local QBCore = exports['qb-core']:GetCoreObject()
--========================================================== Engines
RegisterNetEvent('jim-mechanic:client:applyEngine', function(level)
	if not jobChecks() then return end
	if not locationChecks() then return end
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(PlayerPedId())) then return end
	local vehicle
	if not IsPedInAnyVehicle(PlayerPedId(), false) then vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle) end
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	if DoesEntityExist(vehicle) then
		local currentEngine = GetVehicleMod(vehicle, 11)
		if GetNumVehicleMods(vehicle, 11) == 0 then	TriggerEvent("QBCore:Notify", Loc[Config.Lan]["engines"].cant, "error") return	end
		if GetVehicleMod(vehicle, 11) == level then TriggerEvent("QBCore:Notify", "LVL: "..(level+1)..Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			SetVehicleDoorOpen(vehicle, 4, false, false)
			QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["common"].installing.." LVL: "..level+1, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
			{ animDict = "mini@repair", anim = "fixing_a_ped", flags = 8, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
				if GetVehicleMod(vehicle, 11) ~= currentEngine then TriggerServerEvent("jim-mechanic:server:DupeWarn", "engine"..(currentEngine+1)) emptyHands(playerPed) return end
				qblog("`"..QBCore.Shared.Items["engine"..(level+1)].label.." - engine"..(level+1).."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				SetVehicleMod(vehicle, 11, level)
				SetVehicleDoorShut(vehicle, 4, false)
				emptyHands(PlayerPedId())
				updateCar(vehicle)
				TriggerServerEvent('jim-mechanic:server:removeEngines', level, currentEngine)
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["engines"].installed, "success")
			end, function()
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["engines"].failed, "error")
				SetVehicleDoorShut(vehicle, 4, false)
				emptyHands(PlayerPedId())
			end, "engine"..level+1)
		end
	end
end)
--Simple remove the engine command and give what was already in
RegisterNetEvent('jim-mechanic:client:giveEngine', function()
	if not jobChecks() then return end
	if not locationChecks() then return end
	local vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle)
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	local currentEngine = GetVehicleMod(vehicle, 11)
	SetVehicleDoorOpen(vehicle, 4, false, false)
	QBCore.Functions.Progressbar("accepted_key", Loc[Config.Lan]["engines"].removing, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
	{ animDict = "mini@repair", anim = "fixing_a_ped", flags = 8, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
		if GetVehicleMod(vehicle, 11) ~= currentEngine then TriggerServerEvent("jim-mechanic:server:DupeWarn", "engine"..(currentEngine+1)) emptyHands(playerPed) return end
		qblog("`"..QBCore.Shared.Items["engine"..(currentEngine+1)].label.." - engine"..(currentEngine+1).."` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
		SetVehicleMod(vehicle, 11, -1)
		SetVehicleDoorShut(vehicle, 4, false)
		updateCar(vehicle)
		TriggerServerEvent('jim-mechanic:server:removeEngines', nil, currentEngine)
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["engines"].remove, "success")
		emptyHands(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["engines"].remfail, "error")
		emptyHands(PlayerPedId())
	end, "engine"..currentEngine+1)
end)