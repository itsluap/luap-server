--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX, QBCore, vRP = nil, nil, nil

if Config.Framework == 'esx' then
    TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
    if ESX == nil then
        ESX = exports[Config.FrameworkTriggers.resource_name]:getSharedObject()
    end

elseif Config.Framework == 'qbcore' then
    TriggerEvent(Config.FrameworkTriggers.main, function(obj) QBCore = obj end)
    if QBCore == nil then
        QBCore = exports[Config.FrameworkTriggers.resource_name]:GetCoreObject()
    end

elseif Config.Framework == 'vrp' then
    local Proxy = module('vrp', 'lib/Proxy')
    vRP = Proxy.getInterface('vRP')
    
elseif Config.Framework == 'other' then
    --Add your own code here.
end

function CheckAdminPerms(source)
    local result = false

    if Config.AdminAccess.Framework.ENABLE then
        if Config.Framework == 'esx' then 
            local perms = ESX.GetPlayerFromId(source).getGroup()
            for c, d in pairs(Config.AdminAccess.Framework[Config.Framework]) do
                if perms == d then
                    result = true
                end
            end
        
        elseif Config.Framework == 'qbcore' then
            local perms = QBCore.Functions.GetPermission(source)
            for c, d in pairs(Config.AdminAccess.Framework[Config.Framework]) do
                if type(perms) == 'string' then
                    if perms == d then
                        result = true
                    end
                elseif type(perms) == 'table' then
                    if perms[d] then
                        result = true
                    end
                end
            end

        elseif Config.Framework == 'vrp' then
            local perms = vRP.getUserAdminLevel(vRP.getUserId({source}))
            for c, d in pairs(Config.AdminAccess.Framework[Config.Framework]) do
                if perms == d then
                    result = true
                end
            end

        elseif Config.Framework == 'other' then
            --Add your own permissions check here (boolean).
            result = true
            
        end
    end

    if Config.AdminAccess.Identifiers.ENABLE then
        result = PermsCheck_Identifiers(source, Config.AdminAccess.Identifiers.identifier_list)
    end

    if Config.AdminAccess.AcePerms.ENABLE then
        result = PermsCheck_AcePerms(source, Config.AdminAccess.AcePerms.aceperms_list)
    end

    if Config.AdminAccess.Discord.ENABLE then
        result = PermsCheck_Discord(source, Config.AdminAccess.Discord.discord_list)
    end

    return result
end

function CheckDoorPerms_Standalone(source, door_perms_data)
    local result = false

    if Config.DoorAccessPerms.Identifiers and door_perms_data.identifier and #door_perms_data.identifier > 0 then
        result = PermsCheck_Identifiers(source, door_perms_data.identifier)

    elseif Config.DoorAccessPerms.AcePerms and door_perms_data.ace and #door_perms_data.ace > 0 then
        result = PermsCheck_AcePerms(source, door_perms_data.ace)

    elseif Config.DoorAccessPerms.Discord and door_perms_data.discord and #door_perms_data.discord > 0 then
        result = PermsCheck_Discord(source, door_perms_data.discord)
    end

    return result
end

function CheckDoorPerms_Vrp(source, door_perms_data)
    local user_id = vRP.getUserId(source)
    for c, d in pairs(door_perms_data) do
        if vRP.getUserFaction(user_id) == d.name and vRP.getFactionRank(faction) >= d.grade then
            return true
        end
    end
    return false
end

