local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('indigo-spawn:server:getOwnedHouses', function(_, cb, cid)
    if cid ~= nil then
        local houses = exports.oxmysql:executeSync('SELECT * FROM player_houses WHERE citizenid = ?', {cid})
        if houses[1] ~= nil then
            cb(houses)
        else
            cb(nil)
        end
    else
        cb(nil)
    end
end)

-- QBCore#4011 -- discord.gg/qbcoreframework -- Only Buy From Here