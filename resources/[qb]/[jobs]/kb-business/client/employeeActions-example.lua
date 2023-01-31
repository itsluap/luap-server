local QBCore = exports['qb-core']:GetCoreObject()
local canStock = true

-- puff puff pass stuff --

RegisterNetEvent('kb-business:Crafting:MakeItem', function(data)
    bartext = "Preparing "..QBCore.Shared.Items[data.item].label
    bartime = 12500
    animDictNow = "mini@repair"
    animNow = "fixing_a_ped"
	QBCore.Functions.Progressbar('making_weeditem', bartext, bartime, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = animDictNow, anim = animNow, flags = 8, },
	{}, {}, function()
		TriggerServerEvent('kb-business:Crafting:GetItem', data.item, data.craft)
		Wait(500)
		TriggerEvent("kb-business:Crafting", data)
		ClearPedTasks(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		ClearPedTasks(PlayerPedId())
	end, data.item)
end)

RegisterNetEvent('kb-business:client:weedcraftjoint')
AddEventHandler('kb-business:client:weedcraftjoint', function()
	data = {
		craftable = Config.Joint
	}
	local Menu = {}
	Menu[#Menu + 1] = { header = "Puff Puff Pass", txt = "", isMenuHeader = true }
	Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "" } }
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = "<img src=nui://".."lj-inventory/html/images/"..QBCore.Shared.Items[k].image.." width=35px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				local disable = false
				local checktable = {}
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 1 then number = " x1" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
					settext = text
					checktable[l] = HasItem(l, b)
				end
				for _, v in pairs(checktable) do if v == false then disable = true break end end
				if not disable then setheader = setheader.." ✔️" end
				Menu[#Menu + 1] = { disabled = disable, icon = k, header = setheader, txt = settext, params = { event = "kb-business:Crafting:MakeItem", args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } } }
				settext, setheader = nil
			end
		end
	end
	exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('kb-business:client:UseStressBuffJoint', function(jointType)
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[jointType], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        end
		Citizen.Wait(1000)
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
		exports['ps-buffs']:AddStressBuff(30000, 10)
    end)
end)

RegisterNetEvent('kb-business:client:WeedRestock', function()
	local current = 'mp_m_shopkeep_01'
	if canStock then
		x = -217.39
		y = 6248.74
		z = 30.49

		BLIP_1 = AddBlipForCoord(x,  y,  z)
		SetBlipSprite(BLIP_1, 8)
		SetBlipRoute(BLIP_1,  true) -- waypoint to blip
		--SetBlipRouteColour( blip,  colour )
		canStock = false
		RequestModel(current)
        while not HasModelLoaded(current) do
            Wait(0)
        end
		vector4(-217.39, 6248.74, 31.49, 45.17)
		ShopPed = CreatePed(0, current, -217.39, 6248.74, 30.49, 45.17, false, false) --  create ped
		TaskStartScenarioInPlace(ShopPed, "WORLD_HUMAN_STAND_MOBILE", 0, true)
        FreezeEntityPosition(ShopPed, true)
        SetEntityInvincible(ShopPed, true)
        SetBlockingOfNonTemporaryEvents(ShopPed, true)
		exports['qb-target']:AddTargetEntity(ShopPed, { -- create third eye
			options = {
				{
					type = "client",
					event = "kb-business:OpenWeedRestock",
					label = "Restock Shop",
					icon = "fas fa-shopping-basket",
					job = "puffpuffpass",
				}
			},
			distance = 2.0
		})
		TriggerEvent('kb-business:client:WeedRestockTimer') -- start timer
		TriggerEvent('QBCore:Notify', "Restock has been started!", 'success') 
	elseif not canStock then 
		exports['qb-target']:RemoveTargetEntity(ShopPed, 'Restock Shop') -- remove third eye if started returns false
		DeletePed(ShopPed)
		ClearAllBlipRoutes()
		TriggerEvent('QBCore:Notify', "Restock was cancelled!", 'error') 
	end
end)

RegisterNetEvent('kb-business:client:WeedRestockTimer', function()
	local current = 'mp_m_shopkeep_01'
    local timer = 30 * 60000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            exports['qb-target']:RemoveTargetEntity(ShopPed, 'Restock Shop')
			canStock = true
			DeletePed(ShopPed)
			ClearAllBlipRoutes()
        end
    end
end)

RegisterNetEvent('kb-business:client:StopWeedRestock', function()
	local current = 'mp_m_shopkeep_01'
	exports['qb-target']:RemoveTargetEntity(ShopPed, 'Restock Shop')
end)

RegisterNetEvent("kb-business:OpenWeedRestock", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.RestockShop)
end)

-- default stuff --

RegisterNetEvent('kb-business:client:cookdog')
AddEventHandler('kb-business:client:cookdog', function(data)
    local cookingItem = 'sandwich'

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if not hasItem then 
            TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error') 
        else 
            FoodProgress(cookingItem) 
        end		
    end, cookingItem) -- CHANGE THIS, OBVIOUSLY ;)

end)

function FoodProgress(ItemMake)
    local cookedItem = 'tosti'

    bartext = "Grilling "..QBCore.Shared.Items[ItemMake].label
    bartime = 5000
    animDictNow = "amb@prop_human_bbq@male@base"
    animNow = "base"
    animflag = 8

    QBCore.Functions.Progressbar('making_food', bartext, bartime, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
    { animDict = animDictNow, anim = animNow, flags = animflag, }, {}, {}, function()  
        TriggerServerEvent('kb-business:server:getItem', cookedItem)
        StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('QBCore:Notify', "Cancelled!", 'error')
    end)
end