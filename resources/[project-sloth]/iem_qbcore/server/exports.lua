local QBCore = exports['qb-core']:GetCoreObject()

-- Export: Add money with transaction logging
exports('AddMoney', function(source, moneytype, amount, reason, metadata)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    
    -- Generate idempotency key
    local idempotencyKey = string.format('%s-%s-%d-%d', 
        Player.PlayerData.citizenid, moneytype, amount, os.time())
    
    -- Check if transaction already exists
    local existing = MySQL.scalar.await([[
        SELECT COUNT(*) FROM iem_transactions WHERE idempotency_key = ?
    ]], {idempotencyKey})
    
    if existing > 0 then
        if Config.Debug then
            print('^3[IEM Debug] ^7Duplicate transaction prevented: ' .. idempotencyKey)
        end
        return false
    end
    
    -- Execute transaction
    local success = Player.Functions.AddMoney(moneytype, amount, reason)
    
    if success then
        -- Log to database
        MySQL.insert([[
            INSERT INTO iem_transactions 
            (tx_id, to_account, amount, currency, source_kind, source_ref, note, idempotency_key, metadata)
            VALUES (?, ?, ?, 'USD', ?, ?, ?, ?, ?)
        ]], {
            GenerateTransactionId(),
            Player.PlayerData.citizenid,
            amount,
            DetermineSourceKind(reason),
            moneytype,
            reason,
            idempotencyKey,
            metadata and json.encode(metadata) or nil
        })
        
        -- Update networth if significant amount
        if amount >= 10000 then
            UpdatePlayerNetworth(Player.PlayerData.citizenid)
        end
    end
    
    return success
end)

-- Export: Remove money with transaction logging
exports('RemoveMoney', function(source, moneytype, amount, reason, metadata)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    
    -- Generate idempotency key
    local idempotencyKey = string.format('%s-%s-%d-%d', 
        Player.PlayerData.citizenid, moneytype, amount, os.time())
    
    -- Check if transaction already exists
    local existing = MySQL.scalar.await([[
        SELECT COUNT(*) FROM iem_transactions WHERE idempotency_key = ?
    ]], {idempotencyKey})
    
    if existing > 0 then
        if Config.Debug then
            print('^3[IEM Debug] ^7Duplicate transaction prevented: ' .. idempotencyKey)
        end
        return false
    end
    
    -- Execute transaction
    local success = Player.Functions.RemoveMoney(moneytype, amount, reason)
    
    if success then
        -- Log to database
        MySQL.insert([[
            INSERT INTO iem_transactions 
            (tx_id, from_account, amount, currency, source_kind, source_ref, note, idempotency_key, metadata)
            VALUES (?, ?, ?, 'USD', ?, ?, ?, ?, ?)
        ]], {
            GenerateTransactionId(),
            Player.PlayerData.citizenid,
            amount,
            DetermineSourceKind(reason),
            moneytype,
            reason,
            idempotencyKey,
            metadata and json.encode(metadata) or nil
        })
        
        -- Update networth if significant amount
        if amount >= 10000 then
            UpdatePlayerNetworth(Player.PlayerData.citizenid)
        end
    end
    
    return success
end)

