local Framework = exports["dream-core"]:GetCoreObject()


RegisterServerEvent('dream-stripclub:server:add:to:register')
AddEventHandler('dream-stripclub:server:add:to:register', function(Price, Note)
    local RandomID = math.random(1111,9999)
    Config.ActivePaymentsStrip[RandomID] = {['Price'] = Price, ['Note'] = Note}
    TriggerClientEvent('dream-stripclub:client:sync:register', -1, Config.ActivePaymentsStrip)
end)


RegisterServerEvent('dream-stripclub:server:set:effect')
AddEventHandler('dream-stripclub:server:set:effect', function(data)
    Config.CurrentEffect = {['Dict'] = data['Dict'], ['Effect'] = data['Effect']}
    TriggerClientEvent('dream-stripclub:client:sync:config', -1, Config)
end)

RegisterServerEvent('dream-stripclub:server:close:effect')
AddEventHandler('dream-stripclub:server:close:effect', function()
    Config.CurrentEffect = {['Dict'] = nil, ['Effect'] = nil}
    TriggerClientEvent('dream-stripclub:client:stop:effects', -1)
    TriggerClientEvent('dream-stripclub:client:sync:config', -1, Config)
end)

Framework.Functions.CreateCallback('dream-stripclub:server:has:drank:items', function(source, cb)
    local src = source
    local count = 0
    local Player = Framework.Functions.GetPlayer(src)
    for k, v in pairs(Config.DrankItems) do
        local ItemzData = Player.Functions.GetItemByName(v)
        if ItemzData ~= nil then
           count = count + 1
           if count == 3 then
               cb(true)
           end
        end
    end
end)

RegisterServerEvent('dream-stripclub:server:finish:create')
AddEventHandler('dream-stripclub:server:finish:create', function(Drankje)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    for k, v in pairs(Config.DrankItems) do
        Player.Functions.RemoveItem(v, 1)
        TriggerClientEvent('dream-inventory:client:ItemBox', src, Framework.Shared.Items[v], "remove")
    end
    Citizen.SetTimeout(350, function()
        Player.Functions.AddItem(Drankje, 1)
        TriggerClientEvent('dream-inventory:client:ItemBox', src, Framework.Shared.Items[Drankje], "add")
    end)
end)


RegisterServerEvent('dream-stripclub:server:pay:receipt')
AddEventHandler('dream-stripclub:server:pay:receipt', function(Price, Note, Id)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    if Player.Functions.RemoveMoney('cash', Price, 'stripclub') then
        if Config.ActivePaymentsStrip[tonumber(Id)] ~= nil then
            Config.ActivePaymentsStrip[tonumber(Id)] = nil
            TriggerEvent('dream-stripclub:give:receipt:to:workers', Note, Price)
            TriggerClientEvent('dream-stripclub:client:sync:register', -1, Config.ActivePaymentsStrip)
        
            TriggerEvent('dream-bossmenu:server:addAccountMoney', 'vanilla', Price)
        else
            TriggerClientEvent('Framework:Notify', src, 'Error..', 'error')
        end
    else
        TriggerClientEvent('Framework:Notify', src, 'You dont have enough cash..', 'error')
    end
end)

RegisterServerEvent('dream-stripclub:give:receipt:to:workers')
AddEventHandler('dream-stripclub:give:receipt:to:workers', function(Note, Price)
    local src = source
    for k, v in pairs(Framework.Functions.GetPlayers()) do
        local Player = Framework.Functions.GetPlayer(v)
        if Player ~= nil then
            if Player.PlayerData.job.name == 'vanilla' and Player.PlayerData.job.onduty then
                local Info = {note = Note, price = Price}
                Player.Functions.AddItem('burger-ticket', 1, false, Info)
                TriggerClientEvent('dream-inventory:client:ItemBox', Player.PlayerData.source, Framework.Shared.Items['burger-ticket'], "add")
            end
        end
    end
end)

RegisterServerEvent('dream-stripclub:server:sell:tickets')
AddEventHandler('dream-stripclub:server:sell:tickets', function()
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    for k, v in pairs(Player.PlayerData.items) do
        if v.name == 'burger-ticket' then
            Player.Functions.RemoveItem('burger-ticket', 1)
            -- Player.Functions.AddMoney('cash', math.random(60, 100), 'stripclub-payment')
		TriggerEvent("dream-bossmenu:server:addAccountMoney", "vanilla", math.random(20, 40))
        end
    end
    TriggerClientEvent('dream-inventory:client:ItemBox', Player.PlayerData.source, Framework.Shared.Items['burger-ticket'], "remove")
end)