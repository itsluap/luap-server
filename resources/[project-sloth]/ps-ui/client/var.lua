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

RegisterNetEvent("CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_A")
AddEventHandler("CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_A",function(data,cb)
    exports['ps-ui']:Circle(function(success)
        if success then
            cb(true)
        else
            cb(false)
        end
    end, 2, 20) -- Number of Blocks, Time (seconds) -- your minigame start here
end)

RegisterNetEvent("CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B")
AddEventHandler("CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",function(data,cb)
    exports['minigame-shape']:StartShapeGame(function(Outcome)
        if Outcome then
            cb(true)
        else
            cb(false)
        end
    end)
end)

exports("VarHack", VarHack)
