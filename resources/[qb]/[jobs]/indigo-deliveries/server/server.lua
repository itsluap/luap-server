local QBCore = exports['indigo-core']:GetCoreObject()

local Jobs = {}
local Location = vector4(0.0, 0.0, 0.0, 0.0)

local function FindJobById(id)
    for i=1, #Jobs do
        if Jobs[i]['GroupID'] == id then
            return i
        end
    end
    return 0
end

RegisterNetEvent('kevin-deliveries:TakeJob', function ()
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    Player.Functions.SetJob(Config.JobName,0)
    TriggerClientEvent('QBCore:Notify', PlayerId, Config.GotJobNotify, "success", 3000)
end)

RegisterServerEvent('kevin-deliveries:CreateDeliveryGroupJob', function(GroupID)
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    local Meta = Player.PlayerData.metadata['deliveries']
    if FindJobById(GroupID) == 0 then
        Jobs[#Jobs+1] = {GroupID = GroupID, DeliveryTruckId = 0, DeliveryPackages = 0, CollectedPackages = 0, DeliveredPackages = 0}

        local jobID = #Jobs
        local TruckSpawn = Config.VehicleSpawn
        local DeliveryTruck = CreateVehicle('boxville7', TruckSpawn.x, TruckSpawn.y, TruckSpawn.z, TruckSpawn.w, true, true)
        while not DoesEntityExist(DeliveryTruck) do
            Wait(25)
        end

        if DoesEntityExist(DeliveryTruck) then
            if Meta <= Config.DeliveryLowReputation and Meta < Config.DeliveryMidReputation then
                Location = Config.Shops[1]
            elseif Meta > Config.DeliveryMidReputation and Meta < Config.DeliveryHighReputation then
                Location = Config.Shops[2]
            elseif Meta >= Config.DeliveryHighReputation then
                Location = Config.Shops[3]
            end
            Jobs[jobID]['DeliveryTruckId'] = DeliveryTruck
            Jobs[jobID]['Location'] = Location.Coords[math.random(#Location.Coords)]
            Jobs[jobID]['DeliveryPackages'] = Location.Packages
            local TruckPlate = GetVehicleNumberPlateText(DeliveryTruck)
            local GroupMembers = exports['ps-playergroups']:getGroupMembers(GroupID)
            if Config.ItemPlacement == 'trunk' then
                local items = {}
                for k, item in pairs(Config.TrunkItems) do
                    local itemInfo = QBCore.Shared.Items[item.name:lower()]
                    items[item.slot] = {
                        name = itemInfo['name'],
                        amount = Jobs[jobID]['DeliveryPackages'],
                        info = item.info,
                        label = itemInfo['label'],
                        description = itemInfo['description'] and itemInfo['description'] or '',
                        weight = itemInfo['weight'],
                        type = itemInfo['type'],
                        unique = itemInfo['unique'],
                        useable = itemInfo['useable'],
                        image = itemInfo['image'],
                        slot = item.slot,
                    }
                end
                Config.TrunkItems = items
                TriggerEvent('inventory:server:addTrunkItems', TruckPlate, Config.TrunkItems)
            end
            for i=1, #GroupMembers do
                CreateThread(function ()
                    if Config.Phone == 'qb' then
                        TriggerClientEvent('indigo-phone:client:CustomNotification', GroupMembers[i], Config.PhoneNotification1Title, Config.PhoneNotification1, Config.PhoneNotification1Icon, Config.PhoneNotification1TextColour, 15000)
                    elseif Config.Phone == 'gks' then
                        TriggerClientEvent('gksphone:notifi', GroupMembers[i], {title = Config.PhoneNotification1Title, message = Config.PhoneNotification1, img= '/html/static/img/icons/messages.png'})
                    end
                end)
                TriggerClientEvent('vehiclekeys:client:SetOwner', GroupMembers[i], TruckPlate)
                TriggerClientEvent('kevin-deliveries:StartDelivery', GroupMembers[i], NetworkGetNetworkIdFromEntity(DeliveryTruck), Jobs[jobID]['Location'])
            end
            exports['ps-playergroups']:setJobStatus(GroupID, 'ROADRUNNER DELIVERY')
        end

        exports['ps-playergroups']:CreateBlipForGroup(GroupID, 'delivery-location', {
            label = 'buyer',
            coords = Jobs[jobID]['Location'],
            sprite = Config.DestinationBlip,
            color = Config.DestinationBlipSpriteColour,
            scale = Config.DestinationBlipSpriteScale,
            route = Config.DestinationBlipRoute,
            routeColor = Config.DestinationBlipRouteColour,
        })
    else
        print('no group id found in jobs')
    end
end)

RegisterServerEvent('kevin-deliveries:TakePackages', function(GroupID)
    local PlayerId = source
    local jobID = FindJobById(GroupID)
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    Player.Functions.AddItem(Config.TrunkItems[1].name, 1, false)
	TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[Config.TrunkItems[1].name], 'add')

    Jobs[jobID]['CollectedPackages'] = Jobs[jobID]['CollectedPackages'] + 1
    if Jobs[jobID]['CollectedPackages'] ==  Jobs[jobID]['DeliveryPackages'] then
        local GroupMembers = exports['ps-playergroups']:getGroupMembers(GroupID)
        for i=1, #GroupMembers do
            TriggerClientEvent('kevin-deliveries:RemoveTarget', GroupMembers[i])
        end
    end
end)

RegisterNetEvent('kevin-deliveries:DeliverPackage', function (GroupID)
    local PlayerId = source
    local jobID = FindJobById(GroupID)
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    local Package = Player.Functions.GetItemByName(Config.TrunkItems[1].name)
    if Package then
        Player.Functions.RemoveItem(Config.TrunkItems[1].name, 1, false)
        TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[Config.TrunkItems[1].name], 'remove')

        Jobs[jobID]['DeliveredPackages'] = Jobs[jobID]['DeliveredPackages'] + 1
        local GroupMembers = exports['ps-playergroups']:getGroupMembers(GroupID)
        for i=1, #GroupMembers do
            CreateThread(function ()
                if Config.Phone == 'qb' then
                    TriggerClientEvent('indigo-phone:client:CustomNotification', GroupMembers[i], Config.PhoneNotification2Title, Config.PhoneNotification2..Jobs[jobID]['DeliveredPackages']..' / '..Jobs[jobID]['DeliveryPackages'], Config.PhoneNotification2Icon, Config.PhoneNotification2TextColour, 15000)
                elseif Config.Phone == 'gks' then
                    TriggerClientEvent('gksphone:notifi', GroupMembers[i], {title = Config.PhoneNotification2Title, message = Config.PhoneNotification2..Jobs[jobID]['DeliveredPackages']..' / '..Jobs[jobID]['DeliveryPackages'], img= '/html/static/img/icons/messages.png'})
                end
            end)
        end
        if Jobs[jobID]['DeliveredPackages'] ==  Jobs[jobID]['DeliveryPackages'] then
            for i=1, #GroupMembers do
                TriggerClientEvent('kevin-deliveries:CanReturn', GroupMembers[i])
                CreateThread(function ()
                    if Config.Phone == 'qb' then
                        TriggerClientEvent('indigo-phone:client:CustomNotification', GroupMembers[i], Config.PhoneNotification3Title, Config.PhoneNotification3, Config.PhoneNotification3Icon, Config.PhoneNotification3TextColour, 15000)
                        Wait(3500)
                        TriggerClientEvent('indigo-phone:client:CustomNotification', GroupMembers[i], Config.PhoneNotification4Title, Config.PhoneNotification4, Config.PhoneNotification4Icon, Config.PhoneNotification4TextColour, 15000)
                    elseif Config.Phone == 'gks' then
                        TriggerClientEvent('gksphone:notifi', GroupMembers[i], {title = Config.PhoneNotification3Title, message = Config.PhoneNotification3, img= '/html/static/img/icons/messages.png'})
                        Wait(3500)
                        TriggerClientEvent('gksphone:notifi', GroupMembers[i], {title = Config.PhoneNotification4Title, message = Config.PhoneNotification4, img= '/html/static/img/icons/messages.png'})
                    end
                end)
                exports['ps-playergroups']:RemoveBlipForGroup(GroupID, 'delivery-location')
                exports['ps-playergroups']:CreateBlipForGroup(GroupID, 'delivery-warehouse', {
                    label = 'warehouse',
                    coords = Config.VehicleSpawn,
                    sprite = Config.ReturnBlipSprite,
                    color = Config.ReturnBlipSpriteColour,
                    scale = Config.ReturnBlipSpriteScale,
                    route = Config.ReturnBlipRoute,
                    routeColor = Config.ReturnBlipRouteColour,
                })
            end
            TriggerClientEvent('kevin-deliveries:CreateZone', PlayerId)
        end
    else
        TriggerClientEvent('QBCore:Notify', PlayerId, Config.NoPackageToDeliverNotify, 'error')
    end
end)

RegisterNetEvent('kevin-deliveries:ReturnVehicleAndClean', function (GroupID)
    local PlayerId = source
    local jobID = FindJobById(GroupID)
    local DeliveryTruckCoords = GetEntityCoords(Jobs[jobID]['DeliveryTruckId'])
    local ReturnCoords = vector3(Config.VehicleSpawn.x, Config.VehicleSpawn.y, Config.VehicleSpawn.z)
    if #(DeliveryTruckCoords - ReturnCoords) <= 10.0 then
        DeleteEntity(Jobs[jobID]['DeliveryTruckId'])
        exports['ps-playergroups']:RemoveBlipForGroup(GroupID, 'delivery-warehouse')
        Jobs[jobID] = nil
        exports['ps-playergroups']:setJobStatus(GroupID, 'WAITING')
    else
        TriggerClientEvent('QBCore:Notify', PlayerId, Config.TruckNotCloseNotify, 'error')
        TriggerClientEvent('kevin-deliveries:CantReturn', PlayerId)
    end
end)

RegisterNetEvent('kevin-deliveries:SendEndMessages', function (GroupID)
    local PlayerId = source
    local GroupMembers = exports['ps-playergroups']:getGroupMembers(GroupID)
    for i=1, #GroupMembers do
        CreateThread(function ()
            if Config.Phone == 'qb' then
                TriggerClientEvent('indigo-phone:client:CustomNotification', GroupMembers[i], Config.PhoneNotification5Title, Config.PhoneNotification5, Config.PhoneNotification5Icon, Config.PhoneNotification5TextColour, 15000)
                Wait(3500)
                TriggerClientEvent('indigo-phone:client:CustomNotification', GroupMembers[i], Config.PhoneNotification6Title, Config.PhoneNotification6, Config.PhoneNotification6Icon, Config.PhoneNotification6TextColour, 15000)
            elseif Config.Phone == 'gks' then
                TriggerClientEvent('gksphone:notifi', GroupMembers[i], {title = Config.PhoneNotification5Title, message = Config.PhoneNotification5, img= '/html/static/img/icons/messages.png'})
                Wait(3500)
                TriggerClientEvent('gksphone:notifi', GroupMembers[i], {title = Config.PhoneNotification6Title, message = Config.PhoneNotification6, img= '/html/static/img/icons/messages.png'})
            end
        end)
    end
end)

RegisterNetEvent('kevin-deliveries:CollectPayment', function ()
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    local pay = Location.Payment
    Player.Functions.AddMoney(Config.PaymentMethod, pay, 'RoadRunner Delivery Payment')
    local Reputation = Player.PlayerData.metadata['deliveries'] + Location.Reputation
    Player.Functions.SetMetaData('deliveries', Reputation)
end)
