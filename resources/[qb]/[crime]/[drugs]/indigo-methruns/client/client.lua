local QBCore = exports['qb-core']:GetCoreObject()

local currentCops = 0
local playerData = QBCore.Functions.GetPlayerData()
local methvehicle = nil
local locationData = nil
local methCarLocation = vector3(0.0, 0.0, 0.0)
local supplerLocation = vector3(0.0, 0.0, 0.0)
local dropLocation = vector3(0.0, 0.0, 0.0)
local supplier = nil
local validPackages = false
local gotTimer = false
local gotPackages = false
local gotLocation = false
local ambushPeds = nil
local collectedItems = 0
local canCollect = false
local caseprop = false
local gotCase = false
local itemName = nil
local completed = false
local dropBlip = nil
local supplierBlip = nil

RegisterNetEvent('police:SetCopCount', function(amount)
    currentCops = amount
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    playerData = QBCore.Functions.GetPlayerData()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        playerData = QBCore.Functions.GetPlayerData()
        exports['ps-zones']:DestroyZone('Meth-CarZone')
        exports['ps-zones']:DestroyZone('Meth-SupplierZone')
        exports['ps-zones']:DestroyZone('Meth-DropOffZone')
    end
end)

CreateThread(function()
    QBCore.Functions.LoadModel(Config.PedHash)
    local MethPed = CreatePed(0, Config.PedHash, Config.PedPos.x, Config.PedPos.y, Config.PedPos.z-1.0, Config.PedPos.w, false, false)
	TaskStartScenarioInPlace(MethPed, 'WORLD_HUMAN_SMOKING_POT', true)
	FreezeEntityPosition(MethPed, true)
	SetEntityInvincible(MethPed, true)
	SetBlockingOfNonTemporaryEvents(MethPed, true)

    exports['qb-target']:AddTargetEntity(MethPed, {
        options = {
            {
                icon = 'fas fa-box',
                label = 'Hand Goodies',
                canInteract = function()
                    return not validPackages
                end,
                action = function()
                    StartItems()
                end,
            },
            {
                icon = 'fas fa-list-check',
                label = 'Get Task',
                canInteract = function()
                    return validPackages
                end,
                action = function()
                    GetTask()
                end,
            },
            {
                icon = 'fas fa-check',
                label = 'Check Goods',
                canInteract = function()
                    return not validPackages
                end,
                action = function()
                    if currentCops >= Config.CopNeeded then
                        TriggerServerEvent('indigo-methruns:verifyitems')
                    else
                        QBCore.Functions.Notify('You cannot do this right now..', 'error', 4000)
                    end
                end,
            },
            {
                icon = 'fas fa-mobile-screen-button',
                label = 'Check Status',
                action = function()
                    TriggerServerEvent('indigo-methruns:checkrep')
                end,
            },
            {
                icon = 'fas fa-list-check',
                label = 'Collect Reward',
                canInteract = function()
                    return canCollect
                end,
                action = function()
                    TriggerServerEvent('indigo-methruns:getmethcase')
                    canCollect = false
                    gotCase = true
                end,
            },
        },
        distance = 2.0
    })
end)

RegisterNetEvent('ps-zones:enter', function(ZoneName, ZoneData)
    if ZoneName == 'Meth-CarZone' then
        CreateMethVeh()
    elseif ZoneName == 'Meth-SupplierZone'  then
        CreateSupplier()
    elseif ZoneName == 'Meth-DropOffZone' then
        DropTarget()
    end
end)

RegisterNetEvent('ps-zones:leave', function(ZoneName, ZoneData)
    if ZoneName == 'Meth-DropOffZone' then
        if DoesEntityExist(methvehicle) then
            exports['qb-target']:RemoveTargetBone('boot', 'Drop off')
        end
    end
end)

function DropTarget()
    exports['qb-target']:AddTargetBone('boot', {
        options = {
            {
                icon = 'fas fa-boxes-stacked',
                label = 'Drop off',
                canInteract = function(entity)
                    return entity == methvehicle
                end,
                action = function()
                    DropOff()
                end,
            },
        },
        distance = 1.5,
    })
end

