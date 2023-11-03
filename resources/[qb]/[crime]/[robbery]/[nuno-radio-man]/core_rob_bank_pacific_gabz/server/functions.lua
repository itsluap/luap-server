Functions = {}
resource = GetCurrentResourceName()

--Framework Setup
Citizen.CreateThread(function()
	if cfg.framework == "esx_old" then
		TriggerEvent("esx:getSharedObject",function(obj) Functions = obj end)
	end
	if cfg.framework == "esx_new" then
		Functions = exports["es_extended"]:getSharedObject()
	end
	if cfg.framework == "qbcore" then
		Functions = exports["qb-core"]:GetCoreObject()
	end
	if cfg.framework == "vrp" then
		local Proxy = module("vrp","lib/Proxy")
		Functions = Proxy.getInterface("vRP")
	end
	if cfg.framework == "vrpex" then
		local Proxy = module("vrp","lib/Proxy")
		Functions = Proxy.getInterface("vRP")
	end
	if cfg.framework == "nunoradioman" then
		Functions = exports["core_system_functions"]:GetFunctions(GetCurrentResourceName()) exports("Refresh", function(data) Functions = data end)
	end
end)

--Framework & Other Functions
function CheckIfItemExists(player,item_name,item_amount)
	if cfg.framework == "esx_old" then
		local xPlayer = Functions.GetPlayerFromId(player) -- get player data.
		if item_name == "money" then -- check if item is money
			if xPlayer.getMoney() >= item_amount then return true else return false end -- checks the amount
		else  -- if it is an item
			if xPlayer.getInventoryItem(item_name) ~= nil then if xPlayer.getInventoryItem(item_name).count >= item_amount then return true else return false end else return false end -- checks the amount
		end
	end
	if cfg.framework == "esx_new" then
		local xPlayer = Functions.GetPlayerFromId(player) -- get player data.
		if item_name == "money" then -- check if item is money
			if xPlayer.getMoney() >= item_amount then return true else return false end -- checks the amount
		else  -- if it is an item
			if xPlayer.getInventoryItem(item_name) ~= nil then if xPlayer.getInventoryItem(item_name).count >= item_amount then return true else return false end else return false end -- checks the amount
		end
	end
	if cfg.framework == "qbcore" then
		local xPlayer = Functions.Functions.GetPlayer(player) -- get player data.
		if item_name == "money" then -- check if item is money
			if xPlayer.PlayerData.money["cash"] >= item_amount then return true else return false end -- checks the amount
		else  -- if it is an item
			if xPlayer.Functions.GetItemByName(item_name) ~= nil then if xPlayer.Functions.GetItemByName(item_name).amount >= item_amount then return true else return false end else return false end -- checks the amount
		end
	end
	if cfg.framework == "vrp" then
		local user_id = Functions.getUserId({player}) -- get player user_id.
		if item_name == "money" then -- check if item is money
			if Functions.getMoney({user_id}) >= item_amount then return true else return false end -- checks the amount
		else  -- if it is an item
			if Functions.getInventoryItemAmount({user_id,item_name}) >= item_amount then return true else return false end -- checks the amount
		end
	end
	if cfg.framework == "vrpex" then
		local user_id = Functions.getUserId(player) -- get player user_id.
		if item_name == "money" then -- check if item is money
			if Functions.getMoney(user_id) >= item_amount then return true else return false end -- checks the amount
		else  -- if it is an item
			if Functions.getInventoryItemAmount(user_id,item_name) >= item_amount then return true else return false end -- checks the amount
		end
	end
	if cfg.framework == "nunoradioman" then
		return Functions.Inventory.CheckIfPlayerInventoryItemExists({player = player,item_name = item_name,item_amount = item_amount})
	end
	if cfg.framework == "standalone" then
		return true
	end
