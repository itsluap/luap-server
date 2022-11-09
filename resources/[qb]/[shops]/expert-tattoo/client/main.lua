local QBCore = exports[Config.CoreObject]:GetCoreObject()
local currentTattoos = {}
local cam = nil
local opacity = 1
local Clothing = {}
local Tattoshopprice = {}
local Tattoshoppriceended = {}
local ClothingSaveAs = false

local function refreshTattoos()
	QBCore.Functions.TriggerCallback(Config.TriggerName..'tattooshop:GetPlayerTattoos', function(tattooList)
		if tattooList then
			ClearPedDecorations(PlayerPedId())
			for k, v in pairs(tattooList) do
				if v.Count ~= nil then
					for i = 1, v.Count do
						SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
					end
				else
					SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
				end
			end
			currentTattoos = tattooList
		else
			ClearPedDecorations(PlayerPedId())
		end
	end)
end

RegisterNetEvent(Config.Core..':Client:OnPlayerLoaded', function()
	Wait(5000)
	refreshTattoos()
end)

CreateThread(function()
	AddTextEntry("Tattoos", "Tattoo Shop")
	for k, v in pairs(Config.Shops) do
		local blip = AddBlipForCoord(v)
		SetBlipSprite(blip, 75)
		SetBlipColour(blip, 1)
		SetBlipScale(blip, 0.5)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("Tattoos")
		EndTextCommandSetBlipName(blip)
	end
end)

RegisterCommand("tt-r", function()
	refreshTattoos()
end)

function DrawTattoo(collection, name)
	ClearPedDecorations(PlayerPedId())
	for k, v in pairs(currentTattoos) do
		if v.Count ~= nil then
			for i = 1, v.Count do
				SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
			end
		else
			SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
		end
	end
	for i = 1, opacity do
		SetPedDecoration(PlayerPedId(), collection, name)
	end
end

