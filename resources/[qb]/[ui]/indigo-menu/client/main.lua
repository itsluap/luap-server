local headerShown = false
local inMenu = false

local function openMenu(data)
    if not data then return end
    SetNuiFocus(true, true)
    headerShown = false
    inMenu = true
    SendNUIMessage({
        action = 'OPEN_MENU',
        data = data
    })
end

local function closeMenu()
    headerShown = false
    inMenu = false
    SetNuiFocus(false)
    SendNUIMessage({
        action = 'CLOSE_MENU'
    })
end

local function showHeader(data)
    headerShown = true
    SendNUIMessage({
        action = 'SHOW_HEADER',
        data = data
    })
end

RegisterNetEvent('indigo-menu:client:openMenu', function(data)
    openMenu(data)
end)

RegisterNetEvent('indigo-menu:client:closeMenu', function()
    closeMenu()
end)

RegisterNUICallback('clickedButton', function(data)
    if headerShown then headerShown = false end
    PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    SetNuiFocus(false)
    if data.event then
        if data.isServer then
            TriggerServerEvent(data.event, data.args)
        elseif data.isCommand then
            ExecuteCommand(data.event)
        elseif data.isQBCommand then
            TriggerServerEvent('QBCore:CallCommand', data.event, data.args)
        elseif isAction then
            data.event(data.args)
        else
            TriggerEvent(data.event, data.args)
        end
    end
end)

RegisterNUICallback('closeMenu', function()
    headerShown = false
    inMenu = false
    SetNuiFocus(false)
end)

RegisterCommand('playerfocus', function()
    if headerShown then
        SetNuiFocus(true, true)
        print('nuifocus = true')
    end
end)

RegisterKeyMapping('playerFocus', 'Give Menu Focus', 'mouse_button', 'MOUSE_RIGHT')

exports('openMenu', openMenu)
exports('closeMenu', closeMenu)
exports('showHeader', showHeader)
exports('clearHistory', clearHistory)