function CheckDoorPerms_Ace(source, data)
    local temp_table = {}
    for c, d in pairs(data) do
        if IsPlayerAceAllowed(source, d) then
            temp_table[#temp_table+1] = d
        end
    end
    return temp_table
end

function GetDoorPerms_Standalone(source)
    local temp_table = {}

    if Config.DoorAccessPerms.Identifiers then
        temp_table.identifiers = GetAllStandaloneIdentifiers(source)
    end
    if Config.DoorAccessPerms.Discord then
        temp_table.discord = GetAllDiscordRoles(source)
    end

    return temp_table
end

function GetIdentifier(source)
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.identifier

    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        return xPlayer.PlayerData.citizenid

    elseif Config.Framework == 'vrp' then
        local user_id = vRP.getUserId({source})
        return user_id

    elseif Config.Framework == 'standalone' then
        return GetPlayerIdentifiers(source)[2]
        
    elseif Config.Framework == 'other' then
        return GetPlayerIdentifiers(source)[1] --return the players identifier here (string).

    end
end


--███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
--██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--█████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function GetAllStandaloneIdentifiers(source)
    local temp_table = {}
    for c, d in pairs(GetPlayerIdentifiers(source)) do
        temp_table[#temp_table+1] = {full = d, trimmed = d:sub(d:find(':')+1, #d)}
    end
    return temp_table
end
function PermsCheck_Identifiers(source, data)
    for c, d in pairs(data) do
        for cc, dd in pairs(GetAllStandaloneIdentifiers(source)) do
            if (dd.full == d:lower()) or (dd.trimmed == d:lower()) then
                return true
            end
        end
    end
    return false
end

function PermsCheck_AcePerms(source, data)
    for c, d in pairs(data) do
        if IsPlayerAceAllowed(source, d) then
            return true
        end
    end
    return false
end

function GetAllDiscordRoles(source)
    return exports.Badger_Discord_API:GetDiscordRoles(source)
end
function PermsCheck_Discord(source, data)
    local discord_roles = GetAllDiscordRoles(source)
    for c, d in pairs(data) do
        for cc, dd in pairs(discord_roles) do
            if d == dd then
                return true
            end
        end
    end
    return false
end


-- ██████╗ █████╗ ██╗     ██╗     ██████╗  █████╗  ██████╗██╗  ██╗███████╗
--██╔════╝██╔══██╗██║     ██║     ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔════╝
--██║     ███████║██║     ██║     ██████╔╝███████║██║     █████╔╝ ███████╗
--██║     ██╔══██║██║     ██║     ██╔══██╗██╔══██║██║     ██╔═██╗ ╚════██║
--╚██████╗██║  ██║███████╗███████╗██████╔╝██║  ██║╚██████╗██║  ██╗███████║
-- ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝


RegisterServerEvent('cd_doorlock:Callback')
AddEventHandler('cd_doorlock:Callback', function(id, action, data)
    local _source = source
    if action == 'check_admin_perms' then
        TriggerClientEvent('cd_doorlock:Callback', _source, id, CheckAdminPerms(_source))

    elseif action == 'get_door_perms_standalone' then
        TriggerClientEvent('cd_doorlock:Callback', _source, id, GetDoorPerms_Standalone(_source))

    elseif action == 'check_door_perms_standalone' then
        TriggerClientEvent('cd_doorlock:Callback', _source, id, CheckDoorPerms_Standalone(_source, data))

    elseif action == 'check_door_perms_vrp' then
        TriggerClientEvent('cd_doorlock:Callback', _source, id, CheckDoorPerms_Vrp(_source, data))

    elseif action == 'check_door_perms_ace' then
        TriggerClientEvent('cd_doorlock:Callback', _source, id, CheckDoorPerms_Ace(_source, data))

    end
end)


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(source, notif_type, message)
    if notif_type and message then
        if Config.NotificationType.server == 'esx' then
            TriggerClientEvent('esx:showNotification', source, message)
        
        elseif Config.NotificationType.server == 'qbcore' then
            if notif_type == 1 then
                TriggerClientEvent('QBCore:Notify', source, message, 'success')
            elseif notif_type == 2 then
                TriggerClientEvent('QBCore:Notify', source, message, 'primary')
            elseif notif_type == 3 then
                TriggerClientEvent('QBCore:Notify', source, message, 'error')
            end
        
        elseif Config.NotificationType.server == 'mythic_old' then
            if notif_type == 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert:custom', source, { type = 'success', text = message, length = 10000})
            elseif notif_type == 2 then
                TriggerClientEvent('mythic_notify:client:SendAlert:custom', source, { type = 'inform', text = message, length = 10000})
            elseif notif_type == 3 then
                TriggerClientEvent('mythic_notify:client:SendAlert:custom', source, { type = 'error', text = message, length = 10000})
            end

        elseif Config.NotificationType.server == 'mythic_new' then
            if notif_type == 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = message, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
            elseif notif_type == 2 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = message, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
            elseif notif_type == 3 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = message, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
            end

        elseif Config.NotificationType.client == 'chat' then
                TriggerClientEvent('chatMessage', source, message)

        elseif Config.NotificationType.server == 'other' then
            --add your own notification.

        end
    end
end


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


RegisterServerEvent('cd_doorlock:Debug')
AddEventHandler('cd_doorlock:Debug', function()
    local _source = source
    print('^6-----------------------^0')
    print('^1CODESIGN DEBUG^0')
    print(string.format('^6Identifier:^0 %s', GetIdentifier(_source)))
    TriggerClientEvent('table', _source, GetDoorPerms_Standalone(_source))
    print('^6-----------------------^0')
end)
