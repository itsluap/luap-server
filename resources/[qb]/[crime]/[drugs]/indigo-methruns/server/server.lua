local QBCore = exports['qb-core']:GetCoreObject()

local coolDown = false

AddEventHandler('onServerResourceStart', function(resourceName)
	if Config.Inventory == 'ox' and (resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName()) then
		exports.ox_inventory:RegisterStash("handoff_member", "Handoff", 50, 400000)
	end
end)

function GetStartItems()
	local result = nil
	if Config.Inventory == 'qb' then
		result = MySQL.Sync.fetchScalar('SELECT items FROM stashitems WHERE stash = ?', {'Handoff'})
	else
		result = MySQL.Sync.fetchScalar('SELECT data FROM ox_inventory WHERE name = ?', {'handoff_member'})
	end
	
	if result then
		local stashItems = json.decode(result)
		if stashItems then
			local items = {}
			for k, item in pairs(stashItems) do
				local itemInfo = QBCore.Shared.Items[item.name:lower()]
				if itemInfo then
					item.slot = item.slot
					items[item.slot] = item
				end
			end
			return items
		end
	end
	
	return {}
end


function PassedCheck()
	if Config.Inventory == 'qb' or Config.Inventory == 'lj' then
		local startItems = GetStartItems()
		local requiredAmount = Config.RequiredAmount

		for k, v in pairs(startItems) do
			if v.name == Config.StartItem then
				if (Config.UseItemsStacked and v.amount == requiredAmount) or (not Config.UseItemsStacked and k == requiredAmount) then
					return true
				end
			end
		end
	else
		local passedCheck = exports.ox_inventory:Search('handoff_member', 'count', 'floor_cleaner')
		if passedCheck == Config.RequiredAmount then
			return true
		end
	end

	return false
end

function CoolDown()
	CreateThread(function ()
		Wait(Config.CoolDown * 60000)
		coolDown = false
	end)
end

function ClearStash(PlayerId)
	if PassedCheck() then
		TriggerClientEvent('QBCore:Notify', PlayerId, 'These look good to me, you can grab your task now.', 'primary', 5000)
		TriggerClientEvent('indigo-methruns:client:verifypackages', PlayerId)
		if Config.Inventory == 'qb' or Config.Inventory == 'lj' then
			MySQL.Sync.fetchAll('UPDATE stashitems SET items = "[]" WHERE stash = ?', { 'Handoff' })
		else
			exports.ox_inventory:ClearInventory('handoff_member')
		end
	else
		TriggerClientEvent('QBCore:Notify', PlayerId, 'Something isn\'t right.', 'error', 5000)
	end
end

RegisterNetEvent('indigo-methruns:verifyitems', function ()
    local PlayerId = source
	local PlayerCoords = GetEntityCoords(GetPlayerPed(PlayerId))
	local dist = #(PlayerCoords - vector3(Config.PedPos.x, Config.PedPos.y, Config.PedPos.z))
	if dist < 10.0 then
		if Config.UseMethCooldown then
			if not coolDown then
				coolDown = true
				ClearStash(PlayerId)
				CoolDown()
			else
				TriggerClientEvent('QBCore:Notify', PlayerId, 'Check back again later', 'error', 5000)
			end
		else
			ClearStash(PlayerId)
		end
	end
end)

RegisterNetEvent('indigo-methruns:giveproducts', function (supCoords)
    local PlayerId = source
	local Player = QBCore.Functions.GetPlayer(PlayerId)
	local PlayerCoords = GetEntityCoords(GetPlayerPed(PlayerId))
	local dist = #(PlayerCoords - vector3(supCoords.x, supCoords.y, supCoords.z))
	if dist < 10.0 then
		if Player.PlayerData.metadata['methruns'] <= Config.LevelRep then
			if Player.Functions.AddItem(Config.LowRepItem, 1, false) then
				TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[Config.LowRepItem], 'add')
			else
				TriggerClientEvent('indigo-methruns:minuscollected', PlayerId)
			end
		elseif Player.PlayerData.metadata['methruns'] >= Config.LevelRep then
			if Player.Functions.AddItem(Config.HighRepItem, 1, false) then
				TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[Config.HighRepItem], 'add')
			else
				TriggerClientEvent('indigo-methruns:minuscollected', PlayerId)
			end
		end
	end
end)

RegisterNetEvent('indigo-methruns:removeitem', function (Item, amount)
	local PlayerId = source
	local Player = QBCore.Functions.GetPlayer(PlayerId)
	if Player.Functions.RemoveItem(Item, amount, false) then
		TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[Item], 'remove', amount)
		TriggerClientEvent('QBCore:Notify', PlayerId, 'Leave the area..', 'primary', 5000)
		TriggerClientEvent('indigo-methruns:leavevehicle', PlayerId)
	else
		TriggerClientEvent('QBCore:Notify', PlayerId, 'Something isn\'t right here..', 'error', 5000)
		TriggerClientEvent('indigo-methruns:minusdropped', PlayerId)
	end
end)

RegisterNetEvent('indigo-methruns:rewards', function(bool)
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
	if not bool then return end
	if Player.Functions.RemoveItem('methcase', 1, false) then
		local Pay = 0
		TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items['methcase'], 'remove')
		local randomRep = math.random(Config.MinRep, Config.MaxRep)
		local uprep = Player.PlayerData.metadata['methruns'] + randomRep
		Player.Functions.SetMetaData('methruns', uprep)
		if Player.PlayerData.metadata['methruns'] <= Config.LevelRep then
			Pay = math.random(Config.MinMethPayoutLowRep, Config.MaxMethPayoutLowRep)
			Player.Functions.AddMoney('cash', Pay, 'Methrun Payment')
		elseif Player.PlayerData.metadata['methruns'] >= Config.LevelRep then
			Pay = math.random(Config.MinMethPayoutHighRep, Config.MaxMethPayoutHighRep)
			Player.Functions.AddMoney('cash', Pay, 'Methrun Payment')
		end

		TriggerEvent('qb-log:server:CreateLog', 'methruns', 'Methrun', 'green',
			'**'..'Player: '..GetPlayerName(Player.PlayerData.source)..'**\n'..
			'**'..'Citizen Id: '..Player.PlayerData.citizenid..'**\n'..
			'**'..'Player Id: '..Player.PlayerData.source..'**\n'..
			'Money Recieved: $'..Pay..'\n'..
			'Repututation Earned: '..randomRep..'\n'..
			'Player Current Repututation: '..uprep..'\n')

		TriggerClientEvent('indigo-methruns:changevars', PlayerId)
	end
end)

RegisterNetEvent('indigo-methruns:checkrep', function ()
	local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
	local rep = Player.PlayerData.metadata['methruns']
	TriggerClientEvent('QBCore:Notify', PlayerId, 'Current Reputation: '..rep, 'primary', 5000)
end)

RegisterNetEvent('indigo-methruns:getmethcase', function ()
	local PlayerId = source
	local Player = QBCore.Functions.GetPlayer(PlayerId)
	Player.Functions.AddItem('methcase', 1, false)
	TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items['methcase'], 'add')
end)

QBCore.Functions.CreateUseableItem('methcase', function(source)
	TriggerClientEvent('indigo-methruns:rewards', source)
end)

RegisterNetEvent('indigo-methruns:policetracker', function (coords)
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.name == Config.PoliceJobName then
            TriggerClientEvent('kevin-methruns:policetracker', v.PlayerData.source, coords)
        end
    end
end)