Config = {}
Config.Keys={['ESC']=322,['F1']=288,['F2']=289,['F3']=170,['F5']=166,['F6']=167,['F7']=168,['F8']=169,['F9']=56,['F10']=57,['~']=243,['1']=157,['2']=158,['3']=160,['4']=164,['5']=165,['6']=159,['7']=161,['8']=162,['9']=163,['-']=84,['=']=83,['BACKSPACE']=177,['TAB']=37,['Q']=44,['W']=32,['E']=38,['R']=45,['T']=245,['Y']=246,['U']=303,['P']=199,['[']=39,[']']=40,['ENTER']=18,['CAPS']=137,['A']=34,['S']=8,['D']=9,['F']=23,['G']=47,['H']=74,['K']=311,['L']=182,['LEFTSHIFT']=21,['Z']=20,['X']=73,['C']=26,['V']=0,['B']=29,['N']=249,['M']=244,[',']=82,['.']=81,['LEFTCTRL']=36,['LEFTALT']=19,['SPACE']=22,['RIGHTCTRL']=70,['HOME']=213,['PAGEUP']=10,['PAGEDOWN']=11,['DELETE']=178,['LEFTARROW']=174,['RIGHTARROW']=175,['TOP']=27,['DOWNARROW']=173,['NENTER']=201,['N4']=108,['N5']=60,['N6']=107,['N+']=96,['N-']=97,['N7']=117,['N8']=61,['N9']=118,['UPARROW']=172,['INSERT']=121}
function L(cd) if Locales[Config.Language][cd] then return Locales[Config.Language][cd] else print('Locale is nil ('..cd..')') end end
--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


Config.Framework = 'qbcore' ---[ 'esx' / 'qbcore' / 'standalone' / 'other' ] Choose your framework.
Config.Language = 'EN' --[ 'EN' ] You can add your own locales to the Locales.lua. But make sure to add it here.

Config.FrameworkTriggers = { --You can change the esx/qbcore events (IF NEEDED).
    main = 'QBCore:GetObject',   --ESX = 'esx:getSharedObject'   QBCORE = 'QBCore:GetObject'
    load = 'QBCore:Client:OnPlayerLoaded',      --ESX = 'esx:playerLoaded'      QBCORE = 'QBCore:Client:OnPlayerLoaded'
    job = 'QBCore:Client:OnJobUpdate',             --ESX = 'esx:setJob'            QBCORE = 'QBCore:Client:OnJobUpdate'
	resource_name = 'qb-core'   --ESX = 'es_extended'           QBCORE = 'qb-core'
}


--██╗███╗   ███╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ███╗   ██╗████████╗
--██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗████╗  ██║╚══██╔══╝
--██║██╔████╔██║██████╔╝██║   ██║██████╔╝   ██║   ███████║██╔██╗ ██║   ██║   
--██║██║╚██╔╝██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║╚██╗██║   ██║   
--██║██║ ╚═╝ ██║██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║ ╚████║   ██║   
--╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝


Config.Debug = false --To enable debug prints.


--███╗   ███╗ █████╗ ██╗███╗   ██╗
--████╗ ████║██╔══██╗██║████╗  ██║
--██╔████╔██║███████║██║██╔██╗ ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝


Config.KeySpam = {
    key_change_interval = 5, --(in seconds) How often do you want the key you spam to change?

    Keys = { --The list of possible keys to press.
        [1] = {key = Config.Keys['E'], label = 'E'},
        [2] = {key = Config.Keys['W'], label = 'W'},
        [3] = {key = Config.Keys['A'], label = 'A'},
        [4] = {key = Config.Keys['S'], label = 'S'},
        [5] = {key = Config.Keys['D'], label = 'D'},
        [6] = {key = Config.Keys['SPACE'], label = 'SPACE'},
        --[7] = {key = Config.Keys['CHANGEME'], label = 'CHANGEME'},
    }
}

Config.UISettings = { --The configurable settings for the countdown, victory and defeat UI's.
    Countdown = {
        start = 3, --The number from which the countdown will start
        end_ = 1, --The number after which the UI will display "GO" and close.
        volume = 0.2 --(0.01-1.0) The volume.
    },

    Victory = {
        fire_interval = 1000, --(in miliseconds) Fires confetti after a win every x miliseconds.
        stop_confetti = 3000, --(in miliseconds) Stops confetti after a win after x miliseconds
        close_after = 5000, --(in miliseconds) Closes the UI after a win after x miliseconds.
        volume = 0.2 --(0.01-1.0) The volume.
    },

    Defeat = {
        close_after = 5000, --(in miliseconds) Closes the UI after a win after x miliseconds.
        volume = 0.2 --(0.01-1.0) The volume.
    }
}

Config.AvailableTables = { --A list of all available arm wrestling tables that can be spawned and used.
    [1] = `prop_arm_wrestle_01`,
    [2] = `bkr_prop_clubhouse_arm_wrestle_01a`,
    [3] = `bkr_prop_clubhouse_arm_wrestle_02a`,
    --[4] = `ADD_MORE_HERE`,
}

Config.DisabledControls = { --A list of keys which are disabled while you are in a game.
    23,32,33,34,35,37,63,64,71,72,75,246
}


-- ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗     █████╗ ███╗   ██╗██████╗     ██╗   ██╗███████╗ █████╗ ██████╗ ██╗     ███████╗    ██╗████████╗███████╗███╗   ███╗███████╗
--██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██║   ██║██╔════╝██╔══██╗██╔══██╗██║     ██╔════╝    ██║╚══██╔══╝██╔════╝████╗ ████║██╔════╝
--██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗    ███████║██╔██╗ ██║██║  ██║    ██║   ██║███████╗███████║██████╔╝██║     █████╗      ██║   ██║   █████╗  ██╔████╔██║███████╗
--██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║   ██║╚════██║██╔══██║██╔══██╗██║     ██╔══╝      ██║   ██║   ██╔══╝  ██║╚██╔╝██║╚════██║
--╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╔╝███████║██║  ██║██████╔╝███████╗███████╗    ██║   ██║   ███████╗██║ ╚═╝ ██║███████║
-- ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝    ╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝╚══════╝
                                                                                                                                                                                      

Config.SpawnTable = {
	ChatCommand = {
		ENABLE = true, --Do you want to allow players to spawn the table prop with a chat command? (no usable items required).
		command = 'armwrestling_table', --Customise the chat command.
	},

	UsableItem = { --ESX/QBCORE ONLY.
		ENABLE = true, --Do you want to allow players to spawn the arm wrestling table prop with a usable item?
    	item_name = 'armwrestling_table',
	}
}

Config.DeleteTable = {
    ENABLE = true, --Do you want to allow players to delete the closest arm wrestling table prop with a chat command?
    command = 'armwrestling_delete',
}


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


function Round(cd) return math.floor(cd+0.5) end
function Trim(cd) return cd:gsub('%s+', '') end

if Config.Framework == 'standalone' then
    Config.SpawnTable.UsableItem.ENABLE = false
    print('^3Config.SpawnTableUsableItem.ENABLE has been disabled because you have chosen the Standalone framework option.^0')
end