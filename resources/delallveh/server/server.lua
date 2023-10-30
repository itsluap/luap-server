--------------------------------------
------Created By Whit3Xlightning------
--https://github.com/Whit3XLightning--
--------------------------------------

RegisterCommand(Config.commandName, function(source, args, rawCommand) TriggerClientEvent("wld:delallveh", -1) end, Config.restricCommand)

-- testing ox_lib --

local i = 0
 
while true do
    Wait(1000)
    i += 1
 
    print(cache('test', function() return i end, 5000))
end