local QBCore = exports['indigo-core']:GetCoreObject()

RegisterNUICallback('GetAvailableTaxiDrivers', function(_, cb)
    QBCore.Functions.TriggerCallback('indigo-phone:server:GetAvailableTaxiDrivers', function(drivers)
        cb(drivers)
    end)
end)