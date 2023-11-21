--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX, QBCore = nil, nil
JobData, GangData, on_duty = {}, {}, true

CreateThread(function()
    if Config.Framework == 'esx' then
        while ESX == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
            if ESX == nil then
                ESX = exports[Config.FrameworkTriggers.resource_name]:getSharedObject()
            end
            Wait(100)
        end
        JobData = ESX.PlayerData.job or {}
        if JobData.onDuty ~= nil and Config.UseDutySystem then on_duty = JobData.onDuty end 

        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function(xPlayer)
            JobData = xPlayer.job or {}
            if JobData.onDuty ~= nil and Config.UseDutySystem then on_duty = JobData.onDuty end
        end)

        RegisterNetEvent(Config.FrameworkTriggers.job)
        AddEventHandler(Config.FrameworkTriggers.job, function(job)
            JobData = job or {}
            if JobData.onDuty ~= nil and Config.UseDutySystem then on_duty = JobData.onDuty end
        end)  

    elseif Config.Framework == 'qbcore' then
        while QBCore == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) QBCore = obj end)
            if QBCore == nil then
                QBCore = exports[Config.FrameworkTriggers.resource_name]:GetCoreObject()
            end
            Wait(100)
        end
        JobData = QBCore.Functions.GetPlayerData().job or {}
        GangData = QBCore.Functions.GetPlayerData().gang or {}
        if #JobData > 0 and Config.UseDutySystem then on_duty = QBCore.Functions.GetPlayerData().job.onduty end

        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function()
            JobData = QBCore.Functions.GetPlayerData().job or {}
            GangData = QBCore.Functions.GetPlayerData().gang or {}
            if Config.UseDutySystem then
                on_duty = QBCore.Functions.GetPlayerData().job.onduty
            end
        end)

        RegisterNetEvent(Config.FrameworkTriggers.job)
        AddEventHandler(Config.FrameworkTriggers.job, function(JobInfo)
            JobData = JobInfo or {}
        end)

        RegisterNetEvent('QBCore:Client:SetDuty')
        AddEventHandler('QBCore:Client:SetDuty', function(boolean)
            if not Config.UseDutySystem then return end
            on_duty = boolean
        end)

        RegisterNetEvent('QBCore:Client:OnGangUpdate')
        AddEventHandler('QBCore:Client:OnGangUpdate', function(gang)
            GangData = gang
        end)

    elseif Config.Framework == 'other' then
        --add your framework code here.

    end

    while true do
        Wait(100)
        if NetworkIsSessionStarted() then
            TriggerServerEvent('cd_doorlock:PlayerLoaded')
            break
        end
    end
end)

function GetDoorPerms()
    local temp_table = {}

    if Config.DoorAccessPerms.Framework then
        if Config.Framework == 'esx' then
            while JobData.name == nil do Wait(0) end
            temp_table.job = {job_name = JobData.name, job_grade = JobData.grade}
        
        elseif Config.Framework == 'qbcore' then
            while JobData.name == nil do Wait(0) end
            while GangData.name == nil do Wait(0) end
            temp_table.job = {job_name = JobData.name, job_grade = JobData.grade.level, gang_name = GangData.name, gang_grade = GangData.grade.level}

        elseif Config.Framework == 'other' then
            temp_table.job = {job_name = 'unemployed', job_grade = 0} --return a players job name (string) and job grade (number).
        end
    end

    if Config.DoorAccessPerms.Identifiers or Config.DoorAccessPerms.Discord then
        local callback = Callback('get_door_perms_standalone')
        temp_table.identifier = callback.identifiers
        temp_table.discord = callback.discord
    end
    
    return temp_table
end

function CheckDoorPerms(door_perms_data)
    if Config.DoorAccessPerms.Framework then
        if Config.Framework == 'esx' then
            for c, d in pairs(door_perms_data.job) do
                if JobData.name == d.name and JobData.grade >= d.grade and on_duty then
                    return true
                end
            end
        
        elseif Config.Framework == 'qbcore' then
            for c, d in pairs(door_perms_data.job) do
                if (JobData.name == d.name and JobData.grade.level >= d.grade and on_duty) or (GangData.name == d.name and GangData.grade.level >= d.grade) then
                    return true
                end
            end

        elseif Config.Framework == 'vrp' then
            return Callback('check_door_perms_vrp', door_perms_data.job)

        elseif Config.Framework == 'other' then
            --add your own permissions check here (boolean).
            return true
            
        end
    end

    if Config.DoorAccessPerms.Identifiers or Config.DoorAccessPerms.AcePerms or Config.DoorAccessPerms.Discord then
        if door_perms_data.identifier or door_perms_data.ace_perms or door_perms_data.discord then
            return Callback('check_door_perms_standalone', door_perms_data)
        end
    end

    return false
end

function CheckAdminPerms()
    return Callback('check_admin_perms')
end


--██╗  ██╗███████╗██╗   ██╗███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--█████╔╝ █████╗   ╚████╔╝ ███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--██║  ██╗███████╗   ██║   ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
--╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


TriggerEvent('chat:addSuggestion', '/'..Config.OpenDoorMenu.command, L('command_opendoormenu'))
RegisterCommand(Config.OpenDoorMenu.command, function()
    TriggerEvent('cd_doorlock:OpenDoorLockMenu')
end)

