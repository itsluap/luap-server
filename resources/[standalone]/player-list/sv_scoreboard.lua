local QBCore = exports['qb-core']:GetCoreObject() 

local ST = ST or {}
ST.Scoreboard = {}
ST._Scoreboard = {}
ST._Scoreboard.PlayersS = {}
ST._Scoreboard.RecentS = {}


QBCore.Functions.CreateCallback('shitidk', function(source, cb)
    local group = QBCore.Functions.GetPermission(source)
    cb(group)
end)

RegisterServerEvent('qb-score:AddPlayer')
AddEventHandler("qb-score:AddPlayer", function()

    local identifiers, discordIdentifier = GetPlayerIdentifiers(source)
    for _, v in pairs(identifiers) do
        if string.find(v, "discord") then
            discordIdentifier = v
            break
        end
    end

    --local stid = HexIdToSteamId(discordIdentifier)
    local ply = GetPlayerName(source)
    local scomid = discordIdentifier:gsub("discord:", "")
    local data = { src = source, discordid = discordIdentifier, comid = scomid, name = ply }

    TriggerClientEvent("qb-score:AddPlayer", -1, data )
    ST.Scoreboard.AddAllPlayers()
end)

function ST.Scoreboard.AddAllPlayers(self)
    local xPlayers   = QBCore.Functions.GetPlayers()

    for i=1, #xPlayers, 1 do
        
        local identifiers, discordIdentifier = GetPlayerIdentifiers(xPlayers[i])
        for _, v in pairs(identifiers) do
            if string.find(v, "discord") then
                discordIdentifier = v
                break
            end
        end

        --local stid = HexIdToSteamId(discordIdentifier)
        local ply = GetPlayerName(xPlayers[i])
        local scomid = discordIdentifier:gsub("discord:", "")
        local data = { src = xPlayers[i], discordid = discordIdentifier, comid = scomid, name = ply }

        TriggerClientEvent("qb-score:AddAllPlayers", source, data, recentData)

    end
end

function ST.Scoreboard.AddPlayerS(self, data)
    ST._Scoreboard.PlayersS[data.src] = data
end

AddEventHandler("playerDropped", function()
	local identifiers, discordIdentifier = GetPlayerIdentifiers(source)
    for _, v in pairs(identifiers) do
        if string.find(v, "discord") then
            discordIdentifier = v
            break
        end
    end

    --local stid = HexIdToSteamId(discordIdentifier)
    local ply = GetPlayerName(source)
    local scomid = discordIdentifier:gsub("discord:", "")
    local plyid = source
    local data = { src = source, discordid = discordIdentifier, comid = scomid, name = ply }

    TriggerClientEvent("qb-score:RemovePlayer", -1, data )
    Wait(600000)
    TriggerClientEvent("qb-score:RemoveRecent", -1, plyid)
end)

--[[
function ST.Scoreboard.RemovePlayerS(self, data)
    ST._Scoreboard.RecentS = data
end

function ST.Scoreboard.RemoveRecentS(self, src)
    ST._Scoreboard.RecentS.src = nil
end

function HexIdToSteamId(hexId)
    local cid = math.floor(tonumber(string.sub(hexId, 7), 16))
	local steam64 = math.floor(tonumber(string.sub( cid, 2)))
	local a = steam64 % 2 == 0 and 0 or 1
	local b = math.floor(math.abs(6561197960265728 - steam64 - a) / 2)
	local sid = "STEAM_0:"..a..":"..(a == 1 and b -1 or b)
    return sid
end
]]--