local QBCore = exports['qb-core']:GetCoreObject()
--========================================================== Transmission
RegisterNetEvent('jim-mechanic:client:applyTransmission', function(level)
	if not jobChecks() then return end
	if not locationChecks() then return end
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(PlayerPedId())) then return end
	local vehicle
	if not IsPedInAnyVehicle(PlayerPedId(), false) then vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle) end
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	if DoesEntityExist(vehicle) then
		local currentTrans = GetVehicleMod(vehicle, 13)
		if GetNumVehicleMods(vehicle, 13) == 0 then	TriggerEvent("QBCore:Notify", Loc[Config.Lan]["transmission"].cant, "error") return end
		if currentTrans == level then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			SetVehicleDoorOpen(vehicle, 4, false, false)
			QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["common"].installing.."LVL: "..level+1, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
			{ animDict = "mini@repair",	anim = "fixing_a_ped", flags = 16, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
				if GetVehicleMod(vehicle, 13) ~= currentTrans then TriggerServerEvent("jim-mechanic:server:DupeWarn", "transmission"..(currentTrans+1)) emptyHands(playerPed) return end
				qblog("`"..QBCore.Shared.Items["transmission"..(level+1)].label.." - transmission"..(level+1).."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				SetVehicleMod(vehicle, 13, level)
				SetVehicleDoorShut(vehicle, 4, false)
				updateCar(vehicle)
				TriggerServerEvent('jim-mechanic:server:removeTransmission', level, currentTrans)
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["transmission"].installed, "success")
				emptyHands(PlayerPedId())
			end, function() -- Cancel
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["transmission"].failed, "error")
				SetVehicleDoorShut(vehicle, 4, false)
				emptyHands(PlayerPedId())
			end, "transmission"..level+1)
		end
	end
end)

RegisterNetEvent('jim-mechanic:client:giveTransmission', function()
	if not jobChecks() then return end
	if not locationChecks() then return end
	local vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle)
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	local currentTrans = GetVehicleMod(vehicle, 13)
	SetVehicleDoorOpen(vehicle, 4, false, false)
	QBCore.Functions.Progressbar("accepted_key", Loc[Config.Lan]["transmission"].removing, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
	{ animDict = "mini@repair", anim = "fixing_a_ped", flags = 16, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
		if GetVehicleMod(vehicle, 13) ~= currentTrans then TriggerServerEvent("jim-mechanic:server:DupeWarn", "transmission"..(currentTrans+1)) emptyHands(playerPed) return end
		qblog("`"..QBCore.Shared.Items["transmission"..(currentTrans+1)].label.." - transmission"..(currentTrans+1).."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
		SetVehicleMod(vehicle, 13, -1)
		SetVehicleDoorShut(vehicle, 4, false)
		updateCar(vehicle)
		TriggerServerEvent('jim-mechanic:server:removeTransmission', nil, currentTrans)
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["transmission"].remove, "success")
		emptyHands(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["transmission"].remfail, "error")
		emptyHands(PlayerPedId())
	end, "transmission"..currentTrans+1)
end)