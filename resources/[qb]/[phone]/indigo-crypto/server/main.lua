-- Variables
local coin = Crypto.Coin
local QBCore = exports['qb-core']:GetCoreObject()
local bannedCharacters = {'%','$',';'}

-- Events

RegisterServerEvent('indigo-crypto:server:ExchangeFail', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("cryptostick")

    if ItemData ~= nil then
        Player.Functions.RemoveItem("cryptostick", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "remove")
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.cryptostick_malfunctioned'), 'error')
    end
end)

RegisterServerEvent('indigo-crypto:server:Rebooting', function(state, percentage)
    Crypto.Exchange.RebootInfo.state = state
    Crypto.Exchange.RebootInfo.percentage = percentage
end)

RegisterServerEvent('indigo-crypto:server:GetRebootState', function()
    local src = source
    TriggerClientEvent('indigo-crypto:client:GetRebootState', src, Crypto.Exchange.RebootInfo)
end)

RegisterServerEvent('indigo-crypto:server:SyncReboot', function()
    TriggerClientEvent('indigo-crypto:client:SyncReboot', -1)
end)

RegisterServerEvent('indigo-crypto:server:ExchangeSuccess', function(LuckChance)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("cryptostick")

    if ItemData ~= nil then
        local LuckyNumber = math.random(1, 10)
        local DeelNumber = 1000000
        local Amount = (math.random(611111, 1599999) / DeelNumber)
        if LuckChance == LuckyNumber then
            Amount = (math.random(1599999, 2599999) / DeelNumber)
        end

        Player.Functions.RemoveItem("cryptostick", 1)
        --Player.Functions.AddMoney('crypto', Amount)
        exports['indigo-phone']:AddCrypto(src, 'lme', 7)
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.you_have_exchanged_your_cryptostick_for',{amount = Amount}), "success", 3500)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "remove")
        TriggerClientEvent('indigo-phone:client:AddTransaction', src, Player, {},  Lang:t('credit.there_are_amount_credited',{amount = Amount}), "Credit")
    end
end)

-- Callbacks

QBCore.Functions.CreateCallback('indigo-crypto:server:HasSticky', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("cryptostick")

    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)