RegisterKeyMapping(Config.ToggleDoorLock.command, L('command_toggledoorlock'), 'keyboard', Config.ToggleDoorLock.key)
TriggerEvent('chat:addSuggestion', '/'..Config.ToggleDoorLock.command, L('command_toggledoorlock'))
RegisterCommand(Config.ToggleDoorLock.command, function()
    TriggerEvent('cd_doorlock:ToggleDoorState')
end)


-- ██╗      ██████╗  ██████╗██╗  ██╗██████╗ ██╗ ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ 
-- ██║     ██╔═══██╗██╔════╝██║ ██╔╝██╔══██╗██║██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ 
-- ██║     ██║   ██║██║     █████╔╝ ██████╔╝██║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗
-- ██║     ██║   ██║██║     ██╔═██╗ ██╔═══╝ ██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║
-- ███████╗╚██████╔╝╚██████╗██║  ██╗██║     ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝
-- ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 


function StartLockpicking()
    local result = exports['cd_keymaster']:StartKeyMaster()
    return result --You must return a boolean (true or false).
end


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(notif_type, message)
    if notif_type and message then
        if Config.NotificationType.client == 'esx' then
            ESX.ShowNotification(message)
        
        elseif Config.NotificationType.client == 'qbcore' then
            if notif_type == 1 then
                QBCore.Functions.Notify(message, 'success')
            elseif notif_type == 2 then
                QBCore.Functions.Notify(message, 'primary')
            elseif notif_type == 3 then
                QBCore.Functions.Notify(message, 'error')
            end

        elseif Config.NotificationType.client == 'mythic_old' then
            if notif_type == 1 then
                exports['mythic_notify']:DoCustomHudText('success', message, 10000)
            elseif notif_type == 2 then
                exports['mythic_notify']:DoCustomHudText('inform', message, 10000)
            elseif notif_type == 3 then
                exports['mythic_notify']:DoCustomHudText('error', message, 10000)
            end

        elseif Config.NotificationType.client == 'mythic_new' then
            if notif_type == 1 then
                exports['mythic_notify']:SendAlert('success', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 2 then
                exports['mythic_notify']:SendAlert('inform', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 3 then
                exports['mythic_notify']:SendAlert('error', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            end

        elseif Config.NotificationType.client == 'chat' then
            TriggerEvent('chatMessage', message)
            
        elseif Config.NotificationType.client == 'other' then
            --add your own notification.
            
        end
    end
end

--██████╗ ███████╗██████╗ ██╗   ██╗ ██████╗ 
--██╔══██╗██╔════╝██╔══██╗██║   ██║██╔════╝ 
--██║  ██║█████╗  ██████╔╝██║   ██║██║  ███╗
--██║  ██║██╔══╝  ██╔══██╗██║   ██║██║   ██║
--██████╔╝███████╗██████╔╝╚██████╔╝╚██████╔╝
--╚═════╝ ╚══════╝╚═════╝  ╚═════╝  ╚═════╝ 


if Config.Debug then
    local function Debug()
        print('^6-----------------------^0')
        print('^1CODESIGN DEBUG^0')
        print(string.format('^6Resource Name:^0 %s', GetCurrentResourceName()))
        print(string.format('^6Framework:^0 %s', Config.Framework))
        print(string.format('^6Language:^0 %s', Config.Language))
        if Config.Framework == 'esx' then
            print(string.format('^6Job Name:^0 %s', JobData.name))
            print(string.format('^6Job Grade:^0 %s', JobData.grade))
        elseif Config.Framework == 'qbcore' then
            print(string.format('^6Job Name:^0 %s', JobData.name))
            print(string.format('^6Job Grade:^0 %s', JobData.grade.level))
            print(string.format('^6Gang Name:^0 %s', GangData.name))
            print(string.format('^6Gang Grade:^0 %s', GangData.grade.level))
        end
        print(string.format('^6Use Duty System:^0 %s', tostring(Config.UseDutySystem)))
        print(string.format('^6On Duty:^0 %s', tostring(on_duty)))
        print(string.format('^6Config.AdminAccess: [Framework: ^0%s^6] [Identifiers: ^0%s^6] [AcePerms: ^0%s^6] [Discord: ^0%s^6]', tostring(Config.AdminAccess.Framework.ENABLE), tostring(Config.AdminAccess.Identifiers.ENABLE), tostring(Config.AdminAccess.AcePerms.ENABLE), tostring(Config.AdminAccess.Discord.ENABLE)))
        print(string.format('^6Config.DoorAccessPerms: [Framework: ^0%s^6] [Identifiers: ^0%s^6] [AcePerms: ^0%s^6] [Discord: ^0%s^6]', tostring(Config.DoorAccessPerms.Framework), tostring(Config.DoorAccessPerms.Identifiers), tostring(Config.DoorAccessPerms.AcePerms), tostring(Config.DoorAccessPerms.Discord)))
        print(string.format('^6Admin Access:^0 %s', tostring(CheckAdminPerms())))
        print('^6-----------------------^0')
        TriggerServerEvent('cd_doorlock:Debug')
    end

    CreateThread(function()
        Wait(3000)
        Debug()
    end)

    RegisterCommand('debug_radar', function()
        Debug()
    end)
end
