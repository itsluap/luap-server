RegisterNetEvent('cd_doorlock:ToggleNUIFocus_1')
AddEventHandler('cd_doorlock:ToggleNUIFocus_1', function()
    Wait(100)
    NUI_status = true
    while NUI_status do
        Wait(5)
        SetNuiFocus(NUI_status, NUI_status)
    end
    SetNuiFocus(false, false)
end)

RegisterNetEvent('cd_doorlock:Callback')
AddEventHandler('cd_doorlock:Callback', function(id, result)
    CB[id] = result
    Wait(5000)
    CB[id] = nil
end)

function Callback(action, data)
    CB_id = CB_id + 1
    TriggerServerEvent('cd_doorlock:Callback', CB_id, action, data)
    local timeout = 0 while CB[CB_id] == nil and timeout <= 100 do Wait(0) timeout=timeout+1 end
    return CB[CB_id]
end

local tablet_prop

local function PlayAnimation(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

function TabletAnimation(boolean)
    local ped = PlayerPedId()
    if boolean then
        PlayAnimation('amb@world_human_seat_wall_tablet@female@base', 'base', -1)
        tablet_prop = CreateObject(`prop_cs_tablet`, 0, 0, 0, true, true, true)
        AttachEntityToEntity(tablet_prop, ped, GetPedBoneIndex(ped, 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
        SetModelAsNoLongerNeeded(tablet_prop)
    else
        StopAnimTask(ped, 'amb@world_human_seat_wall_tablet@female@base', 'base' ,8.0, -8.0, -1, 50, 0, false, false, false)
        NetworkRequestControlOfEntity(tablet_prop)
        SetEntityAsMissionEntity(tablet_prop)
        DeleteEntity(tablet_prop)
        tablet_prop = nil
    end
end

function Draw3DText(coords, text)
    local cd, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextCentre(1)
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x, y)
    DrawRect(x, y+0.0125, 0.015+string.len(text)/400, 0.035, 71, 71, 71, 100)
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        DisableCam()
        TabletAnimation(false)
    end
end)