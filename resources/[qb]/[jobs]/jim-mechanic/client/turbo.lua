local QBCore = exports['qb-core']:GetCoreObject()
--========================================================== Turbo
RegisterNetEvent('jim-mechanic:client:applyTurbo', function()
	if not jobChecks() then return end
	if not locationChecks() then return end
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(PlayerPedId())) then return end
	local vehicle
	if not IsPedInAnyVehicle(PlayerPedId(), false) then vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle) end
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	if DoesEntityExist(vehicle) then
		if GetNumVehicleMods(vehicle,11) == 0 then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].noOptions, "error") return end
		if IsToggleModOn(vehicle, 18) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			SetVehicleDoorOpen(vehicle, 4, false, false)
			QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["turbo"].install, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
			{ animDict = "mini@repair",	anim = "fixing_a_ped", flags = 16, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
				if IsToggleModOn(vehicle, 18) then TriggerServerEvent("jim-mechanic:server:DupeWarn", "turbo") emptyHands(playerPed) return end
				qblog("`"..QBCore.Shared.Items["turbo"].label.." - turbo` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				ToggleVehicleMod(vehicle, 18, true)
				SetVehicleDoorShut(vehicle, 4, false)
				FreezeEntityPosition(PlayerPedId(), false)
				updateCar(vehicle)
				TriggerServerEvent('jim-mechanic:server:removeTurbo')
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["turbo"].installed, "success")
				emptyHands(PlayerPedId())
			end, function() -- Cancel
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["turbo"].failed, "error")
				SetVehicleDoorShut(vehicle, 4, false)
				emptyHands(PlayerPedId())
			end, "turbo")
		end
	end
end)

RegisterNetEvent('jim-mechanic:client:giveTurbo', function()
	if not jobChecks() then return end
	if not locationChecks() then return end
	local vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle)
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	SetVehicleDoorOpen(vehicle, 4, false, false)
	QBCore.Functions.Progressbar("accepted_key", Loc[Config.Lan]["turbo"].removing, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
	{ animDict = "mini@repair",	anim = "fixing_a_ped", flags = 16, }, {}, {}, function() SetVehicleModKit(vehicle, 0) SetVehicleModKit(vehicle, 0)
		if not IsToggleModOn(vehicle, 18) then TriggerServerEvent("jim-mechanic:server:DupeWarn", "turbo") emptyHands(playerPed) return end
		qblog("`"..QBCore.Shared.Items["turbo"].label.." - turbo` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
		ToggleVehicleMod(vehicle, 18, false)
		SetVehicleDoorShut(vehicle, 4, false)
		updateCar(vehicle)
		TriggerServerEvent('jim-mechanic:server:giveTurbo')
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["turbo"].remove, "success")
		emptyHands(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["turbo"].remfail, "error")
		emptyHands(PlayerPedId())
	end, "turbo")
end)