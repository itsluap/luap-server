Config = {}
function L(cd) if Locales[Config.Language][cd] then return Locales[Config.Language][cd] else print('Locale is nil ('..cd..')') end end
--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


Config.Framework = 'esx' ---[ 'esx' / 'qbcore' / 'vrp' / 'standalone' ] Choose your framework.
Config.Language = 'EN' --[ 'EN' ] You can add your own locales to the Locales.lua. But make sure to add it here.

Config.FrameworkTriggers = { --You can change the esx/qbcore events (IF NEEDED).
    main = 'esx:getSharedObject',   --ESX = 'esx:getSharedObject'   QBCORE = 'QBCore:GetObject'
    load = 'esx:playerLoaded',      --ESX = 'esx:playerLoaded'      QBCORE = 'QBCore:Client:OnPlayerLoaded'
    job = 'esx:setJob',             --ESX = 'esx:setJob'            QBCORE = 'QBCore:Client:OnJobUpdate'
	resource_name = 'es_extended'   --ESX = 'es_extended'           QBCORE = 'qb-core'
}

Config.NotificationType = { --[ 'esx' / 'qbcore' / 'mythic_old' / 'mythic_new' / 'chat' / 'other' ] Choose your notification script.
    server = 'esx',
    client = 'esx' 
}


--██╗███╗   ███╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ███╗   ██╗████████╗
--██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗████╗  ██║╚══██╔══╝
--██║██╔████╔██║██████╔╝██║   ██║██████╔╝   ██║   ███████║██╔██╗ ██║   ██║   
--██║██║╚██╔╝██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║╚██╗██║   ██║   
--██║██║ ╚═╝ ██║██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║ ╚████║   ██║   
--╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝


Config.Debug = false --To enable debug prints.
Config.UseDutySystem = false --Do you want to use your frameworks (esx/qbcore) built-in duty system?


--███╗   ███╗ █████╗ ██╗███╗   ██╗
--████╗ ████║██╔══██╗██║████╗  ██║
--██╔████╔██║███████║██║██╔██╗ ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝


Config.AdminAccess = { --A list of different methods where you can define which players have admin permissions to create/edit/delete/import doors on the in-game UI.
    Framework = { --Ignore this framework section if you dont use a framework.
        ['esx'] = {'superadmin', 'admin', },
        ['qbcore'] = {'god', 'admin', },
        ['vrp'] = {5, 6, 7, 8, 9, 10, },
        ['other'] = {'change_me', 'change_me', },
    },

    Identifiers = {
        ENABLE = false, --Do you want to allow players with specific identifiers to use the admin features?
        identifier_list = {'steam:xxxxx', 'license:xxxxx', 'fivem:xxxxx', }, --You can use a players steam, license or fivem id etc.
    },

    AcePerms = { 
        ENABLE = false, --Do you want to allow players with specific ace perms to use the admin features?
        aceperms_list = {'command', 'doorlock', }, --Make sure you have your ace perms configured correctly in your server.cfg.
    },

    Discord = { --This feature requires the Badger Discord API resource.
        ENABLE = false, --Do you want to allow players with specific discord roles in your discord to use the admin features?
        discord_list = {'758736678000082910', '758736678000082910', }, --You must put the role id from your discord here (https://www.itgeared.com/how-to-get-role-id-on-discord).
    }
}


Config.DoorAccessPerms = { --When creating/editing/importing doors, you always need to define which permission groups can lock/unlock these doors. Here you can choose which perms options are available to choose from on the in-game UI.
    Identifiers = true, --Do you want to allow your admins to add a players identifier to the door permissions? (license,steam,fivem etc)
    
    AcePerms = true, --Do you want to allow your admins to add ace perms to the door permissions?
    
    Discord = true --Do you want to allow your admins to add discord roles to the door permissions? This feature requires the Badger Discord API resource.
}


Config.DoorStateDisplay = {
    DrawTextUI = true, --Do you want doors to display the lock/unlock state via the built in draw text UI?

    Emojis = true, --Do you want doors to display the lock/unlock state via emojis?

    Draw3DText = false, --Do you want doors to display the lock/unlock state via draw 3d text UI?

    Notification = true --Do you want a notification to show after a door is locked/unlocked?
}


--██╗  ██╗███████╗██╗   ██╗███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--█████╔╝ █████╗   ╚████╔╝ ███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--██║  ██╗███████╗   ██║   ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
--╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


Config.OpenDoorMenu = {
    ENABLE = true, --Do you want to allow player's open the door lock UI?
    command = 'doorlockui', --The chat command.
}

Config.ToggleDoorLock = {
    ENABLE = true, --Do you want to allow player's to toggle door locks?
    command = 'doorlock', --The chat command.
    key = 'e', --The keypress.
}


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


function Round(cd) return math.floor(cd+0.5) end
function Trim(cd) return cd:gsub('%s+', '') end

--Dont change any of this below.
if Config.Framework == 'esx' or Config.Framework == 'qbcore' or Config.Framework == 'other' then
    Config.AdminAccess.Framework.ENABLE = true
else
    Config.AdminAccess.Framework.ENABLE = false
end

if Config.Framework == 'esx' or Config.Framework == 'qbcore' or Config.Framework == 'other' then
    Config.DoorAccessPerms.Framework = true
else
    Config.DoorAccessPerms.Framework = false
end

if GetResourceState('Badger_Discord_API') ~= 'started' then
    Config.AdminAccess.Discord.ENABLE = false
    Config.DoorAccessPerms.Discord = false
end