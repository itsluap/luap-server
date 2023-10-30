local QBCore = exports['qb-core']:GetCoreObject()

local deliveryItem = nil
local truckBones = nil
local onJob = false
local packagesDelivered = false
local hasPackage = false
local shopCoords = vector3(0.0, 0.0, 0.0)
local returnVehicle = false
local roadRunnerTruck = nil
local handPackage = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

CreateThread(function()
    local PedBlip = AddBlipForCoord(Config.JobPedLocation)
    SetBlipSprite(PedBlip, Config.JobPedBlipSprite)
    SetBlipColour(PedBlip, Config.JobPedBlipSpriteColour)
    SetBlipAsShortRange(PedBlip, true)
    SetBlipScale(PedBlip, Config.JobPedBlipSpriteScale)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(Config.JobBlipName)
    EndTextCommandSetBlipName(PedBlip)
    QBCore.Functions.LoadModel(Config.JobPed)
    local RoadRunnerJobPed = Config.JobPedLocation
    local RoadRunnerPed = CreatePed(0, Config.JobPed, RoadRunnerJobPed.x, RoadRunnerJobPed.y, RoadRunnerJobPed.z-1.0, RoadRunnerJobPed.w, false, false)
	TaskStartScenarioInPlace(RoadRunnerPed, Config.JobPedAnimation, true)
	FreezeEntityPosition(RoadRunnerPed, true)
	SetEntityInvincible(RoadRunnerPed, true)
	SetBlockingOfNonTemporaryEvents(RoadRunnerPed, true)

    exports['qb-target']:AddTargetEntity(RoadRunnerPed, {
        options = {
            {
                icon = 'fas fa-circle',
                label = 'Sign In',
                canInteract = function()
                    return not onJob
                end,
                action = function()
                    TriggerServerEvent('indigo-deliveriesv2:CreateDeliveryGroupJob')
                end,
            },
            {
                icon = 'fas fa-circle',
                label = 'Cancel Delivery',
                canInteract = function()
                    return onJob
                end,
                action = function()
                    TriggerServerEvent('indigo-deliveriesv2:canceldelivery')
                end,
            },
            {
                icon = 'fas fa-circle',
                label = 'Return Vehicle',
                canInteract = function()
                    return returnVehicle
                end,
                action = function()
                    TriggerServerEvent('indigo-deliveriesv2:ReturnVehicleAndClean')
                end,
            },
            {
                icon = 'fas fa-circle',
                label = 'Apply for Job',
                action = function()
                    TriggerServerEvent('indigo-deliveriesv2:TakeJob')
                end,
            },
            {
                icon = 'fas fa-circle',
                label = 'Check Experience',
                action = function()
                    TriggerServerEvent('indigo-deliveriesv2:checkreputation')
                end,
            },
            -- {
            --     icon = 'fas fa-circle',
            --     label = 'Create Group',
            --     action = function()
            --         CreateGroup()
            --     end,
            -- },
        },
        distance = 2.0
    })
end)

-- USED THIS TO SHOW A NOTIFICATION ON OX_LIB TO SHOW HOW TO START THE JOB (IF YOU USE THIS UNCOMMENT THE OPTION IN THE TARGET ABOVE )
function CreateGroup()
    local alert = lib.alertDialog({
        header = 'To Create Group:',
        content = '- Get a phone  \n - Go to Job Center App \n - Create Group \n - Other members go to Job Center App \n - Join your friend\'s group',
        centered = true,
        cancel = true
    })
end

--  USED THIS TO TEST THE JOB WITHOUT TALING TO PED
-- RegisterCommand('deliv',function ()
--     TriggerServerEvent('indigo-deliveriesv2:CreateDeliveryGroupJob')
-- end)

RegisterNetEvent('indigo-deliveriesv2:createjobvehicle', function ()
    local truckhash = `boxville7`
    QBCore.Functions.LoadModel(truckhash)
    local TruckSpawn = Config.VehicleSpawn
    roadRunnerTruck = CreateVehicle(truckhash, TruckSpawn.x, TruckSpawn.y, TruckSpawn.z, TruckSpawn.w, true, true)

    local VehiclePlate = GetVehicleNumberPlateText(roadRunnerTruck)
    local networkID = NetworkGetNetworkIdFromEntity(roadRunnerTruck)
    SetEntityAsMissionEntity(roadRunnerTruck)
    SetNetworkIdExistsOnAllMachines(networkID, true)
    NetworkRegisterEntityAsNetworked(roadRunnerTruck)
    SetNetworkIdCanMigrate(networkID, true)
    SetVehicleDirtLevel(roadRunnerTruck, 0)
    SetVehicleEngineOn(roadRunnerTruck, true, true)
    SetVehicleDoorsLocked(roadRunnerTruck, 1)
    exports[Config.FuelScript]:SetFuel(roadRunnerTruck, 100)
    onJob = true
    TriggerServerEvent('indigo-deliveriesv2:givegroupvehiclekeys', VehiclePlate, networkID)
end)

RegisterNetEvent('indigo-deliveriesv2:addvehicletarget', function (networkID)
    truckBones = {
        'seat_dside_r',
        'seat_pside_r'
    }

    CreateThread(function()
        exports['qb-target']:AddTargetBone(truckBones, {
            options = {
                {
                    icon = 'fas fa-box',
                    label = 'Take Package',
                    action = function(entity)
                        handPackage =  true
                        TriggerServerEvent('indigo-deliveriesv2:TakePackages')
                    end,
                    canInteract = function(entity)
                        return NetworkGetNetworkIdFromEntity(entity) == networkID and not hasPackage and not handPackage
                    end,
                },
            },
            distance = 1.5,
        })
    end)
end)

