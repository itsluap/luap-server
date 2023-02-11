local QBCore = exports['qb-core']:GetCoreObject()
--========================================================== Drift
RegisterNetEvent('jim-mechanic:client:applyDrift', function()
	if GetGameBuildNumber() < 2372 then return end
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
		if GetDriftTyresEnabled(vehicle) ~= false then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["tires"].install, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
			{ animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 8, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
				qblog("`drifttires - "..QBCore.Shared.Items["drifttires"].label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				SetVehicleTyreFixed(vehicle, 0)
				SetVehicleTyreFixed(vehicle, 1)
				SetVehicleTyreFixed(vehicle, 2)
				SetVehicleTyreFixed(vehicle, 3)
				SetVehicleTyreFixed(vehicle, 4)
				SetDriftTyresEnabled(vehicle, true)
				emptyHands(PlayerPedId())
				updateCar(vehicle)
				TriggerServerEvent('jim-mechanic:server:removeDrift')
				if GetVehicleTyresCanBurst(vehicle) ~= 1 then
					TriggerServerEvent('jim-mechanic:server:giveBulletProof')
					SetVehicleTyresCanBurst(vehicle, true)
					TriggerEvent("QBCore:Notify", Loc[Config.Lan]["tires"].swap, "success")
				end
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["tires"].installed, "success")
			end, function() -- Cancel
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["tires"].failed, "error")
				emptyHands(PlayerPedId())
			end, "drifttires")
		end
	end
end)

RegisterNetEvent('jim-mechanic:client:giveDrift', function()
	if GetGameBuildNumber() < 2372 then return end
	if not jobChecks() then return end
	if not locationChecks() then return end
	local vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle)
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	if DoesEntityExist(vehicle) then
		QBCore.Functions.Progressbar("accepted_key", Loc[Config.Lan]["tires"].removing, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
		{ animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 8, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
			if GetDriftTyresEnabled(vehicle) == false then TriggerServerEvent("jim-mechanic:server:DupeWarn", "drifttires") emptyHands(playerPed) return end
			qblog("`drifttires - "..QBCore.Shared.Items["drifttires"].label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
			SetVehicleTyreFixed(vehicle, 0)
			SetVehicleTyreFixed(vehicle, 1)
			SetVehicleTyreFixed(vehicle, 2)
			SetVehicleTyreFixed(vehicle, 3)
			SetVehicleTyreFixed(vehicle, 4)
			SetDriftTyresEnabled(vehicle, false)
			emptyHands(PlayerPedId())
			updateCar(vehicle)
			TriggerServerEvent('jim-mechanic:server:giveDrift')
			TriggerEvent("QBCore:Notify", Loc[Config.Lan]["tires"].remove, "success")
		end, function() -- Cancel
			TriggerEvent("QBCore:Notify", Loc[Config.Lan]["tires"].remfail, "error")
			emptyHands(PlayerPedId())
		end, "drifttires")
	end
end)

--========================================================== Bullet Proof
RegisterNetEvent('jim-mechanic:client:applyBulletProof', function()
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
		if GetVehicleTyresCanBurst(vehicle) == false then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].already2, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			time = math.random(7000,10000)
			QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["tires"].install2, time, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
			{ animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 8, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
				if GetVehicleTyresCanBurst(vehicle) == false then TriggerServerEvent("jim-mechanic:server:DupeWarn", "bprooftires") emptyHands(playerPed) return end
				qblog("`bprooftires - "..QBCore.Shared.Items["bprooftires"].label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				SetVehicleTyreFixed(vehicle, 0)
				SetVehicleTyreFixed(vehicle, 1)
				SetVehicleTyreFixed(vehicle, 2)
				SetVehicleTyreFixed(vehicle, 3)
				SetVehicleTyreFixed(vehicle, 4)
				SetVehicleTyresCanBurst(vehicle, false)
				updateCar(vehicle)
				TriggerServerEvent('jim-mechanic:server:removeBulletProof')
				if GetDriftTyresEnabled(vehicle) ~= false then
					TriggerServerEvent('jim-mechanic:server:giveDrift')
					SetDriftTyresEnabled(vehicle, false)
					TriggerEvent("QBCore:Notify", Loc[Config.Lan]["tires"].swap2, "success")
				end
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["tires"].installed2, "success")
				emptyHands(PlayerPedId())
			end, function() -- Cancel
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["tires"].failed2, "error")
				emptyHands(PlayerPedId())
			end, "bprooftires")
		end
	end
end)

RegisterNetEvent('jim-mechanic:client:giveBulletProof', function()
	if not jobChecks() then return end
	if not locationChecks() then return end
	local vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle)
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	if DoesEntityExist(vehicle) then
		QBCore.Functions.Progressbar("accepted_key", Loc[Config.Lan]["tires"].removing2, 8000, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
		{ animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 8, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
			if GetVehicleTyresCanBurst(vehicle) ~= false then TriggerServerEvent("jim-mechanic:server:DupeWarn", "bprooftires") emptyHands(playerPed) return end
			qblog("`bprooftires - "..QBCore.Shared.Items["bprooftires"].label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
			SetVehicleTyreFixed(vehicle, 0)
			SetVehicleTyreFixed(vehicle, 1)
			SetVehicleTyreFixed(vehicle, 2)
			SetVehicleTyreFixed(vehicle, 3)
			SetVehicleTyreFixed(vehicle, 4)
			SetVehicleTyresCanBurst(vehicle, true)
			updateCar(vehicle)
			TriggerServerEvent('jim-mechanic:server:giveBulletProof')
			TriggerEvent("QBCore:Notify", Loc[Config.Lan]["tires"].remove2, "success")
			emptyHands(PlayerPedId())
		end, function()
			TriggerEvent("QBCore:Notify", Loc[Config.Lan]["tires"].remfail, "error")
			emptyHands(PlayerPedId())
		end, "bprooftires")
	end
end)