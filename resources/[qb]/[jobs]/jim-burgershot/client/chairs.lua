local QBCore = exports['qb-core']:GetCoreObject()

local burgerseat = 0
local sitting = false
local Chairs = {}

CreateThread(function()
	for k, v in pairs(Config.Chairs) do
		Chairs["BurgerChair"..k] =
		exports['qb-target']:AddBoxZone("BurgerChair"..k, v.coords.xyz, 0.7, 0.7, { name="BurgerChair"..k, heading = v.coords.w, debugPoly=Config.Debug, minZ = v.coords.z-1.2, maxZ = v.coords.z+0.1, },
			{ options = { { event = "jim-burgershot:Chair", icon = "fas fa-chair", label = Loc[Config.Lan].info["Sit Down"], loc = v.coords, stand = v.stand }, },
				distance = 2.2
		})
	end
end)

RegisterNetEvent('jim-burgershot:Chair', function(data)
	local canSit = true
	local sitting = false
	local ped = PlayerPedId()
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz)
		if dist <= 0.4 then triggerNotify(nil, Loc[Config.Lan].error["someone_sitting"]) canSit = false end
	end
	if canSit then
		if not IsPedHeadingTowardsPosition(ped, data.loc.xyz, 20.0) then TaskTurnPedToFaceCoord(ped, data.loc.xyz, 1500) Wait(1500)	end
		if #(data.loc.xyz - GetEntityCoords(PlayerPedId())) > 1.5 then TaskGoStraightToCoord(ped, data.loc.xyz, 0.5, 1000, 0.0, 0) Wait(1100) end
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.loc[4], 0, 1, true)
		burgerseat = data.stand
		sitting = true
	end
	while sitting do
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				if burgerseat then SetEntityCoords(ped, burgerseat) end
				burgerseat = nil
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

