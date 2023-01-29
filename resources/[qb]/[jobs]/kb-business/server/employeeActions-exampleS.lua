local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('kb-business:server:getItem')
AddEventHandler('kb-business:server:getItem', function(item)
	local src = source
	local ply = QBCore.Functions.GetPlayer(src)

	ply.Functions.AddItem(item, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)
