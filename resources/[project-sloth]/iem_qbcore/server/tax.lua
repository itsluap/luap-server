local QBCore = exports['qb-core']:GetCoreObject()

-- Start tax timer
function StartTaxTimer()
    TaxRunTimer = CreateThread(function()
        while true do
            Wait(Config.TaxInterval)
            
            if Config.TaxEnabled then
                RunTaxCollection(Config.TaxDryRun, 'AUTOMATIC')
            end
        end
    end)
end

-- Run tax collection
function RunTaxCollection(dryRun, createdBy)
    local runId = GenerateTaxRunId()
    local windowStart = os.date('%Y-%m-%d %H:%M:%S', os.time() - Config.TaxInterval / 1000)
    local windowEnd = os.date('%Y-%m-%d %H:%M:%S')
    
    -- Create tax run record
    MySQL.insert([[
        INSERT INTO iem_tax_runs 
        (run_id, window_start, window_end, created_by, status)
        VALUES (?, ?, ?, ?, 'PROCESSING')
    ]], {
        runId, windowStart, windowEnd, createdBy
    })
    
    -- Get all players with their networth
    local players = CalculateAllNetworths()
    local totalCollected = 0
    local playersAffected = 0
    local taxLedger = {}
    
    for _, player in ipairs(players) do
        local taxAmount = CalculateTaxForPlayer(player)
        
        if taxAmount > 0 then
            if not dryRun then
                -- Collect tax from player
                local success = CollectTaxFromPlayer(player.citizenid, taxAmount, runId)
                
                if success then
                    totalCollected = totalCollected + taxAmount
                    playersAffected = playersAffected + 1
                    
                    -- Add to ledger
                    table.insert(taxLedger, {
                        run_id = runId,
                        player_id = player.citizenid,
                        amount = taxAmount,
                        status = 'SUCCESS'
                    })
                else
                    -- Failed to collect
                    table.insert(taxLedger, {
                        run_id = runId,
                        player_id = player.citizenid,
                        amount = taxAmount,
                        status = 'FAILED',
                        error = 'Insufficient funds'
                    })
                end
            else
                -- Dry run - just calculate
                totalCollected = totalCollected + taxAmount
                playersAffected = playersAffected + 1
                
                table.insert(taxLedger, {
                    run_id = runId,
                    player_id = player.citizenid,
                    amount = taxAmount,
                    status = 'PENDING'
                })
            end
        end
    end
    
    -- Save ledger entries
    if #taxLedger > 0 then
        local values = {}
        for _, entry in ipairs(taxLedger) do
            table.insert(values, string.format(
                "('%s', '%s', '%s', '%s', %d, '%s', %s)",
                GenerateTransactionId(),
                entry.run_id,
                'SYSTEM',
                entry.player_id,
                entry.amount,
                entry.status,
                entry.error and string.format("'%s'", entry.error:gsub("'", "''")) or 'NULL'
            ))
        end
        
        MySQL.query([[
            INSERT INTO iem_tax_ledger 
            (entry_id, run_id, account_id, player_id, amount, status, error)
            VALUES ]] .. table.concat(values, ','))
    end
    
    -- Update tax run status
    MySQL.update([[
        UPDATE iem_tax_runs 
        SET status = ?, total_collected = ?, players_affected = ?, completed_at = NOW()
        WHERE run_id = ?
    ]], {
        dryRun and 'DRY_RUN' or 'COMPLETED',
        totalCollected,
        playersAffected,
        runId
    })
    
    -- Send notification if configured
    if Config.DiscordWebhook.Enabled and Config.DiscordWebhook.TaxRunNotifications then
        SendTaxRunNotification(runId, totalCollected, playersAffected, dryRun)
    end
    
    print(string.format('^2[IEM] ^7Tax run %s: Collected $%d from %d players %s',
        runId, totalCollected, playersAffected, dryRun and '(DRY RUN)' or ''))
    
    return {
        runId = runId,
        totalCollected = totalCollected,
        playersAffected = playersAffected,
        dryRun = dryRun,
        ledger = taxLedger
    }
end

-- Calculate tax for a player based on brackets
function CalculateTaxForPlayer(playerData)
    local networth = playerData.networth
    
    -- Check exemptions
    if IsPlayerExempt(playerData.citizenid, networth) then
        return 0
    end
    
    -- Calculate progressive tax
    local totalTax = 0
    
    for _, bracket in ipairs(Config.TaxBrackets) do
        if networth > bracket.min then
            local taxableAmount = networth
            
            if bracket.max then
                taxableAmount = math.min(networth, bracket.max) - bracket.min
            else
                taxableAmount = networth - bracket.min
            end
            
            if taxableAmount > 0 then
                totalTax = totalTax + (taxableAmount * bracket.rate)
            end
        end
    end
    
    return math.floor(totalTax)
end

