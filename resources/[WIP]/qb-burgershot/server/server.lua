local Framework = exports['qb-core']:GetCoreObject()

-- Code

Framework.Functions.CreateCallback('qb-burgershot:server:has:burger:items', function(source, cb)
    local Count = 0
    local Player = Framework.Functions.GetPlayer(source)
    for k, v in pairs(Config.BurgerItems) do
        local BurgerData = Player.Functions.GetItemByName(v)
        if BurgerData ~= nil then
           Count = Count + 1
        end
    end
    if Count == 3 then
        cb(true)
    else
        cb(false)
    end 
end)

RegisterServerEvent('qb-burgershot:server:finish:burger')
AddEventHandler('qb-burgershot:server:finish:burger', function(BurgerName)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    for k, v in pairs(Config.BurgerItems) do
        Player.Functions.RemoveItem(v, 1, false, true)
    end
    Citizen.SetTimeout(350, function()
        Player.Functions.AddItem(BurgerName, 1, false, false, true)
    end)
end)

RegisterServerEvent('qb-burgershot:server:finish:fries')
AddEventHandler('qb-burgershot:server:finish:fries', function()
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem('burger-potato', 1) then
        Player.Functions.AddItem('burger-fries', math.random(3, 5))
    end
end)

RegisterServerEvent('qb-burgershot:server:finish:patty')
AddEventHandler('qb-burgershot:server:finish:patty', function()
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem('burger-raw', 1) then
        Player.Functions.AddItem('burger-meat', 1)
    end
end)

RegisterServerEvent('qb-burgershot:server:finish:drink')
AddEventHandler('qb-burgershot:server:finish:drink', function(DrinkName)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    Player.Functions.AddItem(DrinkName, 1)
end)

RegisterServerEvent('qb-burgershot:server:add:to:register')
AddEventHandler('qb-burgershot:server:add:to:register', function(Price, Note)
    local RandomID = math.random(1111,9999)
    Config.ActivePayments[RandomID] = {['Price'] = Price, ['Note'] = Note}
    TriggerClientEvent('qb-burgershot:client:sync:register', -1, Config.ActivePayments)
end)

RegisterServerEvent('qb-burgershot:server:get:bag')
AddEventHandler('qb-burgershot:server:get:bag', function()
    local RandomID = math.random(1111,99999)
    local Player = Framework.Functions.GetPlayer(source)
    Player.Functions.AddItem('burger-box', 1, false, {boxid = RandomID}, true)
end)

RegisterServerEvent('qb-burgershot:server:pay:receipt')
AddEventHandler('qb-burgershot:server:pay:receipt', function(Data)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    if Player.Functions.RemoveMoney('cash', Data['Price'], 'burger-shot') then
        if Config.ActivePayments[tonumber(Data['BillId'])] ~= nil then
            Config.ActivePayments[tonumber(Data['BillId'])] = nil
            TriggerEvent('qb-burgershot:give:receipt:to:workers')
            TriggerClientEvent('qb-burgershot:client:sync:register', -1, Config.ActivePayments)
        else
            TriggerClientEvent('Framework:Notify', src, 'Error..', 'error')
        end
    else
        TriggerClientEvent('Framework:Notify', src, 'You dont have enough cash..', 'error')
    end
end)

RegisterServerEvent('qb-burgershot:give:receipt:to:workers')
AddEventHandler('qb-burgershot:give:receipt:to:workers', function()
    for k, v in pairs(Framework.Functions.GetPlayers()) do
        local Player = Framework.Functions.GetPlayer(v)
        if Player ~= nil and Player.PlayerData.job.name == 'burger' and Player.PlayerData.job.onduty then
            Player.Functions.AddItem('burger-ticket', 1)
        end
    end
end)

RegisterServerEvent('qb-burgershot:server:sell:tickets')
AddEventHandler('qb-burgershot:server:sell:tickets', function()
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    for k, v in pairs(Player.PlayerData.inventory) do
        if v.name == 'burger-ticket' then
            Player.Functions.RemoveItem('burger-ticket', v.amount)
            Player.Functions.AddMoney('cash', (math.random(60, 100) * v.amount), 'burgershot-payment')
        end
    end
end)

RegisterServerEvent('qb-burgershot:server:alert:workers')
AddEventHandler('qb-burgershot:server:alert:workers', function()
    TriggerClientEvent('qb-burgershot:client:call:intercom', -1)
end)

RegisterServerEvent('qb-burgershot:server:give:payment')
AddEventHandler('qb-burgershot:server:give:payment', function(PlayerId)
    local Player = Framework.Functions.GetPlayer(PlayerId)
    if Player ~= nil then
        TriggerClientEvent('qb-burgershot:client:open:payment', PlayerId)
    else
        TriggerClientEvent('Framework:Notify', source, 'This is not right..', 'error')
    end
end)

Framework.Commands.Add("setburger", "Hire a burgershot employee", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = Framework.Functions.GetPlayer(source)
    local TargetPlayer = Framework.Functions.GetPlayer(tonumber(args[1]))
    if Player.PlayerData.metadata['ishighcommand'] and Player.PlayerData.job.name == 'burger' then
        if TargetPlayer ~= nil then
            TriggerClientEvent('Framework:Notify', TargetPlayer.PlayerData.source, 'You have been hired as a burgershot employee!', 'success')
            TriggerClientEvent('Framework:Notify', Player.PlayerData.source, 'You hired '..TargetPlayer.PlayerData.charinfo.firstname..' '..TargetPlayer.PlayerData.charinfo.lastname..' as a burgershot employee!', 'success')
            TargetPlayer.Functions.SetJob('burger')
        end
    end
end)

Framework.Commands.Add("fireburger", "Fire a burgershot employee", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = Framework.Functions.GetPlayer(source)
    local TargetPlayer = Framework.Functions.GetPlayer(tonumber(args[1]))
    if Player.PlayerData.metadata['ishighcommand'] and Player.PlayerData.job.name == 'burger' then
        if TargetPlayer ~= nil and TargetPlayer.PlayerData.job.name == 'burger' then
            TriggerClientEvent('Framework:Notify', TargetPlayer.PlayerData.source, 'You have been fired!', 'error')
            TriggerClientEvent('Framework:Notify', Player.PlayerData.source, 'You fired '..TargetPlayer.PlayerData.charinfo.firstname..' '..TargetPlayer.PlayerData.charinfo.lastname..' from Burgershot', 'success')
            TargetPlayer.Functions.SetJob('unemployed')
        end
    end
end)