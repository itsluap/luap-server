Framework = exports["qb-core"]:GetCoreObject()
RegisterNetEvent('Framework:Client:CloseNui')
AddEventHandler('Framework:Client:CloseNui', function()
    SetNuiFocus(false, false)
end)

-- Code

RegisterNUICallback('callback', function(data, cb)
    SetNuiFocus(false, false)
    ReturnData(data.success)
end)

function StartShapeGame(Callback)
    ReturnData = Callback
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open"
    })
end