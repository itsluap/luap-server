local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-spawn:server:getOwnedHouses', function(_, cb, cid)
    if cid ~= nil then
        local houses = MySQL.query.await('SELECT * FROM properties WHERE owner_citizenid = ?', {cid})
        if houses[1] ~= nil then
            cb(houses)
        else
            cb({})
        end
    else
        cb({})
    end
end)

QBCore.Functions.CreateCallback('indigo-spawn:server:getOwnedApartments', function(_, cb, cid)
    if cid ~= nil then
        local apartments = MySQL.query.await('SELECT * FROM apartments WHERE citizenid = ?', {cid})
        if apartments[1] ~= nil then
            print(json.encode(apartments))
            cb(apartments)
        else
            cb({})
        end
    else
        cb({})
    end
end)
