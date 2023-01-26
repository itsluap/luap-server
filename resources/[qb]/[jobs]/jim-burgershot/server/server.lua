local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	for _, v in pairs(Crafting) do
		for i = 1, #v do
			for l, b in pairs(v[i]) do
				if not QBCore.Shared.Items[l] and l ~= "amount" then print("Crafting: Missing Item from QBCore.Shared.Items: '"..l.."'") end
				if type(b) == "table" then
					for j in pairs(b) do if not QBCore.Shared.Items[j] then print("Crafting: Missing Item from QBCore.Shared.Items: '"..j.."'") end end end end end end
	for i = 1, #Config.Items.items do
		if not QBCore.Shared.Items[Config.Items.items[i].name] then print("Store: Missing Item from QBCore.Shared.Items: '"..Config.Items.items[i].name.."'") end
	end
	if not QBCore.Shared.Jobs["burgershot"] then print("Error: Job role not found - 'burgershot'") end
end)

if not Config.JimConsumables then
	CreateThread(function()
		local drinks = { "bscoke", "bscoffee", "milkshake", "milk", }
		for _, v in pairs(drinks) do  QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-burgershot:client:Drink', source, item.name) end) end

		local food = { "heartstopper", "shotfries", "shotnuggets", "shotrings", "moneyshot", "meatfree", "bleeder", "torpedo", "rimjob", "creampie", "cheesewrap", "chickenwrap" }
		for _, v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-burgershot:client:Eat', source, item.name) end) end

		QBCore.Functions.CreateUseableItem("murderbag", function(source, item) TriggerClientEvent('jim-burgershot:Stash', source, {}, item.info["id"], true) end)
	end)
end

RegisterServerEvent("jim-burgershot:server:GrabBag", function()
	local src = source local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["murderbag"], "add", 1)
	Player.Functions.AddItem("murderbag", 1, false, { ["id"] = math.random(1, 9999999) })
end)

---Crafting
RegisterServerEvent('jim-burgershot:Crafting:GetItem', function(ItemMake, craftable)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	--This grabs the table from client and removes the item requirements
	local amount = 1
	if craftable then
		if craftable["amount"] then amount = craftable["amount"] end
		for k, v in pairs(craftable[ItemMake]) do TriggerEvent("jim-burgershot:server:toggleItem", false, tostring(k), v, src) end
	end
	--This should give the item, while the rest removes the requirements
	TriggerEvent("jim-burgershot:server:toggleItem", true, ItemMake, amount, src)
end)

RegisterNetEvent('jim-burgershot:server:toggleItem', function(give, item, amount, newsrc)
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
		else TriggerEvent("jim-burgershot:server:DupeWarn", item, src) end -- if not boot the player
	elseif give then
		if QBCore.Functions.GetPlayer(src).Functions.AddItem(item, amount) then
			if Config.Debug then print("^5Debug^7: ^4Giving ^2Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
		end
	end
end)

RegisterNetEvent("jim-burgershot:server:DupeWarn", function(item, newsrc)
	local src = newsrc or source
	local P = QBCore.Functions.GetPlayer(src)
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Tried to remove item ^7('^3"..item.."^7')^2 but it wasn't there^7")
	if not Config.Debug then DropPlayer(src, "Kicked for attempting to duplicate items") end
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Dropped from server for item duplicating^7")
end)

function HasItem(source, items, amount)
	local amount = amount or 1
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    local totalItems = #items
    local count = 0
    local kvIndex = 2

	if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Checking if player has required item^7 '^3"..tostring(items).."^7'") end

	for _, itemData in pairs(Player.PlayerData.items) do
        if itemData and (itemData.name == items) then
			if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Item^7: '^3"..tostring(items).."^7' ^2Slot^7: ^3"..itemData.slot.." ^7x(^3"..tostring(itemData.amount).."^7)") end
			count += itemData.amount
		end
	end
	if count >= amount then
		if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items ^5FOUND^7 x^3"..count.."^7") end
		return true
	end
	if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items ^1NOT FOUND^7") end
    return false
end