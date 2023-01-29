local QBCore = exports['qb-core']:GetCoreObject()

---Crafting
RegisterServerEvent('kb-business:Crafting:GetItem', function(ItemMake, craftable)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	--This grabs the table from client and removes the item requirements
	local amount = 1
	if craftable then
		if craftable["amount"] then amount = craftable["amount"] end
		for k, v in pairs(craftable[ItemMake]) do TriggerEvent("kb-business:server:toggleItem", false, tostring(k), v, src) end
	end
	--This should give the item, while the rest removes the requirements
	TriggerEvent("kb-business:server:toggleItem", true, ItemMake, amount, src)
end)

RegisterNetEvent('kb-business:server:toggleItem', function(give, item, amount, newsrc)
	local src = newsrc or source
	local amount = amount or 1
	local remamount = amount
	if not give then
		if HasItem(src, item, amount) then -- check if you still have the item
			if QBCore.Functions.GetPlayer(src).Functions.GetItemByName(item).unique then -- If unique item, keep removing until gone
				while remamount > 0 do
					QBCore.Functions.GetPlayer(src).Functions.RemoveItem(item, 1)
					remamount -= 1
				end
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount) -- Show removal item box when all are removed
				return
			end
			if QBCore.Functions.GetPlayer(src).Functions.RemoveItem(item, amount) then
				if Config.Debug then print("^5Debug^7: ^1Removing ^2from Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount)
			end
		else
			-- notification saying missing items here
		end
	elseif give then
		if QBCore.Functions.GetPlayer(src).Functions.AddItem(item, amount) then
			if Config.Debug then print("^5Debug^7: ^4Giving ^2Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
		end
	end
end)

RegisterServerEvent("kb-business:server:GrabBox", function()
	local src = source local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["pppbox"], "add", 1)
	Player.Functions.AddItem("pppbox", 1, false, { ["id"] = math.random(1, 9999999) })
end)

-- default stuff --

RegisterServerEvent('kb-business:server:getItem')
AddEventHandler('kb-business:server:getItem', function(item)
	local src = source
	local ply = QBCore.Functions.GetPlayer(src)

	ply.Functions.AddItem(item, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)
