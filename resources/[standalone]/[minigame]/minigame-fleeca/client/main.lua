AddEventHandler('open:fleecaminigame', function(callback)
    Callbackk = callback
    openHack()
end)

AddEventHandler('success:fleecaminigame', function(data, cb)
    closeHack()
    Callbackk(data.success)
    cb('ok')
end)

AddEventHandler('close:fleecaminigame', function()
    closeHack()
end)

--[[
RegisterNUICallback('fleeca:success', function(data, cb)
    closeHack()
    Callbackk(data.success)
    cb('ok')
end)
]]--

function openHack()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open"
    })
end

function closeHack()
    SetNuiFocus(false, false)
end
