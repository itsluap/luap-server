local QBCore = exports['qb-core']:GetCoreObject()

local cancarry = false
local TruckBones
local OnJob = false
local PackagesDelivered = false
local HasPackage = false
local CanCollectPayment = false
local ShopCoords = vector3(0.0, 0.0, 0.0)
local ReturnVehicle = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    cancarry = true
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    cancarry = false
end)

AddEventHandler('onResourceStart', function(resourceName)
    --if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        exports["ps-zones"]:DestroyZone('RoadRunner-TruckReturnZone')
        cancarry = true
    --end
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

    exports['indigo-target']:AddTargetEntity(RoadRunnerPed, {
        options = {
            {
                icon = Config.CheckInTargetIcon,
                label = Config.CheckInLabel,
                canInteract = function()
                    return not OnJob
                end,
                action = function()
                    TriggerEvent('kevin-deliveries:TalkToJobPed')
                end,
            },
            {
                icon = Config.GroupManagementTargetIcon,
                label = Config.GroupManagementLabel,
                action = function()
                    ExecuteCommand('group')
                end,
            },
            {
                icon = Config.CollectPaymentTargetIcon,
                label = Config.CollectPaymentLabel,
                canInteract = function()
                    return CanCollectPayment
                end,
                action = function()
                    TriggerEvent('kevin-deliveries:CleanandCollect')
                end,
            },
            {
                icon = Config.ReturnVehicleTargetIcon,
                label = Config.ReturnVehicleLabel,
                canInteract = function()
                    return ReturnVehicle
                end,
                action = function()
                    TriggerEvent('kevin-deliveries:ReturnVehicle')
                end,
            },
            {
                icon = Config.ApplyForJobTargetIcon,
                label = Config.ApplyForJobLabel,
                action = function()
                    TriggerEvent('kevin-deliveries:ApplyForJob')
                end,
            },
        },
        distance = 2.0
    })
end)

RegisterNetEvent('kevin-deliveries:TalkToJobPed', function ()
    if Config.JobNeeded then
        if PlayerJob.name == Config.JobName then
            if exports['ps-playergroups']:IsGroupLeader() then
                if exports['ps-playergroups']:GetJobStage() == 'WAITING' then
                    local GroupID = exports['ps-playergroups']:GetGroupID()
                    local model = GetHashKey('boxville7')
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Wait(0)
                    end
                    TriggerServerEvent('kevin-deliveries:CreateDeliveryGroupJob', GroupID)
                else
                    QBCore.Functions.Notify(Config.GroupBusyNotify, 'error', 5000)
                end
            else
                QBCore.Functions.Notify(Config.NotGroupLeaderNotify, 'error', 5000)
            end
        else
            QBCore.Functions.Notify('You do not seem to work here.', 'error')
        end
    else
        if exports['ps-playergroups']:IsGroupLeader() then
            if exports['ps-playergroups']:GetJobStage() == 'WAITING' then
                local GroupID = exports['ps-playergroups']:GetGroupID()
                local model = GetHashKey('boxville7')
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Wait(0)
                end
                TriggerServerEvent('kevin-deliveries:CreateDeliveryGroupJob', GroupID)
            else
                QBCore.Functions.Notify(Config.GroupBusyNotify, 'error', 5000)
            end
        else
            QBCore.Functions.Notify(Config.NotGroupLeaderNotify, 'error', 5000)
        end
    end
end)

RegisterNetEvent('kevin-deliveries:ApplyForJob', function ()
    if PlayerJob.name == Config.JobName then
        TriggerEvent('QBCore:Notify', Config.AlreadyWorkHereNotify, "error", 3000)
    else
        TriggerServerEvent('kevin-deliveries:TakeJob')
    end
end)

RegisterNetEvent('kevin-deliveries:StartDelivery', function (DeliveryTruckId, Coords)
    OnJob = true
    RoadRunnerTruck = NetworkGetEntityFromNetworkId(DeliveryTruckId)
    ShopCoords = Coords
    SetVehicleLivery(RoadRunnerTruck, 5)
    SetVehicleDirtLevel(RoadRunnerTruck, 0)
    SetVehicleEngineOn(RoadRunnerTruck, true, true)
    SetVehicleDoorsLocked(RoadRunnerTruck, 1)
    exports[Config.FuelScript]:SetFuel(RoadRunnerTruck, 100)

    if Config.ItemPlacement == 'target' then
        TruckBones = {
            'seat_dside_r',
            'seat_pside_r'
        }
        exports['indigo-target']:AddTargetBone(TruckBones, {
            options = {
                {
                    icon = Config.TruckTargetIcon,
                    label = Config.TruckTargetLabel,
                    action = function()
                        TriggerServerEvent('kevin-deliveries:TakePackages',exports['ps-playergroups']:GetGroupID())
                    end,
                    canInteract = function(entity, distance, data)
                        return entity == RoadRunnerTruck and not HasPackage
                    end,
                },
            },
            distance = 1.5,
        })
    end

    exports['indigo-target']:AddBoxZone('Delivery-TargetZone', vector3(ShopCoords.x, ShopCoords.y, ShopCoords.z), 3.5, 2.0, {
        name='Delivery-TargetZone',
        debugPoly= false,
        heading= ShopCoords.w,
        minZ = ShopCoords.z-1 ,
        maxZ = ShopCoords.z+1,
        }, {
            options = {
                {
                    icon = Config.DeliverTargetIcon,
                    label = Config.DeliverTargetLabel,
                    canInteract = function()
                        return not PackagesDelivered and HasPackage
                    end,
                    action = function()
                        TriggerServerEvent('kevin-deliveries:DeliverPackage',exports['ps-playergroups']:GetGroupID())
                    end,
                },
            },
        distance = 1.5
    })
end)