-- Check if player is exempt from tax
function IsPlayerExempt(citizenid, networth)
    -- Check minimum balance floor
    if networth < Config.TaxExemptions.MinBalanceFloor then
        return true
    end
    
    -- Get player data
    local Player = QBCore.Functions.GetPlayerByCitizenId(citizenid)
    local playerData = nil
    
    if Player then
        playerData = Player.PlayerData
    else
        -- Offline player - query from database
        playerData = MySQL.single.await([[
            SELECT * FROM players WHERE citizenid = ?
        ]], {citizenid})
    end
    
    if not playerData then
        return true -- Exempt if player not found
    end
    
    -- Check playtime exemption
    if Config.TaxExemptions.MinPlaytimeHours > 0 then
        local playtime = playerData.playtime or 0
        if playtime < Config.TaxExemptions.MinPlaytimeHours * 3600 then
            return true
        end
    end
    
    -- Check job exemptions
    local job = playerData.job or (playerData.job and playerData.job.name)
    if job then
        for _, exemptJob in ipairs(Config.TaxExemptions.ExemptJobs) do
            if job == exemptJob then
                -- Check on-duty exemption
                if Config.TaxExemptions.OnDutyExemption then
                    if Player and Player.PlayerData.job.onduty then
                        return true
                    end
                else
                    return true
                end
            end
        end
    end
    
    -- Check gang exemptions
    local gang = playerData.gang or (playerData.gang and playerData.gang.name)
    if gang then
        for _, exemptGang in ipairs(Config.TaxExemptions.ExemptGangs) do
            if gang == exemptGang then
                return true
            end
        end
    end
    
    -- Check whitelist
    local license = playerData.license
    if license then
        for _, whitelisted in ipairs(Config.TaxExemptions.WhitelistedLicenses) do
            if license == whitelisted then
                return true
            end
        end
        
        -- Check blacklist
        for _, blacklisted in ipairs(Config.TaxExemptions.BlacklistedLicenses) do
            if license == blacklisted then
                return false -- Force tax even if other exemptions apply
            end
        end
    end
    
    return false
end

-- Collect tax from player
function CollectTaxFromPlayer(citizenid, amount, runId)
    local Player = QBCore.Functions.GetPlayerByCitizenId(citizenid)
    
    if Player then
        -- Online player - try bank first, then cash
        if Player.PlayerData.money.bank >= amount then
            Player.Functions.RemoveMoney('bank', amount, 'Wealth tax - Run: ' .. runId)
            return true
        elseif Player.PlayerData.money.cash >= amount then
            Player.Functions.RemoveMoney('cash', amount, 'Wealth tax - Run: ' .. runId)
            return true
        else
            -- Try partial collection
            local totalAvailable = Player.PlayerData.money.bank + Player.PlayerData.money.cash
            if totalAvailable > 0 then
                if Player.PlayerData.money.bank > 0 then
                    Player.Functions.RemoveMoney('bank', Player.PlayerData.money.bank, 'Wealth tax (partial) - Run: ' .. runId)
                end
                if Player.PlayerData.money.cash > 0 then
                    Player.Functions.RemoveMoney('cash', Player.PlayerData.money.cash, 'Wealth tax (partial) - Run: ' .. runId)
                end
                return true
            end
        end
    else
        -- Offline player - direct database update
        local result = MySQL.single.await([[
            SELECT cash, bank FROM players WHERE citizenid = ?
        ]], {citizenid})
        
        if result then
            if result.bank >= amount then
                MySQL.update([[
                    UPDATE players SET bank = bank - ? WHERE citizenid = ?
                ]], {amount, citizenid})
                
                -- Log transaction
                MySQL.insert([[
                    INSERT INTO iem_transactions 
                    (tx_id, from_account, amount, currency, source_kind, source_ref, note)
                    VALUES (?, ?, ?, 'USD', 'TAX', 'bank', ?)
                ]], {
                    GenerateTransactionId(),
                    citizenid,
                    amount,
                    'Wealth tax - Run: ' .. runId
                })
                
                return true
            elseif result.cash >= amount then
                MySQL.update([[
                    UPDATE players SET cash = cash - ? WHERE citizenid = ?
                ]], {amount, citizenid})
                
                -- Log transaction
                MySQL.insert([[
                    INSERT INTO iem_transactions 
                    (tx_id, from_account, amount, currency, source_kind, source_ref, note)
                    VALUES (?, ?, ?, 'USD', 'TAX', 'cash', ?)
                ]], {
                    GenerateTransactionId(),
                    citizenid,
                    amount,
                    'Wealth tax - Run: ' .. runId
                })
                
                return true
            end
        end
    end
    
    return false
end

-- Generate tax run ID
function GenerateTaxRunId()
    return string.format('TAX-%s-%s', os.date('%Y%m%d'), math.random(1000, 9999))
end

-- Send Discord notification
function SendTaxRunNotification(runId, totalCollected, playersAffected, dryRun)
    if not Config.DiscordWebhook.URL or Config.DiscordWebhook.URL == '' then
        return
    end
    
    local embed = {
        {
            title = dryRun and '💰 Tax Run (Dry Run)' or '💰 Tax Run Completed',
            description = string.format(
                'Tax collection %s has been completed.',
                runId
            ),
            color = dryRun and 16776960 or 5025616, -- Yellow for dry run, green for actual
            fields = {
                {
                    name = 'Total Collected',
                    value = string.format('$%s', totalCollected),
                    inline = true
                },
                {
                    name = 'Players Affected',
                    value = tostring(playersAffected),
                    inline = true
                },
                {
                    name = 'Run Type',
                    value = dryRun and 'Dry Run' or 'Live Collection',
                    inline = true
                }
            },
            timestamp = os.date('!%Y-%m-%dT%H:%M:%S')
        }
    }
    
    PerformHttpRequest(Config.DiscordWebhook.URL, function(err, text, headers) end, 'POST', 
        json.encode({embeds = embed}), {['Content-Type'] = 'application/json'})
end

-- Export tax functions
exports('RunTaxCollection', RunTaxCollection)
exports('CalculateTaxForPlayer', CalculateTaxForPlayer)
exports('IsPlayerExempt', IsPlayerExempt)