function GetNaked()
	if not ClothingSaveAs then
		ClothingSaveAs = true
		Clothing[0.1] = {}
		Clothing[0.1]["Prop"] = GetPedPropIndex(PlayerPedId(), 0)
		Clothing[0.1]["Texture"] = GetPedPropTextureIndex(PlayerPedId(), 0)

		Clothing[1.1] = {}
		Clothing[1.1]["Prop"] = GetPedPropIndex(PlayerPedId(), 1)
		Clothing[1.1]["Texture"] = GetPedPropTextureIndex(PlayerPedId(), 1)

		Clothing[2.1] = {}
		Clothing[2.1]["Prop"] = GetPedPropIndex(PlayerPedId(), 2)
		Clothing[2.1]["Texture"] = GetPedPropTextureIndex(PlayerPedId(), 2)

		Clothing[1] = {}
		Clothing[1]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 1)
		Clothing[1]["Texture"] = GetPedTextureVariation(PlayerPedId(), 1)

		Clothing[3] = {}
		Clothing[3]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 3)
		Clothing[3]["Texture"] = GetPedTextureVariation(PlayerPedId(), 3)

		Clothing[4] = {}
		Clothing[4]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 4)
		Clothing[4]["Texture"] = GetPedTextureVariation(PlayerPedId(), 4)

		Clothing[6] = {}
		Clothing[6]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 6)
		Clothing[6]["Texture"] = GetPedTextureVariation(PlayerPedId(), 6)

		Clothing[7] = {}
		Clothing[7]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 7)
		Clothing[7]["Texture"] = GetPedTextureVariation(PlayerPedId(), 7)

		Clothing[8] = {}
		Clothing[8]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 8)
		Clothing[8]["Texture"] = GetPedTextureVariation(PlayerPedId(), 8)

		Clothing[9] = {}
		Clothing[9]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 9)
		Clothing[9]["Texture"] = GetPedTextureVariation(PlayerPedId(), 9)

		Clothing[10] = {}
		Clothing[10]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 10)
		Clothing[10]["Texture"] = GetPedTextureVariation(PlayerPedId(), 10)

		Clothing[11] = {}
		Clothing[11]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 11)
		Clothing[11]["Texture"] = GetPedTextureVariation(PlayerPedId(), 11)
	end
		if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
			local nakedMale = {
				outfitData = {
					["pants"]       = { item = 14, texture = 0},  -- Broek
					["arms"]        = { item = 15, texture = 0},  -- Armen
					["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
					["vest"]        = { item = 0, texture = 0},  -- Body Vest
					["torso2"]      = { item = 91, texture = 0},  -- Jas / Vesten
					["shoes"]       = { item = 5, texture = 0},  -- Schoenen
					["decals"]      = { item = 10, texture = 0},  -- Decals
					["accessory"]   = { item = 0, texture = 0},  -- Nek / Das
					["hat"]         = { item = -1, texture = -1},  -- Pet
					["glass"]       = { item = 0, texture = 0},  -- Bril
					["mask"]         = { item = 0, texture = 0},  -- Masker
				},
			}
			TriggerEvent(Config.TriggerName..'clothing:client:loadOutfit', nakedMale)
		else
			local nakedFemale = {
				outfitData = {
					["pants"]       = { item = 16, texture = 0},  -- Broek
					["arms"]        = { item = 15, texture = 0},  -- Armen
					["t-shirt"]     = { item = -1, texture = 0},  -- T Shirt
					["vest"]        = { item = 0, texture = 0},  -- Body Vest
					["torso2"]      = { item = 101, texture = 1},  -- Jas / Vesten
					["shoes"]       = { item = 5, texture = 0},  -- Schoenen
					["decals"]      = { item = 0, texture = 0},  -- Decals
					["accessory"]   = { item = 0, texture = 0},  -- Nek / Das
					["hat"]         = { item = -1, texture = -1},  -- Pet
					["glass"]       = { item = 0, texture = 0},  -- Bril
					["mask"]         = { item = 0, texture = 0},  -- Masker
				},
			}
			TriggerEvent(Config.TriggerName..'clothing:client:loadOutfit', nakedFemale)
		end
end

function ResetSkin()
	TriggerServerEvent(Config.TriggerName.."clothes:loadPlayerSkin")
	Wait(100)
	ClearPedDecorations(PlayerPedId())
	for k, v in pairs(currentTattoos) do
		if v.Count ~= nil then
			for i = 1, v.Count do
				SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
			end
		else
			SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
		end
	end
end

function ResetSkin2()
	ClothingSaveAs = false
	if json.encode(Clothing) ~= "[]" then
		local resetSkin = {
			outfitData = {
				["pants"]       = { item = Clothing[4]["Prop"], texture = Clothing[4]["Texture"]},  -- Broek
				["arms"]        = { item = Clothing[3]["Prop"], texture = Clothing[3]["Texture"]},  -- Armen
				["t-shirt"]     = { item = Clothing[8]["Prop"], texture = Clothing[8]["Texture"]},  -- T Shirt
				["vest"]        = { item = Clothing[9]["Prop"], texture = Clothing[9]["Texture"]},  -- Body Vest
				["torso2"]      = { item = Clothing[11]["Prop"], texture = Clothing[11]["Texture"]},  -- Jas / Vesten
				["shoes"]       = { item = Clothing[6]["Prop"], texture = Clothing[6]["Texture"]},  -- Schoenen
				["decals"]      = { item = Clothing[10]["Prop"], texture = Clothing[10]["Texture"]},  -- Decals
				["accessory"]   = { item = Clothing[7]["Prop"], texture = Clothing[7]["Texture"]},  -- Nek / Das
				["hat"]         = { item = Clothing[0.1]["Prop"], texture = Clothing[0.1]["Texture"]},  -- Pet
				["glass"]       = { item = Clothing[1.1]["Prop"], texture = Clothing[1.1]["Texture"]},  -- Bril
				["mask"]        = { item = Clothing[1]["Prop"], texture = Clothing[1]["Texture"]},  -- Masker
			},
		}
		TriggerEvent(Config.TriggerName..'clothing:client:loadOutfit', resetSkin)
	end
end

function BuyTattoo(collection, name, label, price)
	QBCore.Functions.TriggerCallback(Config.TriggerName..'tattooshop:PurchaseTattoo', function(success)
		if success then
			table.insert(currentTattoos, {collection = collection, nameHash = name, Count = opacity})
		else
			refreshTattoos()
		end
	end, currentTattoos, price, {collection = collection, nameHash = name, Count = opacity}, GetLabelText(label))
end

function RemoveTattoo(name, label)
	for k, v in pairs(currentTattoos) do
		if v.nameHash == name then
			table.remove(currentTattoos, k)
		end
	end
	TriggerServerEvent(Config.TriggerName.."tattooshop:server:RemoveTattoo", currentTattoos)
	QBCore.Functions.Notify("You have removed the " .. GetLabelText(label) .. " tattoo", 'success')
end

RegisterNetEvent(Config.TriggerName..'tattoo:client:SetaCameraForSell', function(data)
	for k, v in pairs(Config.TattooCats) do
		if v[1] == data.db2[1] then
			if not DoesCamExist(cam) then
				cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
				SetCamActive(cam, true)
				RenderScriptCams(true, false, 0, true, true)
				StopCamShaking(cam, true)
			end
			if GetCamCoord(cam) ~= GetOffsetFromEntityInWorldCoords(PlayerPedId(), v[3][1]) then
				SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), v[3][1]))
				PointCamAtCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), data.db2[4].x, data.db2[4].y, data.db2[4].z))
			end
		end
	end
	Tattoshoppriceended = {
		{
            header = '< Go Back',
            params = {
                event = Config.TriggerName..'tatto:client:gobacktattolist'
            }
        },
		{
            header = '🔄 Change Camera',
            params = {
                event = Config.TriggerName..'tatto:client:changecamera',
				args = data.db2[1]
            }
        },
	}
	Tattoshoppriceended[#Tattoshoppriceended+1] = {
		header = "Apply tatto",
		txt = "$"..data.db.Price,
		params = {
			event = Config.TriggerName.."tattoo:client:EndOftattoIsaccept",
			args = {["price"] = data.db.Price, ["Collection"] = data.db.Collection, ["HashNameFemale"] = data.db.HashNameFemale, ["HashNameMale"] = data.db.HashNameMale, ["name"] = data.db.Name},
		}
	}

	if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
		DrawTattoo(data.db.Collection, data.db.HashNameMale)
	else
		DrawTattoo(data.db.Collection, data.db.HashNameFemale)
	end
	exports[Config.TriggerName..'menu']:openMenu(Tattoshoppriceended)
