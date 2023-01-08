local QBCore = exports['qb-core']:GetCoreObject()

-- Open ID card
RegisterServerEvent('badge:open')
AddEventHandler('badge:open', function(ID, targetID, type)
	local identifier = QBCore.Functions.GetPlayerByCitizenId(ID)
	local _source 	 = QBCore.Functions.GetPlayer(targetID)
	local show       = false
	local _PED_ID = PED_ID

	MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', {['@identifier'] = identifier},
	function (user)
		if (user[1] ~= nil) then
			MySQL.Async.fetchAll('SELECT type FROM user_licenses WHERE owner = @identifier', {['@identifier'] = identifier},
			function (licenses)
				if type ~= nil then
					for i=1, #licenses, 1 do
						if type == 'driver' then
							if licenses[i].type == 'drive' or licenses[i].type == 'drive_bike' or licenses[i].type == 'drive_truck' then
								show = true
							end
						elseif type =='weapon' then
							if licenses[i].type == 'weapon' then
								show = true
							end
						end
					end
				else
					show = true
				end

				if show then
					local array = {
						user = user,
						licenses = licenses
					}
					TriggerClientEvent('badge:open', _source, array, type)
					TriggerClientEvent( 'badge:shot', _source, source )
				else
					TriggerClientEvent('QBCore:Notify', _source, "You don't have that type of license..", 'error')
				end
			end)
		end
	end)
end)

QBCore.Functions.CreateUseableItem("pdbadge", function(source, item)
    TriggerClientEvent('badge:openPD', source, true)
end)