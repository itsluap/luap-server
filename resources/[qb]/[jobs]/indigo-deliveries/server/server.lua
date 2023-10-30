local QBCore = exports['qb-core']:GetCoreObject()

local Jobs = {}

RegisterNetEvent('indigo-deliveriesv2:TakeJob', function ()
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    if Player.PlayerData.job.name == Config.JobName then
        TriggerClientEvent('QBCore:Notify', PlayerId, 'You are already employed here', "error", 3000)
    else
        Player.Functions.SetJob(Config.JobName,0)
        TriggerClientEvent('QBCore:Notify', PlayerId, "You got a new job..", "success", 3000)
    end
end)

RegisterServerEvent('indigo-deliveriesv2:CreateDeliveryGroupJob', function()
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    local group = exports['qb-phone']:GetGroupByMembers(PlayerId)
    if group then
        if Config.JobNeeded then
            if Player.PlayerData.job.name == Config.JobName then
                TriggerEvent('indigo-deliveriesv2:startjob', PlayerId)
            else
                TriggerClientEvent('QBCore:Notify', PlayerId, 'You do not work here', "error", 3000)
            end
        else
            TriggerEvent('indigo-deliveriesv2:startjob', PlayerId)
        end
    else
        TriggerClientEvent('QBCore:Notify', PlayerId, 'You are not in a group..', "error", 3000)
    end
end)

