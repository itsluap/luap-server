local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}
isLoggedIn = false
local onDuty = false
local Targets = {}
local Props = {}

local function jobCheck()
	canDo = true
	if not onDuty then triggerNotify(nil, Loc[Config.Lan].error["not_cloked_in"], 'error') canDo = false end
	return canDo
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then if PlayerData.job.name == "burgershot" then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
	isLoggedIn = true
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	QBCore.Functions.GetPlayerData(function(PlayerData)	PlayerJob = PlayerData.job if PlayerData.job.name == "burgershot" then onDuty = PlayerJob.onduty end end)
end)

CreateThread(function()
	local bossroles = {}
	for grade in pairs(QBCore.Shared.Jobs["burgershot"].grades) do
		if QBCore.Shared.Jobs["burgershot"].grades[grade].isboss == true then
			if bossroles["burgershot"] ~= nil then
				if bossroles["burgershot"] > tonumber(grade) then bossroles["burgershot"] = tonumber(grade) end
			else bossroles["burgershot"] = tonumber(grade)	end
		end
	end
	for k, v in pairs(Config.Locations) do
		if v.zoneEnable then
			JobLocation = PolyZone:Create(v.zones, { name = v.label, debugPoly = Config.Debug })
			JobLocation:onPlayerInOut(function(isPointInside) if not isPointInside and onDuty and PlayerJob.name == v.job then TriggerServerEvent("QBCore:ToggleDuty") end end)

			makeBlip({coords = v.blip, sprite = 106, col = v.blipcolor, scale = 0.7, disp = 6, name = v.label})
		end
	end
	if Config.MLO == "GN" then
		if not Props["tray1"] then Props["tray1"] = makeProp({prop = `prop_food_bs_tray_02`, coords = vector4(-1193.36, -895.44, 14.1+1.03, 305.0)}, 1, 0) end
		if not Props["tray2"] then Props["tray2"] = makeProp({prop = `prop_food_bs_tray_01`, coords = vector4(-1194.52, -893.83, 14.1+1.03, 305.0)}, 1, 0) end
		if not Props["tray3"] then Props["tray3"] = makeProp({prop = `prop_food_bs_tray_01`, coords = vector4(-1192.41, -896.84, 14.1+1.03, 305.0)}, 1, 0) end

		if not Props["bag"] then Props["bag"] = makeProp({prop = `prop_food_bs_bag_04`, coords = vector4(-1196.68, -902.19, 13.9+1.03, 180.0)}, 1, 0) end
		if not Props["bag2"] then Props["bag2"] = makeProp({prop = `prop_food_bs_bag_04`, coords = vector4(-1196.31, -901.9, 13.9+1.03, 180.0)}, 1, 0) end
		if not Props["bag3"] then Props["bag3"] = makeProp({prop = `prop_food_bs_bag_04`, coords = vector4(-1196.5, -902.09, 13.9+1.03, 300.0)}, 1, 0) end

		--Targets
		--Stash/Shops
		Targets["BShelf"] =
		exports['qb-target']:AddBoxZone("BShelf", vector3(-1195.29, -897.51, 13.97), 3.0, 1.0, { name="BShelf", heading = 35.0, debugPoly=Config.Debug, minZ = 13.7, maxZ = 14.77, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_shelves"], job = "burgershot", id = "Shelf" }, },
				distance = 2.0 })
		Targets["BFridge"] =
		exports['qb-target']:AddBoxZone("BFridge", vector3(-1201.31, -901.69, 13.97), 3.8, 0.6, { name="BFridge", heading = 35.0, debugPoly=Config.Debug, minZ = 13.0, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_fridge"], job = "burgershot", id = "Fridge" }, },
				distance = 1.5 })
		Targets["BStore"] =
		exports['qb-target']:AddBoxZone("BStore", vector3(-1198.5, -904.02, 13.97), 0.4, 1.4, { name="BStore", heading = 213.65, debugPoly=Config.Debug, minZ = 12.97, maxZ = 15.37, },
			{ options = { { event = "jim-burgershot:shop", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_storage"], job = "burgershot" }, },
				distance = 1.5 })
		Targets["BBag"] =
		exports['qb-target']:AddBoxZone("BBag", vector3(-1196.52, -902.07, 13.97), 0.7, 0.5, { name="BBag", heading = 305.0, debugPoly=Config.Debug, minZ = 12.97, maxZ = 14.57, },
			{ options = { { event = "jim-burgershot:client:GrabBag", icon = "fas fa-bag-shopping", label = Loc[Config.Lan].targetinfo["grab_murderbag"], job = "burgershot", }, },
				distance = 2.0 })

		--Food Making
		Targets["BGrill"] =
		exports['qb-target']:AddBoxZone("BGrill", vector3(-1198.27, -895.3, 14.0), 0.7, 1.2, { name="BGrill", heading = 34.93, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-fire", label = Loc[Config.Lan].targetinfo["use_grill"], job = "burgershot", craftable = Crafting.Grill, header = Loc[Config.Lan].menu["grill"] }, },
				distance = 1.5 })
		Targets["BFryer"] =
		exports['qb-target']:AddBoxZone("BFryer", vector3(-1200.85, -896.84, 13.97), 0.6, 1.6, { name="BFryer", heading = 34.0, debugPoly=Config.Debug, minZ = 12.97, maxZ = 14.57, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].targetinfo["use_deepfryer"], job = "burgershot", craftable = Crafting.Fryer, header = Loc[Config.Lan].menu["deep_fat_fryer"] }, },
				distance = 1.5 })
		Targets["BChop"] =
		exports['qb-target']:AddBoxZone("BChop", vector3(-1197.19, -898.18, 14.0), 0.6, 1.5, { name="BChop", heading = 213.93, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-utensils", label = Loc[Config.Lan].targetinfo["use_chopping_board"], job = "burgershot", craftable = Crafting.ChopBoard, header = Loc[Config.Lan].menu["chopping_board"] }, },
				distance = 1.5 })
		Targets["BPrepare"] =
		exports['qb-target']:AddBoxZone("BPrepare", vector3(-1196.54, -899.28, 13.98), 0.6, 1.5, { name="BPrepare", heading = 34.93, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["prepare_food"], job = "burgershot", craftable = Crafting.Prepare, header = Loc[Config.Lan].menu["prepare_food"] }, },
				distance = 1.5 })
		Targets["BDrink"] =
		exports['qb-target']:AddBoxZone("BDrink", vector3(-1197.25, -894.48, 13.97), 2.0, 0.6, { name="BDrink", heading = 35.0, debugPoly=Config.Debug, minZ = 13.97, maxZ = 14.97, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_drinks"], job = "burgershot", craftable = Crafting.Drink, header = Loc[Config.Lan].menu["drinks_dispenser"] }, },
				distance = 1.5 })
		Targets["BDonut"] =
		exports['qb-target']:AddBoxZone("BDonut", vector3(-1196.52, -895.74, 13.97), 0.8, 0.6, { name="BDonut", heading = 35.0, debugPoly=Config.Debug, minZ = 13.97, maxZ = 15.17, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-dot-circle", label = Loc[Config.Lan].targetinfo["open_cabinet"], job = "burgershot", craftable = Crafting.Donut, header = Loc[Config.Lan].menu["food_cabinet"] }, },
				distance = 1.5 })

		--Trays
		Targets["BTray1"] =
		exports['qb-target']:AddBoxZone("BTray1", vector3(-1194.29, -893.85, 14.2), 0.6, 1.0, { name="BTray1", heading = 215.0, debugPoly=Config.Debug, minZ = 13.5, maxZ = 14.8, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], id = "Tray1" }, },
				distance = 2.0 })
		Targets["BTray2"] =
		exports['qb-target']:AddBoxZone("BTray2", vector3(-1193.39, -895.42, 14.2), 0.6, 1.0, { name="BTray2", heading = 215.0, debugPoly=Config.Debug, minZ = 13.5, maxZ = 14.8, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], id = "Tray2" }, },
				distance = 2.0 })
		Targets["BTray3"] =
		exports['qb-target']:AddBoxZone("BTray3", vector3(-1192.39, -896.86, 14.2), 0.6, 1.0, { name="BTray3", heading = 215.0, debugPoly=Config.Debug, minZ = 13.5, maxZ = 14.8, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], id = "Tray3" }, },
				distance = 2.0 })

		--Hand Washing
		Targets["BWash1"] =
		exports['qb-target']:AddBoxZone("BWash1", vector3(-1197.61, -902.73, 13.98), 0.6, 0.8, { name="BWash1", heading = 300.0, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })
		Targets["BWash2"] =
		exports['qb-target']:AddBoxZone("BWash2", vector3(-1205.24, -893.9, 13.98), 1.1, 0.8, { name="BWash2", heading = 122.65, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })
		Targets["BWash3"] =
		exports['qb-target']:AddBoxZone("BWash3", vector3(-1206.01, -892.84, 13.98), 0.6, 0.6, { name="BWash3", heading = 122.0, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })
		Targets["BWash4"] =
		exports['qb-target']:AddBoxZone("BWash4", vector3(-1201.96, -890.09, 13.98), 0.6, 0.6, { name="BWash4", heading = 122.0, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })
		Targets["BWash5"] =
		exports['qb-target']:AddBoxZone("BWash5", vector3(-1201.16, -891.14, 13.98), 0.6, 0.6, { name="BWash5", heading = 122.0, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })

		--Payments / Clockin
		Targets["BReceipt"] =
		exports['qb-target']:AddCircleZone("BReceipt", vector3(-1194.95, -893.15, 14.15), 0.5, { name="BReceipt", debugPoly=Config.Debug, useZ=true, },
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "burgershot",
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/bf/BurgerShot-HDLogo.svg width=225px></p>" }, },
				distance = 1.5 })
		Targets["BReceipt2"] =
		exports['qb-target']:AddCircleZone("BReceipt2", vector3(-1193.97, -894.67, 14.15), 0.5, { name="BReceipt2", debugPoly=Config.Debug, useZ=true, },
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "burgershot",
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/bf/BurgerShot-HDLogo.svg width=225px></p>" }, },
				distance = 1.5 })
		Targets["BReceipt3"] =
		exports['qb-target']:AddCircleZone("BReceipt3", vector3(-1192.93, -896.24, 14.15), 0.5, { name="BReceipt3", debugPoly=Config.Debug, useZ=true, },
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "burgershot",
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/bf/BurgerShot-HDLogo.svg width=225px></p>" }, },
				distance = 1.5 })
		Targets["BClockin"] =
		exports['qb-target']:AddBoxZone("BClockin", vector3(-1179.06, -896.32, 13.97), 0.6, 0.6, { name="BClockin", heading = 10.0, debugPoly=Config.Debug, minZ = 13.57, maxZ = 14.57, },
				{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = "burgershot" },
							{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
							}, distance = 2.0 })
	end
	if Config.MLO == "LP" then
		--CLEAR PROPS
		CreateModelHide(vector3(-1202.76, -889.01, 14.0), 1.5, -851111464, true)
		CreateModelHide(vector3(-1202.76, -889.01, 14.0), 1.5, -421145003, true)

		CreateModelHide(vector3(-1199.01, -890.5, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1196.95, -886.98, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1191.59, -882.02, 14.86), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1195.24, -890.98, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1186.99, -894.32, 14.86), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1186.81, -881.8, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1188.73, -890.44, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1182.04, -894.47, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1180.42, -892.44, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1186.26, -896.37, 14.0), 1.5, 1864388210, true)

		CreateModelHide(vector3(-1180.42, -892.44, 14.0), 1.5, 759729215, true)
		CreateModelHide(vector3(-1180.19, -893.49, 14.0), 1.5, -775118285, true)

		CreateModelHide(vector3(-1200.74, -887.44, 14.0), 1.5, 1778631864, true)

		CreateModelHide(vector3(-1200.34, -886.73, 14.01), 1.5, -1842599357, true)

		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 600967813, true)
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 1049934319, true)
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 443058963, true)

		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 510552540, true)

		CreateModelHide(vector3(-1187.63, -898.52, 14.0), 1.5, 510552540, true)

		CreateModelHide(vector3(-1184.18, -895.2, 14.0), 1.5, 1948359883, true)
		CreateModelHide(vector3(-1184.18, -895.2, 14.0), 1.5, 1388308576, true)

		CreateModelHide(vector3(-1200.69, -888.19, 14.0), 1.5, 922914566, true)
		CreateModelHide(vector3(-1202.72, -888.3, 14.0), 1.5, -1732499190, true)

		--ADD JOB RELATED PROPS
		if not Props["tray1"] then Props["tray1"] = makeProp({prop = `prop_food_bs_tray_02`, coords = vector4(-1196.3, -890.7, 15.05, 305.0)}, 1, 0) end
		if not Props["tray2"] then Props["tray2"] = makeProp({prop = `prop_food_bs_tray_01`, coords = vector4(-1195.0, -892.68, 15.05, 305.0)}, 1, 0) end
		if not Props["bag"] then Props["bag"] = makeProp({prop = `prop_food_bs_bag_04`, coords = vector4(-1200.44, -896.36, 13.91+1.03, 300.0)}, 1, 0) end
		if not Props["bag2"] then Props["bag2"] = makeProp({prop = `prop_food_bs_bag_04`, coords = vector4(-1200.44, -896.16, 13.91+1.03, 180.0)}, 1, 0) end
		if not Props["bag3"] then Props["bag3"] = makeProp({prop = `prop_food_bs_bag_04`, coords = vector4(-1200.64, -896.06, 13.91+1.03, 250.0)}, 1, 0) end

		--Targets
		--Stash/Shops
		Targets["BShelf"] =
		exports['qb-target']:AddBoxZone("BShelf", vector3(-1197.75, -894.31, 14.19), 1.1, 4.5, { name="BShelf", heading = 123.65, debugPoly=Config.Debug, minZ = 13.0, maxZ = 14.9, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_shelves"], job = "burgershot", id = "Shelf" }, },
				distance = 2.0 })
		Targets["BFridge"] =
		exports['qb-target']:AddBoxZone("BFridge", vector3(-1203.9, -889.75, 13.99), 1.2, 1.6, { name="BFridge", heading = 215.0, debugPoly=Config.Debug, minZ = 13.0, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_fridge"], job = "burgershot", id = "Fridge" }, },
				distance = 1.5 })
		Targets["BStore"] =
		exports['qb-target']:AddBoxZone("BStore", vector3(-1205.75, -892.99, 13.99), 1.0, 4.5, { name="BStore", heading = 122.65, debugPoly=Config.Debug, minZ = 13.2, maxZ = 15.5, },
			{ options = { { event = "jim-burgershot:shop", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_storage"], job = "burgershot" }, },
				distance = 1.5 })
		Targets["BBag"] =
		exports['qb-target']:AddBoxZone("BBag", vector3(-1200.51, -896.17, 14.0), 0.5, 0.7, { name="BBag", heading = 304.0, debugPoly=Config.Debug, minZ = 13.6, maxZ = 14.6, },
			{ options = { { event = "jim-burgershot:client:GrabBag", icon = "fas fa-bag-shopping", label = Loc[Config.Lan].targetinfo["grab_murderbag"], job = "burgershot", }, },
				distance = 2.0 })

		--Food Making
		Targets["BGrill1"] =
		exports['qb-target']:AddBoxZone("BGrill1", vector3(-1200.27, -900.76, 14.0), 0.7, 1.2, { name="BGrill1", heading = 123.65, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-fire", label = Loc[Config.Lan].targetinfo["use_grill"], job = "burgershot", craftable = Crafting.Grill, header = Loc[Config.Lan].menu["grill"] }, },
				distance = 1.5 })
		Targets["BGrill2"] =
		exports['qb-target']:AddBoxZone("BGrill2", vector3(-1202.64, -897.27, 14.0), 0.7, 1.2, { name="BGrill2", heading = 122.65, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-fire", label = Loc[Config.Lan].targetinfo["use_grill"], job = "burgershot", craftable = Crafting.Grill, header = Loc[Config.Lan].menu["grill"] }, },
				distance = 1.5 })
		Targets["BFryer"] =
		exports['qb-target']:AddBoxZone("BFryer", vector3(-1201.4, -898.98, 13.98), 0.7, 2.5, { name="BFryer", heading = 123.65, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].targetinfo["use_deepfryer"], job = "burgershot", craftable = Crafting.Fryer, header = Loc[Config.Lan].menu["deep_fat_fryer"] }, },
				distance = 1.5 })
		Targets["BChop"] =
		exports['qb-target']:AddBoxZone("BChop", vector3(-1199.38, -902.07, 14.0), 0.6, 1.5, { name="BChop", heading = 123.65, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-utensils", label = Loc[Config.Lan].targetinfo["use_chopping_board"], job = "burgershot", craftable = Crafting.ChopBoard, Loc[Config.Lan].menu["chopping_board"] }, },
				distance = 1.5 })
		Targets["BPrepare"] =
		exports['qb-target']:AddBoxZone("BPrepare", vector3(-1198.37, -898.36, 13.98), 1.8, 3.2, { name="BPrepare", heading = 123.65, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["prepare_food"], job = "burgershot", craftable = Crafting.Prepare, Loc[Config.Lan].menu["prepare_food"] }, },
				distance = 1.5 })
		Targets["BDrink"] =
		exports['qb-target']:AddBoxZone("BDrink", vector3(-1199.47, -895.44, 13.9953), 0.6, 1.7, { name="BDrink", heading = 122.65, debugPoly=Config.Debug, minZ = 13.3, maxZ = 15.0, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_drinks"], job = "burgershot", craftable = Crafting.Drink, header = Loc[Config.Lan].menu["drinks_dispenser"] }, },
				distance = 1.5 })
		Targets["BDonut"] =
		exports['qb-target']:AddBoxZone("BDonut", vector3(-1203.35, -895.66, 13.9952), 0.7, 1.0, { name="BDonut", heading = 122.65, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.8, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-dot-circle", label = Loc[Config.Lan].targetinfo["open_cabinet"], job = "burgershot", craftable = Crafting.Donut, header = Loc[Config.Lan].menu["food_cabinet"] }, },
				distance = 1.5 })

		--Trays
		Targets["BTray1"] =
		exports['qb-target']:AddBoxZone("BTray1", vector3(-1196.3, -890.7, 14.0), 0.6, 1.0, { name="BTray1", heading = 215.0, debugPoly=Config.Debug, minZ = 13.5, maxZ = 14.8, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], id = "Tray1" }, },
				distance = 2.0 })
		Targets["BTray2"] =
		exports['qb-target']:AddBoxZone("BTray2", vector3(-1195.0, -892.68, 14.0), 0.6, 1.0, { name="BTray2", heading = 215.0, debugPoly=Config.Debug, minZ = 13.5, maxZ = 14.8, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], id = "Tray2" }, },
				distance = 2.0 })
		Targets["BTray3"] =
		exports['qb-target']:AddBoxZone("BTray3", vector3(-1193.86, -894.4, 14.0), 0.6, 1.0, { name="BTray3", heading = 215.0, debugPoly=Config.Debug, minZ = 13.5, maxZ = 14.8, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], id = "Tray3" }, },
				distance = 2.0 })

		--Hand Washing
		Targets["BWash1"] =
		exports['qb-target']:AddBoxZone("BWash1", vector3(-1197.12, -902.07, 13.98), 0.6, 1.0, { name="BWash1", heading = 215.0, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })
		Targets["BWash2"] =
		exports['qb-target']:AddBoxZone("BWash2", vector3(-1198.23, -902.78, 13.98), 1.1, 0.8, { name="BWash2", heading = 215.65, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })
		Targets["BWash3"] =
		exports['qb-target']:AddBoxZone("BWash3", vector3(-1200.7, -888.98, 14.0), 0.6, 0.6, { name="BWash3", heading = 34.93, debugPoly=Config.Debug, minZ = 13.2, maxZ = 14.6, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })
		Targets["BWash4"] =
		exports['qb-target']:AddBoxZone("BWash4", vector3(-1198.57, -887.54, 14.0), 0.6, 0.6, { name="BWash4", heading = 215.0, debugPoly=Config.Debug, minZ = 13.2, maxZ = 14.6, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })

		--Payments / Clockin
		Targets["BReceipt"] =
		exports['qb-target']:AddCircleZone("BReceipt", vector3(-1196.04, -891.38, 14.15), 0.5, { name="BReceipt", debugPoly=Config.Debug, useZ=true, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "burgershot" }, },
				distance = 1.5 })
		Targets["BReceipt2"] =
		exports['qb-target']:AddCircleZone("BReceipt2", vector3(-1194.7, -893.32, 14.15), 0.5, { name="BReceipt2", debugPoly=Config.Debug, useZ=true, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "burgershot", }, },
				distance = 1.5 })
		Targets["BReceipt3"] =
		exports['qb-target']:AddCircleZone("BReceipt3", vector3(-1193.42, -895.22, 14.15), 0.5, { name="BReceipt3", debugPoly=Config.Debug, useZ=true, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "burgershot",}, },
				distance = 2.0 })
		Targets["BClockin"] =
		exports['qb-target']:AddBoxZone("BClockin", vector3(-1193.18, -898.13, 14.2), 0.6, 2.5, { name="BClockin", heading = 35.0, debugPoly=Config.Debug, minZ = 14.2, maxZ = 15.2, },
				{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = "burgershot" },
							{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
							}, distance = 2.0 })

	end
	if Config.MLO == "NP" then
		--Targets
		--Stash/Shops
		Targets["BShelf"] =
		exports['qb-target']:AddBoxZone("BShelf", vector3(-1197.4, -894.58, 13.98), 1.5, 1.0, { name="BShelf", heading = 34.0, debugPoly=Config.Debug, minZ = 13.78, maxZ = 14.78, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_shelves"], job = "burgershot", id = "Shelf" }, },
				distance = 2.0 })
		Targets["BShelf2"] =
		exports['qb-target']:AddBoxZone("BShelf2", vector3(-1198.26, -893.33, 13.98), 1.5, 1.0, { name="BShelf2", heading = 34.0, debugPoly=Config.Debug, minZ = 13.78, maxZ = 14.78, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_shelves"], job = "burgershot", id = "Shelf" }, },
				distance = 2.0 })
		Targets["BFridge"] =
		exports['qb-target']:AddBoxZone("BFridge", vector3(-1196.71, -901.79, 13.98), 1.6, 0.5, { name="BFridge", heading = 304.0, debugPoly=Config.Debug, minZ = 13.33, maxZ = 15.53, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_fridge"], job = "burgershot", id = "Fridge" }, },
				distance = 1.5 })
		Targets["BStore"] =
		exports['qb-target']:AddBoxZone("BStore", vector3(-1205.01, -893.89, 13.98), 2.5, 0.6, { name="BStore", heading = 34.0, debugPoly=Config.Debug, minZ = 12.97, maxZ = 15.37, },
			{ options = { { event = "jim-burgershot:shop", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_storage"], job = "burgershot" }, },
				distance = 1.5 })
		Targets["BBag"] =
		exports['qb-target']:AddBoxZone("BBag", vector3(-1197.78, -891.46, 13.98), 2.1, 0.7, { name="BBag", heading = 304.0, debugPoly=Config.Debug, minZ = 13.38, maxZ = 14.38, },
			{ options = { { event = "jim-burgershot:client:GrabBag", icon = "fas fa-bag-shopping", label = Loc[Config.Lan].targetinfo["grab_murderbag"], job = "burgershot", }, },
				distance = 2.0 })
		Targets["BBag2"] =
		exports['qb-target']:AddBoxZone("BBag2", vector3(-1196.19, -905.02, 13.98), 2.5, 0.7, { name="BBag2", heading = 34.0, debugPoly=Config.Debug, minZ = 13.18, maxZ = 14.78, },
			{ options = { { event = "jim-burgershot:client:GrabBag", icon = "fas fa-bag-shopping", label = Loc[Config.Lan].targetinfo["grab_murderbag"], job = "burgershot", }, },
				distance = 2.0 })

		--Food Makingd
		Targets["BGrill"] =
		exports['qb-target']:AddBoxZone("BGrill", vector3(-1202.8, -897.25, 13.98), 1.7, 0.7, { name="BGrill", heading = 34.0, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-fire", label = Loc[Config.Lan].targetinfo["use_grill"], job = "burgershot", craftable = Crafting.Grill, header = Loc[Config.Lan].menu["grill"] }, },
				distance = 1.5 })
		Targets["BFryer"] =
		exports['qb-target']:AddBoxZone("BFryer", vector3(-1201.85, -898.62, 13.98), 1.7, 0.8, { name="BFryer", heading = 34.0, debugPoly=Config.Debug, minZ = 13.3, maxZ = 14.5, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].targetinfo["use_deepfryer"], job = "burgershot", craftable = Crafting.Fryer, header = Loc[Config.Lan].menu["deep_fat_fryer"] }, },
				distance = 1.5 })
		Targets["BChop"] =
		exports['qb-target']:AddBoxZone("BChop", vector3(-1198.33, -898.66, 13.98), 1.8, 0.6, { name="BChop", heading = 304.0, debugPoly=Config.Debug, minZ = 13.78, maxZ = 14.38, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-utensils", label = Loc[Config.Lan].targetinfo["use_chopping_board"], job = "burgershot", craftable = Crafting.ChopBoard, Loc[Config.Lan].menu["chopping_board"] }, },
				distance = 1.5 })
		Targets["BPrepare"] =
		exports['qb-target']:AddBoxZone("BPrepare", vector3(-1199.62, -897.78, 13.98), 1.7, 0.6, { name="BPrepare", heading = 34.0, debugPoly=Config.Debug, minZ = 13.78, maxZ = 14.38, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["prepare_food"], job = "burgershot", craftable = Crafting.Prepare, Loc[Config.Lan].menu["prepare_food"] }, },
				distance = 1.5 })
		Targets["BDrink"] =
		exports['qb-target']:AddBoxZone("BDrink", vector3(-1199.85, -895.35, 13.98), 2.35, 0.6, { name="BDrink", heading = 34.0, debugPoly=Config.Debug, minZ = 13.78, maxZ = 14.78, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_drinks"], job = "burgershot", craftable = Crafting.Drink, header = Loc[Config.Lan].menu["drinks_dispenser"] }, },
				distance = 1.5 })
		Targets["BDrink2"] =
		exports['qb-target']:AddBoxZone("BDrink2", vector3(-1190.07, -904.51, 13.98), 2.35, 0.6, { name="BDrink2", heading = 34.0, debugPoly=Config.Debug, minZ = 13.78, maxZ = 14.78, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_drinks"], job = "burgershot", craftable = Crafting.Drink, header = Loc[Config.Lan].menu["drinks_dispenser"] }, },
				distance = 1.5 })
		Targets["BDonut"] =
		exports['qb-target']:AddBoxZone("BDonut", vector3(-1203.45, -895.67, 13.98),1.5, 0.5, { name="BDonut", heading = 34.0, debugPoly=Config.Debug, minZ = 13.97, maxZ = 15.17, },
			{ options = { { event = "jim-burgershot:Crafting", icon = "fas fa-dot-circle", label = Loc[Config.Lan].targetinfo["open_cabinet"], job = "burgershot", craftable = Crafting.Donut, header = Loc[Config.Lan].targetinfo["food_cabinet"], }, },
				distance = 1.5 })

		--Trays
		Targets["BTray1"] =
		exports['qb-target']:AddBoxZone("BTray1", vector3(-1195.88, -891.31, 14.2), 0.6, 1.0, { name="BTray1", heading = 215.0, debugPoly=Config.Debug, minZ = 14.0, maxZ = 15.35, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], id = "Tray1" }, },
				distance = 2.0 })
		Targets["BTray2"] =
		exports['qb-target']:AddBoxZone("BTray2", vector3(-1194.99, -892.92, 14.2), 0.6, 1.1, { name="BTray2", heading = 215.0, debugPoly=Config.Debug, minZ = 14.0, maxZ = 15.35, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], id = "Tray2" }, },
				distance = 2.0 })
		Targets["BTray3"] =
		exports['qb-target']:AddBoxZone("BTray3", vector3(-1193.88, -894.37, 14.2), 0.6, 1.0, { name="BTray3", heading = 215.0, debugPoly=Config.Debug, minZ = 14.0, maxZ = 15.35, },
			{ options = { { event = "jim-burgershot:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], id = "Tray3" }, },
				distance = 2.0 })

		--Hand Washing
		Targets["BWash1"] =
		exports['qb-target']:AddBoxZone("BWash1", vector3(-1199.41, -886.27, 13.98), 0.6, 0.6, { name="BWash1", heading = 305.0, debugPoly=Config.Debug, minZ = 13.18, maxZ = 14.38, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })
		Targets["BWash2"] =
		exports['qb-target']:AddBoxZone("BWash2", vector3(-1201.92, -887.98, 13.98), 0.6, 0.6, { name="BWash2", heading = 305.0, debugPoly=Config.Debug, minZ = 13.18, maxZ = 14.38, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })
		Targets["BWash3"] =
		exports['qb-target']:AddBoxZone("BWash3", vector3(-1200.24, -901.13, 13.88), 0.8, 0.85, { name="BWash3", heading = 34.0, debugPoly=Config.Debug, minZ = 13.38, maxZ = 14.38, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })
		Targets["BWash4"] =
		exports['qb-target']:AddBoxZone("BWash4", vector3(-1191.73, -901.48, 13.98), 0.82, 0.75, { name="BWash4", heading = 34.0, debugPoly=Config.Debug, minZ = 13.38, maxZ = 14.38, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })
		Targets["BWash5"] =
		exports['qb-target']:AddBoxZone("BWash5", vector3(-1181.53, -899.43, 13.98), 0.82, 0.75, { name="BWash5", heading = 34.0, debugPoly=Config.Debug, minZ = 13.18, maxZ = 14.38, },
			{ options = { { event = "jim-burgershot:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], }, },
				distance = 2.0 })

		--Payments / Clockin
		Targets["BReceipt"] =
		exports['qb-target']:AddBoxZone("BReceipt", vector3(-1194.23, -893.87, 13.98), 0.35, 1.0, { name="BReceipt", heading = 35.0, debugPoly=Config.Debug, minZ = 13.98, maxZ = 14.58, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "burgershot",
							img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/bf/BurgerShot-HDLogo.svg width=225px></p>" }, },
				distance = 1.5 })

		Targets["BReceipt2"] =
		exports['qb-target']:AddBoxZone("BReceipt2", vector3(-1195.28, -892.35, 13.98), 0.35, 1.0, { name="BReceipt2", heading = 35.0, debugPoly=Config.Debug, minZ = 13.98, maxZ = 14.58, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "burgershot",
							img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/bf/BurgerShot-HDLogo.svg width=225px></p>" }, },
				distance = 1.5 })
		Targets["BReceipt3"] =
		exports['qb-target']:AddBoxZone("BReceipt3", vector3(-1196.29, -890.82, 13.98), 0.55, 1.0, { name="BReceipt3", heading = 35.0, debugPoly=Config.Debug, minZ = 13.98, maxZ = 14.58, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "burgershot",
							img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/bf/BurgerShot-HDLogo.svg width=225px></p>" }, },
				distance = 1.5 })
		Targets["BReceipt4"] =
		exports['qb-target']:AddBoxZone("BReceipt4", vector3(-1192.74, -906.44, 13.98), 0.55, 1.0, { name="BReceipt4", heading = 324.0, debugPoly=Config.Debug, minZ = 13.98, maxZ = 14.58, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "burgershot",
							img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/bf/BurgerShot-HDLogo.svg width=225px></p>" }, },
				distance = 1.5 })

		Targets["BClockin"] =
		exports['qb-target']:AddBoxZone("BClockin", vector3(-1191.52, -900.58, 13.98), 1.4, 0.2, { name="BClockin", heading = 34.0, debugPoly=Config.Debug, minZ = 14.18, maxZ = 15.38, },
				{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = "burgershot" },
							}, distance = 2.0 })
		Targets["BClockin2"] =
		exports['qb-target']:AddBoxZone("BClockin2", vector3(-1178.11, -896.3, 13.98), 0.8, 0.5, { name="BClockin2", heading = 34.0, debugPoly=Config.Debug, minZ = 13.78, maxZ = 14.58, },
				{ options = { { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
				}, distance = 2.0 })
	end

	--Atm Props
	-- if not Props["atm1"] then Props["atm1"] = makeProp({prop = `prop_atm_01`, coords = vector4(-1184.53, -882.85, 13.94-0.22, 122.53)}, 1, 0) end
	-- if not Props["atm2"] then Props["atm2"] = makeProp({prop = `prop_atm_01`, coords = vector4(-1199.6, -884.99, 13.50-0.22, 215.0)}, 1, 0) end
	-- if not Props["bench"] then Props["bench"] = makeProp({prop = `prop_bench_01a`, coords = vector4(-1195.53, -878.53, 13.5, 212.0)}, 1, 0) end
end)

RegisterNetEvent('jim-burgershot:washHands', function(data)
    QBCore.Functions.Progressbar('washing_hands', Loc[Config.Lan].progressbar["washing_hands"], 5000, false, true, {disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = false, },
		{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		triggerNotify(nil, Loc[Config.Lan].success["have_washed_hands"], 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
		triggerNotify(nil, Loc[Config.Lan].error["cancelled"], 'error')
    end, data.icon)
end)

RegisterNetEvent('jim-burgershot:client:GrabBag', function(data)
	QBCore.Functions.Progressbar('making_food', Loc[Config.Lan].progressbar["grab_murder_bag"], 2000, false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle", flags = 8, },
	{}, {}, function()
		TriggerServerEvent("jim-burgershot:server:GrabBag")
		ClearPedTasks(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		ClearPedTasks(PlayerPedId())
	end, "murderbag")
end)

RegisterNetEvent('jim-burgershot:Crafting:MakeItem', function(data)
	if data.header == "Drinks Dispenser" then
		bartext = Loc[Config.Lan].progress["pouring"]..QBCore.Shared.Items[data.item].label
		bartime = 3500
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
	elseif data.header == "Food Cabinet" then
		bartext = Loc[Config.Lan].progress["receiving"]..QBCore.Shared.Items[data.item].label
		bartime = 3500
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
	elseif data.item == "slicedpotato" or data.item == "slicedonion" then
		bartext = Loc[Config.Lan].progress["slicing"]..QBCore.Shared.Items[data.item].label
		bartime = 3000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	elseif data.item == "cheesewrap" or data.item == "chickenwrap" then
		bartext = Loc[Config.Lan].progress["preparing"]..QBCore.Shared.Items[data.item].label
		bartime = 8000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	elseif data.header == "Deep Fat Fryer" then
		bartext = Loc[Config.Lan].progress["frying"]..QBCore.Shared.Items[data.item].label
		bartime = 5000
        animDictNow = "mp_arresting"
        animNow = "a_uncuff"
	elseif data.header == "Grill" then
		bartext = Loc[Config.Lan].progress["cooking"]..QBCore.Shared.Items[data.item].label
		bartime = 5000
        animDictNow = "amb@prop_human_bbq@male@base"
        animNow = "base"
	elseif data.header == "Prepare Food" then
		bartext = Loc[Config.Lan].progress["preparing"]..QBCore.Shared.Items[data.item].label
		bartime = 12500
		animDictNow = "mini@repair"
		animNow = "fixing_a_ped"
	else
		bartext = Loc[Config.Lan].progress["preparing"]..QBCore.Shared.Items[data.item].label
		bartime = 12500
		animDictNow = "mini@repair"
		animNow = "fixing_a_ped"
	end
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = animDictNow, anim = animNow, flags = 8, },
	{}, {}, function()
		TriggerServerEvent('jim-burgershot:Crafting:GetItem', data.item, data.craft)
		Wait(500)
		TriggerEvent("jim-burgershot:Crafting", data)
		ClearPedTasks(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		ClearPedTasks(PlayerPedId())
	end, data.item)
end)

RegisterNetEvent('jim-burgershot:Stash', function(data, id)
	if id then -- If it has a bag ID then open the limited stash
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgershot_"..id, { maxweight = 12000, slots = 10, })
		TriggerEvent("inventory:client:SetCurrentStash", "burgershot_"..id)
	else
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgershot_"..data.id)
		TriggerEvent("inventory:client:SetCurrentStash", "burgershot_"..data.id)
	end
end)

RegisterNetEvent('jim-burgershot:shop', function()
	if not jobCheck() then return end
	local event = "inventory:server:OpenInventory"
	if Config.JimShop then event = "jim-shops:ShopOpen" end
	TriggerServerEvent(event, "shop", "burgershot", Config.Items)
end)

RegisterNetEvent('jim-burgershot:Crafting', function(data)
	if not jobCheck() then return end
	local Menu = {}
	Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
	Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "" } }
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[k].image.." width=35px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				local disable = false
				local checktable = {}
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
					settext = text
					checktable[l] = HasItem(l, b)
				end
				for _, v in pairs(checktable) do if v == false then disable = true break end end
				if not disable then setheader = setheader.." ✔️" end
				Menu[#Menu + 1] = { disabled = disable, icon = k, header = setheader, txt = settext, params = { event = "jim-burgershot:Crafting:MakeItem", args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } } }
				settext, setheader = nil
			end
		end
	end
	exports['indigo-menu']:openMenu(Menu)
end)

RegisterNetEvent('jim-burgershot:client:Eat', function(itemName)
	if itemName == "moneyshot" or itemName == "heartstopper" or itemName == "bleeder" or itemName == "meatfree" then TriggerEvent('animations:client:EmoteCommandStart', {"burger"})
	elseif itemName == "torpedo" or itemName == "cheesewrap" or itemName == "chickenwrap" then TriggerEvent('animations:client:EmoteCommandStart', {"torpedo"})
	elseif itemName == "shotrings" or itemName == "shotnuggets" or itemName == "shotfries" then TriggerEvent('animations:client:EmoteCommandStart', {"bsfries"})
	elseif itemName == "rimjob" or itemName == "creampie" then TriggerEvent('animations:client:EmoteCommandStart', {"donut2"}) end
	QBCore.Functions.Progressbar("eat_something", Loc[Config.Lan].progress["eating"]..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
		toggleItem(false, itemName, 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger)
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
		if Config.RewardItem == itemName then toggleItem(true, Config.RewardPool[math.random(1, #Config.RewardPool)], 1) end
	end, function() -- Cancel
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, itemName)
end)

RegisterNetEvent('jim-burgershot:client:Drink', function(itemName)
	if itemName == "bscoke" then  TriggerEvent('animations:client:EmoteCommandStart', {"bscoke"})
	elseif itemName == "bscoffee" then TriggerEvent('animations:client:EmoteCommandStart', {"bscoffee"})
	elseif itemName == "milk" then TriggerEvent('animations:client:EmoteCommandStart', {"milk"})
	elseif itemName == "milkshake" then TriggerEvent('animations:client:EmoteCommandStart', {"glass"}) end
    QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan].progress["drinking"]..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
		toggleItem(false, itemName, 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
		if Config.RewardItem == itemName then toggleItem(true, Config.RewardPool[math.random(1, #Config.RewardPool)], 1) end
	end, function() -- Cancel
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, itemName)
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
	for _, v in pairs(Props) do unloadModel(v) DeleteEntity(v) end
end)

-- Drive Thru Update --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if isLoggedIn then
            local NearAnything = false
            local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
            if PlayerJob.name == 'burgershot' and PlayerJob.onduty then
                local Distance = #(PlayerCoords - Config.Intercom['Worker'])
                if Distance < 1.8 then
                    NearAnything = true
                    if not ShowingInteraction then
                        ShowingInteraction = true
                        exports['qb-core']:DrawText('Drive Thru', 'left')
                        exports['pma-voice']:addPlayerToCall(878914, 'Phone')
                    end
                end
            end
            local Distance = #(PlayerCoords - Config.Intercom['Customer'])
            if Distance < 3 then
                NearAnything = true
                if not ShowingInteraction then
                    ShowingInteraction = true
                    TriggerServerEvent('qb-burgershot:server:alert:workers')
                    exports['qb-core']:DrawText('Drive Thru', 'left')
                    exports['pma-voice']:addPlayerToCall(878914, 'Phone')
                end
            end
            if not NearAnything then
                if ShowingInteraction then
                    ShowingInteraction = false
                    exports['qb-core']:HideText()
                    exports['pma-voice']:removePlayerFromCall(878914, 'Phone')
                end
                Citizen.Wait(1000)
            end
        end
    end
end)

RegisterNetEvent('qb-burgershot:client:call:intercom')
AddEventHandler('qb-burgershot:client:call:intercom', function()
    if QBCore.Functions.GetPlayerData().job.name =='burgershot' and QBCore.Functions.GetPlayerData().job.onduty then
        QBCore.Functions.Notify('Someone is at the drive thru', 'info', 7000)
        PlaySoundFrontend( -1, "Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
    end
end)