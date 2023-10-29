RegisterNetEvent('cd_darts:ToggleNUIFocus')
AddEventHandler('cd_darts:ToggleNUIFocus', function()
    Wait(100)
    NUI_status = true
    while NUI_status do
        Wait(5)
        SetNuiFocus(NUI_status, NUI_status)
    end
    SetNuiFocus(false, false)
end)