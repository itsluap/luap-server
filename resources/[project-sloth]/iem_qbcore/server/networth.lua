local QBCore = exports['qb-core']:GetCoreObject()

-- Update player networth snapshot
function UpdatePlayerNetworth(citizenid)
    local Player = QBCore.Functions.GetPlayerByCitizenId(citizenid)
    local cash = 0
    local bank = 0
    local businessShare = 0
    
    if Player then
        -- Online player
        cash = Player.PlayerData.money.cash or 0
        bank = Player.PlayerData.money.bank or 0
    else
        -- Offline player - query from database
        local result = MySQL.single.await([[
            SELECT cash, bank FROM players WHERE citizenid = ?
        ]], {citizenid})
        
        if result then
            cash = result.cash or 0
            bank = result.bank or 0
        end
    end
    
    -- Calculate business share if enabled
    if Config.IncludeBusinessBalances then
        local businesses = MySQL.query.await([[
            SELECT b.balance * 0.5 as share 
            FROM management_funds b
            JOIN management_employees e ON b.job_name = e.job
            WHERE e.citizenid = ? AND e.grade >= 3
        ]], {citizenid})
        
        if businesses and #businesses > 0 then
            for _, biz in ipairs(businesses) do
                businessShare = businessShare + (biz.share or 0)
            end
        end
    end
    
    local networth = cash + bank + businessShare
    
    -- Insert or update snapshot
    MySQL.insert([[
        INSERT INTO iem_networth_snapshots 
        (player_id, cash, bank, business_share, networth)
        VALUES (?, ?, ?, ?, ?)
    ]], {
        citizenid, cash, bank, businessShare, networth
    })
    
    if Config.Debug then
        print(string.format('^3[IEM Debug] ^7Updated networth for %s: $%d', 
            citizenid, networth))
    end
    
    return networth
end

-- Start networth update timer
function StartNetworthUpdateTimer()
    NetworthUpdateTimer = CreateThread(function()
        while true do
            Wait(Config.UpdateNetworthInterval)
            
            -- Update networth for all online players
            local Players = QBCore.Functions.GetPlayers()
            for _, playerId in ipairs(Players) do
                local Player = QBCore.Functions.GetPlayer(playerId)
                if Player then
                    UpdatePlayerNetworth(Player.PlayerData.citizenid)
                end
            end
            
            if Config.Debug then
                print('^3[IEM Debug] ^7Networth update cycle completed')
            end
        end
    end)
end

-- Calculate networth for all players (used for tax calculations)
function CalculateAllNetworths()
    local networthData = {}
    
    -- Get all players with recent activity
    local players = MySQL.query.await([[
        SELECT citizenid, cash, bank 
        FROM players 
        WHERE last_updated >= DATE_SUB(NOW(), INTERVAL 30 DAY)
    ]])
    
    for _, player in ipairs(players) do
        local businessShare = 0
        
        -- Calculate business share if enabled
        if Config.IncludeBusinessBalances then
            local businesses = MySQL.query.await([[
                SELECT b.balance * 0.5 as share 
                FROM management_funds b
                JOIN management_employees e ON b.job_name = e.job
                WHERE e.citizenid = ? AND e.grade >= 3
            ]], {player.citizenid})
            
            if businesses and #businesses > 0 then
                for _, biz in ipairs(businesses) do
                    businessShare = businessShare + (biz.share or 0)
                end
            end
        end
        
        local networth = (player.cash or 0) + (player.bank or 0) + businessShare
        
        table.insert(networthData, {
            citizenid = player.citizenid,
            cash = player.cash or 0,
            bank = player.bank or 0,
            business_share = businessShare,
            networth = networth
        })
    end
    
    return networthData
end

-- Get top richest players
function GetRichestPlayers(limit)
    limit = limit or 10
    
    local results = MySQL.query.await([[
        SELECT 
            p.citizenid,
            p.name,
            p.job,
            p.gang,
            ns.cash,
            ns.bank,
            ns.business_share,
            ns.networth,
            ns.timestamp
        FROM players p
        JOIN (
            SELECT player_id, MAX(timestamp) as max_ts
            FROM iem_networth_snapshots
            GROUP BY player_id
        ) latest ON p.citizenid = latest.player_id
        JOIN iem_networth_snapshots ns ON ns.player_id = latest.player_id 
            AND ns.timestamp = latest.max_ts
        ORDER BY ns.networth DESC
        LIMIT ?
    ]], {limit})
    
    return results
end

-- Export functions
exports('UpdatePlayerNetworth', UpdatePlayerNetworth)
exports('CalculateAllNetworths', CalculateAllNetworths)
exports('GetRichestPlayers', GetRichestPlayers)
