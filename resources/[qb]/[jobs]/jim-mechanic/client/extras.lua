local QBCore = exports['qb-core']:GetCoreObject()

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
	local HasHarnass = exports['qb-smallresources']:HasHarness()
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

--ODOMETER FUNCTION
local DistAdd = 0
local DistCount = 0
local ShowingOdo = false
ShowOdo = Config.ShowOdo
local owned
local prevVeh

CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped, true) then
			local veh = GetVehiclePedIsIn(ped)
			local prevLoc = GetEntityCoords(veh)
			local plate = trim(GetVehicleNumberPlateText(veh))
			if DoesEntityExist(veh) and not IsVehicleStopped(veh) then
				if plate then
					if GetPedInVehicleSeat(veh, -1) == ped then
						if prevVeh ~= veh then -- Don't keep checking database for vehicle ownership if in the same car
							owned = IsVehicleOwned(plate) -- only check if vehicle is owned when the player is in the driver seat
							prevVeh = veh
						end
						--SHOW ODOMETER STUFF
						Wait(1000)
						if ShowOdo and (owned or Config.Debug) then
							if DistCount == 0 or Config.Debug then
								local p = promise.new()
								QBCore.Functions.TriggerCallback('jim-mechanic:distGrab', function(cb) p:resolve(cb) end, trim(GetVehicleNumberPlateText(veh)))
								dist = Citizen.Await(p)
								if dist ~= "" then
									if Config.distkph then dist = string.format("%05d", math.floor((dist+DistAdd) * 0.01)).." <b>Km</b>"
									else dist = string.format("%05d", math.floor((dist+DistAdd) * 0.00621371)).." <b>Mi</b>" end
								end
								if Config.Debug then
									local p = promise.new() QBCore.Functions.TriggerCallback('jim-mechanic:GetNosLoaded', function(cb) p:resolve(cb) end) local VehicleNitrous = Citizen.Await(p)
									dist =
									"<b>Vehicle Debug Info</b>:"..
									"<br>"..searchCar(veh)..
									"Class: "..getClass(veh)..
									"<br>"..Loc[Config.Lan]["check"].plate..trim(GetVehicleNumberPlateText(veh)).."]"..
									"<br>Dist: "..tostring(dist)..
									"<br>Fuel: "..nosBar(math.floor(exports['LegacyFuel']:GetFuel(veh))).." "..math.floor(exports['LegacyFuel']:GetFuel(veh)).."%"
									if VehicleNitrous[trim(GetVehicleNumberPlateText(veh))] then
										dist = dist.."<br>NOS: "..nosBar((VehicleNitrous[trim(GetVehicleNumberPlateText(veh))].level)).." "..tostring((VehicleNitrous[trim(GetVehicleNumberPlateText(veh))].level)).."%"
									end

									dist = dist..
									"<br><br><b>Vehicle Health</b>:"..
									"<br>Engine: "..math.floor(GetVehicleEngineHealth(veh)/10).."%<br>"..nosBar(math.floor(GetVehicleEngineHealth(veh)/10))..
									"<br>Body: "..math.floor(GetVehicleBodyHealth(veh)/10).."%<br>"..nosBar(math.floor(GetVehicleBodyHealth(veh)/10))
									if useMechJob() then
										dist = dist..
										"<br><br><b>Extra Damages</b>:"..
										"<br>"..Loc[Config.Lan]["repair"].radiator..": "..math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "radiator")).."%<br>"..nosBar(math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "radiator"))).." "..
										"<br>"..Loc[Config.Lan]["repair"].driveshaft..": "..math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "axle")).."%<br>"..nosBar(math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "axle"))).." "..
										"<br>"..Loc[Config.Lan]["repair"].brakes..": "..math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "brakes")).."%<br>"..nosBar(math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "brakes"))).." "..
										"<br>"..Loc[Config.Lan]["repair"].clutch..": "..math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "clutch")).."%<br>"..nosBar(math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "clutch"))).." "..
										"<br>"..Loc[Config.Lan]["repair"].tank..": "..math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "fuel")).."%<br>"..nosBar(math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "fuel")))
									end

									dist = dist..
									"<br><br><b>Upgrade Levels</b>:"..
									"<br>"..Loc[Config.Lan]["check"].label1.." Lvl "..(GetVehicleMod(veh, 11)+1)..
									"<br>"..Loc[Config.Lan]["check"].label2.." Lvl "..(GetVehicleMod(veh, 12)+1)..
									"<br>"..Loc[Config.Lan]["check"].label3.." Lvl "..(GetVehicleMod(veh, 15)+1)..
									"<br>"..Loc[Config.Lan]["check"].label4.." Lvl "..(GetVehicleMod(veh, 13)+1)..
									"<br>"..Loc[Config.Lan]["check"].label5.." Lvl "..(GetVehicleMod(veh, 16)+1)..
									"<br>"..Loc[Config.Lan]["check"].label6.." "..tostring(IsToggleModOn(veh, 18))..
									"<br>"..Loc[Config.Lan]["check"].label7.." "..tostring(IsToggleModOn(veh, 22))..
									"<br>"..Loc[Config.Lan]["check"].label8.." "..tostring(GetDriftTyresEnabled(veh))..
									"<br>"..Loc[Config.Lan]["check"].label9.." "..tostring(GetVehicleTyresCanBurst(veh))
								end
								if not ShowingOdo then TriggerEvent("jim-mechanic:client:DrawText", dist, tostring(Config.OdoLocation)) ShowingOdo = true
								else TriggerEvent("jim-mechanic:client:DrawText", dist, tostring(Config.OdoLocation)) end
							end
						end
						--Hide if it was enabled, but not now
						if not ShowOdo and ShowingOdo then ShowingOdo = false TriggerEvent("jim-mechanic:client:HideText") end
						DistAdd = DistAdd + #(prevLoc - GetEntityCoords(veh))
						DistCount = DistCount + 1
						if DistCount >= 6 then
							if owned then
								if useMechJob() then
									if DoesEntityExist(veh) then
										local mechDamages = {
											["radiator"] = (math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "radiator"))+0.0 or 100),
											["axle"] = (math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "axle"))+0.0 or 100),
											["brakes"] = (math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "brakes"))+0.0 or 100),
											["clutch"] = (math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "clutch"))+0.0 or 100),
											["fuel"] = (math.floor(exports['qb-mechanicjob']:GetVehicleStatus(plate, "fuel"))+0.0 or 100),
										}
										TriggerServerEvent('jim-mechanic:server:saveStatus', mechDamages, plate)
									end
								end
								TriggerServerEvent('jim-mechanic:server:UpdateDrivingDistance', plate, math.round(DistAdd)) end
							DistCount = 0
							DistAdd = 0
						end
					end
				end
			end
		else TriggerEvent("jim-mechanic:client:HideText") if ShowingOdo then ShowingOdo = false DistCount = 0 end
		end
		Wait(500)
	end
end)

RegisterNetEvent("jim-mechanic:ShowOdo", function() print("^3ShowOdo^7: ^2Odometer toggled^7") ShowOdo = not ShowOdo end)