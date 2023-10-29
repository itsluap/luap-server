--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX, QBCore = nil, nil

if Config.Framework == 'esx' then
    TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
    if ESX == nil then
        ESX = exports[Config.FrameworkTriggers.resource_name]:getSharedObject()
    end

elseif Config.Framework == 'qbcore' then
    TriggerEvent(Config.FrameworkTriggers.main, function(obj) QBCore = obj end)
    if QBCore == nil then
        QBCore = exports[Config.FrameworkTriggers.resource_name]:GetCoreObject()
    end
    
elseif Config.Framework == 'other' then
    --Add your own code here.
end


--███████╗██████╗  █████╗ ██╗    ██╗███╗   ██╗    ████████╗ █████╗ ██████╗ ██╗     ███████╗
--██╔════╝██╔══██╗██╔══██╗██║    ██║████╗  ██║    ╚══██╔══╝██╔══██╗██╔══██╗██║     ██╔════╝
--███████╗██████╔╝███████║██║ █╗ ██║██╔██╗ ██║       ██║   ███████║██████╔╝██║     █████╗  
--╚════██║██╔═══╝ ██╔══██║██║███╗██║██║╚██╗██║       ██║   ██╔══██║██╔══██╗██║     ██╔══╝  
--███████║██║     ██║  ██║╚███╔███╔╝██║ ╚████║       ██║   ██║  ██║██████╔╝███████╗███████╗
--╚══════╝╚═╝     ╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝  ╚═══╝       ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝


if Config.SpawnTable.UsableItem.ENABLE then
    if Config.Framework == 'esx' then
        ESX.RegisterUsableItem(Config.SpawnTable.UsableItem.item_name, function(source)
            TriggerClientEvent('cd_armwrestling:SpawnTable', source)
        end)

    elseif Config.Framework == 'qbcore' then
        QBCore.Functions.CreateUseableItem(Config.SpawnTable.UsableItem.item_name, function(source, item)
            TriggerClientEvent('cd_armwrestling:SpawnTable', source)
        end)
    end
end

if Config.SpawnTable.ChatCommand.ENABLE then
    RegisterCommand(Config.SpawnTable.ChatCommand.command, function(source)
        TriggerClientEvent('cd_armwrestling:SpawnTable', source)
    end)
end