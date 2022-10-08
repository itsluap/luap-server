QBCore = exports['qb-core']:GetCoreObject()

local command_name = "bodybag"

local PlayerData = {}

local bodyBag = nil

local attached = false

function PutInBodybag()

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    deadCheck = IsEntityDead(playerPed)

    if deadCheck and not attached then
        SetEntityVisible(playerPed, false, false)
        
        RequestModel(xm_prop_body_bag)

        while not HasModelLoaded(xm_prop_body_bag) do
            Citizen.Wait(1)
        end

        bodyBag = CreateObject(Config.xm_prop_body_bag, playerCoords.x, playerCoords.y, playerCoords.z, true, true, true)

        AttachEntityToEntity(bodyBag, playerPed, 0, -0.2, 0.75, -0.2, 0.0, 0.0, 0.0, false, false, false, false, 20, false)
        attached = true

    end
end

RegisterNetEvent('bodybag:PutInBag')
AddEventHandler('bodybag:PutInBag', PutInBodybag)

-- bodybag command --

RegisterCommand(command_name, function(source, args, rawCommand)
    local player = QBCore.Functions.GetPlayerData()
    PlayerJob = player.job

    if PlayerJob.name == 'police' or PlayerJob.name == 'ambulance' then

        if args[1] and GetPlayerName(args[1]) ~= nil then

            local targetPed = GetPlayerPed(args[1])

            TriggerServerEvent('bodybag', GetPlayerServerId(targetPed))

        else 

            local closestPlayer, closestPlayerDist = QBCore.Functions.GetClosestPlayer()
            local targetPed = GetPlayerPed(closestPlayer)

            if closestPlayer ~= -1 and closestDistance <= 3.0 and IsEntityDead(targetPed) then

                TriggerServerEvent('bodybag', GetPlayerServerId(closestPlayer))
            else
                print("notification here")
            end
        
        end
    end

end, false)

-- remove bodybag if player is alive --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed = PlayerPedId()
        
        deadCheck = IsEntityDead(playerPed)

        if not deadCheck and attached then

            DetachEntity(playerPed, true, false)
            SetEntityVisible(playerPed, true, true)

            SetEntityAsMissionEntity(bodyBag, false, false)
            SetEntityVisible(bodybag, false)
            SetModelAsNoLongerNeeded(bodyBag)
            
            DeleteObject(bodyBag)
            DeleteEntity(bodyBag)

            bodyBag = nil
            attached = false

        end

        Citizen.Wait(Config.freq_bag_off)

    end
end)