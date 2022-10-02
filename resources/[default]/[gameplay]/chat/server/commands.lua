
--[[ COMMANDS ]]--

RegisterCommand('clear', function(source, args, rawCommand)
    TriggerClientEvent('chat:client:ClearChat', source)
end, false)

RegisterCommand('ooc', function(source, args, rawCommand)
	local msg = rawCommand:sub(4)
	local name = getIdentity(source)
	fal = name.firstname .. "  " .. name.lastname
        TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message"><b>OOC {0}:</b> {1}</div>',
        args = { fal, msg }
    })
end, false)



