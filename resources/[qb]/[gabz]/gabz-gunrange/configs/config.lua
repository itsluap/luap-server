function L(cd) if Locales[Config.Language][cd] then return Locales[Config.Language][cd] else print('Locale is nil ('..cd..')') end end
--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


Config.Framework = 'qbcore' ---[ 'esx' / 'qbcore' / 'standalone' / 'other' ] Choose your framework.
Config.Language = 'EN' --[ 'EN' / 'NL' ] You can add your own locales to the Locales.lua. But make sure to add it here.

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


Config.Debug = {
    prints = true, --To enable debug prints.
    drawLines = false, --The outlines of the seperate ranges.
    outerLines = {
        ['LS'] = {
            front_left = vector3(12.22,-1091.27,29.9),
            front_right = vector3(20.81,-1094.38,29.9),
            rear_left = vector3(13.98,-1084.10,29.9),
            rear_right =  vector3(23.19,-1087.49,29.9),
        },
        ['SF'] = {
            front_left = vector3(824.89,-2168.94,29.9),
            front_right = vector3(815.67,-2169.01,29.9),
            rear_left = vector3(825.42,-2176.50,29.9),
            rear_right =  vector3(815.72,-2176.58,29.9),
        },
    }
}


--███╗   ███╗ █████╗ ██╗███╗   ██╗
--████╗ ████║██╔══██╗██║████╗  ██║
--██╔████╔██║███████║██║██╔██╗ ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝


Config.timeRange = 15 --(in seconds) How many seconds does the ranked shooting session last for?
Config.waitCooldown = 5 --(in seconds) How many seconds does the countdown last for?
Config.UsingGabzAmmunition = true --Do you use the cfx-gabz-ammunition map?


--██╗  ██╗███████╗██╗   ██╗███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--█████╔╝ █████╗   ╚████╔╝ ███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--██║  ██╗███████╗   ██║   ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
--╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


Config.MoveTarget = {
    ENABLE = true, --Do you want to allow player's to move the gunrange targets?
    command = 'gunrange_movetarget', --The chat command.
    description = L('command_movetarget'), --The chat command's description.
    key = 'i'
}

Config.PracticeMode = {
    ENABLE = true, --Do you want to allow player's to practise in a unranked gunrange session?
    command = 'gunrange_practice',
    description = L('command_practice'),
    key = 'u'
}

Config.Start = {
    ENABLE = true, --Do you want to allow player's to start a ranked gunrange session?
    command = 'gunrange_start',
    description = L('command_start'),
    key = 'o'
}

Config.ScoreBoard = {
    ENABLE = true, --Do you want to allow player's to view the scoreboard from ranked gunrange sessions?
    command ='gunrange_scoreboard',
    description = L('command_scoreboard')
}


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

function Round(cd) return math.floor(cd+0.5) end
function Trim(cd) return cd:gsub('%s+', '') end

if GetResourceState('cfx-gabz-ammunation') == 'started' then
    Config.UsingGabzMaps = true
else
    Config.UsingGabzMaps = false
end

if Config.UsingGabzMaps then
    for c, d in pairs(Config.gunRangeLocation) do
        d.enabled = true
    end
    for c, d in pairs(Config.CustomGunrange) do
        d.enabled = false
    end
else
    for c, d in pairs(Config.gunRangeLocation) do
        d.enabled = false
    end
    for c, d in pairs(Config.CustomGunrange) do
        d.enabled = true 
    end
end

