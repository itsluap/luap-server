-----------------------
----   Variables   ----
-----------------------
local QBCore = exports['qb-core']:GetCoreObject()
local KeysList = {}
local isTakingKeys = false
local isCarjacking = false
local canCarjack = true
local AlertSend = false
local lastPickedVehicle = nil
local usingAdvanced = false
local IsHotwiring = false
local IsHacking = false
local trunkclose = true
local looped = false

local function robKeyLoop()
    if looped == false then
        looped = true
        while true do
            local sleep = 1000
            if LocalPlayer.state.isLoggedIn then
                sleep = 100

                local ped = PlayerPedId()
                local entering = GetVehiclePedIsTryingToEnter(ped)
                local carIsImmune = false
                if entering ~= 0 and not isBlacklistedVehicle(entering) then
                    sleep = 2000
                    local plate = QBCore.Functions.GetPlate(entering)

                    local driver = GetPedInVehicleSeat(entering, -1)
                    for _, veh in ipairs(Config.ImmuneVehicles) do
                        if GetEntityModel(entering) == joaat(veh) then
                            carIsImmune = true
                        end
                    end
                    -- Driven vehicle logic
                    if driver ~= 0 and not IsPedAPlayer(driver) and not HasKeys(plate) and not carIsImmune then
                        if IsEntityDead(driver) then
                            if not isTakingKeys then
                                isTakingKeys = true

                                TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(entering), 1)
                                QBCore.Functions.Progressbar("steal_keys", Lang:t("progress.takekeys"), 2500, false, false, {
                                    disableMovement = false,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true
                                }, {}, {}, {}, function() -- Done
                                    TriggerServerEvent('indigo-vehiclekeys:server:AcquireVehicleKeys', plate)
                                    isTakingKeys = false
                                end, function()
                                    isTakingKeys = false
                                end)
                            end
                        elseif Config.LockNPCDrivingCars then
                            TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(entering), 2)
                        else
                            TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(entering), 1)
                            TriggerServerEvent('indigo-vehiclekeys:server:AcquireVehicleKeys', plate)

                            --Make passengers flee
                            local pedsInVehicle = GetPedsInVehicle(entering)
                            for _, pedInVehicle in pairs(pedsInVehicle) do
                                if pedInVehicle ~= GetPedInVehicleSeat(entering, -1) then
                                    MakePedFlee(pedInVehicle)
                                end
                            end
                        end
                    -- Parked car logic
                    elseif driver == 0 and entering ~= lastPickedVehicle and not HasKeys(plate) and not isTakingKeys then
                        QBCore.Functions.TriggerCallback('indigo-vehiclekeys:server:checkPlayerOwned', function(playerOwned)
                            if not playerOwned then
                                if Config.LockNPCParkedCars then
                                    TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(entering), 2)
                                else
                                    TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(entering), 1)
                                end
                            end
                        end, plate)

                    end
                end

                -- Hotwiring while in vehicle, also keeps engine off for vehicles you don't own keys to
                if IsPedInAnyVehicle(ped, false) and not IsHotwiring and not IsHacking then
                    sleep = 1000
                    local vehicle = GetVehiclePedIsIn(ped)
                    local plate = QBCore.Functions.GetPlate(vehicle)

                    TriggerServerEvent('indigo-vehiclekeys:server:setGlobalState') -- setting globalstate so it can be used below

                    if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() and not HasKeys(plate) and not isBlacklistedVehicle(vehicle) and not AreKeysJobShared(vehicle) then
                        sleep = 0
                        SetVehicleEngineOn(vehicle, false, false, true)

                        if not GlobalState.isPlayerOwnedCar then -- trying to use globalstate to see if car is player owned or not
                            exports['ps-ui']:DisplayText("[H] Hotwire", "warning") -- Colors: primary, error, success, warning, info, mints"))
                            if IsControlJustPressed(0, 74) then
                                Hotwire(vehicle, plate)
                            end
                        else 
                            exports['ps-ui']:DisplayText("[H] Hack", "warning") -- Colors: primary, error, success, warning, info, mints"))
                            if IsControlJustPressed(0, 74) then
                                HackPlayerOwned(vehicle, plate)
                            end
                        end
                    end
                end

                if Config.CarJackEnable and canCarjack then
                    local playerid = PlayerId()
                    local aiming, target = GetEntityPlayerIsFreeAimingAt(playerid)
                    if aiming and (target ~= nil and target ~= 0) then
                        if DoesEntityExist(target) and IsPedInAnyVehicle(target, false) and not IsEntityDead(target) and not IsPedAPlayer(target) then
                            local targetveh = GetVehiclePedIsIn(target)
                            for _, veh in ipairs(Config.ImmuneVehicles) do
                                if GetEntityModel(targetveh) == joaat(veh) then
                                    carIsImmune = true
                                end
                            end
                            if GetPedInVehicleSeat(targetveh, -1) == target and not IsBlacklistedWeapon() then
                                local pos = GetEntityCoords(ped, true)
                                local targetpos = GetEntityCoords(target, true)
                                if #(pos - targetpos) < 5.0 and not carIsImmune then
                                    CarjackVehicle(target)
                                end
                            end
                        end
                    end
                end
                if entering == 0 and not IsPedInAnyVehicle(ped, false) and GetSelectedPedWeapon(ped) == `WEAPON_UNARMED` then
                    looped = false
                    break
                end
            end
            Wait(sleep)
        end
    end
