-- Variables
local QBCore = exports['qb-core']:GetCoreObject()
local requiredItemsShowed = false
local requiredItemsShowed2 = false
local requiredItemsShowed3 = false
local requiredItemsShowed4 = false
local requiredItemsShowed5 = false
local requiredItems = {[1] = {name = QBCore.Shared.Items["cryptostick"]["name"], image = QBCore.Shared.Items["cryptostick"]["image"]}}
local requiredItems2 = {[1] = {name = QBCore.Shared.Items["electronickit"]["name"], image = QBCore.Shared.Items["electronickit"]["image"]}}

-- Functions

local function DrawText3Ds(coords, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function ExchangeSuccess()
	TriggerServerEvent('qb-crypto:server:ExchangeSuccess', math.random(1, 10))
end

local function ExchangeFail()
	local Odd = 5
	local RemoveChance = math.random(1, Odd)
	local LosingNumber = math.random(1, Odd)
	if RemoveChance == LosingNumber then
		TriggerServerEvent('qb-crypto:server:ExchangeFail')
		TriggerServerEvent('qb-crypto:server:SyncReboot')
	end
end

local function SystemCrashCooldown()
	CreateThread(function()
		while Crypto.Exchange.RebootInfo.state do
			if (Crypto.Exchange.RebootInfo.percentage + 1) <= 100 then
				Crypto.Exchange.RebootInfo.percentage = Crypto.Exchange.RebootInfo.percentage + 1
				TriggerServerEvent('qb-crypto:server:Rebooting', true, Crypto.Exchange.RebootInfo.percentage)
			else
				Crypto.Exchange.RebootInfo.percentage = 0
				Crypto.Exchange.RebootInfo.state = false
				TriggerServerEvent('qb-crypto:server:Rebooting', false, 0)
			end
			Wait(1200)
		end
	end)
end

local function HackingSuccess(success)
    if success then
		TriggerEvent('mhacking:hide')
        ExchangeSuccess()
    else
		TriggerEvent('mhacking:hide')
		ExchangeFail()
	end
end

CreateThread(function()
	while true do
		local sleep = 5000
		if LocalPlayer.state.isLoggedIn then
			local ped = PlayerPedId()
			local pos = GetEntityCoords(ped)
			local dist = #(pos - Crypto.Exchange.coords)
			
			if dist < 15 then
				sleep = 5
				if dist < 1.5 then
					if not Crypto.Exchange.RebootInfo.state then
						DrawText3Ds(Crypto.Exchange.coords, Lang:t('text.enter_usb'))
						if not requiredItemsShowed then
							requiredItemsShowed = true
							TriggerEvent('inventory:client:requiredItems', requiredItems, true)
						end

						if IsControlJustPressed(0, 38) then
							QBCore.Functions.TriggerCallback('qb-crypto:server:HasSticky', function(HasItem)
								if HasItem then
									TriggerEvent("mhacking:show")
									TriggerEvent("mhacking:start", math.random(4, 6), 45, HackingSuccess)
								else
									QBCore.Functions.Notify(Lang:t('error.you_dont_have_a_cryptostick'), 'error')
								end
							end)
						end
					else
						DrawText3Ds(Crypto.Exchange.coords, Lang:t('text.system_is_rebooting', {rebootInfoPercentage = Crypto.Exchange.RebootInfo.percentage}) )
					end
				else
					if requiredItemsShowed then
						requiredItemsShowed = false
						TriggerEvent('inventory:client:requiredItems', requiredItems, false)
					end
				end
			end
		end
		Wait(sleep)
	end
end)

CreateThread(function()
	while true do
		local sleep = 5000
		if LocalPlayer.state.isLoggedIn then
			local ped = PlayerPedId()
			local pos = GetEntityCoords(ped)
			-- for pacific bank and paleto bank item ui --
			local paletodist = #(pos - Crypto.Paleto.coords)
			local pacificdist = #(pos - Crypto.Pacific.coords)
			local pacificdist2 = #(pos - Crypto.Pacific.coords2)
			local pacificdist3 = #(pos - Crypto.Pacific.coords3)
			
			if paletodist < 15 then
				sleep = 5
				if paletodist < 1.5 then
					if not requiredItemsShowed2 then
						requiredItemsShowed2 = true
						TriggerEvent('inventory:client:requiredItems', requiredItems2, true)
					end
				else
					if requiredItemsShowed2 then
						requiredItemsShowed2 = false
						TriggerEvent('inventory:client:requiredItems', requiredItems2, false)
					end
				end
			elseif pacificdist < 5 then
				sleep = 5
				if pacificdist < 1.5 then
					if not requiredItemsShowed3 then
						requiredItemsShowed3 = true
						TriggerEvent('inventory:client:requiredItems', requiredItems2, true)
					end
				else
					if requiredItemsShowed3 then
						requiredItemsShowed3 = false
						TriggerEvent('inventory:client:requiredItems', requiredItems2, false)
					end
				end
			elseif pacificdist2 < 5 then
				sleep = 5
				if pacificdist2 < 1.5 then
					if not requiredItemsShowed4 then
						requiredItemsShowed4 = true
						TriggerEvent('inventory:client:requiredItems', requiredItems2, true)
					end
				else
					if requiredItemsShowed4 then
						requiredItemsShowed4 = false
						TriggerEvent('inventory:client:requiredItems', requiredItems2, false)
					end
				end
			elseif pacificdist3 < 5 then
				sleep = 5
				if pacificdist3 < 1.5 then
					if not requiredItemsShowed5 then
						requiredItemsShowed5 = true
						TriggerEvent('inventory:client:requiredItems', requiredItems2, true)
					end
				else
					if requiredItemsShowed5 then
						requiredItemsShowed5 = false
						TriggerEvent('inventory:client:requiredItems', requiredItems2, false)
					end
				end
			else 
				print('not near')
			end

		end
		Wait(sleep)
	end
end)

-- Events

RegisterNetEvent('qb-crypto:client:SyncReboot', function()
	Crypto.Exchange.RebootInfo.state = true
	SystemCrashCooldown()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	TriggerServerEvent('qb-crypto:server:GetRebootState')
end)

RegisterNetEvent('qb-crypto:client:GetRebootState', function(RebootInfo)
	if RebootInfo.state then
		Crypto.Exchange.RebootInfo.state = RebootInfo.state
		Crypto.Exchange.RebootInfo.percentage = RebootInfo.percentage
		SystemCrashCooldown()
	end
end)
