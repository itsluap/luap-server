local function hideText()
    exports['ps-ui']:HideText()
end

local function drawText(text, _)
    exports['ps-ui']:DisplayText(text, "primary")
end

local function changeText(text, _)
    exports['ps-ui']:DisplayText(text, "primary")
end

local function keyPressed()
    CreateThread(function() -- Not sure if a thread is needed but why not eh?
        Wait(500)
        hideText()
    end)
end

RegisterNetEvent('indigo-core:client:DrawText', function(text, position)
    drawText(text, position)
end)

RegisterNetEvent('indigo-core:client:HideText', function()
    hideText()
end)
RegisterNetEvent('indigo-core:client:HideText', function()
    hideText()
end)

RegisterNetEvent('indigo-core:client:KeyPressed', function()
    keyPressed()
end)

exports('DrawText', drawText)
exports('ChangeText', changeText)
exports('HideText', hideText)
exports('KeyPressed', keyPressed) 