-- Export: Transfer money between players
exports('TransferMoney', function(fromSource, toSource, moneytype, amount, reason, metadata)
    local FromPlayer = QBCore.Functions.GetPlayer(fromSource)
    local ToPlayer = QBCore.Functions.GetPlayer(toSource)
    
    if not FromPlayer or not ToPlayer then return false end
    
    -- Check if sender has enough money
    if FromPlayer.PlayerData.money[moneytype] < amount then
        return false
    end
    
    -- Generate idempotency key
    local idempotencyKey = string.format('%s-%s-%d-%d', 
        FromPlayer.PlayerData.citizenid, ToPlayer.PlayerData.citizenid, amount, os.time())
    
    -- Check if transaction already exists
    local existing = MySQL.scalar.await([[
        SELECT COUNT(*) FROM iem_transactions WHERE idempotency_key = ?
    ]], {idempotencyKey})
    
    if existing > 0 then
        if Config.Debug then
            print('^3[IEM Debug] ^7Duplicate transfer prevented: ' .. idempotencyKey)
        end
        return false
    end
    
    -- Execute transfer
    local removeSuccess = FromPlayer.Functions.RemoveMoney(moneytype, amount, reason or 'Transfer to ' .. ToPlayer.PlayerData.citizenid)
    if not removeSuccess then return false end
    
    local addSuccess = ToPlayer.Functions.AddMoney(moneytype, amount, reason or 'Transfer from ' .. FromPlayer.PlayerData.citizenid)
    if not addSuccess then
        -- Rollback if add fails
        FromPlayer.Functions.AddMoney(moneytype, amount, 'Transfer rollback')
        return false
    end
    
    -- Log transfer transaction
    MySQL.insert([[
        INSERT INTO iem_transactions 
        (tx_id, from_account, to_account, amount, currency, source_kind, source_ref, note, idempotency_key, metadata)
        VALUES (?, ?, ?, ?, 'USD', 'TRANSFER', ?, ?, ?, ?)
    ]], {
        GenerateTransactionId(),
        FromPlayer.PlayerData.citizenid,
        ToPlayer.PlayerData.citizenid,
        amount,
        moneytype,
        reason or 'Player transfer',
        idempotencyKey,
        metadata and json.encode(metadata) or nil
    })
    
    -- Update networth for both players if significant amount
    if amount >= 10000 then
        UpdatePlayerNetworth(FromPlayer.PlayerData.citizenid)
        UpdatePlayerNetworth(ToPlayer.PlayerData.citizenid)
    end
    
    return true
end)

-- Export: Get player's current networth
exports('GetPlayerNetworth', function(citizenid)
    local result = MySQL.single.await([[
        SELECT * FROM iem_networth_snapshots 
        WHERE player_id = ? 
        ORDER BY timestamp DESC 
        LIMIT 1
    ]], {citizenid})
    
    if result then
        return {
            cash = result.cash,
            bank = result.bank,
            business_share = result.business_share,
            networth = result.networth,
            timestamp = result.timestamp
        }
    end
    
    return nil
end)

-- Export: Get economy overview
exports('GetEconomyOverview', function()
    -- Get total money supply
    local totalCash = MySQL.scalar.await([[
        SELECT SUM(cash) FROM players
    ]]) or 0
    
    local totalBank = MySQL.scalar.await([[
        SELECT SUM(bank) FROM players
    ]]) or 0
    
    -- Get transaction volume (last 24h)
    local transactionVolume = MySQL.single.await([[
        SELECT 
            COUNT(*) as count,
            SUM(ABS(amount)) as volume
        FROM iem_transactions
        WHERE timestamp >= DATE_SUB(NOW(), INTERVAL 24 HOUR)
    ]])
    
    -- Get active player count (last 7 days)
    local activePlayerCount = MySQL.scalar.await([[
        SELECT COUNT(DISTINCT citizenid)
        FROM players
        WHERE last_updated >= DATE_SUB(NOW(), INTERVAL 7 DAY)
    ]]) or 0
    
    return {
        totalCash = totalCash,
        totalBank = totalBank,
        moneySupply = totalCash + totalBank,
        transactionVolume24h = transactionVolume.volume or 0,
        transactionCount24h = transactionVolume.count or 0,
        activePlayerCount = activePlayerCount
    }
end)

-- Export: Run tax collection (manual trigger)
exports('RunTaxCollection', function(dryRun, createdBy)
    return RunTaxCollection(dryRun or false, createdBy or 'MANUAL')
end)

-- Export: Get tax run history
exports('GetTaxRunHistory', function(limit)
    local results = MySQL.query.await([[
        SELECT * FROM iem_tax_runs
        ORDER BY created_at DESC
        LIMIT ?
    ]], {limit or 10})
    
    return results
end)
