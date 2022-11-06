local QBCore = exports['qb-core']:GetCoreObject()
local VehicleNitrous = {}

QBCore.Functions.CreateCallback('nos:GetNosLoadedVehs', function(_, cb)
  cb(VehicleNitrous)
end)

QBCore.Functions.CreateUseableItem("nitrous", function(source)
  TriggerClientEvent('smallresource:client:LoadNitrous', source)
end)

RegisterNetEvent('nitrous:server:LoadNitrous', function(Plate)
  TriggerClientEvent('nitrous:client:LoadNitrous', -1, Plate)
end)

RegisterNetEvent('nitrous:server:SyncFlames', function(netId)
  TriggerClientEvent('nitrous:client:SyncFlames', -1, netId, source)
end)

RegisterNetEvent('nitrous:server:UnloadNitrous', function(Plate)
  TriggerClientEvent('nitrous:client:UnloadNitrous', -1, Plate)
end)

RegisterNetEvent('nitrous:server:UpdateNitroLevel', function(Plate, level)
  TriggerClientEvent('nitrous:client:UpdateNitroLevel', -1, Plate, level)
end)

RegisterNetEvent('nitrous:server:StopSync', function(plate)
  TriggerClientEvent('nitrous:client:StopSync', -1, plate)
end)

RegisterNetEvent('nitro:__sync')
AddEventHandler('nitro:__sync', function (purgeEnabled, lastVehicle)
  -- Fix for source reference being lost during loop below.
  local source = source

  for _, player in ipairs(GetPlayers()) do
    if player ~= tostring(source) then
      TriggerClientEvent('nitro:__update', player, source, purgeEnabled, lastVehicle)
    end
  end
end)