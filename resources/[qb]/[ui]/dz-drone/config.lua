Config = {}

Config.Framework = "qbcore" -- Set you framework "qbcore" or "esx" or "" if you use standalone framework and use /drone 1 or 2 command to use the Drone
Config.QBCoreName = "qb-core" -- You QBCore script name must be correct to work (only if you use QBCore Framework)
Config.IsESXLegacy = false -- Set it true is you're using esx legacy (only if you use ESX Framework)

Config.Controls = { -- FiveM Controls: https://docs.fivem.net/docs/game-references/controls/
	Forward		= 32,	-- W for Qwerty / Z for Azerty
	Backward	= 33,	-- S
	Left		= 34,	-- A for Qwerty / Q for Azerty
	Right		= 35,	-- D
	Up			= 51,	-- E
	Down		= 52,	-- Q for Qwerty / A for Azerty
	Stop		= 22,	-- Space
	ZoomOut		= 16,	-- Mouse Scroll Whell Down
	ZoomIn		= 17,	-- Mouse Scroll Whell Up
	Nightvision	= 140,	-- R
	Heatvision	= 75,	-- F
	Spotlight	= 47,	-- G
	Scanner		= 24,	-- Left Mouse Button
	Cancel		= 200,	-- ESC
}

Config.Transition = {
	['direction']       	= 'Direction',
	['height']          	= 'Height',
	['camera']          	= 'Camera',
	['zoom']            	= 'Zoom',
	['nightvision']     	= 'Nightvision',
	['heatvision']      	= 'Heatvision',
	['spotlight']       	= 'Spotlight',
	['scan_player']     	= 'Scan Player',
	['cancel']          	= 'Cancel',
	['cant_use_drone']  	= 'You can\'t use the drone',
	
	['scan_searching']  	= 'Searching...',
	['scan_searching_db']	= 'Searching in database...',
	['scan_unknown']		= 'Unknown',
	['scan_not_recognized']	= 'Target cannot be recognized',
}