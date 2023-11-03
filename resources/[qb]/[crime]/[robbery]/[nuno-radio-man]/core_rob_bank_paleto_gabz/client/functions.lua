Functions = {}
resource = GetCurrentResourceName()

--Framework Setup
Citizen.CreateThread(function()
	if cfg.framework == "esx_old" then TriggerEvent("esx:getSharedObject",function(obj) Functions = obj end) end
	if cfg.framework == "esx_new" then Functions = exports["es_extended"]:getSharedObject()end
	if cfg.framework == "qbcore" then Functions = exports["qb-core"]:GetCoreObject() end
end)

--Framework & Other Functions
RegisterNetEvent(resource..":StartRobbery_c")
AddEventHandler(resource..":StartRobbery_c", function(data)
	-- do whatever you want
end)
RegisterNetEvent(resource..":Notification_c")
AddEventHandler(resource..":Notification_c", function(data)
	if cfg.notification.selected == "gtav" then
		BeginTextCommandThefeedPost("STRING")
		AddTextComponentSubstringPlayerName(data.notification)
		EndTextCommandThefeedPostTicker(true, false)
	end
	if cfg.notification.selected == "qbcore" then
		Functions.Functions.Notify(data.notification,"success")
	end
	if cfg.notification.selected == "esx" then
		Functions.ShowNotification(data.notification)
	end
end)
RegisterNetEvent(resource..":PoliceNotification_c")
AddEventHandler(resource..":PoliceNotification_c", function(data)
	if cfg.dispatch == "nunoradioman" then
		BeginTextCommandThefeedPost("STRING") AddTextComponentSubstringPlayerName(data.dispatch.message) EndTextCommandThefeedPostTicker(true, false)

		local blip = AddBlipForCoord(data.coords.x,data.coords.y,data.coords.z)
		SetBlipCategory(blip,2)
		SetBlipSprite(blip,data.dispatch.sprite)
		SetBlipColour(blip,data.dispatch.color)
		SetBlipScale(blip,data.dispatch.scale)
		BeginTextCommandSetBlipName("STRING") AddTextComponentString(data.dispatch.code.." - "..data.dispatch.message) EndTextCommandSetBlipName(blip)

		local blip_radius = AddBlipForRadius(data.coords.x,data.coords.y,data.coords.z,25.0)
		SetBlipColour(blip_radius,1)
		SetBlipAlpha(blip_radius,100)

		Citizen.Wait(1000 * data.dispatch.time)

		RemoveBlip(blip)
		RemoveBlip(blip_radius)
	end
	if cfg.dispatch == "ps_dispatch" then
		exports["ps-dispatch"]:CustomAlert({
			coords = data.coords,
			message = data.dispatch.message,
			dispatchCode = data.dispatch.code,
			description =  data.dispatch.message,
			radius = 25.0,
			sprite = data.dispatch.sprite,
			color = data.dispatch.color,
			scale = data.dispatch.scale,
			length = data.dispatch.time,
		})
	end
	if cfg.dispatch == "cd_dispatch" then
		TriggerServerEvent('cd_dispatch:AddNotification',{
			job_table = cfg.police.groups, 
			coords = data.coords,
			title = data.dispatch.code.." - "..data.dispatch.message,
			message = data.dispatch.message,
			flash = 0,
			unique_id = tostring(math.random(0000000,9999999)),
			blip = {
				sprite = data.dispatch.sprite, 
				scale = data.dispatch.scale, 
				colour = data.dispatch.color,
				flashes = false,
				text = data.dispatch.code.." - "..data.dispatch.message,
				time = 1000 * data.dispatch.time,
				sound = 1,
			}
		})
	end
	if cfg.dispatch == "core_dispatch" then
		exports['core_dispach']:addCall(data.dispatch.code,data.dispatch.message,{},{data.coords.x,data.coords.y,data.coords.z},cfg.police.groups[1],5000,data.dispatch.sprite,data.dispatch.color)
	end
	if cfg.dispatch == "outlawalert" then
		TriggerServerEvent('wf-alerts:svNotify',{
			caller = 'Alarm',
			coords = data.coords,
			dispatchData = {
				displayCode = data.dispatch.code,
				description = data.dispatch.message,
				isImportant = 0,
				recipientList = cfg.police.groups,
				length = data.dispatch.time * 1000,
				infoM = 'fa-info-circle',
				info = data.dispatch.message,
			},
		})
	end
end)

function clone(obj, seen) if type(obj) ~= 'table' then return obj end if seen and seen[obj] then return seen[obj] end local s = seen or {} local res = {} s[obj] = res for k, v in pairs(obj) do res[clone(k, s)] = clone(v, s) end return setmetatable(res, getmetatable(obj)) end