if Config.MLO == "LP" then
	Config.Chairs = {
		--SmallTable1
		{ coords = vector4(-1191.32, -891.24, 14.0, 214.93), stand = vector3(-1191.65, -890.75, 14.0-0.5) },
		{ coords = vector4(-1190.44, -892.65, 14.0, 34.93), stand = vector3(-1190.89, -893.02, 14.0-0.5) },
		--Smalltable2
		{ coords = vector4(-1193.86, -887.51, 14.0, 214.93), stand = vector3(-1194.38, -887.82, 14.0-0.5) },
		{ coords = vector4(-1192.97, -889.0, 14.0, 34.93), stand = vector3(-1192.49, -889.4, 14.0-0.5) },
		--SmallTable3
		{ coords = vector4(-1187.51, -888.73, 14.0, 214.93), stand = vector3(-1187.85, -888.24, 14.0-0.5) },
		{ coords = vector4(-1186.63, -890.1, 14.0, 34.93), stand = vector3(-1185.97, -889.8, 14.0-0.5) },
		--Smalltable4
		{ coords = vector4(-1190.06, -884.95, 14.0, 214.93), stand = vector3(-1189.67, -884.61, 14.0-0.5) },
		{ coords = vector4(-1189.12, -886.41, 14.0, 34.93), stand = vector3(-1188.73, -886.86, 14.0-0.5) },
		--Booth1
		{ coords = vector4(-1187.39, -895.65, 14.0, 303.93), stand = vector3(-1188.34, -894.03, 14.0-0.5) },
		{ coords = vector4(-1187.91, -894.88, 14.0, 303.93), stand = vector3(-1188.34, -894.03, 14.0-0.5) },
		{ coords = vector4(-1185.64, -894.48, 14.0, 123.93), stand = vector3(-1186.77, -892.9, 14.0-0.5) },
		{ coords = vector4(-1186.16, -893.7, 14.0, 123.93), stand = vector3(-1186.77, -892.9, 14.0-0.5) },
		--Booth2
		{ coords = vector4(-1184.9, -893.89, 14.0, 303.93), stand = vector3(-1185.8, -892.47, 14.0-0.5) },
		{ coords = vector4(-1185.41, -893.14, 14.0, 303.93), stand = vector3(-1185.8, -892.47, 14.0-0.5) },
		{ coords = vector4(-1183.13, -892.76, 14.0, 123.93), stand = vector3(-1184.04, -891.36, 14.0-0.5) },
		{ coords = vector4(-1183.61, -892.02, 14.0, 123.93), stand = vector3(-1184.04, -891.36, 14.0-0.5) },
		--Cornerbooth1
		{ coords = vector4(-1181.43, -891.74, 14.0, 34.93), stand = vector3(-1183.24, -890.69, 14.0-0.5) },
		{ coords = vector4(-1181.04, -889.98, 14.0, 123.93), stand = vector3(-1183.24, -890.69, 14.0-0.5) },
		--booth3
		{ coords = vector4(-1182.08, -888.7, 14.0, 34.93), stand = vector3(-1183.48, -889.61, 14.0-0.5) },
		{ coords = vector4(-1182.79, -889.18, 14.0, 34.93), stand = vector3(-1183.48, -889.61, 14.0-0.5) },
		{ coords = vector4(-1183.2, -886.9, 14.0, 214.93), stand = vector3(-1184.52, -888.0, 14.0-0.5) },
		{ coords = vector4(-1183.99, -887.45, 14.0, 214.93), stand = vector3(-1184.52, -888.0, 14.0-0.5) },
		--booth4
		{ coords = vector4(-1185.99, -882.97, 14.0, 34.93), stand = vector3(-1187.37, -883.84, 14.0-0.5) },
		{ coords = vector4(-1186.73, -883.47, 14.0, 34.93), stand = vector3(-1187.37, -883.84, 14.0-0.5) },
		{ coords = vector4(-1187.11, -881.18, 14.0, 214.93), stand = vector3(-1188.39, -882.17, 14.0-0.5) },
		{ coords = vector4(-1187.88, -881.7, 14.0, 214.93), stand = vector3(-1188.39, -882.17, 14.0-0.5) },
		--Cornerbooth2
		{ coords = vector4(-1187.91, -879.92, 14.0, 123.93), stand = vector3(-1189.22, -881.7, 14.0-0.5) },
		{ coords = vector4(-1189.74, -879.53, 14.0, 214.93), stand = vector3(-1189.22, -881.7, 14.0-0.5) },
		--Booth5
		{ coords = vector4 (-1191.23, -880.75, 14.0, 123.93), stand = vector3(-1190.4, -882.07, 14.0-0.5) },
		{ coords = vector4(-1190.7, -881.54, 14.0, 123.93), stand = vector3(-1190.4, -882.07, 14.0-0.5) },
		{ coords = vector4(-1192.99, -881.91, 14.0, 303.93), stand = vector3(-1191.92, -883.21, 14.0-0.5) },
		{ coords = vector4(-1192.52, -882.59, 14.0, 303.93), stand = vector3(-1191.92, -883.21, 14.0-0.5) },
		--Booth6
		{ coords = vector4(-1193.8, -882.39, 14.0, 123.93), stand = vector3(-1192.95, -883.87, 14.0-0.5) },
		{ coords = vector4(-1193.24, -883.23, 14.0, 123.93), stand = vector3(-1192.95, -883.87, 14.0-0.5) },
		{ coords = vector4(-1195.5, -883.64, 14.0, 303.93), stand = vector3(-1194.53, -884.97, 14.0-0.5) },
		{ coords = vector4(-1195.02, -884.35, 14.0, 303.93), stand = vector3(-1194.53, -884.97, 14.0-0.5) },

		--MiddleBooth1
		{ coords = vector4(-1189.56, -891.83, 14.0, 303.93), stand = vector3(-1188.1, -891.89, 14.0-0.5) },
		{ coords = vector4(-1189.23, -890.37, 14.0, 214.93), stand = vector3(-1188.1, -891.89, 14.0-0.5) },
		{ coords = vector4(-1187.71, -890.57, 14.0, 123.93), stand = vector3(-1188.1, -891.89, 14.0-0.5) },

		--MiddleBooth2
		{ coords = vector4(-1192.64, -887.25, 14.0, 303.93), stand = vector3(-1192.24, -885.9, 14.0-0.5) },
		{ coords = vector4(-1191.29, -887.3, 14.0, 34.93), stand = vector3(-1192.24, -885.9, 14.0-0.5) },
		{ coords = vector4(-1190.76, -886.03, 14.0, 123.93), stand = vector3(-1192.24, -885.9, 14.0-0.5) },

		--Bench
		{ coords = vector4(-1194.89, -878.21, 13.5, 33.0), },
		{ coords = vector4(-1195.5, -878.58, 13.5, 33.0), },
		{ coords = vector4(-1196.11, -878.99, 13.45, 33.0), },
}
elseif Config.MLO == "GN" then
	Config.Chairs = {
		--==STORE FRONT==--

		--LEFTSIDE--
		--Booth 1
		{ coords = vector4(-1188.96, -896.61, 14.0, 303.93), stand = vector3(-1189.77, -895.49, 13.97-0.5) },

		{ coords = vector4(-1187.62, -895.83, 14.0, 123.93), stand = vector3(-1188.5, -894.65, 13.97-0.5) },
		{ coords = vector4(-1188.03, -895.21, 14.0, 123.93), stand = vector3(-1188.5, -894.65, 13.97-0.5) },

		--Booth 2
		{ coords = vector4(-1186.99, -895.38, 14.0, 303.93), stand = vector3(-1187.8, -894.21, 13.97-0.5) },
		{ coords = vector4(-1187.44, -894.72, 14.0, 303.93), stand = vector3(-1187.8, -894.21, 13.97-0.5) },
		{ coords = vector4(-1185.69, -894.59, 14.0, 123.93), stand = vector3(-1186.57, -893.4, 13.98-0.5) },
		{ coords = vector4(-1186.16, -893.88, 14.0, 123.93), stand = vector3(-1186.57, -893.4, 13.98-0.5) },

		--Booth 3
		{ coords = vector4(-1185.11, -894.13, 14.0, 303.93), stand = vector3(-1185.91, -892.94, 13.97-0.5) },
		{ coords = vector4(-1185.6, -893.44, 14.0, 303.93), stand = vector3(-1185.91, -892.94, 13.97-0.5) },
		{ coords = vector4(-1183.73, -893.26, 14.0, 123.93), stand = vector3(-1184.61, -892.06, 13.97-0.5) },
		{ coords = vector4(-1184.29, -892.62, 14.0, 123.93), stand = vector3(-1184.61, -892.06, 13.97-0.5) },

		--Left-Middle
		--Booth 4
		{ coords = vector4(-1186.67, -888.9, 14.0, 123.93), stand = vector3(-1185.86, -890.09, 13.97-0.5) },
		{ coords = vector4(-1186.23, -889.63, 14.0, 123.93), stand = vector3(-1185.86, -890.09, 13.97-0.5) },
		{ coords = vector4(-1188.04, -889.74, 14.0, 303.93), stand = vector3(-1187.07, -890.97, 13.97-0.5) },
		{ coords = vector4(-1187.56, -890.45, 14.0, 303.93), stand = vector3(-1187.07, -890.97, 13.97-0.5) },

		--Booth 5
		{ coords = vector4(-1188.65, -890.26, 14.0, 123.93), stand = vector3(-1187.88, -891.52, 13.97-0.5) },
		{ coords = vector4(-1188.18, -891.0, 14.0, 123.93), stand = vector3(-1187.88, -891.52, 13.97-0.5) },
		{ coords = vector4(-1189.99, -891.06, 14.0, 303.93), stand = vector3(-1189.01, -892.38, 13.97-0.5) },
		{ coords = vector4(-1189.49, -891.82, 14.0, 303.93), stand = vector3(-1189.01, -892.38, 13.97-0.5) },

		--FRONT--
		--Booth 6
		{ coords = vector4(-1183.04, -892.7, 14.0, 34.93), stand = vector3(-1181.82, -891.74, 13.97-0.5) },
		{ coords = vector4(-1182.37, -892.25, 14.0, 34.93), stand = vector3(-1181.82, -891.74, 13.97-0.5) },
		{ coords = vector4(-1183.88, -891.35, 14.0, 214.93), stand = vector3(-1182.55, -890.72, 13.97-0.5) },
		{ coords = vector4(-1183.22, -890.92, 14.0, 214.93), stand = vector3(-1182.55, -890.72, 13.97-0.5) },

		--Booth 7
		{ coords = vector4(-1184.37, -890.72, 14.0, 34.93), stand = vector3(-1183.1, -889.8, 13.97-0.5) },
		{ coords = vector4(-1183.68, -890.23, 14.0, 34.93), stand = vector3(-1183.1, -889.8, 13.97-0.5) },
		{ coords = vector4(-1185.23, -889.35, 14.0, 214.93), stand = vector3(-1183.97, -888.61, 13.97-0.5) },
		{ coords = vector4(-1184.52, -888.88, 14.0, 214.93), stand = vector3(-1183.97, -888.61, 13.97-0.5) },

		--Booth 8
		{ coords = vector4(-1186.11, -882.36, 14.0, 34.93), stand = vector3(-1187.3, -883.19, 13.97-0.5) },
		{ coords = vector4(-1186.88, -882.85, 14.0, 34.93), stand = vector3(-1187.3, -883.19, 13.97-0.5) },
		{ coords = vector4(-1186.97, -881.03, 14.0, 214.93), stand = vector3(-1188.21, -882.02, 13.97-0.5) },
		{ coords = vector4(-1187.79, -881.52, 14.0, 214.93), stand = vector3(-1188.21, -882.02, 13.97-0.5) },

		--Corner Booth
		{ coords = vector4(-1188.12, -879.48, 14.0, 123.93), stand = vector3(-1189.01, -880.78, 13.97-0.5) },
		{ coords = vector4(-1189.27, -879.22, 14.0, 214.93), stand = vector3(-1189.01, -880.78, 13.97-0.5) },

		--STOOLS
		{ coords = vector4(-1183.33, -887.32, 14.27, 306.11), stand = vector3(-1183.53, -887.58, 13.97-0.5) },
		{ coords = vector4(-1182.56, -888.32, 14.27, 306.11), stand = vector3(-1182.88, -888.49, 13.97-0.5) },
		{ coords = vector4(-1181.85, -889.39, 14.27, 306.11), stand = vector3(-1182.09, -889.55, 13.97-0.5) },
		{ coords = vector4(-1181.27, -890.08, 14.27, 306.11), stand = vector3(-1181.54, -890.23, 13.97-0.5) },
		{ coords = vector4(-1180.68, -891.02, 14.27, 306.11), stand = vector3(-1180.95, -891.22, 13.97-0.5) },

		--RIGHTSIDE--
		--Booth 9
		{ coords = vector4(-1190.79, -880.32, 14.0, 123.93), stand = vector3(-1190.02, -881.45, 13.97-0.5) },
		{ coords = vector4(-1190.4, -880.99, 14.0, 123.93), stand = vector3(-1190.02, -881.45, 13.97-0.5) },
		{ coords = vector4(-1192.21, -881.16, 14.0, 303.93), stand = vector3(-1191.24, -882.33, 13.97-0.5) },
		{ coords = vector4(-1191.78, -881.78, 14.0, 303.93), stand = vector3(-1191.24, -882.33, 13.97-0.5) },

		--Booth 10
		{ coords = vector4(-1192.87, -881.6, 14.0, 123.93), stand = vector3(-1192.05, -882.95, 13.97-0.5) },
		{ coords = vector4(-1192.37, -882.33, 14.0, 123.93), stand = vector3(-1192.05, -882.95, 13.97-0.5) },
		{ coords = vector4(-1194.25, -882.5, 14.0, 303.93), stand = vector3(-1193.34, -883.7, 13.97-0.5) },
		{ coords = vector4(-1193.75, -883.14, 14.0, 303.93), stand = vector3(-1193.34, -883.7, 13.97-0.5) },

		--Booth 11
		{ coords = vector4(-1189.05, -885.43, 14.0, 123.93), stand = vector3(-1190.02, -884.14, 13.97-0.5) },
		{ coords = vector4(-1189.53, -884.74, 14.0, 123.93), stand = vector3(-1190.02, -884.14, 13.97-0.5) },
		{ coords = vector4(-1190.41, -886.25, 14.0, 303.93), stand = vector3(-1191.17, -885.03, 13.97-0.5) },
		{ coords = vector4(-1190.83, -885.54, 14.0, 303.93), stand = vector3(-1191.17, -885.03, 13.97-0.5) },

		--Booth 12
		{ coords = vector4(-1190.99, -886.75, 14.0, 123.93), stand = vector3(-1192.01, -885.49, 13.97-0.5) },
		{ coords = vector4(-1191.47, -886.11, 14.0, 123.93), stand = vector3(-1192.01, -885.49, 13.97-0.5) },
		{ coords = vector4(-1192.44, -887.62, 14.0, 303.93), stand = vector3(-1193.19, -886.37, 13.97-0.5) },
		{ coords = vector4(-1192.86, -886.87, 14.0, 303.93), stand = vector3(-1193.19, -886.37, 13.97-0.5) },

		--==Back Office==--
		--Changing room seats
		{ coords = vector4(-1185.59, -900.64, 14.0, 123.93), },
		{ coords = vector4(-1184.95, -901.57, 14.0, 123.93), },
		{ coords = vector4(-1186.66, -902.6, 14.0, 303.93), },
		{ coords = vector4(-1187.35, -901.7, 14.0, 303.93), },

		{ coords = vector4(-1177.66, -896.3, 14.0, 99.0), },
		{ coords = vector4(-1180.18, -897.13, 14.0, 295.93), },
		{ coords = vector4(-1179.53, -898.17, 14.0, 312.93), },

		--Bench
		{ coords = vector4(-1194.89, -878.21, 13.5, 33.0), },
		{ coords = vector4(-1195.5, -878.58, 13.5, 33.0), },
		{ coords = vector4(-1196.11, -878.99, 13.45, 33.0), },
}
elseif Config.MLO == "NP" then
	Config.Chairs = {
		--SmallTable1
		{ coords = vector4(-1191.25, -891.33, 14.0, 214.93), stand = vector3(-1191.83, -891.82, 13.98-0.5) },
		{ coords = vector4(-1190.36, -892.63, 14.0, 34.93), stand = vector3(-1190.91, -893.14, 13.98-0.5) },
		--SmallTable2
		{ coords = vector4(-1193.85, -887.46, 14.0, 214.93), stand = vector3(-1194.67, -888.12, 13.98-0.5) },
		{ coords = vector4(-1193.0, -888.8, 14.0, 34.93), stand = vector3(-1193.62, -889.33, 13.98-0.5) },
		--CornerBooth1
		{ coords = vector4(-1191.04, -896.8, 14.0, 303.93), stand = vector3(-1191.0, -895.71, 13.98-0.5) },
		{ coords = vector4(-1189.47, -897.17, 14.0, 34.93), stand = vector3(-1189.12, -896.01, 13.98-0.5) },
		--CornerBooth2
		{ coords = vector4(-1181.38, -891.65, 14.0, 34.93), stand = vector3(-1182.49, -891.56, 13.98-0.5) },
		{ coords = vector4(-1181.06, -889.98, 14.0, 123.93), stand = vector3(-1183.03, -890.33, 13.98-0.5) },
		--CornerBooth3
		{ coords = vector4(-1188.0, -879.83, 14.0, 123.93), stand = vector3(-1189.03, -881.45, 13.98-0.5) },
		{ coords = vector4(-1189.62, -879.46, 14.0, 214.93), stand = vector3(-1189.99, -880.47, 13.98-0.5) },
		--Booth1
		{ coords = vector4(-1187.38, -895.64, 14.0, 303.93), stand = vector3(-1188.25, -894.1, 13.98-0.5) },
		{ coords = vector4(-1187.93, -894.82, 14.0, 303.93), stand = vector3(-1188.25, -894.1, 13.98-0.5) },
		{ coords = vector4(-1185.63, -894.43, 14.0, 123.93), stand = vector3(-1186.71, -893.04, 13.98-0.5) },
		{ coords = vector4(-1186.15, -893.68, 14.0, 123.93), stand = vector3(-1186.71, -893.04, 13.98-0.5) },
		--Booth2
		{ coords = vector4(-1184.85, -893.91, 14.0, 303.93), stand = vector3(-1185.85, -892.4, 13.98-0.5) },
		{ coords = vector4(-1185.42, -893.08, 14.0, 303.93), stand = vector3(-1185.85, -892.4, 13.98-0.5) },
		{ coords = vector4(-1183.37, -892.92, 14.0, 123.93), stand = vector3(-1184.3, -891.59, 13.98-0.5) },
		{ coords = vector4(-1183.89, -892.17, 14.0, 123.93), stand = vector3(-1184.3, -891.59, 13.98-0.5) },
		--Booth3
		{ coords = vector4(-1195.56, -883.53, 14.0, 303.93), stand = vector3(-1194.56, -884.97, 13.98-0.5) },
		{ coords = vector4(-1195.01, -884.33, 14.0, 303.93), stand = vector3(-1194.56, -884.97, 13.98-0.5) },
		{ coords = vector4(-1193.75, -882.38, 14.0, 123.93), stand = vector3(-1192.88, -883.66, 13.98-0.5) },
		{ coords = vector4(-1193.22, -883.16, 14.0, 123.93), stand = vector3(-1192.88, -883.66, 13.98-0.5) },
		--Booth4
		{ coords = vector4(-1193.04, -881.83, 14.0, 303.93), stand = vector3(-1191.94, -883.4, 13.98-0.5) },
		{ coords = vector4(-1192.49, -882.64, 14.0, 303.93), stand = vector3(-1191.94, -883.4, 13.98-0.5) },
		{ coords = vector4(-1191.51, -880.84, 14.0, 123.93), stand = vector3(-1190.61, -882.17, 13.98-0.5) },
		{ coords = vector4(-1190.92, -881.71, 14.0, 123.93), stand = vector3(-1190.61, -882.17, 13.98-0.5) },
		--Booth5
		{ coords = vector4(-1182.0, -888.74, 14.0, 34.93), stand = vector3(-1183.36, -889.72, 13.98-0.5) },
		{ coords = vector4(-1182.89, -889.31, 14.0, 34.93), stand = vector3(-1183.36, -889.72, 13.98-0.5) },
		{ coords = vector4(-1183.29, -886.84, 14.0, 214.93), stand = vector3(-1184.63, -887.75, 13.98-0.5) },
		{ coords = vector4(-1184.05, -887.36, 14.0, 214.93), stand = vector3(-1184.63, -887.75, 13.98-0.5) },
		--Booth6
		{ coords = vector4(-1185.96, -882.98, 14.0, 34.93), stand = vector3(-1187.36, -883.96, 13.98-0.5) },
		{ coords = vector4(-1186.81, -883.52, 14.0, 34.93), stand = vector3(-1187.36, -883.96, 13.98-0.5) },
		{ coords = vector4(-1187.16, -881.11, 14.0, 214.93), stand = vector3(-1188.56, -882.22, 13.98-0.5) },
		{ coords = vector4(-1187.94, -881.63, 14.0, 214.93), stand = vector3(-1188.56, -882.22, 13.98-0.5) },
		--MiddleBooth1
		{ coords = vector4(-1189.42, -892.16, 14.0, 303.93), stand = vector3(-1187.96, -892.12, 14.0-0.5) },
		{ coords = vector4(-1189.16, -890.47, 14.0, 214.93), stand = vector3(-1187.96, -892.12, 14.0-0.5) },
		{ coords = vector4(-1187.46, -890.76, 14.0, 123.93), stand = vector3(-1187.96, -892.12, 14.0-0.5) },
		--MiddleBooth2
		{ coords = vector4(-1192.96, -886.88, 14.0, 303.93), stand = vector3(-1192.47, -885.5, 14.0-0.5) },
		{ coords = vector4(-1191.34, -887.1, 14.0, 34.93), stand = vector3(-1192.47, -885.5, 14.0-0.5) },
		{ coords = vector4(-1190.99, -885.51, 14.0, 123.93), stand = vector3(-1192.47, -885.5, 14.0-0.5) },

		--Staffroom
		{ coords = vector4(-1188.91, -903.83, 14.0, 332.4), },
		{ coords = vector4(-1187.34, -904.61, 14.0, 82.52), },
		{ coords = vector4(-1184.6, -903.65, 14.0, 34.93), },
		{ coords = vector4(-1185.33, -904.22, 14.0, 34.93), },
		{ coords = vector4(-1186.66, -899.24, 14.0, 201.0), },
		{ coords = vector4(-1187.9, -901.6, 14.0, 304.83), },
		{ coords = vector4(-1188.56, -900.59, 14.0, 284.82), },

		{ coords = vector4(-1183.29, -898.81, 14.0, 103.46), stand = vector3(-1183.77, -898.27, 13.98-0.5) },

		{ coords = vector4(-1176.72, -898.59, 14.0, 34.93), },
		{ coords = vector4(-1177.56, -899.16, 14.0, 34.93), },
		{ coords = vector4(-1179.8, -896.45, 14.0, 294.05), stand = vector3(-1179.8, -895.67, 13.98-0.5) },
		{ coords = vector4(-1178.99, -897.57, 14.0, 322.76), stand = vector3(-1179.8, -895.67, 13.98-0.5) },
		{ coords = vector4(-1177.32, -895.85, 14.0, 123.93), stand = vector3(-1177.91, -895.01, 13.98-0.5) },

		--Bench
		{ coords = vector4(-1194.89, -878.21, 13.5, 33.0), },
		{ coords = vector4(-1195.5, -878.58, 13.5, 33.0), },
		{ coords = vector4(-1196.11, -878.99, 13.45, 33.0), },
	}
end

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Chairs) do exports['qb-target']:RemoveZone(k) end
end)