end

function HackPlayerOwned(vehicle, plate)
    local hackingTime = math.random(Config.minHackingTime, Config.maxHackingTime)
    local ped = PlayerPedId()
    IsHacking = true
    exports['ps-ui']:HideText()
    SetVehicleEngineOn(vehicle, false, false, true) -- trying to keep engine off until hotwire is finished
    SetVehicleAlarm(vehicle, true)
    SetVehicleAlarmTimeLeft(vehicle, hackingTime)
    exports['ps-ui']:Scrambler(function(success)
        if success then
                TriggerServerEvent('indigo-vehiclekeys:server:AcquireVehicleKeys', plate)
                Wait(1000)
            else
                QBCore.Functions.Notify(Lang:t("notify.fvhacking"), "error")
        end
    end, "greek", 30, 0) -- Type (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only )
    SetTimeout(10000, function()
        AttemptPoliceAlert("steal")
    end)
    IsHacking = false
    IsHotwiring = false
end

function isBlacklistedVehicle(vehicle)
    local isBlacklisted = false
    for _,v in ipairs(Config.NoLockVehicles) do
        if joaat(v) == GetEntityModel(vehicle) then
            isBlacklisted = true
            break;
        end
    end
    if Entity(vehicle).state.ignoreLocks or GetVehicleClass(vehicle) == 13 then isBlacklisted = true end
    return isBlacklisted
end

function addNoLockVehicles(model)
    Config.NoLockVehicles[#Config.NoLockVehicles+1] = model
end
exports('addNoLockVehicles', addNoLockVehicles)

function removeNoLockVehicles(model)
    for k,v in pairs(Config.NoLockVehicles) do
        if v == model then
            Config.NoLockVehicles[k] = nil
        end
    end
end
exports('removeNoLockVehicles', removeNoLockVehicles)



-----------------------
---- Client Events ----
-----------------------
RegisterKeyMapping('togglelocks', Lang:t("info.tlock"), 'keyboard', 'L')
RegisterCommand('togglelocks', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        ToggleVehicleLockswithoutnui(GetVehicle())
    else
        if Config.UseKeyfob then
            openmenu()
        else
            ToggleVehicleLockswithoutnui(GetVehicle())
        end
    end
end)

--RegisterKeyMapping('engine', Lang:t("info.engine"), 'keyboard', 'G')
RegisterCommand('engine', function()
    local vehicle = GetVehicle()
    if vehicle and IsPedInVehicle(PlayerPedId(), vehicle) then
        ToggleEngine(vehicle)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() and QBCore.Functions.GetPlayerData() ~= {} then
        GetKeys()
    end
end)

-- Handles state right when the player selects their character and location.
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    GetKeys()
end)