end
function RemoveItemFromPlayer(player,item_name,item_amount)
	if cfg.framework == "esx_old" then
		local xPlayer = Functions.GetPlayerFromId(player) -- get player data.
		if item_name == "money" then -- check if item is money
			xPlayer.removeAccountMoney("money",item_amount) -- remove money to player
		else -- if it is an item
			xPlayer.removeInventoryItem(item_name,item_amount) -- remove item to player
		end
	end
	if cfg.framework == "esx_new" then
		local xPlayer = Functions.GetPlayerFromId(player) -- get player data.
		if item_name == "money" then -- check if item is money
			xPlayer.removeAccountMoney("money",item_amount) -- remove money to player
		else -- if it is an item
			xPlayer.removeInventoryItem(item_name,item_amount) -- remove item to player
		end
	end
	if cfg.framework == "qbcore" then
		local xPlayer = Functions.Functions.GetPlayer(player) -- get player data.
		if item_name == "money" then -- check if item is money
			xPlayer.Functions.RemoveMoney("cash",item_amount) -- remove money to player
		else -- if it is an item
			xPlayer.Functions.RemoveItem(item_name,item_amount) -- remove item to player
		end
	end
	if cfg.framework == "vrp" then
		local user_id = Functions.getUserId({player}) -- get player user_id
		if item_name == "money" then -- check if item is money
			Functions.tryPayment({user_id,item_amount}) -- remove money to player
		else -- if it is an item
			Functions.tryGetInventoryItem({user_id,item_name,item_amount,true}) -- remove item to player
		end
	end
	if cfg.framework == "vrpex" then
		local user_id = Functions.getUserId(player) -- get player user_id
		if item_name == "money" then -- check if item is money
			Functions.tryPayment(user_id,item_amount) -- remove money to player
		else -- if it is an item
			Functions.tryGetInventoryItem(user_id,item_name,item_amount,true) -- remove item to player
		end
	end
	if cfg.framework == "nunoradioman" then
		Functions.Inventory.RemoveInventoryItem({player = player,item_name = item_name,item_amount = item_amount,item_notification = true})
	end
	if cfg.framework == "standalone" then

	end

	Log("removeitem",player,{item = item_name,amount = item_amount})
end
function GiveItemToPlayer(player,item_name,item_amount)
	if cfg.framework == "esx_old" then
		local xPlayer = Functions.GetPlayerFromId(player) -- get player data.
		if item_name == "money" then -- check if item is money
			xPlayer.addAccountMoney("money",item_amount) -- give money to player
		elseif item_name == "dirtymoney" then -- check if item is dirtymoney
			xPlayer.addAccountMoney("black_money",item_amount) -- give blackmoney to player
		else -- if it is an item
			xPlayer.addInventoryItem(item_name,item_amount) -- give item to player
		end
	end
	if cfg.framework == "esx_new" then
		local xPlayer = Functions.GetPlayerFromId(player) -- get player data.
		if item_name == "money" then -- check if item is money
			xPlayer.addAccountMoney("money",item_amount) -- give money to player
		elseif item_name == "dirtymoney" then -- check if item is dirtymoney
			xPlayer.addAccountMoney("black_money",item_amount) -- give blackmoney to player
		else -- if it is an item
			xPlayer.addInventoryItem(item_name,item_amount) -- give item to player
		end
	end
	if cfg.framework == "qbcore" then
		local xPlayer = Functions.Functions.GetPlayer(player) -- get player data.
		if item_name == "money" then -- check if item is money
			xPlayer.Functions.AddMoney("cash",item_amount) -- give money to player
		elseif item == "markedbills" then -- check if item is markedbills
			xPlayer.Functions.AddItem("markedbills",1,false,{worth = math.random(5000, 10000)})
		else -- if it is an item
			xPlayer.Functions.AddItem(item_name,item_amount) -- give item to player
		end
	end
	if cfg.framework == "vrp" then
		local user_id = Functions.getUserId({player}) -- get player user_id.
		if item_name == "money" then -- check if item is money 
			Functions.giveMoney({user_id,item_amount}) -- give money to player
		else -- if it is an item
			Functions.giveInventoryItem({user_id,item_name,item_amount,true}) -- give item to player
		end
	end
	if cfg.framework == "vrpex" then
		local user_id = Functions.getUserId(player) -- get player user_id.
		if item_name == "money" then -- check if item is money   
			Functions.giveMoney(user_id,item_amount) -- give money to player
		else -- if it is an item
			Functions.giveInventoryItem(user_id,item_name,item_amount,true) -- give item to player
		end
	end
	if cfg.framework == "nunoradioman" then
		Functions.Inventory.GiveInventoryItem({player = player,item_name = item_name,item_amount = item_amount,item_notification = true})
	end
	if cfg.framework == "standalone" then

	end

	Log("giveitem",player,{item = item_name,amount = item_amount})
