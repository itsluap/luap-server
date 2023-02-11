--[[
	
local QBCore = exports['indigo-core']:GetCoreObject()

local Strepper = {}
local Targets = {}

if Config.MLO == "gabz" then
	PedList = {
		vector4(117.69, -1295.76, 29.27, 319.17),
		vector4(107.71, -1291.65, 29.25, 214.09),
		vector4(108.7, -1282.8, 28.26, 208.82),
		vector4(114.02, -1291.89, 28.26, 28.57),
		vector4(123.99, -1289.42, 30.38, 200.33),
		vector4(119.23, -1283.81, 28.26, 123.1),
		vector4(113.24, -1304.33, 29.29, 351.54),
		vector4(112.27, -1302.71, 29.29, 255.14),
		vector4(117.99, -1299.24, 29.27, 125.51),
	}
else
	PedList = {
		vector4(115.96, -1299.53, 29.02, 302.23),
		vector4(117.34, -1292.64, 28.26, 29.26),
		vector4(117.69, -1295.76, 29.27, 319.17),
		vector4(110.23, -1289.44, 28.86, 237.82),
		vector4(106.68, -1289.48, 28.86, 32.73),
		vector4(108.7, -1282.8, 28.26, 208.82),
		vector4(114.02, -1291.89, 28.26, 28.57),
		vector4(123.99, -1289.42, 30.38, 200.33),
		vector4(119.23, -1283.81, 28.26, 123.1),
	}
end
CreateThread(function()
	for k, v in pairs(PedList) do
		local rand = math.random(1,3)
		Strepper[#Strepper+1] = makePed(`CSB_Stripper_02`, v, true, true, nil, { "mini@strip_club@private_dance@part"..rand, "priv_dance_p"..rand })
		Targets["Strep"..k] =
			exports['indigo-target']:AddBoxZone("Strep"..k, vector3(v.x, v.y, v.z-0.3), 0.8, 0.8, { name="Strep"..k, heading = v.w, debugPoly=Config.Debug, minZ = v.z-1.0, maxZ=v.z+1.0 },
				{ options = { { event = "jim-vanillaunicorn:PayStrep", icon = "fas fa-money-bill-1-wave", label = Loc[Config.Lan].info["tip"]..Config.TipCost, ped = Strepper[#Strepper] }, },
				distance = 1.5 })
		Wait(1500)
	end
end)

RegisterNetEvent("jim-vanillaunicorn:PayStrep", function(data)
	local p = promise.new()	QBCore.Functions.TriggerCallback("jim-vanillaunicorn:GetCash", function(cb) p:resolve(cb) end)
	if Citizen.Await(p) >= Config.TipCost then TriggerServerEvent("jim-vanillaunicorn:StrepTip")
	else triggerNotify(nil, "Not Enough Cash", "error") return end
	--Spawn money and hand to ped
	loadAnimDict("mp_common")
	loadModel(`prop_anim_cash_note`)
	if prop == nil then prop = CreateObject(`prop_anim_cash_note`, 0.0, 0.0, 0.0, true, false, false) end
	AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.1, -0.0, 0.0, -180.0, 0.0, 0.0, true, true, false, true, 1, true)
	TaskPlayAnim(data.ped, "mp_common", "givetake2_b", 3.0, 3.0, 0.3, 16, 0.2, 0, 0, 0)
	TaskPlayAnim(PlayerPedId(), "mp_common", "givetake2_a", 3.0, 3.0, -1, 16, 0.1, 0, 0, 0)
	--Take Money and stop animiation
	Wait(1000)
	AttachEntityToEntity(prop, data.ped, GetPedBoneIndex(v, 57005), 0.1, -0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
	Wait(1000)
	StopAnimTask(PlayerPedId(), "mp_common", "givetake2_b", 1.0)
	StopAnimTask(data.ped, "mp_common", "givetake2_a", 1.0)
	destroyProp(prop) unloadModel(`prop_anim_cash_note`)
	unloadAnimDict("mp_common")
	prop = nil
	CreateThread(function()
		FreezeEntityPosition(data.ped, false)
		if not IsPedHeadingTowardsPosition(data.ped, GetEntityCoords(PlayerPedId()), 20.0) then TaskTurnPedToFaceCoord(data.ped, GetEntityCoords(PlayerPedId()), 1500) Wait(1600) end
		--Blow kiss
		loadAnimDict("anim@mp_player_intselfieblow_kiss")
		TaskPlayAnim(data.ped, "anim@mp_player_intselfieblow_kiss", "exit", 3.0, 3.0, -1, 16, 0.1, 0, 0, 0)
		Wait(3000)
		--Relieve stress and heal 2hp
		TriggerServerEvent('hud:server:RelieveStress', Config.TipStress)
		unloadAnimDict("anim@mp_player_intselfieblow_kiss")
		local rand = math.random(1,3)
		loadAnimDict("mini@strip_club@private_dance@part"..rand)
		TaskPlayAnim(data.ped, "mini@strip_club@private_dance@part"..rand, "priv_dance_p"..rand, 1.0, 1.0, -1, 1, 0.2, 0, 0, 0)
		FreezeEntityPosition(data.ped, true)
	end)
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Targets) do exports["indigo-target"]:RemoveZone(k) end
	for _, v in pairs(Strepper) do DeleteEntity(v) end
end)

]]--