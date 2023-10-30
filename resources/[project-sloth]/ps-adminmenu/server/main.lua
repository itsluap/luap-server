QBCore = exports['qb-core']:GetCoreObject()

lib.addCommand('adminmenu', {
    help = 'Open the admin menu',
    restricted = 'qbcore.mod'
}, function(source)
    TriggerClientEvent('ps-adminmenu:client:OpenUI', source)
end)
-- Callbacks
