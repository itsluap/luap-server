local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('indigo-whiteboard:changewhiteboard', function(url, room)
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.Locations[room] ~= nil and (Config.Locations[room].job == false or Player.PlayerData.job.name == Config.Locations[room].job) then
        Config.Locations[room].currentImage = url
        TriggerClientEvent('indigo-whiteboard:changewhiteboardcli', -1, url, room)
    end
end)

QBCore.Functions.CreateCallback('indigo-whiteboard:getCurrentImage', function(_, cb)
    local images = {}
    for k,v in pairs(Config.Locations) do
        images[k] = v.currentImage
    end
    cb(images)
end)