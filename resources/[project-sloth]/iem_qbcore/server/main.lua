local QBCore = exports['qb-core']:GetCoreObject()

-- Local variables
local TransactionQueue = {}
local NetworthUpdateTimer = nil
local TaxRunTimer = nil

-- Initialize resource
CreateThread(function()
    -- Create tables if they don't exist
    InitializeDatabase()
    
    -- Start transaction flush timer
    if Config.EnableTransactionLogging then
        StartTransactionFlushTimer()
    end
    
    -- Start networth update timer
    if Config.UpdateNetworthInterval > 0 then
        StartNetworthUpdateTimer()
    end
    
    -- Start tax timer
    if Config.TaxEnabled and Config.TaxInterval > 0 then
        StartTaxTimer()
    end
    
    print('^2[IEM] ^7IndigoRP Economy Manager initialized successfully')
end)

-- Initialize database tables
function InitializeDatabase()
    -- Check if tables exist, create if not
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `iem_transactions` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `tx_id` VARCHAR(50) UNIQUE,
            `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            `from_account` VARCHAR(50),
            `to_account` VARCHAR(50),
            `amount` BIGINT,
            `currency` VARCHAR(10) DEFAULT 'USD',
            `source_kind` VARCHAR(50),
            `source_ref` VARCHAR(100),
            `note` TEXT,
            `staff_id` VARCHAR(50),
            `idempotency_key` VARCHAR(100) UNIQUE,
            `metadata` JSON,
            INDEX idx_timestamp (`timestamp`),
            INDEX idx_from_account (`from_account`),
            INDEX idx_to_account (`to_account`),
            INDEX idx_source_kind (`source_kind`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])
    
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `iem_networth_snapshots` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `player_id` VARCHAR(50),
            `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            `cash` BIGINT,
            `bank` BIGINT,
            `business_share` BIGINT,
            `networth` BIGINT,
            INDEX idx_player_timestamp (`player_id`, `timestamp`),
            INDEX idx_timestamp (`timestamp`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])
    
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `iem_tax_runs` (
            `run_id` VARCHAR(50) PRIMARY KEY,
            `window_start` TIMESTAMP,
            `window_end` TIMESTAMP,
            `created_by` VARCHAR(50) DEFAULT 'SYSTEM',
            `status` VARCHAR(20),
            `total_collected` BIGINT DEFAULT 0,
            `players_affected` INT DEFAULT 0,
            `note` TEXT,
            `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            `completed_at` TIMESTAMP NULL,
            INDEX idx_status (`status`),
            INDEX idx_window (`window_start`, `window_end`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])
    
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `iem_tax_ledger` (
            `entry_id` VARCHAR(50) PRIMARY KEY,
            `run_id` VARCHAR(50),
            `account_id` VARCHAR(50),
            `player_id` VARCHAR(50),
            `amount` BIGINT,
            `status` VARCHAR(20),
            `error` TEXT,
            `processed_at` TIMESTAMP NULL,
            UNIQUE KEY unique_run_account (`run_id`, `account_id`),
            INDEX idx_run_id (`run_id`),
            INDEX idx_player_id (`player_id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])
    
    if Config.Debug then
        print('^3[IEM Debug] ^7Database tables initialized')
    end
end

-- Hook into QBCore money changes
local OriginalAddMoney = nil
local OriginalRemoveMoney = nil

CreateThread(function()
    Wait(1000) -- Wait for QBCore to fully load
    
    -- Store original functions
    local Player = QBCore.Functions.GetPlayer(1) -- Get a sample player object
    if Player then
        local PlayerMeta = getmetatable(Player)
        if PlayerMeta and PlayerMeta.__index and PlayerMeta.__index.Functions then
            OriginalAddMoney = PlayerMeta.__index.Functions.AddMoney
            OriginalRemoveMoney = PlayerMeta.__index.Functions.RemoveMoney
        end
    end
end)

-- Override AddMoney function
QBCore.Functions.AddMoney = function(source, moneytype, amount, reason)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    
    -- Call original function
    local success = Player.Functions.AddMoney(moneytype, amount, reason)
    
    -- Log transaction if successful
    if success and Config.EnableTransactionLogging then
        LogTransaction({
            player_id = Player.PlayerData.citizenid,
            account_type = moneytype,
            amount = amount,
            transaction_type = 'ADD',
            reason = reason or 'Unknown',
            source_kind = DetermineSourceKind(reason)
        })
    end
    
    return success
