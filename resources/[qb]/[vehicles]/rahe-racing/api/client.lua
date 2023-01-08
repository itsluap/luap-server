local QBCore = exports["qb-core"]:GetCoreObject()
local isOpen = false
local tabletObj = nil
local tabletDict = "amb@code_human_in_bus_passenger_idles@female@tablet@base"
local tabletAnim = "base"
local tabletProp = `prop_cs_tablet`
local tabletBone = 60309
local tabletOffset = vector3(0.03, 0.002, -0.0)
local tabletRot = vector3(10.0, 160.0, 0.0)

function doAnimation()
    if not isOpen then return end
    -- Animation
    RequestAnimDict(tabletDict)
    while not HasAnimDictLoaded(tabletDict) do Citizen.Wait(100) end
    -- Model
    RequestModel(tabletProp)
    while not HasModelLoaded(tabletProp) do Citizen.Wait(100) end

    local plyPed = PlayerPedId()
    tabletObj = CreateObject(tabletProp, 0.0, 0.0, 0.0, true, true, false)
    local tabletBoneIndex = GetPedBoneIndex(plyPed, tabletBone)

    AttachEntityToEntity(tabletObj, plyPed, tabletBoneIndex, tabletOffset.x, tabletOffset.y, tabletOffset.z, tabletRot.x, tabletRot.y, tabletRot.z, true, false, false, false, 2, true)
    SetModelAsNoLongerNeeded(tabletProp)

    CreateThread(function()
        while isOpen do
            Wait(0)
            if not IsEntityPlayingAnim(plyPed, tabletDict, tabletAnim, 3) then
                TaskPlayAnim(plyPed, tabletDict, tabletAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
            end
        end

        if not isOpen then
            ClearPedSecondaryTask(plyPed)
            Citizen.Wait(250)
            DetachEntity(tabletObj, true, false)
            DeleteEntity(tabletObj)
        end
    end)
end

RegisterCommand("racing", function()
    local hasItem = QBCore.Functions.HasItem('racetablet')
    if hasItem then
        openTablet()
        isOpen = true
        doAnimation()
    else
        QBCore.Functions.Notify('You don\'t have a race tablet!', 'error')
    end
end)

-- CLIENT export - This function is exported, so it can be opened from any other client-side script by using 'exports['rahe-racing']:openRacingTablet()'
function openRacingTablet()
    openTablet()
    isOpen = true
    doAnimation()
end

-- If you wish to open the tablet via. an event not the export.
RegisterNetEvent("rahe-racing:client:openTablet")
AddEventHandler("rahe-racing:client:openTablet", function()
    openTablet()
    isOpen = true
    doAnimation()
end)

function notifyPlayer(message)
    TriggerEvent('chatMessage', "SERVER", "normal", message)
end

-- You can do some logic when the tablet is closed. For example if you started an animation when opened, you can end the animation here.
RegisterNetEvent('rahe-racing:client:tabletClosed', function()
    --ClearPedTasksImmediately(PlayerPedId())
    isOpen = false
    ClearPedSecondaryTask(plyPed)
    Citizen.Wait(250)
    DetachEntity(tabletObj, true, false)
    DeleteEntity(tabletObj)
end)