local QBCore = exports['qb-core']:GetCoreObject()
--========================================================== Suspension
RegisterNetEvent('jim-mechanic:client:applySuspension', function(level)
	if not jobChecks() then return end
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(PlayerPedId())) then return end
	if not IsPedInAnyVehicle(PlayerPedId(), false) then vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle) end
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	if DoesEntityExist(vehicle) then
		local currentSuspension = GetVehicleMod(vehicle, 15)
		if GetNumVehicleMods(vehicle, 15) == 0 then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["suspension"].cant, "error") return end
		if currentSuspension == level then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["common"].installing.."LVL: "..level+1, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
			{ animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 8, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
				if GetVehicleMod(vehicle, 15) ~= currentSuspension then TriggerServerEvent("jim-mechanic:server:DupeWarn", "suspension"..(currentSuspension+1)) emptyHands(playerPed) return end
				qblog("`"..QBCore.Shared.Items["suspension"..(level+1)].label.." - suspension"..(level+1).."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				SetVehicleMod(vehicle, 15, level)
				SetVehicleDoorShut(vehicle, 4, false)
				emptyHands(PlayerPedId())
				updateCar(vehicle)
				TriggerServerEvent('jim-mechanic:server:removeSuspension', level, currentSuspension)
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["suspension"].installed, "success")
			end, function()
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["suspension"].failed, "error")
				emptyHands(PlayerPedId())
			end, "suspension"..level+1)
		end
	end
end)

RegisterNetEvent('jim-mechanic:client:giveSuspension', function()
	if not jobChecks() then return end
	if not locationChecks() then return end
	local vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle)
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	local currentSuspension = GetVehicleMod(vehicle, 15)
	QBCore.Functions.Progressbar("accepted_key", Loc[Config.Lan]["suspension"].removing, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
	{ animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 8, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
		if GetVehicleMod(vehicle, 15) ~= currentSuspension then TriggerServerEvent("jim-mechanic:server:DupeWarn", "suspension"..(currentSuspension+1)) emptyHands(playerPed) return end
		qblog("`"..QBCore.Shared.Items["suspension"..(currentSuspension+1)].label.." - suspension"..(currentSuspension+1).."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
		SetVehicleMod(vehicle, 15, -1)
		updateCar(vehicle)
		TriggerServerEvent('jim-mechanic:server:removeSuspension', nil, currentSuspension)
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["suspension"].removed, "success")
		emptyHands(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["suspension"].remfail, "error")
		emptyHands(PlayerPedId())
	end, "suspension"..currentSuspension+1)
end)
