local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('indigo-spawn:server:getOwnedHouses', function(_, cb, cid)
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

-- QBCore#4011 -- discord.gg/qbcoreframework -- Only Buy From Here