end)

local cameraname = 1
RegisterNetEvent(Config.TriggerName..'tatto:client:changecamera', function(data)
	for k, v in pairs(Config.TattooCats) do
		if v[1] == data then
			if not DoesCamExist(cam) then
				cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
				SetCamActive(cam, true)
				RenderScriptCams(true, false, 0, true, true)
				StopCamShaking(cam, true)
			end
			if cameraname == 4 then
				cameraname = 1
			else
				cameraname = cameraname + 1
			end
			if GetCamCoord(cam) ~= GetOffsetFromEntityInWorldCoords(PlayerPedId(), v[3][cameraname]) then
				SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), v[3][cameraname]))
				PointCamAtCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), v[4]))
			end
		end
	end
	exports[Config.TriggerName..'menu']:openMenu(Tattoshoppriceended)
end)

RegisterNetEvent(Config.TriggerName..'tattoo:client:EndOftattoIsaccept', function(data)
	if DoesCamExist(cam) then
		DetachCam(cam)
		SetCamActive(cam, false)
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end
	if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
		BuyTattoo(data.Collection, data.HashNameMale, data.name, data.price)
	else
		BuyTattoo(data.Collection, data.HashNameFemale, data.name, data.price)
	end
end)

RegisterNetEvent(Config.TriggerName..'tatto:client:gobacktattolist', function()
	if DoesCamExist(cam) then
		DetachCam(cam)
		SetCamActive(cam, false)
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end
	refreshTattoos()
	exports[Config.TriggerName..'menu']:openMenu(Tattoshopprice)
end)

RegisterNetEvent(Config.TriggerName..'tatto:client:Removing', function()
	if DoesCamExist(cam) then
		DetachCam(cam)
		SetCamActive(cam, false)
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end
	GetNaked()
	exports[Config.TriggerName..'menu']:openMenu(Tattoshopprice)
end)

RegisterNetEvent(Config.TriggerName..'tatto:client:Wear', function()
	if DoesCamExist(cam) then
		DetachCam(cam)
		SetCamActive(cam, false)
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end
	ResetSkin2()
	exports[Config.TriggerName..'menu']:openMenu(Tattoshopprice)
end)