RegisterNetEvent('kevin-deliveries:RemoveTarget', function ()
    exports['indigo-target']:RemoveTargetBone(TruckBones, Config.TruckTargetLabel)
end)

RegisterNetEvent('kevin-deliveries:CanReturn', function ()
    CanCollectPayment = true
    ReturnVehicle = true
end)

RegisterNetEvent('kevin-deliveries:CleanandCollect', function ()
    CanCollectPayment = false
    local GroupID = exports['ps-playergroups']:GetGroupID()
    TriggerServerEvent('kevin-deliveries:CollectPayment', GroupID)
end)

RegisterNetEvent('kevin-deliveries:ReturnVehicle', function ()
    if exports['ps-playergroups']:IsGroupLeader() then
        if exports['ps-playergroups']:GetJobStage() == 'ROADRUNNER DELIVERY' then
            local GroupID = exports['ps-playergroups']:GetGroupID()
            TriggerServerEvent('kevin-deliveries:ReturnVehicleAndClean', GroupID)
            ReturnVehicle = false
            OnJob = false
            PackagesDelivered = false
            HasPackage = false
            CanCollectPayment = false
            ShopCoords = vector3(0.0, 0.0, 0.0)
        else
            QBCore.Functions.Notify(Config.GroupNotOnJobNotify, 'error', 5000)
        end
    else
        QBCore.Functions.Notify(Config.IfNotGroupLeaderCannotReturnVehicleNotify, 'error', 5000)
    end
end)

RegisterNetEvent('kevin-deliveries:CreateZone', function ()
    exports["ps-zones"]:CreateBoxZone("RoadRunner-TruckReturnZone", Config.VehicleSpawn, 30.0, 30.0, {
        debugPoly = false,
        heading = Config.VehicleSpawn.w,
        minZ = Config.VehicleSpawn.z - 1,
        maxZ = Config.VehicleSpawn.z + 5,
    })
end)

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    local GroupID = exports['ps-playergroups']:GetGroupID()
    if ZoneName == 'RoadRunner-TruckReturnZone' then
        TriggerServerEvent('kevin-deliveries:SendEndMessages', GroupID)
        exports["ps-zones"]:DestroyZone('RoadRunner-TruckReturnZone')
    end
end)

RegisterNetEvent('kevin-deliveries:CantReturn', function ()
    ReturnVehicle = true
end)

CreateThread(function()
    while true do
        if cancarry then
            local player = PlayerPedId()
            local Item = QBCore.Functions.HasItem(Config.TrunkItems[1].name)
            if Item then
                if not HasPackage then
                    HasPackage = true
                    LoadAnim('anim@heists@box_carry@')
                    TaskPlayAnim(player, 'anim@heists@box_carry@', 'idle', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
                    local boxhash = `prop_cs_cardbox_01`
                    QBCore.Functions.LoadModel(boxhash)
                    DeliveryBox = CreateObject(boxhash, 0, 0, 0, true, true, true)
                    AttachEntityToEntity(DeliveryBox, player, GetPedBoneIndex(player, 0xEB95), 0.075, -0.00, 0.255, -130.0, 105.0, 0.0, true, true, false, false, 0, true)
                    CarryAnimation()
                    DisableControls()
                end
            elseif HasPackage then
                HasPackage = false
                DeleteEntity(DeliveryBox)
                ClearPedTasks(player)
            end
        end
        Wait(1000)
    end
end)

function DisableControls()
    CreateThread(function ()
        while HasPackage do
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

function CarryAnimation()
    local player = PlayerPedId()
    CreateThread( function ()
        while HasPackage do
            if not IsEntityPlayingAnim(player, 'anim@heists@box_carry@', 'idle', 3) then
                TaskPlayAnim(player, 'anim@heists@box_carry@', 'idle', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
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