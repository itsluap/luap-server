-----------------------
----   Variables   ----
-----------------------
local QBCore = exports['indigo-core']:GetCoreObject()
local scenes = {}

-----------------------
----   Threads     ----
-----------------------

CreateThread(function()
    UpdateAllScenes()
    while true do
        DeleteExpiredScenes()
        Wait(Config.AuditInterval)
    end
end)

-----------------------
---- Server Events ----
-----------------------

QBCore.Functions.CreateCallback('indigo-scenes:server:GetScenes', function(_, cb)
    cb(scenes)
end)

-----------------------
----   Functions   ----
-----------------------

function UpdateAllScenes()
    scenes = {}
    MySQL.Async.fetchAll('SELECT * FROM scenes', {}, function(result)
        if result[1] then
            for _, v in pairs(result) do
                local newCoords = json.decode(v.coords)
                scenes[#scenes+1] = {
                    id = v.id,
                    text = v.text,
                    color = v.color,
                    viewdistance = v.viewdistance,
                    expiration = v.expiration,
                    fontsize = v.fontsize,
                    fontstyle = v.fontstyle,
                    coords = vector3(newCoords.x, newCoords.y, newCoords.z),
                }
            end
        end
        TriggerClientEvent('indigo-scenes:client:UpdateAllScenes', -1, scenes)
    end)
end

function DeleteExpiredScenes()
    MySQL.Async.execute('DELETE FROM scenes WHERE date_deletion < NOW()', {}, function(result)
        if result > 0 then
            print('Deleted '..result..' expired scenes from the database.')
            UpdateAllScenes()
        end
    end)
end

RegisterNetEvent('indigo-scenes:server:DeleteScene', function(id)
    MySQL.Async.execute('DELETE FROM scenes WHERE id = ?', {id}, function()
        UpdateAllScenes()
    end)
end)

RegisterNetEvent('indigo-scenes:server:CreateScene', function(sceneData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    TriggerEvent("qb-log:server:CreateLog", "scenes", "New Scene Created", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) created a new scene; scene: **"..sceneData.text.."**, where: **" .. sceneData.coords .. "**")

    MySQL.Async.insert('INSERT INTO scenes (creator, text, color, viewdistance, expiration, fontsize, fontstyle, coords, date_creation, date_deletion) VALUES (? ,?, ?, ?, ?, ?, ?, ?, NOW(), DATE_ADD(NOW(), INTERVAL ? HOUR))', {
        Player.PlayerData.citizenid,
        sceneData.text,
        sceneData.color,
        sceneData.viewdistance,
        sceneData.expiration,
        sceneData.fontsize,
        sceneData.fontstyle,
        json.encode(sceneData.coords),
        sceneData.expiration
    }, function()
        UpdateAllScenes()
    end)
end)

-- commands --

QBCore.Commands.Add('createscene','', {}, false, function(source)
    local src = source
    TriggerClientEvent('indigo-scenes:createscene', src)
end, 'admin')


QBCore.Commands.Add('deletescene','', {}, false, function(source)
    local src = source
    TriggerClientEvent('indigo-scenes:deletescene', src)
end, 'admin')