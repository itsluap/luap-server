local QBCore = exports['indigo-core']:GetCoreObject()

--Slow and visible cleaning command
RegisterNetEvent('jim-mechanic:client:cleanVehicle', function(skip)
	local playerPed	= PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	if not skip then if not jobChecks() then return end end
	if not inCar() then return end
	if not nearPoint(coords) then return end
	local vehicle = getClosest(coords) pushVehicle(vehicle)
	if DoesEntityExist(vehicle) then
	local cleaning = false
	if skip then
		if GetVehicleDirtLevel(vehicle) <= 0.1 then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["extras"].clean, "success") SetVehicleDirtLevel(vehicle, 0.0) updateCar(vehicle) return
		elseif GetVehicleDirtLevel(vehicle) > 0.1 then
			cleaning = true
			TriggerServerEvent("QBCore:Server:RemoveItem", 'cleaningkit', 1)
			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['cleaningkit'], "remove", 1)
		end
	else cleaning = true end
		TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
		Wait(150)
		TriggerEvent('animations:client:EmoteCommandStart', {"clean2"})
		while cleaning do
			if GetVehicleDirtLevel(vehicle) >= 1.0 then SetVehicleDirtLevel(vehicle, (tonumber(GetVehicleDirtLevel(vehicle))) - 0.3)
			elseif GetVehicleDirtLevel(vehicle) <= 1.0 then SetVehicleDirtLevel(vehicle, 0.0) cleaning = false TriggerEvent("QBCore:Notify", Loc[Config.Lan]["extras"].clean, "success") emptyHands(playerPed, true) updateCar(vehicle) end
			Wait(300)
		end
	end
end)

--Multipurpose Door command
RegisterNetEvent('jim-mechanic:client:openDoor', function(door)
	local doornum = tonumber(door)
	if doornum < 0 or doornum > 5 then
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["extras"].doorerr, "error")
		return
	end
	local coords = GetEntityCoords(PlayerPedId())
	if not nearPoint(coords) then return end
	local vehicle = nil
	if IsPedSittingInAnyVehicle(PlayerPedId()) then	vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	else vehicle = getClosest(coords) pushVehicle(vehicle) end
	if DoesEntityExist(vehicle) then
		if GetVehicleDoorLockStatus(vehicle) == 2 then
			TriggerEvent("QBCore:Notify", Loc[Config.Lan]["extras"].locked, "error")
			return
		else
			if GetVehicleDoorAngleRatio(vehicle, doornum) > 0.0 then SetVehicleDoorShut(vehicle, doornum, false)
			else SetVehicleDoorOpen(vehicle, doornum, false, false) end
		end
	end
end)

RegisterNetEvent("jim-mechanic:flipvehicle", function()
	local playerPed	= PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	if not inCar() then	return end
	if not nearPoint(coords) then return end
	local vehicle = getClosest(coords) pushVehicle(vehicle)
	if DoesEntityExist(vehicle) then
		QBCore.Functions.Progressbar("accepted_key", Loc[Config.Lan]["extras"].flipping, 12000, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false,	disableCombat = false, },
		{ task = "CODE_HUMAN_MEDIC_TEND_TO_DEAD" }, {}, {}, function() -- Done
			qblog("used `/flipvehicle`")
			emptyHands(playerPed)
			vehiclecoords = GetEntityCoords(vehicle)
			SetEntityCoords(vehicle, vehiclecoords.x+0.5, vehiclecoords.y+0.5, vehiclecoords.z+1)
			Wait(200)
			SetEntityRotation(vehicle, GetEntityRotation(PlayerPedId(), 2), 2)
			Wait(500)
			SetVehicleOnGroundProperly(vehicle)
			TriggerEvent("QBCore:Notify", Loc[Config.Lan]["extras"].flipped, "success")
		end, function() -- Cancel
			TriggerEvent("QBCore:Notify", Loc[Config.Lan]["extras"].failed, "error")
			emptyHands(playerPed)
		end, "fas fa-car-burst")
	end
end)

RegisterNetEvent("jim-mechanic:seat", function(seat)
	if not seat then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["extras"].noseat, "error") return end
	local vehicle = GetVehiclePedIsIn(PlayerPedId())
	local IsSeatFree = IsVehicleSeatFree(vehicle, tonumber(seat))
	local speed = GetEntitySpeed(vehicle)
	local HasHarnass = exports['indigo-smallresources']:HasHarness()
	if not HasHarnass then
		local kmh = (speed * 3.6);
		if IsSeatFree then
			if kmh <= 100.0 then
				SetPedIntoVehicle(PlayerPedId(), vehicle, tonumber(seat))
				QBCore.Functions.Notify(Loc[Config.Lan]["extras"].moveseat..seat.."!")
			else
				QBCore.Functions.Notify(Loc[Config.Lan]["extras"].fastseat)
			end
		else
			QBCore.Functions.Notify(Loc[Config.Lan]["extras"].notseat)
		end
	else
		QBCore.Functions.Notify(Loc[Config.Lan]["extras"].harness, 'error')
	end
end)

local vehicle_sounds = {}
local soundTog = false
RegisterNetEvent("jim-mechanic:togglesound", function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
	if not soundTog then soundTog = true
		currentEngine = GetVehicleMod(vehicle, 11)
		if currentEngine == 3 then ForceVehicleEngineAudio(vehicle, "monster")
		elseif currentEngine == 2 then	ForceVehicleEngineAudio(vehicle, "krieger")
		elseif currentEngine == 1 then	ForceVehicleEngineAudio(vehicle, "zentorno")
		elseif currentEngine == 0 then	ForceVehicleEngineAudio(vehicle, "zorrusso") end
	elseif soundTog then soundTog = false
		ForceVehicleEngineAudio(vehicle, string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
	end
end, false)