-- Resets state on logout, in case of character change.
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    KeysList = {}
end)

RegisterNetEvent('indigo-vehiclekeys:client:AddKeys', function(plate)
    exports['ps-ui']:HideText()
    KeysList[plate] = true
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped)
        local vehicleplate = QBCore.Functions.GetPlate(vehicle)
        if plate == vehicleplate then
            SetVehicleEngineOn(vehicle, false, false, false)
        end
    end
end)

RegisterNetEvent('indigo-vehiclekeys:client:RemoveKeys', function(plate)
    KeysList[plate] = nil
end)

RegisterNetEvent('indigo-vehiclekeys:client:ToggleEngine', function()
    local EngineOn = GetIsVehicleEngineRunning(GetVehiclePedIsIn(PlayerPedId()))
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    if HasKeys(QBCore.Functions.GetPlate(vehicle)) then
        if EngineOn then
            SetVehicleEngineOn(vehicle, false, false, true)
        else
            SetVehicleEngineOn(vehicle, true, false, true)
        end
    end
end)

RegisterNetEvent('indigo-vehiclekeys:client:GiveKeys', function(id)
    local targetVehicle = GetVehicle()
    if targetVehicle then
        local targetPlate = QBCore.Functions.GetPlate(targetVehicle)
        if HasKeys(targetPlate) then
            if id and type(id) == "number" then -- Give keys to specific ID
                GiveKeys(id, targetPlate)
            else
                if IsPedSittingInVehicle(PlayerPedId(), targetVehicle) then -- Give keys to everyone in vehicle
                    local otherOccupants = GetOtherPlayersInVehicle(targetVehicle)
                    for p=1,#otherOccupants do
                        TriggerServerEvent('indigo-vehiclekeys:server:GiveVehicleKeys', GetPlayerServerId(NetworkGetPlayerIndexFromPed(otherOccupants[p])), targetPlate)
                    end
                else -- Give keys to closest player
                    GiveKeys(GetPlayerServerId(QBCore.Functions.GetClosestPlayer()), targetPlate)
                end
            end
        else
            QBCore.Functions.Notify(Lang:t("notify.ydhk"), 'error')
        end
    end
end)

RegisterNetEvent('QBCore:Client:EnteringVehicle', function()
    robKeyLoop()
end)

RegisterNetEvent('weapons:client:DrawWeapon', function()
    Wait(2000)
    robKeyLoop()
end)


RegisterNetEvent('lockpicks:UseLockpick', function(isAdvanced)
    LockpickDoor(isAdvanced)
end)
-- Backwards Compatibility ONLY -- Remove at some point --
RegisterNetEvent('vehiclekeys:client:SetOwner', function(plate)
    TriggerServerEvent('indigo-vehiclekeys:server:AcquireVehicleKeys', plate)
end)
-- Backwards Compatibility ONLY -- Remove at some point --

-----------------------
----   Functions   ----
-----------------------
function openmenu()
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 0.5, "key", 0.3)
    SendNUIMessage({ casemenue = 'open' })
    SetNuiFocus(true, true)
end
function ToggleEngine(veh)
    if veh then
        local EngineOn = GetIsVehicleEngineRunning(veh)
        if not isBlacklistedVehicle(veh) then
            if HasKeys(QBCore.Functions.GetPlate(veh)) or AreKeysJobShared(veh) then
                if EngineOn then
                    SetVehicleEngineOn(veh, false, false, true)
                else
                    SetVehicleEngineOn(veh, true, true, true)
                end
            end
        end
    end
end