end

-- Override RemoveMoney function
QBCore.Functions.RemoveMoney = function(source, moneytype, amount, reason)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    
    -- Call original function
    local success = Player.Functions.RemoveMoney(moneytype, amount, reason)
    
    -- Log transaction if successful
    if success and Config.EnableTransactionLogging then
        LogTransaction({
            player_id = Player.PlayerData.citizenid,
            account_type = moneytype,
            amount = -amount, -- Negative for removals
            transaction_type = 'REMOVE',
            reason = reason or 'Unknown',
            source_kind = DetermineSourceKind(reason)
        })
    end
    
    return success
end

-- Determine source kind from reason
function DetermineSourceKind(reason)
    if not reason then return 'OTHER' end
    
    local reasonLower = string.lower(reason)
    
    for keyword, sourceType in pairs(Config.SourceTypes) do
        if string.find(reasonLower, keyword) then
            return sourceType
        end
    end
    
    return 'OTHER'
end

-- Log transaction to queue
function LogTransaction(data)
    local txId = GenerateTransactionId()
    
    table.insert(TransactionQueue, {
        tx_id = txId,
        player_id = data.player_id,
        account_type = data.account_type,
        amount = data.amount,
        transaction_type = data.transaction_type,
        reason = data.reason,
        source_kind = data.source_kind,
        timestamp = os.time()
    })
    
    -- Flush if queue is full
    if #TransactionQueue >= Config.LogBatchSize then
        FlushTransactionQueue()
    end
    
    if Config.Debug then
        print(string.format('^3[IEM Debug] ^7Transaction logged: %s | %s | $%d | %s', 
            data.player_id, data.account_type, data.amount, data.reason))
    end
end

-- Generate unique transaction ID
function GenerateTransactionId()
    return string.format('%s-%s', os.time(), math.random(100000, 999999))
end

-- Start transaction flush timer
function StartTransactionFlushTimer()
    CreateThread(function()
        while true do
            Wait(Config.LogFlushInterval)
            if #TransactionQueue > 0 then
                FlushTransactionQueue()
            end
        end
    end)
end

-- Flush transaction queue to database
function FlushTransactionQueue()
    if #TransactionQueue == 0 then return end
    
    local values = {}
    for _, tx in ipairs(TransactionQueue) do
        table.insert(values, string.format(
            "('%s', '%s', '%s', %d, '%s', '%s', '%s', FROM_UNIXTIME(%d))",
            tx.tx_id,
            tx.player_id,
            tx.account_type,
            tx.amount,
            tx.transaction_type,
            tx.reason:gsub("'", "''"), -- Escape single quotes
            tx.source_kind,
            tx.timestamp
        ))
    end
    
    local query = [[
        INSERT INTO iem_transactions 
        (tx_id, from_account, to_account, amount, source_kind, source_ref, note, timestamp)
        VALUES ]] .. table.concat(values, ',') .. [[
        ON DUPLICATE KEY UPDATE tx_id = tx_id
    ]]
    
    MySQL.query(query, function(result)
        if Config.Debug then
            print(string.format('^3[IEM Debug] ^7Flushed %d transactions to database', #TransactionQueue))
        end
    end)
    
    -- Clear queue
    TransactionQueue = {}
end

-- Player joined
RegisterNetEvent('QBCore:Server:PlayerLoaded', function(Player)
    local citizenid = Player.PlayerData.citizenid
    local license = Player.PlayerData.license
    
    -- Update player info in database
    MySQL.insert([[
        INSERT INTO players (playerId, license, name, firstSeen, lastSeen, job, gang)
        VALUES (?, ?, ?, NOW(), NOW(), ?, ?)
        ON DUPLICATE KEY UPDATE
        lastSeen = NOW(),
        job = VALUES(job),
        gang = VALUES(gang)
    ]], {
        citizenid,
        license,
        Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname,
        Player.PlayerData.job.name,
        Player.PlayerData.gang.name
    })
    
    -- Update networth snapshot
    if Config.UpdateNetworthInterval > 0 then
        UpdatePlayerNetworth(citizenid)
    end
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    -- Flush any remaining transactions
    if #TransactionQueue > 0 then
        FlushTransactionQueue()
    end
    
    print('^2[IEM] ^7IndigoRP Economy Manager stopped')
end)
