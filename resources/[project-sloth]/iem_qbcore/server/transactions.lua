local QBCore = exports['qb-core']:GetCoreObject()

-- Transaction functions are integrated into main.lua and exports.lua
-- This file contains additional transaction-related utilities

-- Generate unique transaction ID
function GenerateTransactionId()
    return string.format('TX-%s-%s', os.time(), math.random(100000, 999999))
end

-- Determine source kind from reason string
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

-- Get transaction history for a player
function GetPlayerTransactionHistory(citizenid, limit, offset)
    limit = limit or 50
    offset = offset or 0
    
    local transactions = MySQL.query.await([[
        SELECT 
            tx_id,
            timestamp,
            from_account,
            to_account,
            amount,
            source_kind,
            source_ref,
            note
        FROM iem_transactions
        WHERE from_account = ? OR to_account = ?
        ORDER BY timestamp DESC
        LIMIT ? OFFSET ?
    ]], {citizenid, citizenid, limit, offset})
    
    return transactions
end

-- Get transaction volume statistics
function GetTransactionVolume(timeframe)
    timeframe = timeframe or '24 HOUR'
    
    local stats = MySQL.single.await([[
        SELECT 
            COUNT(*) as total_count,
            SUM(CASE WHEN amount > 0 THEN amount ELSE 0 END) as total_inflow,
            SUM(CASE WHEN amount < 0 THEN ABS(amount) ELSE 0 END) as total_outflow,
            COUNT(DISTINCT from_account) + COUNT(DISTINCT to_account) as unique_accounts
        FROM iem_transactions
        WHERE timestamp >= DATE_SUB(NOW(), INTERVAL ]] .. timeframe .. [[)
    ]])
    
    return stats
end

-- Get money flow by source type
function GetMoneyFlowBySource(timeframe)
    timeframe = timeframe or '7 DAY'
    
    local flows = MySQL.query.await([[
        SELECT 
            source_kind,
            COUNT(*) as transaction_count,
            SUM(amount) as total_amount,
            AVG(amount) as avg_amount
        FROM iem_transactions
        WHERE timestamp >= DATE_SUB(NOW(), INTERVAL ]] .. timeframe .. [[)
        GROUP BY source_kind
        ORDER BY total_amount DESC
    ]])
    
    return flows
end

-- Get suspicious transactions (potential fraud detection)
function GetSuspiciousTransactions()
    local suspicious = {}
    
    -- Large cash transactions
    local largeCash = MySQL.query.await([[
        SELECT * FROM iem_transactions
        WHERE source_ref = 'cash' 
        AND ABS(amount) > 100000
        AND timestamp >= DATE_SUB(NOW(), INTERVAL 24 HOUR)
    ]])
    
    for _, tx in ipairs(largeCash) do
        tx.flag_reason = 'LARGE_CASH_TRANSACTION'
        table.insert(suspicious, tx)
    end
    
    -- Rapid transfers (potential laundering)
    local rapidTransfers = MySQL.query.await([[
        SELECT 
            from_account,
            to_account,
            COUNT(*) as transfer_count,
            SUM(amount) as total_amount
        FROM iem_transactions
        WHERE source_kind = 'TRANSFER'
        AND timestamp >= DATE_SUB(NOW(), INTERVAL 1 HOUR)
        GROUP BY from_account, to_account
        HAVING transfer_count > 5
    ]])
    
    for _, pattern in ipairs(rapidTransfers) do
        pattern.flag_reason = 'RAPID_TRANSFERS'
        table.insert(suspicious, pattern)
    end
    
    -- Circular transfers
    local circular = MySQL.query.await([[
        SELECT 
            t1.from_account as account_a,
            t1.to_account as account_b,
            t2.to_account as account_c,
            SUM(t1.amount) as amount
        FROM iem_transactions t1
        JOIN iem_transactions t2 ON t1.to_account = t2.from_account
        JOIN iem_transactions t3 ON t2.to_account = t3.from_account 
            AND t3.to_account = t1.from_account
        WHERE t1.timestamp >= DATE_SUB(NOW(), INTERVAL 30 MINUTE)
        GROUP BY t1.from_account, t1.to_account, t2.to_account
    ]])
    
    for _, circle in ipairs(circular) do
        circle.flag_reason = 'CIRCULAR_TRANSFER'
        table.insert(suspicious, circle)
    end
    
    return suspicious
