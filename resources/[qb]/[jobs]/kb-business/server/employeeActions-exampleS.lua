local QBCore = exports['indigo-core']:GetCoreObject()

-- puff puff pass stuff --

GlobalState.canMakeJoint = false

function HasItem(source, items, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    local isTable = type(items) == 'table'
    local isArray = isTable and table.type(items) == 'array' or false
    local totalItems = #items
    local count = 0
    local kvIndex = 2
    if isTable and not isArray then
        totalItems = 0
        for _ in pairs(items) do totalItems += 1 end
        kvIndex = 1
    end
    if isTable then
	if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Checking if player^7(^6"..source.."^7)^2 has items^7") end
        for k, v in pairs(items) do
            local itemKV = {k, v}
            local item = Player.Functions.GetItemByName(itemKV[kvIndex])
            if item and ((amount and item.amount >= amount) or (not isArray and item.amount >= v) or (not amount and isArray)) then
                count += 1
            end
        end
        if count == totalItems then
			if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items FOUND^7") end
            return true
        end
    else -- Single item as stringHasItem(v, 1)
		if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Checking if player^7(^6"..source.."^7)^2 has items^7") end
		local item = Player.Functions.GetItemByName(items)
        if item and (not amount or (item and amount and item.amount >= amount)) then
            return true
        end
    end
	if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items Not FOUND^7") end
    return false
end

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
	Citizen.Wait(2000)
	TriggerEvent("kb-business:server:toggleItem", true, ItemMake, amount, src)
end)

RegisterNetEvent('kb-business:server:toggleItem', function(give, item, amount, newsrc)
	local src = newsrc or source
	local amount = amount or 1
	local remamount = amount
	if not give then
		if HasItem(src, item, amount) then -- check if you still have the item
			GlobalState.canMakeJoint = true
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
			--print(GlobalState.canMakeJoint)
		end
	elseif give then
		--print(GlobalState.canMakeJoint)
		if GlobalState.canMakeJoint then
			if QBCore.Functions.GetPlayer(src).Functions.AddItem(item, amount) then
				if Config.Debug then print("^5Debug^7: ^4Giving ^2Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
				GlobalState.canMakeJoint = false
			end
		else
			--print("You don't have the required items")
			TriggerClientEvent("QBCore:Notify", src, "You don't have the required items", "error")
		end
	end
	--GlobalState.canMakeJoint = false
end)

RegisterServerEvent("kb-business:server:GrabBox", function()
	local src = source local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["pppbox"], "add", 1)
	Player.Functions.AddItem("pppbox", 1, false, { ["id"] = math.random(1, 9999999) })
end)

-- joints --

QBCore.Functions.CreateUseableItem("joint_whitewidow", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	local jointType = "joint_whitewidow"
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("kb-business:client:UseStressBuffJoint", source, jointType)
end)

QBCore.Functions.CreateUseableItem("joint_skunk", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	local jointType = "joint_skunk"
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("kb-business:client:UseStressBuffJoint", source, jointType)
end)

QBCore.Functions.CreateUseableItem("joint_purplehaze", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	local jointType = "joint_purplehaze"
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("kb-business:client:UseStressBuffJoint", source, jointType)
end)

QBCore.Functions.CreateUseableItem("joint_og_kush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	local jointType = "joint_og_kush"
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("kb-business:client:UseStressBuffJoint", source, jointType)
end)

QBCore.Functions.CreateUseableItem("joint_amnesia", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	local jointType = "joint_amnesia"
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("kb-business:client:UseStressBuffJoint", source, jointType)
end)

QBCore.Functions.CreateUseableItem("joint_ak47", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	local jointType = "joint_ak47"
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("kb-business:client:UseStressBuffJoint", source, jointType)
end)

-- pounds --

QBCore.Functions.CreateUseableItem("white_widow_lb", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["white_widow_lb"], "remove")
	Wait(1000)
	Player.Functions.AddItem("white_widow_oz", 16)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["white_widow_oz"], "add")
end)

QBCore.Functions.CreateUseableItem("skunk_lb", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["skunk_lb"], "remove")
	Wait(1000)
	Player.Functions.AddItem("skunk_oz", 16)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["skunk_oz"], "add")
end)

QBCore.Functions.CreateUseableItem("purple_haze_lb", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["purple_haze_lb"], "remove")
	Wait(1000)
	Player.Functions.AddItem("purple_haze_oz", 16)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["purple_haze_oz"], "add")
end)

QBCore.Functions.CreateUseableItem("og_kush_lb", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["og_kush_lb"], "remove")
	Wait(1000)
	Player.Functions.AddItem("og_kush_oz", 16)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["og_kush_oz"], "add")
end)

QBCore.Functions.CreateUseableItem("amnesia_lb", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["amnesia_lb"], "remove")
	Wait(1000)
	Player.Functions.AddItem("amnesia_oz", 16)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["amnesia_oz"], "add")
end)

QBCore.Functions.CreateUseableItem("ak47_lb", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["ak47_lb"], "remove")
	Wait(1000)
	Player.Functions.AddItem("ak47_oz", 16)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["ak47_oz"], "add")
end)

-- ounces --

QBCore.Functions.CreateUseableItem("white_widow_oz", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["white_widow_oz"], "remove")
	Wait(1000)
	Player.Functions.AddItem("white_widow_bag", 28)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["white_widow_bag"], "add")
end)

QBCore.Functions.CreateUseableItem("skunk_oz", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["skunk_oz"], "remove")
	Wait(1000)
	Player.Functions.AddItem("skunk_bag", 28)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["skunk_bag"], "add")
end)

QBCore.Functions.CreateUseableItem("purple_haze_oz", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["purple_haze_oz"], "remove")
	Wait(1000)
	Player.Functions.AddItem("purple_haze_bag", 28)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["purple_haze_bag"], "add")
end)

QBCore.Functions.CreateUseableItem("og_kush_oz", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["og_kush_oz"], "remove")
	Wait(1000)
	Player.Functions.AddItem("og_kush_bag", 28)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["og_kush_bag"], "add")
end)

QBCore.Functions.CreateUseableItem("amnesia_oz", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["amnesia_oz"], "remove")
	Wait(1000)
	Player.Functions.AddItem("amnesia_bag", 28)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["amnesia_bag"], "add")
end)

QBCore.Functions.CreateUseableItem("ak47_oz", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["ak47_oz"], "remove")
	Wait(1000)
	Player.Functions.AddItem("ak47_bag", 28)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["ak47_bag"], "add")
end)

-- default stuff --

RegisterServerEvent('kb-business:server:getItem')
AddEventHandler('kb-business:server:getItem', function(item)
	local src = source
	local ply = QBCore.Functions.GetPlayer(src)

	ply.Functions.AddItem(item, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)