end
function CheckForPolice()
	if cfg.framework == "esx_old" then
		local xPlayers = Functions.GetPlayers() -- get all players.

		local cops = 0 -- cop variable.
		for _,playerdata in pairs(xPlayers) do -- loop all players.
			for _,groupname in pairs(cfg.police.groups) do -- loop all groups in the cfg.police.groups
				if playerdata.job.name == groupname then -- check group.
					cops = cops + 1 -- add to cop variable.
				end
			end
		end
		if cops >= cfg.police.amount then -- check for police amount
			return true -- return true
		else
			return false -- return false
		end
	end
	if cfg.framework == "esx_new" then
		local xPlayers = Functions.GetExtendedPlayers() -- get all players.

		local cops = 0 -- cop variable.
		for _,playerdata in pairs(xPlayers) do -- loop all players.
			for _,groupname in pairs(cfg.police.groups) do -- loop all groups in the cfg.police.groups
				if playerdata.job.name == groupname then -- check group.
					cops = cops + 1 -- add to cop variable.
				end
			end
		end
		if cops >= cfg.police.amount then -- check for police amount
			return true -- return true
		else
			return false -- return false
		end
	end
	if cfg.framework == "qbcore" then
		local xPlayers = Functions.Functions.GetQBPlayers() -- get all players.

		local cops = 0 -- cop variable.
		for _,playerdata in pairs(xPlayers) do -- loop all players.
			for _,groupname in pairs(cfg.police.groups) do -- loop all groups in the cfg.police.groups
				if playerdata.PlayerData.job.name == groupname and playerdata.PlayerData.job.onduty then -- check group.
					cops = cops + 1 -- add to cop variable.
				end
			end
		end
		if cops >= cfg.police.amount then -- check for police amount
			return true -- return true
		else
			return false -- return false
		end
	end
	if cfg.framework == "vrp" then
		local cops = 0 -- cop variable.
		for groupindex,group in pairs(cfg.police.groups) do -- loop all groups in the cfg.police.groups
			cops = cops + #Functions.getUsersByPermission({group}) -- add to cop variable.
		end
		if cops >= cfg.police.amount then -- check for police amount
			return true -- return true
		else
			return false -- return false
		end
	end
	if cfg.framework == "vrpex" then
		local cops = 0 -- cop variable.
		for groupindex,group in pairs(cfg.police.groups) do -- loop all groups in the cfg.police.groups
			cops = cops + #Functions.getUsersByPermission(group) -- add to cop variable.
		end
		if cops >= cfg.police.amount then -- check for police amount
			return true -- return true
		else
			return false -- return false
		end
	end
	if cfg.framework == "nunoradioman" then
		local canrob = nil
		TriggerEvent("CORE_JOB_POLICE:GetNumberOfPoliceOnline_s",function(cops)
			if cops >= cfg.police.amount then
				canrob = true -- return true
			else
				canrob = false -- return false
			end
		end)

		while canrob == nil do Citizen.Wait(0) end

		return canrob
	end
	if cfg.framework == "standalone" then
		return true -- return true
	end
end
function CallPolice(data)
	if cfg.dispatch == "nunoradioman" then
		if cfg.framework == "esx_old" then
			local xPlayers = Functions.GetPlayers() -- get all players.

			for _,playerdata in pairs(xPlayers) do -- loop all players.
				for _,groupname in pairs(cfg.police.groups) do -- loop all groups in the cfg.police.groups
					if playerdata.job.name == groupname then -- check group.
						TriggerClientEvent(resource..":PoliceNotification_c",xPlayers[i],data) -- send notification to the player that has the police group.
						break
					end
				end
			end
		end
		if cfg.framework == "esx_new" then
			local xPlayers = Functions.GetExtendedPlayers() -- get all players.

			for _,playerdata in pairs(xPlayers) do -- loop all players.
				for _,groupname in pairs(cfg.police.groups) do -- loop all groups in the cfg.police.groups
					if playerdata.job.name == groupname then -- check group.
						TriggerClientEvent(resource..":PoliceNotification_c",xPlayers[i],data) -- send notification to the player that has the police group.
						break
					end
				end
			end
		end
		if cfg.framework == "qbcore" then
			local xPlayers = Functions.Functions.GetQBPlayers() -- get all players.

			for player,playerdata in pairs(xPlayers) do -- loop all players.
				for _,groupname in pairs(cfg.police.groups) do -- loop all groups in the cfg.police.groups
					if playerdata.PlayerData.job.name == groupname and playerdata.PlayerData.job.onduty then -- check group.
						TriggerClientEvent(resource..":PoliceNotification_c",player,data) -- send notification to the player that has the police group.
						break
					end
				end
			end
		end
		if cfg.framework == "vrp" then
			for groupindex,group in pairs(cfg.police.groups) do -- loop all groups in the cfg.police.groups
				local cops = Functions.getUsersByPermission({group}) -- get all players with that group.
				for _,user_id in pairs(cops) do -- loops all players that has that group.
					local player = Functions.getUserSource({user_id}) -- get player source
					TriggerClientEvent(resource..":PoliceNotification_c",player,data) -- send notification to the player that has the police group.
				end
			end
		end
		if cfg.framework == "vrpex" then
			for groupindex,group in pairs(cfg.police.groups) do -- loop all groups in the cfg.police.groups
				local cops = Functions.getUsersByPermission(group) -- get all players with that group.
				for _,user_id in pairs(cops) do -- loops all players that has that group.
					local player = Functions.getUserSource(user_id) -- get player source
					TriggerClientEvent(resource..":PoliceNotification_c",player,data) -- send notification to the player that has the police group.
				end
			end
		end
		if cfg.framework == "nunoradioman" then
			TriggerClientEvent(resource..":PoliceNotification_c",-1,data) -- send notification to the player that has the police group.
		end
	else
		TriggerClientEvent(resource..":PoliceNotification_c",data.player,data)
	end