RegisterNetEvent('indigo-deliveriesv2:changevarible', function ()
    handPackage = false
end)

RegisterNetEvent('indigo-deliveriesv2:addstoretarget', function (Coords)
    shopCoords = Coords

    exports['qb-target']:AddBoxZone('Delivery-TargetZone', vector3(shopCoords.x, shopCoords.y, shopCoords.z), 3.5, 2.0, {
        name='Delivery-TargetZone',
        debugPoly= false,
        heading= shopCoords.w,
        minZ = shopCoords.z-1 ,
        maxZ = shopCoords.z+1,
        }, {
            options = {
                {
                    icon = 'fas fa-circle',
                    label = 'Deliver Package',
                    canInteract = function()
                        return not packagesDelivered and hasPackage
                    end,
                    action = function()
                        handPackage = false
                        TriggerServerEvent('indigo-deliveriesv2:DeliverPackage', deliveryItem)
                    end,
                },
            },
        distance = 1.5
    })
end)

RegisterNetEvent('indigo-deliveriesv2:RemoveTarget', function ()
    exports['qb-target']:RemoveTargetBone(truckBones, 'Take Package')
end)

RegisterNetEvent('indigo-deliveriesv2:canreturn', function ()
    returnVehicle = true
end)

RegisterNetEvent('indigo-deliveriesv2:ReturnVehicle', function ()
    returnVehicle = false
    onJob = false
    packagesDelivered = false
    hasPackage = false
    shopCoords = vector3(0.0, 0.0, 0.0)
end)

RegisterNetEvent('indigo-deliveriesv2:deletevehicle', function ()
    if DoesEntityExist(roadRunnerTruck) then
        NetworkRequestControlOfEntity(roadRunnerTruck)
        Wait(500)
        DeleteEntity(roadRunnerTruck)
        roadRunnerTruck = nil
    end
end)

RegisterNetEvent('kevin-deliveriesv2:cleareverything', function ()
    truckBones = nil
    onJob = false
    packagesDelivered = false
    hasPackage = false
    shopCoords = vector3(0.0, 0.0, 0.0)
    returnVehicle = false
    if DoesEntityExist(roadRunnerTruck) then
        exports['qb-target']:RemoveTargetBone(truckBones, 'Take Package')
    end
end)

function HasBoxItems()
    local playeritems = QBCore.Functions.GetPlayerData().items
    for k, item in pairs(playeritems) do
        for boxes, v in pairs(Config.BoxesData) do
            if boxes == item.name then
                return item.name, v
            end
        end
    end
end

CreateThread(function()
    while true do
        if LocalPlayer.state['isLoggedIn'] then
            local player = PlayerPedId()
            local package, packagesData = HasBoxItems()
            if package then
                if not hasPackage then
                    deliveryItem = package
                    hasPackage = true
                    CreateandAnimate(packagesData)
                end
            elseif hasPackage then
                hasPackage = false
                DeleteEntity(DeliveryBox)
                ClearPedTasks(player)
            end
        end
        Wait(1000)
    end
end)

function CreateandAnimate(packagesData)
    local player = PlayerPedId()
    local animDict = 'anim@heists@box_carry@'
    local animName = 'idle'
    LoadAnim(animDict)
    TaskPlayAnim(player, animDict, animName, 6.0, -6.0, -1, 49, 0, 0, 0, 0)
    local x, y, z = table.unpack(GetEntityCoords(player))
    QBCore.Functions.LoadModel(packagesData.name)
    DeliveryBox = CreateObject(packagesData.name, x, y, z, true, true, true)
    AttachEntityToEntity(DeliveryBox, player, GetPedBoneIndex(player, 28422), packagesData.placement.x,packagesData.placement.y,packagesData.placement.z,packagesData.placement.xrot,
    packagesData.placement.yrot, packagesData.placement.zrot, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(DeliveryBox)
    CarryAnimation(animDict, animName)
    DisableControls()
end

function DisableControls()
    CreateThread(function ()
        while hasPackage do
            DisableControlAction(0, 21, Config.DisableSprintingWithPackages) -- Sprinting
            DisableControlAction(0, 22, Config.DisableJumpingWithPackages) -- Jumping
            DisableControlAction(0, 23, Config.DisableVehicleEnteringWithPackages) -- Vehicle Entering
            DisableControlAction(0, 36, Config.DisableCrouchWithPackages) -- Ctrl
            DisableControlAction(0, 24, Config.DisableAttackingWithPackages) -- Disable Attack
            DisableControlAction(0, 25, Config.DisableAimingWithPackages) -- Disable Aim
            Wait(1)
        end
    end)
end

function CarryAnimation(animDict, animName)
    local player = PlayerPedId()
    CreateThread( function ()
        while hasPackage do
            if not IsEntityPlayingAnim(player, animDict, animName, 3) then
                TaskPlayAnim(player, animDict, animName, 6.0, -6.0, -1, 49, 0, 0, 0, 0)
            end
            Wait(1000)
        end
    end)
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(1)
    end
end