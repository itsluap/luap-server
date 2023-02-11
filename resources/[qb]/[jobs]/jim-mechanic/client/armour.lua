local QBCore = exports['qb-core']:GetCoreObject()
--========================================================== Armour
-- Add Armour
RegisterNetEvent('jim-mechanic:client:applyArmour', function()
	if not jobChecks() then return end
	if not locationChecks() then return end
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(PlayerPedId())) then return end
	if not IsPedInAnyVehicle(PlayerPedId(), false) then	vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle) end
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	if DoesEntityExist(vehicle) then
		if GetNumVehicleMods(vehicle, 16) == 0 then	TriggerEvent("QBCore:Notify", Loc[Config.Lan]["armour"].cant, "error") return end
		if GetVehicleMod(vehicle, 16)+1 == GetNumVehicleMods(vehicle, 16) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			SetVehicleDoorOpen(vehicle, 4, false, false)
			QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["armour"].install, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
			{ animDict = "mini@repair", anim = "fixing_a_ped", flags = 16, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
				qblog("`"..QBCore.Shared.Items["car_armor"].label.." - car_armor` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				SetVehicleMod(vehicle, 16, GetNumVehicleMods(vehicle, 16)-1)
				SetVehicleDoorShut(vehicle, 4, false)
				emptyHands(PlayerPedId())
				updateCar(vehicle)
				TriggerServerEvent('jim-mechanic:server:removeArmour')
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["armour"].installed, "success")
			end, function() -- Cancel
				TriggerEvent("QBCore:Notify", Loc[Config.Lan]["armour"].failed, "error")
				SetVehicleDoorShut(vehicle, 4, false)
				emptyHands(PlayerPedId())
			end, "car_armor")
		end
	end
end)
-- Remove Armour
RegisterNetEvent('jim-mechanic:client:giveArmor', function()
	if not jobChecks() then return end
	if not locationChecks() then return end
	local vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle)	lookVeh(vehicle)
	if lockedCar(vehicle) then return end
	if Config.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then TriggerEvent("QBCore:Notify", Loc[Config.Lan]["common"].owned, "error") return end
	SetVehicleDoorOpen(vehicle, 4, false, false)
	QBCore.Functions.Progressbar("accepted_key", Loc[Config.Lan]["armour"].removing, math.random(7000,10000), false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
	{ animDict = "mini@repair", anim = "fixing_a_ped", flags = 16, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
		if GetVehicleMod(vehicle, 16) == -1 then TriggerServerEvent("jim-mechanic:server:DupeWarn", "car armor") emptyHands(playerPed) return end
		qblog("`"..QBCore.Shared.Items["car_armor"].label.." - car_armor` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
		SetVehicleMod(vehicle, 16, -1)
		SetVehicleDoorShut(vehicle, 4, false)
		updateCar(vehicle)
		TriggerServerEvent('jim-mechanic:server:giveArmour')
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["armour"].removed, "success")
		emptyHands(PlayerPedId())
	end, function()
		TriggerEvent("QBCore:Notify", Loc[Config.Lan]["armour"].remfail, "error")
		emptyHands(PlayerPedId())
	end, "car_armor")
end)