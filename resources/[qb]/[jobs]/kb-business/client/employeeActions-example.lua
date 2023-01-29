local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('kb-business:Crafting:MakeItem', function(data)
    bartext = "Preparing"..QBCore.Shared.Items[data.item].label
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