end

-- Create flag for suspicious activity
function FlagSuspiciousActivity(citizenid, reason, severity, metadata)
    local flagId = string.format('FLAG-%s-%s', os.time(), math.random(1000, 9999))
    
    MySQL.insert([[
        INSERT INTO iem_flags 
        (flag_id, player_id, reason_code, severity, metadata)
        VALUES (?, ?, ?, ?, ?)
    ]], {
        flagId,
        citizenid,
        reason,
        severity or 'MEDIUM',
        metadata and json.encode(metadata) or nil
    })
    
    -- Send Discord notification if configured
    if Config.DiscordWebhook.Enabled and Config.DiscordWebhook.SuspiciousActivityAlerts then
        SendSuspiciousActivityAlert(citizenid, reason, severity)
    end
    
    return flagId
end

-- Send suspicious activity Discord alert
function SendSuspiciousActivityAlert(citizenid, reason, severity)
    if not Config.DiscordWebhook.URL or Config.DiscordWebhook.URL == '' then
        return
    end
    
    local severityColors = {
        LOW = 16776960,      -- Yellow
        MEDIUM = 16744192,   -- Orange
        HIGH = 16711680,     -- Red
        CRITICAL = 8388736   -- Purple
    }
    
    local embed = {
        {
            title = '⚠️ Suspicious Activity Detected',
            description = string.format('Player %s has been flagged for suspicious activity.', citizenid),
            color = severityColors[severity] or severityColors.MEDIUM,
            fields = {
                {
                    name = 'Player ID',
                    value = citizenid,
                    inline = true
                },
                {
                    name = 'Reason',
                    value = reason,
                    inline = true
                },
                {
                    name = 'Severity',
                    value = severity,
                    inline = true
                }
            },
            timestamp = os.date('!%Y-%m-%dT%H:%M:%S')
        }
    }
    
    PerformHttpRequest(Config.DiscordWebhook.URL, function(err, text, headers) end, 'POST', 
        json.encode({embeds = embed}), {['Content-Type'] = 'application/json'})
end

-- Monitor transactions for suspicious patterns
CreateThread(function()
    while true do
        Wait(300000) -- Check every 5 minutes
        
        if Config.DiscordWebhook.SuspiciousActivityAlerts then
            local suspicious = GetSuspiciousTransactions()
            
            for _, activity in ipairs(suspicious) do
                -- Check if already flagged
                local existing = MySQL.scalar.await([[
                    SELECT COUNT(*) FROM iem_flags 
                    WHERE player_id = ? 
                    AND reason_code = ?
                    AND resolved_at IS NULL
                    AND timestamp >= DATE_SUB(NOW(), INTERVAL 1 HOUR)
                ]], {
                    activity.from_account or activity.account_a,
                    activity.flag_reason
                })
                
                if existing == 0 then
                    FlagSuspiciousActivity(
                        activity.from_account or activity.account_a,
                        activity.flag_reason,
                        'MEDIUM',
                        activity
                    )
                end
            end
        end
    end
end)

-- Export transaction functions
exports('GetPlayerTransactionHistory', GetPlayerTransactionHistory)
exports('GetTransactionVolume', GetTransactionVolume)
exports('GetMoneyFlowBySource', GetMoneyFlowBySource)
exports('GetSuspiciousTransactions', GetSuspiciousTransactions)
exports('FlagSuspiciousActivity', FlagSuspiciousActivity)