function ToggleVehicleLockswithoutnui(veh)
    if veh then
        if not isBlacklistedVehicle(veh) then
            if HasKeys(QBCore.Functions.GetPlate(veh)) or AreKeysJobShared(veh) then
                local ped = PlayerPedId()
                local vehLockStatus = GetVehicleDoorLockStatus(veh)

                loadAnimDict("anim@mp_player_intmenu@key_fob@")
                TaskPlayAnim(ped, 'anim@mp_player_intmenu@key_fob@', 'fob_click', 3.0, 3.0, -1, 49, 0, false, false, false)

                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.3)

                NetworkRequestControlOfEntity(veh)
                if vehLockStatus == 1 then
                    TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 2)
                    QBCore.Functions.Notify(Lang:t("notify.vlock"), "primary")
                else
                    TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 1)
                    QBCore.Functions.Notify(Lang:t("notify.vunlock"), "success")
                end

                SetVehicleLights(veh, 2)
                Wait(250)
                SetVehicleLights(veh, 1)
                Wait(200)
                SetVehicleLights(veh, 0)
                Wait(300)
                ClearPedTasks(ped)
            else
                QBCore.Functions.Notify(Lang:t("notify.ydhk"), 'error')
            end
        else
            TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 1)
        end
    end
end

function GiveKeys(id, plate)
    local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(id))))
    if distance < 1.5 and distance > 0.0 then
        TriggerServerEvent('indigo-vehiclekeys:server:GiveVehicleKeys', id, plate)
    else
        QBCore.Functions.Notify(Lang:t("notify.nonear"),'error')
    end
end

function GetKeys()
    QBCore.Functions.TriggerCallback('indigo-vehiclekeys:server:GetVehicleKeys', function(keysList)
        KeysList = keysList
    end)
end

function HasKeys(plate)
    return KeysList[plate]
end
exports('HasKeys', HasKeys)

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(0)
    end
end
-- If in vehicle returns that, otherwise tries 3 different raycasts to get the vehicle they are facing.
-- Raycasts picture: https://i.imgur.com/FRED0kV.png

function GetVehicle()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local vehicle = GetVehiclePedIsIn(PlayerPedId())

    while vehicle == 0 do
        vehicle = QBCore.Functions.GetClosestVehicle()
        if #(pos - GetEntityCoords(vehicle)) > 8 then
            QBCore.Functions.Notify(Lang:t("notify.vehclose"), "error")
            return
        end
    end

    if not IsEntityAVehicle(vehicle) then vehicle = nil end
    return vehicle
end

function AreKeysJobShared(veh)
    local vehName = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
    local vehPlate = QBCore.Functions.GetPlate(veh)
    local jobName = QBCore.Functions.GetPlayerData().job.name
    local onDuty = QBCore.Functions.GetPlayerData().job.onduty
    for job, v in pairs(Config.SharedKeys) do
        if job == jobName then
            if Config.SharedKeys[job].requireOnduty and not onDuty then return false end
            for _, vehicle in pairs(v.vehicles) do
                if string.upper(vehicle) == string.upper(vehName) then
                    if not HasKeys(vehPlate) then
                        TriggerServerEvent("indigo-vehiclekeys:server:AcquireVehicleKeys", vehPlate)
                    end
                    return true
                end
            end
        end
    end
    return false
end

function ToggleVehicleLocks(veh)
    if veh then
        if not isBlacklistedVehicle(veh) then
            if HasKeys(QBCore.Functions.GetPlate(veh)) or AreKeysJobShared(veh) then
                local ped = PlayerPedId()
                local vehLockStatus = GetVehicleDoorLockStatus(veh)
                loadAnimDict("anim@mp_player_intmenu@key_fob@")
                TaskPlayAnim(ped, 'anim@mp_player_intmenu@key_fob@', 'fob_click', 3.0, 3.0, -1, 49, 0, false, false, false)
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.3)
                NetworkRequestControlOfEntity(veh)
                while NetworkGetEntityOwner(veh) ~= 128 do
                    NetworkRequestControlOfEntity(veh)
                    Wait(0)
                end
                if vehLockStatus == 1 then
                    TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 2)
                    QBCore.Functions.Notify(Lang:t("notify.vlock"), "primary")
                end
                SetVehicleLights(veh, 2)
                Wait(250)
                SetVehicleLights(veh, 1)
                Wait(200)
                SetVehicleLights(veh, 0)
                Wait(300)
                ClearPedTasks(ped)
            else
                QBCore.Functions.Notify(Lang:t("notify.ydhk"), 'error')
            end
        else
            TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 1)
        end
    end
