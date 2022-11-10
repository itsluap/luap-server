local QBCore = exports['qb-core']:GetCoreObject()
--========================================================== Brakes
--Add Brakes
RegisterNetEvent('jim-mechanic:client:applyBrakes', function(level)
	if not jobChecks() then return end
	if not locationChecks() then return end
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(PlayerPedId())) then return end
	local vehicle
	if not IsPedInAnyVehicle(PlayerPedId(), false) then	vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle) end
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	if DoesEntityExist(vehicle) then
		local currentBrakes = GetVehicleMod(vehicle, 12)
		if GetNumVehicleMods(vehicle, 12) == 0 then	TriggerEvent("QBCore:Notify", Loc[Config.Lan]["brakes"].cant, "error") return end
		if GetVehicleMod(vehicle, 12) == level then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			QBCore.Functions.Progressbar("accepted_key", Loc[Config.Lan]["common"].installing.."LVL: "..level+1, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
			{ animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 8, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
				if GetVehicleMod(vehicle, 12) ~= currentBrakes then TriggerServerEvent("jim-mechanic:server:DupeWarn", "brakes"..(currentBrakes+1)) emptyHands(playerPed) return end
				qblog("`"..QBCore.Shared.Items["brakes"..(level+1)].label.." - brakes"..(level+1).."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				SetVehicleMod(vehicle, 12, level)
				updateCar(vehicle)
				TriggerServerEvent('jim-mechanic:server:removeBrakes', level, currentBrakes)
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["brakes"].installed, "success")
				emptyHands(PlayerPedId())
			end, function() -- Cancel
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["brakes"].failed, "error")
				emptyHands(PlayerPedId())
			end, "brakes"..level+1)
		end
	end
end)
--Remove Brakes
RegisterNetEvent('jim-mechanic:client:giveBrakes', function()
	if not jobChecks() then return end
	if not locationChecks() then return end
	local vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle)
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	local currentBrakes = GetVehicleMod(vehicle, 12)
	QBCore.Functions.Progressbar("accepted_key", Loc[Config.Lan]["brakes"].removing, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true,	disableMouse = false, disableCombat = false, },
	{ animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 8, }, {}, {}, function()
		if GetVehicleMod(vehicle, 12) ~= currentBrakes then TriggerServerEvent("jim-mechanic:server:DupeWarn", "brakes"..(currentBrakes+1)) emptyHands(playerPed) return end
		qblog("`"..QBCore.Shared.Items["brakes"..currentBrakes+1].label.." - brakes"..currentBrakes+1 .."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
		SetVehicleMod(vehicle, 12, -1)
		updateCar(vehicle)
		TriggerServerEvent('jim-mechanic:server:removeBrakes', nil, currentBrakes)
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["brakes"].remove, "success")
		emptyHands(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["brakes"].remfail, "error")
		emptyHands(PlayerPedId())
	end, "brakes"..currentBrakes+1)
end)