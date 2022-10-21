local QBClassicBlackMarketPed

-- Remove ped model on resource stop.

local function RemoveTRPed()
    if DoesEntityExist(QBClassicBlackMarketPed) then
        DeletePed(QBClassicBlackMarketPed)
    end
end

AddEventHandler('onResourceStop', function(resourceName)
	if GetCurrentResourceName() == resourceName then
        RemoveTRPed()
	end
end)

-- Target and ped model

CreateThread(function()
    if Config.UseBlip then
        local BlackMarketBlip = AddBlipForCoord(Config.Location.Coords)
        SetBlipSprite (BlackMarketBlip, Config.Location.SetBlipSprite)
        SetBlipDisplay(BlackMarketBlip, Config.Location.SetBlipDisplay)
        SetBlipScale  (BlackMarketBlip, Config.Location.SetBlipScale)
        SetBlipAsShortRange(BlackMarketBlip, true)
        SetBlipColour(BlackMarketBlip, Config.Location.SetBlipColour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Location.BlipName)
        EndTextCommandSetBlipName(BlackMarketBlip)
    end
    local Coords = Config.Location.Coords
    local PedHash = Config.Location.ModelHash
    local PedModel = Config.Location.ModelName
    if not DoesEntityExist(QBClassicBlackMarketPed) then
        RequestModel( GetHashKey(PedModel) )
        while ( not HasModelLoaded( GetHashKey(PedModel) ) ) do
            Wait(1)
        end
        QBClassicBlackMarketPed = CreatePed(1, PedHash, Coords, false, true)
        FreezeEntityPosition(QBClassicBlackMarketPed, true)
        SetEntityInvincible(QBClassicBlackMarketPed, true)
        SetBlockingOfNonTemporaryEvents(QBClassicBlackMarketPed, true)
    end
    exports['qb-target']:AddTargetEntity(QBClassicBlackMarketPed, {
        options = {
            {
                num = 1,
                type = "client",
                event = "qb-blackmarket:OpenShop",
                label = Config.Text["TargetLabel"],
                icon = Config.Icons["Eyeicon"],
            }
        },
        distance = 1.5
    })
end)

-- qb-menu

RegisterNetEvent('qb-blackmarket:OpenShop', function()
    local BlackMarket = {
        {
            header = Config.Text['PedHeader'],
            isMenuHeader = true,
            icon = Config.Icons["Header"]
        },
        {
            header = Config.Text['Pistols'],
            icon = Config.Icons['Pistol'],
            params = {
                event = "qb-blackmarket:PistolShop",
            }
        },
        {
            header = Config.Text['SubMachineGuns'],
            icon = Config.Icons['SubMachineGuns'],
            params = {
                event = "qb-blackmarket:SubMachineGunsShop",
            }
        },
        {
            header = Config.Text['Shotguns'],
            icon = Config.Icons['Shotguns'],
            params = {
                event = "qb-blackmarket:ShotGunsShop",
            }
        },
        {
            header = Config.Text['AssaultWeapons'],
            icon = Config.Icons['AssaultWeapons'],
            params = {
                event = "qb-blackmarket:AssaultWeaponsShop",
            }
        },
        {
            header = Config.Text['Miscellanceous'],
            icon = Config.Icons['Miscellanceous'],
            params = {
                event = "qb-blackmarket:MiscellanceousShop",
            }
        },
    }
    exports['qb-menu']:openMenu(BlackMarket)
end)

-- BlackMarket Shop Event
RegisterNetEvent("qb-blackmarket:PistolShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.PistolShop)
end)

RegisterNetEvent("qb-blackmarket:SubMachineGunsShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.SubMachineGunShop)
end)

RegisterNetEvent("qb-blackmarket:ShotGunsShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.ShotGunShop)
end)

RegisterNetEvent("qb-blackmarket:AssaultWeaponsShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.AssaultWeaponsShop)
end)

RegisterNetEvent("qb-blackmarket:MiscellanceousShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.MiscellanceousShop)
end)