function DropOff()
    local item = QBCore.Functions.HasItem(itemName, RecievedPackages)
    if item then
        TriggerEvent('animations:client:EmoteCommandStart', {'mechanic4'})
        local time = math.random(20000, 25000)
        QBCore.Functions.Progressbar('start_delivery', 'Dropping Off', 20000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {
        }, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {'c'})
            SetVehicleUndriveable(methvehicle, true)
            TriggerServerEvent('indigo-methruns:removeitem', itemName, RecievedPackages)
        end, function() -- Cancel
            TriggerEvent('animations:client:EmoteCommandStart', {'c'})
            QBCore.Functions.Notify('Cancelled', 'error')
        end)
    else
        QBCore.Functions.Notify('Something with the item isn\'t right..', 'error')
    end
end

function CreateMethVeh()
    exports['ps-zones']:DestroyZone('Meth-CarZone')
    ClearAreaOfVehicles(methCarLocation.x, methCarLocation.y, methCarLocation.z, 15.0, false, false, false, false, false)
    local vehHash = Config.VehicleNames[math.random(#Config.VehicleNames)]
    QBCore.Functions.LoadModel(vehHash)
    methvehicle = CreateVehicle(vehHash, methCarLocation.x, methCarLocation.y, methCarLocation.z, methCarLocation.w, true, true)
    SetVehicleDirtLevel(methvehicle, 0)
    SetEntityAsMissionEntity(methvehicle)
    
    CreateThread(function ()
        while not gotTimer do
            if IsPedInVehicle(PlayerPedId(), methvehicle) then
                gotTimer = true
                RemoveBlip(MethCarBlip)
                GetSupplier()
            end
            Wait(100)
        end
    end)
end

function StartItems()
    if Config.Inventory == 'qb' then
        TriggerEvent('inventory:client:SetCurrentStash', 'Handoff')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'Handoff', {
            maxweight = 4000000,
            slots = 50,
        })
    else
        exports.ox_inventory:openInventory('stash', 'handoff_member')
    end
end

RegisterNetEvent('indigo-methruns:client:verifypackages', function ()
    validPackages = true
end)

function GetTask()
    local phone = QBCore.Functions.HasItem(Config.PhoneItemName)
    local playerMeta = playerData.metadata['methruns']
    if phone then
        if Config.Phone == 'qb' then
            TriggerEvent('indigo-phone:client:CustomNotification', 'TASK NOTIFICATION', 'Get the vehicle marked on your gps..', 'fas fa-bars', '#c07ef2', 8500)
        elseif Config.Phone == 'gks' then
            TriggerEvent('gksphone:notifi', {title = 'TASK NOTIFICATION', message = 'Get the vehicle marked on your gps..', img= '/html/static/img/icons/messages.png'})
        elseif Config.Phone == 'qs' then
            TriggerEvent('qs-smartphone:client:notify', {title = 'TASK NOTIFICATION', text = 'Get the vehicle marked on your gps..', icon = './img/apps/whatsapp.png', timeout = 5500})
        end
    else
        QBCore.Functions.Notify('Get the vehicle marked on your gps..', 'primary', 4000)
    end
    if playerMeta < Config.LevelRep then
        itemName = Config.LowRepItem
    elseif playerMeta >= Config.LevelRep then
        itemName = Config.HighRepItem
    end
    validPackages = false
    methCarLocation = Config.CarSpawns[math.random(#Config.CarSpawns)]

    MethCarBlip = AddBlipForCoord(methCarLocation.x, methCarLocation.y, methCarLocation.z)
    SetBlipSprite(MethCarBlip, 1)
    SetBlipColour(MethCarBlip, 13)
    SetBlipScale(MethCarBlip, 0.85)
    SetBlipRoute(MethCarBlip, true)
    SetBlipRouteColour(MethCarBlip, 13)

    exports['ps-zones']:CreateCircleZone('Meth-CarZone', methCarLocation, 200.0, {
        debugPoly = false,
        minZ = methCarLocation.z - 1,
        maxZ = methCarLocation.z + 1,
    })
end

function GetSupplier()
    local phone = QBCore.Functions.HasItem(Config.PhoneItemName)
    if phone then
        if Config.Phone == 'qb' then
            TriggerEvent('indigo-phone:client:CustomNotification', 'TASK NOTIFICATION', 'Meet the supplier and get the products', 'fas fa-bars', '#c07ef2', 8500)
        elseif Config.Phone == 'gks' then
            TriggerEvent('gksphone:notifi', {title = 'TASK NOTIFICATION', message = 'Meet the supplier and get the products', img= '/html/static/img/icons/messages.png'})
        elseif Config.Phone == 'qs' then
            TriggerEvent('qs-smartphone:client:notify', {title = 'TASK NOTIFICATION', text = 'Meet the supplier and get the products', icon = './img/apps/whatsapp.png', timeout = 5500})
        end
    else
        QBCore.Functions.Notify('Meet the supplier and get the products', 'primary', 4000)
    end

    locationData = Config.PickupLocations[math.random(#Config.PickupLocations)]
    supplerLocation = locationData.PedSpawn
    supplierBlip = AddBlipForCoord(supplerLocation)
    SetBlipSprite(supplierBlip, 1)
    SetBlipColour(supplierBlip, 13)
    SetBlipScale(supplierBlip, 0.75)
    SetBlipRoute(supplierBlip, true)
    SetBlipRouteColour(supplierBlip, 13)

    exports['ps-zones']:CreateCircleZone('Meth-SupplierZone', supplerLocation, 200.0, {
        debugPoly = false,
        minZ = supplerLocation.z - 1,
        maxZ = supplerLocation.z + 1,
    })
end

function CollectItems()
    RecievedPackages = Config.ItemAmount
    collectedItems = collectedItems +1
    TriggerServerEvent('indigo-methruns:giveproducts', supplerLocation)
    if collectedItems == RecievedPackages then
        exports['qb-target']:RemoveTargetEntity(supplier, 'Pickup Goods')
        gotPackages = true
        SetPedAsNoLongerNeeded(supplier)
        RemoveBlip(supplierBlip)
        GetLocation()
        Alert()
    end
end

RegisterNetEvent('indigo-methruns:minuscollected', function ()
    collectedItems = collectedItems -1
end)

function SpawnAttackers()
    if playerData.metadata['methruns'] <= Config.LevelRep then
        for k, v in pairs(locationData.AmbushSpawn) do
            QBCore.Functions.LoadModel(Config.AmbushPed)
            ambushPeds = CreatePed(0, Config.AmbushPed, v.x, v.y, v.z, v.w, true, true)
            netId = NetworkGetNetworkIdFromEntity(ambushPeds)
            SetNetworkIdExistsOnAllMachines(netId, true)
            NetworkRegisterEntityAsNetworked(ambushPeds)
            SetNetworkIdCanMigrate(netId, true)
            SetPedAccuracy(ambushPeds, Config.LowRepPedAccuracy)
            SetPedArmour(ambushPeds, Config.LowRepPedArmor)
            SetPedMaxHealth(ambushPeds, Config.LowRepPedHealth)
            SetPedRelationshipGroupHash(ambushPeds, `HATES_PLAYER`)
            SetPedKeepTask(ambushPeds, true)
            SetCanAttackFriendly(ambushPeds, false, true)
            TaskCombatPed(ambushPeds, PlayerPedId(), 0, 16)
            SetPedCombatAttributes(ambushPeds, 46, true)
            SetPedCombatAbility(ambushPeds, 1)
            SetPedCombatAttributes(ambushPeds, 0, true)
            GiveWeaponToPed(ambushPeds, Config.LowRepPedWeapon, -1, false, true)
            SetPedDropsWeaponsWhenDead(ambushPeds, false)
            SetPedCombatRange(ambushPeds, 1)
            SetPedFleeAttributes(ambushPeds, 0, 0)
            SetBlockingOfNonTemporaryEvents(ambushPeds, true)
            SetPedSuffersCriticalHits(ambushPeds, false)
            SetPedCanRagdoll(ambushPeds, false)
        end
    elseif playerData.metadata['methruns'] >= Config.LevelRep then
        for k, v in pairs(locationData.AmbushSpawn) do
            QBCore.Functions.LoadModel(Config.AmbushPed)
            ambushPeds = CreatePed(0, Config.AmbushPed, v.x, v.y, v.z, v.w, true, true)
            netId = NetworkGetNetworkIdFromEntity(ambushPeds)
            SetNetworkIdExistsOnAllMachines(netId, true)
            NetworkRegisterEntityAsNetworked(ambushPeds)
            SetNetworkIdCanMigrate(netId, true)
            SetPedAccuracy(ambushPeds, Config.HighRepPedAccuracy)
            SetPedArmour(ambushPeds, Config.HighRepPedArmor)
            SetPedMaxHealth(ambushPeds, Config.HighRepPedHealth)
            SetPedRelationshipGroupHash(ambushPeds, `HATES_PLAYER`)
            SetPedKeepTask(ambushPeds, true)
            SetCanAttackFriendly(ambushPeds, false, true)
            TaskCombatPed(ambushPeds, PlayerPedId(), 0, 16)
            SetPedCombatAttributes(ambushPeds, 46, true)
            SetPedCombatAbility(ambushPeds, 1)
            SetPedCombatAttributes(ambushPeds, 0, true)
            GiveWeaponToPed(ambushPeds, Config.HighRepPedWeapon, -1, false, true)
            SetPedDropsWeaponsWhenDead(ambushPeds, false)
            SetPedCombatRange(ambushPeds, 1)
            SetPedFleeAttributes(ambushPeds, 0, 0)
            SetBlockingOfNonTemporaryEvents(ambushPeds, true)
            SetPedSuffersCriticalHits(ambushPeds, false)
            SetPedCanRagdoll(ambushPeds, false)
        end
    end
end

function CreateSupplier()
    QBCore.Functions.LoadModel(Config.PedHash)
    supplier = CreatePed(0, Config.PedHash, supplerLocation.x, supplerLocation.y, supplerLocation.z-1.0, supplerLocation.w, true, true)
    if DoesEntityExist(supplier) then
        SpawnAttackers()
        exports['ps-zones']:DestroyZone('Meth-SupplierZone')
        FreezeEntityPosition(supplier, true)
        SetEntityInvincible(supplier, true)
        SetBlockingOfNonTemporaryEvents(supplier, true)
        CreateThread(function ()
            exports['qb-target']:AddTargetEntity(supplier, {
                options = {
                    {
                        icon = 'fas fa-box',
                        label = 'Pickup Goods',
                        canInteract = function()
                            return not gotPackages
                        end,
                        action = function()
                            CollectItems()
                        end,
                    },
                },
                distance = 2.0
            })
        end)
    end
end

RegisterNetEvent('indigo-methruns:policetracker', function(coords)
    local transG = 250
    local MethVehicleGpsBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(MethVehicleGpsBlip, 161)
    SetBlipColour(MethVehicleGpsBlip, 43)
    SetBlipDisplay(MethVehicleGpsBlip, 8)
    SetBlipAlpha(MethVehicleGpsBlip, transG)
    SetBlipScale(MethVehicleGpsBlip, 1.5)
    SetBlipAsShortRange(MethVehicleGpsBlip, false)
    PulseBlip(MethVehicleGpsBlip)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Suspicious Vehicle')
    EndTextCommandSetBlipName(MethVehicleGpsBlip)
    while transG ~= 0 do
        Wait(14)
        transG = transG - 1
        SetBlipAlpha(MethVehicleGpsBlip, transG)
        if transG == 0 then
            RemoveBlip(MethVehicleGpsBlip)
            return
        end
    end
end)

function GetLocation()
    local phone = QBCore.Functions.HasItem(Config.PhoneItemName)
    if phone then
        if Config.Phone == 'qb' then
            TriggerEvent('indigo-phone:client:CustomNotification', 'TASK NOTIFICATION', 'Wait for a Drop Location', 'fas fa-bars', '#c07ef2', 8500)
        elseif Config.Phone == 'gks' then
            TriggerEvent('gksphone:notifi', {title = 'TASK NOTIFICATION', message = 'Wait for a Drop Location', img= '/html/static/img/icons/messages.png'})
        elseif Config.Phone == 'qs' then
            TriggerEvent('qs-smartphone:client:notify', {title = 'TASK NOTIFICATION', text = 'Wait for a Drop Location', icon = './img/apps/whatsapp.png', timeout = 5500})
        end
    else
        QBCore.Functions.Notify('Wait for a Drop Location', 'primary', 4000)
    end

    CreateThread(function ()
        while not gotLocation do
            MethVehiclePos = GetEntityCoords(methvehicle)
            TriggerServerEvent('indigo-methruns:policetracker',MethVehiclePos)
            Wait(4000)
        end
    end)

    Wait(Config.LocationTimer * 60000)
    gotLocation = true
    if phone then
        if Config.Phone == 'qb' then
            TriggerEvent('indigo-phone:client:CustomNotification', 'TASK NOTIFICATION', 'Deliver the goods and vehicle', 'fas fa-bars', '#c07ef2', 8500)
        elseif Config.Phone == 'gks' then
            TriggerEvent('gksphone:notifi', {title = 'TASK NOTIFICATION', message = 'Deliver the goods and vehicle', img= '/html/static/img/icons/messages.png'})
        elseif Config.Phone == 'qs' then
            TriggerEvent('qs-smartphone:client:notify', {title = 'TASK NOTIFICATION', text = 'Deliver the goods and vehicle', icon = './img/apps/whatsapp.png', timeout = 5500})
        end
    else
        QBCore.Functions.Notify('Deliver the goods and vehicle', 'primary', 4000)
    end

    dropLocation = Config.DropLocations[math.random(#Config.DropLocations)]
    dropBlip = AddBlipForCoord(dropLocation)
    SetBlipSprite(dropBlip, 1)
    SetBlipColour(dropBlip, 13)
    SetBlipScale(dropBlip, 0.75)
    SetBlipRoute(dropBlip, true)
    SetBlipRouteColour(dropBlip, 13)

    exports['ps-zones']:CreateCircleZone('Meth-DropOffZone', dropLocation, 15.0, {
        debugPoly = false,
        minZ = dropLocation.z - 1,
        maxZ = dropLocation.z + 1,
    })
end

RegisterNetEvent('indigo-methruns:leavevehicle', function ()
    CreateThread(function ()
        while DoesEntityExist(methvehicle) do
            local pos = GetEntityCoords(PlayerPedId())
            local dist = #(pos - GetEntityCoords(methvehicle))
            if dist > 50.0 then
                DeleteEntity(methvehicle)
                local phone = QBCore.Functions.HasItem(Config.PhoneItemName)
                if phone then
                    if Config.Phone == 'qb' then
                        TriggerEvent('indigo-phone:client:CustomNotification', 'TASK NOTIFICATION', 'Return to the boss for payment', 'fas fa-bars', '#c07ef2', 8500)
                    elseif Config.Phone == 'gks' then
                        TriggerEvent('gksphone:notifi', {title = 'TASK NOTIFICATION', message = 'Return to the boss for payment', img= '/html/static/img/icons/messages.png'})
                    elseif Config.Phone == 'qs' then
                        TriggerEvent('qs-smartphone:client:notify', {title = 'TASK NOTIFICATION', text = 'Return to the boss for payment', icon = './img/apps/whatsapp.png', timeout = 5500})
                    end
                else
                    QBCore.Functions.Notify('Return to the boss for payment', 'primary', 4000)
                end
                exports['ps-zones']:DestroyZone('Meth-DropOffZone')
                completed = true
                canCollect = true
                RemoveBlip(dropBlip)
                methvehicle = nil
                locationData = nil
                methCarLocation = vector3(0.0, 0.0, 0.0)
                supplerLocation = vector3(0.0, 0.0, 0.0)
                dropLocation = vector3(0.0, 0.0, 0.0)
                supplier = nil
                Goodies = false
                validPackages = false
                gotTimer = false
                gotPackages = false
                gotLocation = false
                ambushPeds = nil
                collectedItems = 0
                dropBlip = nil
            end
            Wait(1000)
        end
    end)
end)

RegisterNetEvent('indigo-methruns:rewards', function ()
    TriggerServerEvent('indigo-methruns:rewards', completed)
end)

RegisterNetEvent('indigo-methruns:changevars', function ()
    gotCase = false
    completed = false
end)

CreateThread(function()
    while true do
        if gotCase then
            local CaseItem = QBCore.Functions.HasItem(Config.Caseitem)
            if CaseItem then
                if not caseprop then
                    caseprop = true
                    TriggerEvent('animations:client:EmoteCommandStart', {'suitcase2'})
                end
            elseif caseprop then
                TriggerEvent('animations:client:EmoteCommandStart', {'c'})
                caseprop = false
            end
        end
        Wait(1000)
    end
end)

----- ALERTS PORTION
function Alert()
    if Config.Dispatch == 'ps-dispatch' then
        exports['ps-dispatch']:MethRuns()
    elseif Config.Dispatch == 'cd-dispatch' then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police'},
            coords = data.coords,
            title = '10-31 - Suspicious Drug Activity',
            message = 'Drug Activity at '..data.street,
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 67,
                scale = 1.5,
                colour = 2,
                flashes = false,
                text = '911 - Suspicious Drug Activity',
                time = (5*60*1000),
                sound = 1,
            }
        })
    end
end