function GetStoreInfo(source, group)
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    if not group then return end
    local playerRep = Player.PlayerData.metadata['deliveries']
    local data = Config.Shops[1]
    if playerRep >= Config.DeliveryMidReputation and playerRep < Config.DeliveryHighReputation then
        data = Config.Shops[2]
    elseif playerRep >= Config.DeliveryHighReputation then
        data = Config.Shops[math.random(#Config.Shops)]
    end
    local coords = data.Coords[math.random(#data.Coords)]
    local packages = math.random(data.Packages.minamount, data.Packages.maxamount)
    local reputation = data.Reputation
    local payment = math.random(data.Payment.minamount, data.Payment.maxamount)
    if playerRep >= Config.DeliveryHighReputation then
        payment = math.random(Config.Shops[3].Payment.minamount, Config.Shops[3].Payment.maxamount)
    end
    return coords, packages, reputation, payment
end

RegisterNetEvent('indigo-deliveriesv2:startjob', function (source)
    local PlayerId = source
    local group = exports['qb-phone']:GetGroupByMembers(PlayerId)
    local leader = exports['qb-phone']:GetGroupLeader(group)
    if PlayerId == leader then
        Jobs[group] = {StoreLocation = vector4(0.0, 0.0, 0.0, 0.0), DeliveryTruckId = 0, DeliveryPackages = 0, CollectedPackages = 0, DeliveredPackages = 0, Payment = 0, Reputation = 0}
        exports['qb-phone']:pNotifyGroup(group, "RoadRunner Delivery", "Deliver packages to the customer", "fas fa-bars", '#090fd6', 7500)
        local coords, packages, reputation, payment = GetStoreInfo(PlayerId, group)
        print(coords, packages, reputation, payment)
        Jobs[group]['StoreLocation'] = coords
        Jobs[group]['DeliveryPackages'] = packages
        Jobs[group]['Reputation'] = reputation
        Jobs[group]['Payment'] = payment
        TriggerClientEvent('indigo-deliveriesv2:createjobvehicle', PlayerId, Jobs[group]['DeliveryPackages'])
    else
        TriggerClientEvent('QBCore:Notify', PlayerId, 'You are not group leader', "error", 3000)
    end
end)

RegisterNetEvent('indigo-deliveriesv2:givegroupvehiclekeys', function (VehiclePlate, TruckNetworkId)
    local PlayerId = source
    local group = exports['qb-phone']:GetGroupByMembers(PlayerId)
    local members = exports['qb-phone']:getGroupMembers(group)
    Jobs[group]['DeliveryTruckId'] = TruckNetworkId
    for i = 1, #members do
        TriggerClientEvent('vehiclekeys:client:SetOwner', members[i], VehiclePlate)
        TriggerClientEvent('indigo-deliveriesv2:addvehicletarget', members[i], Jobs[group]['DeliveryTruckId'])
        TriggerClientEvent('indigo-deliveriesv2:addstoretarget', members[i], Jobs[group]['StoreLocation'])
    end

    exports['qb-phone']:pNotifyGroup(group, 'CURRENT TASK', 'DELIVER PACKAGES TO STORES', "fas fa-bars", '#86F9A1', 8000)
    local Stages = {
        [1] = {name = "Deliver the packages to the marked store", isDone = false , id = 1},
        [2] = {name = "Return back to the port and return truck", isDone = false , id = 2},
    }
    exports['qb-phone']:setJobStatus(group, "RoadRunner Delivery", Stages)
    local blip = {
        coords = Jobs[group]['StoreLocation'],
        color = 32,
        alpha = 255,
        sprite = 1,
        scale = 0.62,
        label = "Delivery Destination",
        route = true,
        routeColor = 32,
    }
    exports['qb-phone']:CreateBlipForGroup(group, "delivery-location", blip)
end)

RegisterServerEvent('indigo-deliveriesv2:TakePackages', function()
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    local group = exports['qb-phone']:GetGroupByMembers(PlayerId)
    local job = exports["qb-phone"]:getJobStatus(group)
    local ped = GetPlayerPed(PlayerId)
    local pcoords = QBCore.Functions.GetCoords(ped)
    local coords = vector3(pcoords.x, pcoords.y, pcoords.z)
    local dcoords = vector3(Jobs[group]['StoreLocation'].x, Jobs[group]['StoreLocation'].y, Jobs[group]['StoreLocation'].z)
    if not job then return end
    if #(coords - dcoords) < 25.0 then
        local items = {}
        for key, value in pairs(Config.BoxesData) do
            table.insert(items, {key, value})
        end
        local random = math.random(#items)
        local randomItem = items[random]
        if Player.Functions.AddItem(randomItem[1], 1, false) then
            TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[randomItem[1]], 'add')

            Jobs[group]['CollectedPackages'] = Jobs[group]['CollectedPackages'] + 1
            if Jobs[group]['CollectedPackages'] ==  Jobs[group]['DeliveryPackages'] then
                local members = exports['qb-phone']:getGroupMembers(group)
                for i=1, #members do
                    TriggerClientEvent('indigo-deliveriesv2:RemoveTarget', members[i])
                end
            end
        end
    else
        TriggerClientEvent('indigo-deliveriesv2:changevarible', PlayerId)
        TriggerClientEvent('QBCore:Notify', PlayerId, 'To far from location..', 'error', 3000)
    end
end)

RegisterNetEvent('indigo-deliveriesv2:DeliverPackage', function (item)
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    local group = exports['qb-phone']:GetGroupByMembers(PlayerId)
    local job = exports["qb-phone"]:getJobStatus(group)
    if not job then return end
    if Jobs[group]['DeliveredPackages'] < Jobs[group]['DeliveryPackages'] then
        if Player.Functions.RemoveItem(item, 1, false) then
            TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[item], 'remove')

            Jobs[group]['DeliveredPackages'] = Jobs[group]['DeliveredPackages'] + 1
            exports['qb-phone']:pNotifyGroup(group, 'DELIVERY NOTIFICATION', 'PACKAGES : '..Jobs[group]['DeliveredPackages']..' / '..Jobs[group]['DeliveryPackages'], "fas fa-bars", '#86F9A1', 8000)
            if Jobs[group]['DeliveredPackages'] ==  Jobs[group]['DeliveryPackages'] then
                local leader = exports['qb-phone']:GetGroupLeader(group)
                TriggerClientEvent('indigo-deliveriesv2:canreturn', leader)
                
                exports['qb-phone']:pNotifyGroup(group, 'TASK COMPLETED', 'ALL PACKAGES DELIVERED', "fas fa-bars", '#86F9A1', 8000)
                Wait(3500)
                exports['qb-phone']:pNotifyGroup(group, 'CURRENT TASK', 'RETURN TO THE PORT.', "fas fa-bars", '#86F9A1', 8000)

                local Stages = {
                    [1] = {name = "Deliver the packages to the marked store", isDone = true , id = 1},
                    [2] = {name = "Return back to the port and return truck", isDone = false , id = 2},
                }
                exports['qb-phone']:setJobStatus(group, "RoadRunner Delivery", Stages)
                exports['qb-phone']:RemoveBlipForGroup(group, "delivery-location")
                local blip = {
                    coords = Config.VehicleSpawn,
                    color = 32,
                    alpha = 255,
                    sprite = 1,
                    scale = 0.62,
                    label = "RoadRunner Warehouse",
                    route = true,
                    routeColor = 32,
                }
                exports['qb-phone']:CreateBlipForGroup(group, "delivery-warehouse", blip)
            end
        end
    end
end)

RegisterNetEvent('indigo-deliveriesv2:ReturnVehicleAndClean', function ()
    local PlayerId = source
    local group = exports['qb-phone']:GetGroupByMembers(PlayerId)
    local leader = exports['qb-phone']:GetGroupLeader(group)
    local job = exports["qb-phone"]:getJobStatus(group)
    if not job then return end
    if PlayerId == leader then
        exports['qb-phone']:RemoveBlipForGroup(group, "delivery-warehouse")
        local Stages = {
            [1] = {name = "Deliver the packages to the marked store", isDone = true , id = 1},
            [2] = {name = "Return back to the port and return truck", isDone = true , id = 2},
        }
        exports['qb-phone']:setJobStatus(group, "RoadRunner Delivery", Stages)
        local members = exports['qb-phone']:getGroupMembers(group)
        for i=1, #members do
            TriggerClientEvent('indigo-deliveriesv2:cleareverything', members[i])
        end
        TriggerClientEvent('indigo-deliveriesv2:deletevehicle', PlayerId)
        TriggerEvent('indigo-deliveriesv2:CollectPayment', PlayerId)
    else
        TriggerClientEvent('QBCore:Notify', PlayerId, 'You are not group leader', "error", 3000)
    end
end)

RegisterNetEvent('indigo-deliveriesv2:CollectPayment', function (source)
    local PlayerId = source
    local group = exports['qb-phone']:GetGroupByMembers(PlayerId)
    local members = exports['qb-phone']:getGroupMembers(group)
    local leader = exports['qb-phone']:GetGroupLeader(group)
    local job = exports["qb-phone"]:getJobStatus(group)
    if not job then return end
    if PlayerId == leader then
        local pay = Jobs[group]['Payment']
        exports['qb-phone']:resetJobStatus(group)
        for i = 1, #members do
            local Players = QBCore.Functions.GetPlayer(members[i])
            Players.Functions.AddMoney(Config.PaymentMethod, pay, 'RoadRunner Delivery Payment')
            local Reputation = Players.PlayerData.metadata['deliveries'] + Jobs[group]['Reputation']
            Players.Functions.SetMetaData('deliveries', Reputation)
        end
        Jobs[group] = nil
    else
        TriggerClientEvent('QBCore:Notify', PlayerId, 'You are not group leader', "error", 3000)
    end
end)

RegisterNetEvent('indigo-deliveriesv2:canceldelivery', function ()
    local PlayerId = source
    local group = exports['qb-phone']:GetGroupByMembers(PlayerId)
    local leader = exports['qb-phone']:GetGroupLeader(group)
    local job = exports["qb-phone"]:getJobStatus(group)
    if not job then return end
    if PlayerId == leader then
        exports['qb-phone']:RemoveBlipForGroup(group, "delivery-location")
        exports['qb-phone']:RemoveBlipForGroup(group, "delivery-warehouse")
        exports['qb-phone']:resetJobStatus(group)
        local members = exports['qb-phone']:getGroupMembers(group)
        Jobs[group] = nil
        for i=1, #members do
            TriggerClientEvent('indigo-deliveriesv2:cleareverything', members[i])
        end
        TriggerClientEvent('indigo-deliveriesv2:deletevehicle', PlayerId)
    else
        TriggerClientEvent('QBCore:Notify', PlayerId, 'You are not group leader', "error", 3000)
    end
end)

RegisterNetEvent('indigo-deliveriesv2:checkreputation', function ()
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    local Reputation = Player.PlayerData.metadata['deliveries']
    TriggerClientEvent('QBCore:Notify', PlayerId, 'You current reputation: '..Reputation, "primary", 3000)
end)