RegisterNetEvent(Config.TriggerName..'tattoo:client:OpenTattooMenu', function(data)
	Tattoshopprice = {
		{
			header = "Tattoos for "..data[2],
			isMenuHeader = true
		},
		{
            header = '< Go Back',
            params = {
                event = Config.TriggerName..'tatto:client:GoToMeno'
            }
        },
		{
            header = '✖ Removing clothes',
            params = {
                event = Config.TriggerName..'tatto:client:Removing'
            }
        },
		{
            header = '♻ Wear clothes',
            params = {
                event = Config.TriggerName..'tatto:client:Wear'
            }
        },
	}
	for _, tattoo in pairs(Config.AllTattooList) do
		if tattoo.Zone == data[1] then
			if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
				if tattoo.HashNameMale ~= '' then
					for k, v in pairs(currentTattoos) do
						if v.nameHash == tattoo.HashNameMale then
							Tattoshopprice[#Tattoshopprice+1] = {
								header = "[✔] "..GetLabelText(tattoo.Name).." (Already have)",
								txt = "Select for forced remove",
								params = {
									event = Config.TriggerName.."tattoo:client:deletetattoo",
									args = {db = tattoo, db2 = data},
								}
							}
							break
						end
					end
					Tattoshopprice[#Tattoshopprice+1] = {
						header = "["..(#Tattoshopprice+1).."] "..GetLabelText(tattoo.Name),
						txt = "$"..tattoo.Price,
						params = {
							event = Config.TriggerName.."tattoo:client:SetaCameraForSell",
							args = {db = tattoo, db2 = data},
						}
					}
				end
			else
				if tattoo.HashNameFemale ~= '' then
					for k, v in pairs(currentTattoos) do
						if v.nameHash == tattoo.HashNameFemale then
							Tattoshopprice[#Tattoshopprice+1] = {
								header = "[✔] "..GetLabelText(tattoo.Name).." (Already have)",
								txt = "Select for forced remove",
								params = {
									event = Config.TriggerName.."tattoo:client:deletetattoo",
									args = {db = tattoo, db2 = data},
								}
							}
							break
						end
					end
					Tattoshopprice[#Tattoshopprice+1] = {
						header = "["..(#Tattoshopprice+1).."] "..GetLabelText(tattoo.Name),
						txt = "$"..tattoo.Price,
						params = {
							event = Config.TriggerName.."tattoo:client:SetaCameraForSell",
							args = {db = tattoo, db2 = data},
						}
					}
				end
			end
		end
	end

	Tattoshopprice[#Tattoshopprice+1] = {
		header = "⬅ Leave Tatto Shop",
		txt = "",
		params = {
			event = Config.TriggerName.."menu:closeMenu",
		}
	}
	exports[Config.TriggerName..'menu']:openMenu(Tattoshopprice)
end)

RegisterNetEvent(Config.TriggerName..'tattoo:client:deletetattoo', function(data)
	refreshTattoos()
	Wait(100)
	if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
		RemoveTattoo(data.db.HashNameMale, data.db.Name)
	else
		RemoveTattoo(data.db.HashNameFemale, data.db.Name)
	end
end)

RegisterNetEvent(Config.TriggerName..'tattoo:server:settattos', function()
	refreshTattoos()
end)

RegisterNetEvent(Config.TriggerName..'tatto:client:GoToMeno', function(data)
	refreshTattoos()
	if DoesCamExist(cam) then
		DetachCam(cam)
		SetCamActive(cam, false)
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end

	local Tattoshoplocal = {
		{
			header = "Tattoo Shop",
			isMenuHeader = true
		},
	}
	for k, v in pairs(Config.TattooCats) do
		Tattoshoplocal[#Tattoshoplocal+1] = {
			header = v[2],
			txt = "Tattoo for "..v[2],
			params = {
				event = Config.TriggerName.."tattoo:client:OpenTattooMenu",
				args = v,
			}
		}
	end

	Tattoshoplocal[#Tattoshoplocal+1] = {
		header = "⬅ Leave Tatto Shop",
		txt = "",
		params = {
			event = Config.TriggerName.."menu:closeMenu",
		}
	}
	exports[Config.TriggerName..'menu']:openMenu(Tattoshoplocal)
end)


local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local inRange = false
            for k, v in pairs(Config.Shops) do
                local dist = #(pos - v)
                if dist < 15 then
					DrawMarker(2, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
					if dist < 2 then
						DrawText3Ds(v[1], v[2], v[3], '~g~E~w~ - Tattoo')
						if IsControlJustPressed(0, 38) then -- E
							TriggerEvent(Config.TriggerName..'tatto:client:GoToMeno')
						end
					end
					inRange = true
				end
            end
            if not inRange then
                Wait(2000)
            end
		else
			Wait(2000)
        end
        Wait(3)
    end
end)