end

function ToggleVehicleunLocks(veh)
    if veh then
        if not isBlacklistedVehicle(veh) then
            if HasKeys(QBCore.Functions.GetPlate(veh)) or AreKeysJobShared(veh) then
                local ped = PlayerPedId()
                local vehLockStatus = GetVehicleDoorLockStatus(veh)
                loadAnimDict("anim@mp_player_intmenu@key_fob@")
                TaskPlayAnim(ped, 'anim@mp_player_intmenu@key_fob@', 'fob_click', 3.0, 3.0, -1, 49, 0, false, false, false)
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.3)
                NetworkRequestControlOfEntity(veh)
                if vehLockStatus == 2 then
                    TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 1)
                    QBCore.Functions.Notify(Lang:t("notify.vunlock"), "success")
                end
                SetVehicleLights(veh, 2)
                Wait(250)
                SetVehicleLights(veh, 1)
                Wait(200)
                SetVehicleLights(veh, 0)
                Wait(300)
                ClearPedTasks(ped)
            else
                QBCore.Functions.Notify(Lang:t("notify.ydhk"), 'error')
            end
        else
            TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 1)
        end
    end
end
function ToggleVehicleTrunk(veh)
    if veh then
        if not isBlacklistedVehicle(veh) then
            if HasKeys(QBCore.Functions.GetPlate(veh)) or AreKeysJobShared(veh) then
                local ped = PlayerPedId()
                local boot = GetEntityBoneIndexByName(GetVehiclePedIsIn(PlayerPedId(), false), 'boot')
                loadAnimDict("anim@mp_player_intmenu@key_fob@")
                TaskPlayAnim(ped, 'anim@mp_player_intmenu@key_fob@', 'fob_click', 3.0, 3.0, -1, 49, 0, false, false, false)
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.3)
                NetworkRequestControlOfEntity(veh)
                if boot ~= -1 or DoesEntityExist(veh) then
                    if trunkclose == true then
                        SetVehicleLights(veh, 2)
                        Wait(150)
                        SetVehicleLights(veh, 0)
                        Wait(150)
                        SetVehicleLights(veh, 2)
                        Wait(150)
                        SetVehicleLights(veh, 0)
                        Wait(150)
                        SetVehicleDoorOpen(veh, 5)
                        trunkclose = false
                        ClearPedTasks(ped)
                    else
                        SetVehicleLights(veh, 2)
                        Wait(150)
                        SetVehicleLights(veh, 0)
                        Wait(150)
                        SetVehicleLights(veh, 2)
                        Wait(150)
                        SetVehicleLights(veh, 0)
                        Wait(150)
                        SetVehicleDoorShut(veh, 5)
                        trunkclose = true
                        ClearPedTasks(ped)
                    end
			   end
            else
                QBCore.Functions.Notify(Lang:t("notify.ydhk"), 'error')
            end
        else
            TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 1)
        end
    end