end
function Notification(data)
	TriggerClientEvent(resource..":Notification_c",data.player,data) -- sends notification to certain player.
end
function Log(type,player,data)
	if cfg.log.active then
		local identifiers = GetPlayerIdentifiers(player)
		local ids = {["rockstar"] = "Unknown",["discord"] = "Unknown",["ip"] = "Unknown",["steam"] = "Unknown",}
		local embeds = nil
		for k,v in pairs(identifiers) do
			if string.match(v,"license") then ids["rockstar"] = split(v,":")[2] end
			if string.match(v,"discord") then ids["discord"] = split(v,":")[2] end
			if string.match(v,"steam") then ids["steam"] = split(v,":")[2] end
			if string.match(v,"ip") then ids["ip"] = split(v,":")[2] end
		end
		if type == "start" then
			embeds = {{
				["color"] = 16711680,
				["title"] = cfg.log.logs[type].title,
				["description"] = "**[LOG] : "..cfg.log.logs[type].msg.."**\n **[DATE] : "..os.date("%x").."**\n **[TIME] : "..os.date("%X").."**\n\n **PLAYER DATA**\n\n **[PLAYER] : "..GetPlayerName(player).."**\n **[DISCORD] : <@"..ids["discord"]..">**\n **[ROCKSTAR] : "..ids["rockstar"].."**\n **[STEAM] : "..ids["steam"].."\n** **[IP] : "..ids["ip"].."**",
				["footer"] = {
					["text"] = cfg.log.logs[type].footer,
				},
			}}
		end
		if type == "giveitem" then
			embeds = {{
				["color"] = 16711680,
				["title"] = cfg.log.logs[type].title,
				["description"] = "**[LOG] : "..cfg.log.logs[type].msg.." "..data.item.." x"..data.amount.."**\n **[DATE] : "..os.date("%x").."**\n **[TIME] : "..os.date("%X").."**\n\n **PLAYER DATA**\n\n **[PLAYER] : "..GetPlayerName(player).."**\n **[DISCORD] : <@"..ids["discord"]..">**\n **[ROCKSTAR] : "..ids["rockstar"].."**\n **[STEAM] : "..ids["steam"].."\n** **[IP] : "..ids["ip"].."**",
				["footer"] = {
					["text"] = cfg.log.logs[type].footer,
				},
			}}
		end
		if type == "removeitem" then
			embeds = {{
				["color"] = 16711680,
				["title"] = cfg.log.logs[type].title,
				["description"] = "**[LOG] : "..cfg.log.logs[type].msg.." "..data.item.." x"..data.amount.."**\n **[DATE] : "..os.date("%x").."**\n **[TIME] : "..os.date("%X").."**\n\n **PLAYER DATA**\n\n **[PLAYER] : "..GetPlayerName(player).."**\n **[DISCORD] : <@"..ids["discord"]..">**\n **[ROCKSTAR] : "..ids["rockstar"].."**\n **[STEAM] : "..ids["steam"].."\n** **[IP] : "..ids["ip"].."**",
				["footer"] = {
					["text"] = cfg.log.logs[type].footer,
				},
			}}
		end
		if type == "luaexecutors" then
			embeds = {{
				["color"] = 16711680,
				["title"] = cfg.log.logs[type].title,
				["description"] = "**[LOG] : "..cfg.log.logs[type].msg.."**\n **[DATE] : "..os.date("%x").."**\n **[TIME] : "..os.date("%X").."**\n\n **PLAYER DATA**\n\n **[PLAYER] : "..GetPlayerName(player).."**\n **[DISCORD] : <@"..ids["discord"]..">**\n **[ROCKSTAR] : "..ids["rockstar"].."**\n **[STEAM] : "..ids["steam"].."\n** **[IP] : "..ids["ip"].."**",
				["footer"] = {
					["text"] = cfg.log.logs[type].footer,
				},
			}}
		end
		PerformHttpRequest(cfg.log.logs[type].webhook,function(err,text,headers)end,"POST",json.encode({username=cfg.log.logs[type].username,embeds=embeds,avatar_url=cfg.log.logs[type].avatar}),{["Content-Type"]="application/json"})
	end
end

--Other Functions
function split(str,sep) local array = {} local reg = string.format("([^%s]+)",sep) for mem in string.gmatch(str,reg) do table.insert(array,mem) end return array end
function clone(obj, seen) if type(obj) ~= 'table' then return obj end if seen and seen[obj] then return seen[obj] end local s = seen or {} local res = {} s[obj] = res for k,v in pairs(obj) do res[clone(k, s)] = clone(v, s) end return setmetatable(res, getmetatable(obj)) end