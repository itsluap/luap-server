Config = Config or {}

Config.DebugMode = false

Config.DefaultLength = 0.8
Config.DefaultWidth = 0.8
Config.DefaultHeading = 0
Config.DefaultMinMaxZ = 0.8

Config.Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config.FindKey = function(int)
	for k,v in pairs(Config.Keys) do
		if v == int then
			return k
		end
	end
end

Config = {
	Joint = {
		{ ['joint_whitewidow'] = { ['white_widow_bag'] = 1, ['rolling_paper_green'] = 1, } },
		{ ['joint_og_kush'] = { ['og_kush_bag'] = 1, ['rolling_paper_blue'] = 1, } },
		{ ['joint_amnesia'] = { ['amnesia_bag'] = 1, ['rolling_paper_yellow'] = 1, } },
		{ ['joint_ak47'] = { ['ak47_bag'] = 1, ['rolling_paper_red'] = 1, } },
		{ ['joint_skunk'] = { ['skunk_bag'] = 1, ['rolling_paper_orange'] = 1} },
		{ ['joint_purplehaze'] = { ['purple_haze_bag'] = 1, ['rolling_paper_purple'] = 1 } },
	},
	--[[
	Blunt = {
		{ ['joint_whitewidow'] = { ['white_widow_bag'] = 1, ['rolling_paper_green'] = 1, } },
		{ ['joint_og_kush'] = { ['og_kush_bag'] = 1, ['rolling_paper_blue'] = 1, } },
		{ ['joint_amnesia'] = { ['amnesia_bag'] = 1, ['rolling_paper_yellow'] = 1, } },
		{ ['joint_ak47'] = { ['ak47_bag'] = 1, ['rolling_paper_red'] = 1, } },
		{ ['joint_skunk'] = { ['skunk_bag'] = 1, ['rolling_paper_orange'] = 1} },
		{ ['joint_purplehaze'] = { ['purple_haze_bag'] = 1, ['rolling_paper_purple'] = 1 } },
	},
	},
	]]--
}

Config.RestockShop = {
    label = "Restock Shop",
    slots = 4,
    items = {
        [1] = {
            name = "weapon_pistol",
            price = 900,
            amount = 1100,
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_heavypistol",
            price = 11300,
            amount = 100,
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_pistol50",
            price = 11700,
            amount = 100,
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_appistol",
            price = 12200,
            amount = 100,
            type = "item",
            slot = 4,
        },
    }
}

Loc = {}