local QBCore = exports['qb-core']:GetCoreObject()
local trunkBusy = {}

RegisterNetEvent('indigo-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('indigo-radialmenu:trunk:client:Door', -1, plate, door, open)
end)

RegisterNetEvent('indigo-trunk:server:setTrunkBusy', function(plate, busy)
    trunkBusy[plate] = busy
end)

RegisterNetEvent('indigo-trunk:server:KidnapTrunk', function(targetId, closestVehicle)
    TriggerClientEvent('indigo-trunk:client:KidnapGetIn', targetId, closestVehicle)
end)

QBCore.Functions.CreateCallback('indigo-trunk:server:getTrunkBusy', function(_, cb, plate)
    if trunkBusy[plate] then cb(true) return end
    cb(false)
end)

QBCore.Commands.Add("getintrunk", Lang:t("general.getintrunk_command_desc"), {}, false, function(source)
    TriggerClientEvent('indigo-trunk:client:GetIn', source)
end)

QBCore.Commands.Add("putintrunk", Lang:t("general.putintrunk_command_desc"), {}, false, function(source)
    TriggerClientEvent('indigo-trunk:server:KidnapTrunk', source)
end)