Config.scoreCategory = { --⚠️PLEASE READ⚠️; DO NOT CHANGE THESE IF YOU DON'T KNOW WHAT YOUR DOING.
    [1] = {
        name='Special weapons',
        weaponList = {
            `weapon_stungun`,
            `weapon_flaregun`,
            `weapon_raypistol`,
        },
    },
    [2] = {
        name='Handguns',
        weaponList = {
            `weapon_appistol`,
            `weapon_combatpistol`,
            `weapon_doubleaction`,
            `weapon_heavypistol`,
            `weapon_revolver_mk2`,
            `weapon_revolver`,
            `weapon_pistol50`,
            `weapon_pistol_mk2`,
            `weapon_pistol`,
            `weapon_snspistol_mk2`,
            `weapon_snspistol`,
            `weapon_vintagepistol`,
            `weapon_marksmanpistol`
        },
    },
    [3] = {
        name='SMG',
        weaponList = {
            `weapon_machinepistol`,
            `weapon_microsmg`,
            `weapon_minismg`,
            `weapon_smg_mk2`,
            `weapon_smg`,
            `weapon_assaultsmg`
        }
    },
    [4] = {
        name='Snipers',
        weaponList = {
            `weapon_heavysniper_mk2`,
            `weapon_heavysniper`,
            `weapon_marksmanrifle_mk2`,
            `weapon_marksmanrifle`,
            `weapon_sniperrifle`,
            `weapon_musket`,
        }
    },
    [5] = {
        name='LMG',
        weaponList = {
            `weapon_mg`,
            `weapon_gusenberg`,
            `weapon_combatmg`,
            `weapon_combatmg_mk2`,
        }
    },
    [6] = {
        name='Assault Rifles',
        weaponList = {
            `weapon_advancedrifle`,
            `weapon_assaultrifle_mk2`,
            `weapon_bullpuprifle_mk2`,
            `weapon_bullpuprifle`,
            `weapon_carbinerifle_mk2`,
            `weapon_carbinerifle`,
            `weapon_compactrifle`,
            `weapon_specialcarbine_mk2`,
            `weapon_specialcarbine`,
            `weapon_assaultrifle`
        }
    },
    [7] = {
        name='Shotguns',
        weaponList = {
            `weapon_assaultshotgun`,
            `weapon_bullpupshotgun`,
            `weapon_dbshotgun`,
            `weapon_heavyshotgun`,
            `weapon_pumpshotgun`,
            `weapon_pumpshotgun_mk2`,
            `weapon_autoshotgun`,
            `weapon_sawnoffshotgun`
        }
    },
}

Config.Scoring = { --⚠️PLEASE READ⚠️; DO NOT CHANGE THESE IF YOU DON'T KNOW WHAT YOUR DOING.
    ['ammunation'] = {
        [1] = {
            points=10,
            name='headshot',
            location = {
                left = -3.525,
                right = 5.2223,
                topz = 56.0,
                botz = 48.009,
            }
        },
        [2] = {
            points=10,
            name='center',
            location = {
                left = -6.45,
                right = 7.15,
                topz = 6.605,
                botz = -9.99,
            }
        },
        [3] = {
            points = 9,
            name="inner1",
            location = {
                left = -13.754,
                right = 15.100,
                topz = 15.0644,
                botz = -16.569,
            }
        },
        [4] = {
            points = 8,
            name="inner2",
            location = {
                left = -20.5739,
                right = 22.2024,
                topz = 21.7667,
                botz = -23.907,
            }
        },
        [5] = {
            points = 7,
            name="inner3",
            location = {
                left = -29.8640,
                right = 29.318,
                topz = 31.62,
                botz = -31.794,
            }
        },
    },
    ['mrpd'] = {
        offsetSide = -15,
        offsetHeight = 82,
        [1] = {
            points=10,
            name='headshot',
            location = {
                left = 5.9655,
                right = -9.3481,
                topz = 42.9687,
                botz = 27.7698,
            }
        },
        [2] = {
            points=10,
            name='center',
            location = {
                left = 0.4235,
                right = -4.3249,
                topz = 5.8239,
                botz = -0.19013,
            }
        },
        [3] = {
            points = 9,
            name="inner1",
            location = {
                left = 4.512,
                right = -8.2006,
                topz = 12.9612,
                botz = -6.6121,
            }
        },
        [4] = {
            points = 8,
            name="inner2",
            location = {
                left = 8.5046,
                right = -11.1730,
                topz = 17.6636,
                botz = -11.26,
            }
        },
        [5] = {
            points = 7,
            name="inner3",
            location = {
                left = 11.6906,
                right = -14.9938,
                topz = 23.3333,
                botz = -16.7474,
            }
        },
    },
}