end
function GetOtherPlayersInVehicle(vehicle)
    local otherPeds = {}
    for seat=-1,GetVehicleModelNumberOfSeats(GetEntityModel(vehicle))-2 do
        local pedInSeat = GetPedInVehicleSeat(vehicle, seat)
        if IsPedAPlayer(pedInSeat) and pedInSeat ~= PlayerPedId() then
            otherPeds[#otherPeds+1] = pedInSeat
        end
    end
    return otherPeds
end

function GetPedsInVehicle(vehicle)
    local otherPeds = {}
    for seat=-1,GetVehicleModelNumberOfSeats(GetEntityModel(vehicle))-2 do
        local pedInSeat = GetPedInVehicleSeat(vehicle, seat)
        if not IsPedAPlayer(pedInSeat) and pedInSeat ~= 0 then
            otherPeds[#otherPeds+1] = pedInSeat
        end
    end
    return otherPeds
end

function IsBlacklistedWeapon()
    local weapon = GetSelectedPedWeapon(PlayerPedId())
    if weapon ~= nil then
        for _, v in pairs(Config.NoCarjackWeapons) do
            if weapon == joaat(v) then
                return true
            end
        end
    end
    return false
end

function LockpickDoor(isAdvanced)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local vehicle = QBCore.Functions.GetClosestVehicle()

    if vehicle == nil or vehicle == 0 then return end
    if HasKeys(QBCore.Functions.GetPlate(vehicle)) then return end
    if #(pos - GetEntityCoords(vehicle)) > 2.5 then return end
    if GetVehicleDoorLockStatus(vehicle) <= 0 then return end

    usingAdvanced = isAdvanced
    loadAnimDict("veh@break_in@0h@p_m_one@")
    TaskPlayAnim(ped, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
    exports['ps-ui']:Circle(function(success)
        if success then
            TaskPlayAnim(ped, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, 3000, 16, 0, 0, 0, 0)
            TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
            lastPickedVehicle = vehicle
            if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
                TriggerServerEvent('indigo-vehiclekeys:server:AcquireVehicleKeys', QBCore.Functions.GetPlate(vehicle))
            else
                QBCore.Functions.Notify(Lang:t("notify.vlockpick"), 'success')
                TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(vehicle), 1)
            end
        else
            TaskPlayAnim(ped, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, 3000, 16, 0, 0, 0, 0)
            TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
            QBCore.Functions.Notify("You failed to lockpick the vehicle!", "error")
            AttemptPoliceAlert("steal")
        end
    end, 4, 8) -- NumberOfCircles, MS
end

function LockpickFinishCallback(success)
    local vehicle = QBCore.Functions.GetClosestVehicle()

    local chance = math.random()
    if success then
        TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
        lastPickedVehicle = vehicle

        if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
            TriggerServerEvent('indigo-vehiclekeys:server:AcquireVehicleKeys', QBCore.Functions.GetPlate(vehicle))
        else
            QBCore.Functions.Notify(Lang:t("notify.vlockpick"), 'success')
            TriggerServerEvent('indigo-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(vehicle), 1)
        end

    else
        TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
        AttemptPoliceAlert("steal")
    end

    if usingAdvanced then
        if chance <= Config.RemoveLockpickAdvanced then
            TriggerServerEvent("indigo-vehiclekeys:server:breakLockpick", "advancedlockpick")
        end
    else
        if chance <= Config.RemoveLockpickNormal then
            TriggerServerEvent("indigo-vehiclekeys:server:breakLockpick", "lockpick")
        end
    end
end

function Hotwire(vehicle, plate)
    local hotwireTime = math.random(Config.minHotwireTime, Config.maxHotwireTime)
    local ped = PlayerPedId()
    IsHotwiring = true

    exports['ps-ui']:HideText()
    SetVehicleAlarm(vehicle, true)
    SetVehicleAlarmTimeLeft(vehicle, hotwireTime)
    exports['ps-ui']:Circle(function(success)
        if success then
            TriggerServerEvent('indigo-vehiclekeys:server:AcquireVehicleKeys', plate)
            Citizen.Wait(1000)
        else
            QBCore.Functions.Notify(Lang:t("notify.fvlockpick"), "error")
        end
    end, 5, 20) -- NumberOfCircles, MS
    SetTimeout(10000, function()
        AttemptPoliceAlert("steal")
    end)
    IsHotwiring = false
end

function CarjackVehicle(target)
    if not Config.CarJackEnable then return end
    isCarjacking = true
    canCarjack = false
    loadAnimDict('mp_am_hold_up')
    local vehicle = GetVehiclePedIsUsing(target)
    local occupants = GetPedsInVehicle(vehicle)
    for p=1,#occupants do
        local ped = occupants[p]
        CreateThread(function()
            TaskPlayAnim(ped, "mp_am_hold_up", "holdup_victim_20s", 8.0, -8.0, -1, 49, 0, false, false, false)
            PlayPain(ped, 6, 0)
            FreezeEntityPosition(vehicle, true)
            SetVehicleUndriveable(vehicle, true)
        end)
        Wait(math.random(200,500))
    end
    -- Cancel progress bar if: Ped dies during robbery, car gets too far away
    CreateThread(function()
        while isCarjacking do
            local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(target))
            if IsPedDeadOrDying(target) or distance > 7.5 then
                TriggerEvent("progressbar:client:cancel")
                FreezeEntityPosition(vehicle, false)
                SetVehicleUndriveable(vehicle, false)
            end
            Wait(100)
        end
    end)
    QBCore.Functions.Progressbar("rob_keys", Lang:t("progress.acjack"), Config.CarjackingTime, false, true, {}, {}, {}, {}, function()
        local hasWeapon, weaponHash = GetCurrentPedWeapon(PlayerPedId(), true)
        if hasWeapon and isCarjacking then
            local carjackChance
            if Config.CarjackChance[tostring(GetWeapontypeGroup(weaponHash))] then
                carjackChance = Config.CarjackChance[tostring(GetWeapontypeGroup(weaponHash))]
            else
                carjackChance = 0.5
            end
            if math.random() <= carjackChance then
                local plate = QBCore.Functions.GetPlate(vehicle)
                    for p=1,#occupants do
                        local ped = occupants[p]
                        CreateThread(function()
                        FreezeEntityPosition(vehicle, false)
                        SetVehicleUndriveable(vehicle, false)
                        TaskLeaveVehicle(ped, vehicle, 0)
                        PlayPain(ped, 6, 0)
                        Wait(1250)
                        ClearPedTasksImmediately(ped)
                        PlayPain(ped, math.random(7,8), 0)
                        MakePedFlee(ped)
                    end)
                end
                TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
                TriggerServerEvent('indigo-vehiclekeys:server:AcquireVehicleKeys', plate)
            else
                QBCore.Functions.Notify(Lang:t("notify.cjackfail"), "error")
                FreezeEntityPosition(vehicle, false)
                SetVehicleUndriveable(vehicle, false)
                MakePedFlee(target)
                TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
            end
            isCarjacking = false
            Wait(2000)
            AttemptPoliceAlert("carjack")
            Wait(Config.DelayBetweenCarjackings)
            canCarjack = true
        end
    end, function()
        MakePedFlee(target)
        isCarjacking = false
        Wait(Config.DelayBetweenCarjackings)
        canCarjack = true
    end)
end

function AttemptPoliceAlert(type)
    if not AlertSend then
        local chance = Config.PoliceAlertChance
        if GetClockHours() >= 1 and GetClockHours() <= 6 then
            chance = Config.PoliceNightAlertChance
        end
        if math.random() <= chance then
           TriggerServerEvent('police:server:policeAlert', Lang:t("info.palert") .. type)
        end
        AlertSend = true
        SetTimeout(Config.AlertCooldown, function()
            AlertSend = false
        end)
    end
end

function MakePedFlee(ped)
    SetPedFleeAttributes(ped, 0, 0)
    TaskReactAndFleePed(ped, PlayerPedId())
end

-----------------------
----   NUICallback   ----
-----------------------
RegisterNUICallback('closui', function()
	SetNuiFocus(false, false)
end)

RegisterNUICallback('unlock', function()
    ToggleVehicleunLocks(GetVehicle())
	SetNuiFocus(false, false)
end)

RegisterNUICallback('lock', function()
    ToggleVehicleLocks(GetVehicle())
	SetNuiFocus(false, false)
end)

RegisterNUICallback('trunk', function()
    ToggleVehicleTrunk(GetVehicle())
	SetNuiFocus(false, false)
end)

RegisterNUICallback('engine', function()
    ToggleEngine(GetVehicle())
	SetNuiFocus(false, false)
end)
