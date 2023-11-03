local open = false

RegisterNUICallback('var-callback', function(data, cb)
	SetNuiFocus(false, false)
    Callbackk(data.success)
    open = false
    cb('ok')
end)

local function VarHack(callback, blocks, speed)
    if speed == nil or (speed < 2) then speed = 20 end
    if blocks == nil or (blocks < 1 or blocks > 15) then blocks = 5 end
    if not open then
        open = true
        Callbackk = callback
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "var-start",
            blocks = blocks,
            speed = speed,
        })
    end
end

RegisterNetEvent("luap:ThermiteGame")
AddEventHandler("luap:ThermiteGame",function(data,cb)
    exports['ps-ui']:Thermite(function(success)
        if success then
            cb(true)
        else
            cb(false)
        end
    end, 15, 6, 3) -- Number of Blocks, Time (seconds) -- your minigame start here
end)

RegisterNetEvent("luap:ShapeGame")
AddEventHandler("luap:ShapeGame",function(data,cb)
    exports['minigame-shape']:StartShapeGame(function(Outcome)
        if Outcome then
            cb(true)
        else
            cb(false)
        end
    end)
end)

RegisterNetEvent("luap:ScramblerGame")
AddEventHandler("luap:ScramblerGame",function(data,cb)
    exports['ps-ui']:Scrambler(function(success)
        if success then
            cb(true)
        else
            cb(false)
        end
    end, "greek", 45, 0) -- Type (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only )
end)

exports("VarHack", VarHack)