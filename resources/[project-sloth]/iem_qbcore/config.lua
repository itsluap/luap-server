Config = {}

-- Database Settings
Config.DatabaseName = 'indigo_live' -- Your database name

-- Transaction Logging
Config.EnableTransactionLogging = true
Config.LogBatchSize = 50 -- Number of transactions to batch before inserting
Config.LogFlushInterval = 5000 -- Flush logs every 5 seconds (ms)

-- Net Worth Calculation
Config.UpdateNetworthInterval = 60000 -- Update net worth snapshots every minute (ms)
Config.IncludeBusinessBalances = true -- Include business balances in net worth calculation

-- Tax System
Config.TaxEnabled = true
Config.TaxInterval = 12 * 60 * 60 * 1000 -- 12 hours in milliseconds
Config.TaxDryRun = false -- Set to true to test without actually charging

-- Tax Brackets (progressive)
Config.TaxBrackets = {
    {min = 0, max = 50000, rate = 0.00},           -- 0% for 0-50k
    {min = 50001, max = 250000, rate = 0.005},     -- 0.5% for 50k-250k
    {min = 250001, max = 1000000, rate = 0.01},    -- 1% for 250k-1M
    {min = 1000001, max = nil, rate = 0.015}       -- 1.5% for 1M+
}

-- Tax Exemptions
Config.TaxExemptions = {
    MinPlaytimeHours = 12,                         -- Exempt players with less than 12 hours playtime
    MinBalanceFloor = 5000,                        -- Don't tax if balance is below this
    ExemptJobs = {'police', 'ambulance'},          -- Jobs exempt from tax
    ExemptGangs = {},                              -- Gangs exempt from tax
    OnDutyExemption = true,                        -- Exempt on-duty emergency services
    WhitelistedLicenses = {},                      -- Specific license IDs to exempt
    BlacklistedLicenses = {}                       -- Specific license IDs to always tax
}

-- Source Types (for categorizing transactions)
Config.SourceTypes = {
    -- Job payments
    ['salary'] = 'JOB_PAY',
    ['job'] = 'JOB_PAY',
    
    -- Invoices and bills
    ['invoice'] = 'INVOICE',
    ['bill'] = 'INVOICE',
    
    -- Sales
    ['sale'] = 'SALE',
    ['sold'] = 'SALE',
    
    -- Purchases
    ['purchase'] = 'SHOP_PURCHASE',
    ['bought'] = 'SHOP_PURCHASE',
    ['shop'] = 'SHOP_PURCHASE',
    
    -- Fines and penalties
    ['fine'] = 'FINE',
    ['ticket'] = 'FINE',
    
    -- Tax
    ['tax'] = 'TAX',
    ['wealth_tax'] = 'TAX',
    
    -- Transfers
    ['transfer'] = 'TRANSFER',
    ['sent'] = 'TRANSFER',
    ['received'] = 'TRANSFER',
    
    -- Heists and illegal activities
    ['heist'] = 'HEIST_PAYOUT',
    ['robbery'] = 'HEIST_PAYOUT',
    
    -- Banking
    ['deposit'] = 'BANK_DEPOSIT',
    ['withdraw'] = 'BANK_WITHDRAWAL',
    
    -- Admin
    ['admin'] = 'ADMIN_ADJUST',
    ['staff'] = 'ADMIN_ADJUST',
}

-- Webhook for notifications (optional)
Config.DiscordWebhook = {
    Enabled = false,
    URL = '', -- Your Discord webhook URL
    TaxRunNotifications = true,
    LargeTransactionThreshold = 1000000, -- Notify for transactions over 1M
    SuspiciousActivityAlerts = true
}

-- Debug Mode
Config.Debug = false -- Enable debug prints
