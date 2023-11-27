------------------------------------------------------------------------------------------------------
------------------------------------------- WEBHOOK URLS ---------------------------------------------
------------------------------------------------------------------------------------------------------


--56108 green
--16711680 red
--2061822 blue

--These are disabled by default, until you enter your discord webhooks.
local Webhook_Data = {
    ['create'] = {colour = 56108, webhook = 'CHANGE_ME'}, --When someone creates a new door.
    ['delete'] = {colour = 16711680, webhook = 'CHANGE_ME'}, --When someone deletes a door.
    ['edit'] = {colour = 2061822, webhook = 'CHANGE_ME'}, --When someone edits a door.
    ['add_import_data'] = {colour = 56108, webhook = 'CHANGE_ME'}, --When someone adds a import group.
    ['remove_import_data'] = {colour = 16711680, webhook = 'CHANGE_ME'}, --When someone removes a import group.
    ['remove_full_locationgroup'] = {colour = 16711680, webhook = 'CHANGE_ME'}, --When someone deletes a full location group.
}


------------------------------------------------------------------------------------------------------
------------------------------------------- WEBHOOK DATA ---------------------------------------------
------------------------------------------------------------------------------------------------------


function SendWebhook(source, action, data)
    local webhook_data = Webhook_Data[action]
    if webhook_data.webhook and #webhook_data.webhook > 10 then
        local player_name = GetPlayerName(source) or L('unknown')
        local identifier = GetIdentifier(source) or L('unknown')

        local message
        if action == 'create' or action == 'delete' or action == 'edit' then
            message = string.format(L('webhook_message_1'), source, player_name, identifier, data.location_group, data.door_name, data.door_type)
        elseif action == 'add_import_data' or action == 'remove_import_data' then
            message = string.format(L('webhook_message_2'), source, player_name, identifier, data.name, #data.data)
        elseif action == 'remove_full_locationgroup' then
            message = string.format(L('webhook_message_3'), source, player_name, identifier, data.name, data.door_count)
        end

        local data = {{
            ['color'] = webhook_data.colour,
            ['title'] = L(action),
            ['description'] = message,
            ['footer'] = {
                ['text'] = os.date('%c'),
                ['icon_url'] = 'https://i.imgur.com/VMPGPTQ.png',
            },
        }}
        PerformHttpRequest(webhook_data.webhook, function(err, text, headers) end, 'POST', json.encode({username = L('bot_name'), embeds = data}), { ['Content-Type'] = 'application/json' })
    end
end