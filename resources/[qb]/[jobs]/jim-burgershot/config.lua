--print("^2Jim^7-^2Burgershot ^7v^42^7.^43^7.^47 ^7- ^2BurgerShot Job Script by Jimathy^7")

Config = {
	Debug = false,  -- True to show debug boxes and messages
	--https://i.imgur.com/NIFOsYf.jpeg
	--Info To load depends on chosen MLO's
	Lan = "en", -- Pick your language here

	MLO = "NP",     --use "LP" if you are using Smallo's burgershot MLO
					--use "GN" if you are using GNMods burgershot MLO
					--use "NP" if you are using NoPixels Paid burgershot MLO

	img = "ps-inventory/html/images/", -- Change this to your inventory's name and image folder (SET TO "" IF YOU HAVE DOUBLE IMAGES)
	JimShop = false, 		-- Enable this to use jim-shops for buying ingredients
	CheckMarks = true, -- If true this will show the player if they have the correct items to be able to craft the items

	Notify = "qb",

	--Simple Toy Reward Support
	RewardItem = "", --Set this to the name of an item eg "bento"
	RewardPool = { -- Set this to the list of items to be given out as random prizes when the item is used - can be more or less items in the list
		"",
		"",
		"",
	},
	Items = {
		label = "Storage",
		slots = 9,
		items = {
			{ name = 'burgerpatty', price = 8, amount = 200, info = {}, type = 'item', slot = 1, },
			{ name = 'potato', price = 2, amount = 200, info = {}, type = 'item', slot = 2, },
			{ name = 'onion', price = 3, amount = 200, info = {}, type = 'item', slot = 3, },
			{ name = 'frozennugget', price = 8, amount = 200, info = {}, type = 'item', slot = 4, },
			{ name = 'milk', price = 4, amount = 200, info = {}, type = 'item', slot = 5, },
			{ name = 'icecream', price = 6, amount = 200, info = {}, type = 'item', slot = 6, },
			{ name = 'burgerbun', price = 2, amount = 200, info = {}, type = 'item', slot = 7, },
			{ name = 'cheddar', price = 3, amount = 200, info = {}, type = 'item', slot = 8, },
			{ name = 'lettuce', price = 4, amount = 200, info = {}, type = 'item', slot = 9, },
		},
	},
	Locations = {
		{
			zoneEnable = true,
			job = "burgershot",
			label = "Burger Shot",
			zones = {
				vector2(-1153.6727294922, -892.29083251953),
				vector2(-1174.5604248047, -860.27191162109),
				vector2(-1217.4858398438, -889.26123046875),
				vector2(-1196.4073486328, -917.87731933594)
			},
			blip = vector3(-1186.11, -885.86, 13.97),
			blipcolor = 5,
			garage = { spawn = vector4(-1174.83, -901.84, 13.69, 299.8),
				out = vector4(-1163.26, -896.65, 14.05, 119.95),
				list = { "stalion2", "burrito3", } },
		},
	},
}
Crafting = {
	ChopBoard = {
		{ ['slicedonion'] = { ['onion'] = 1, },
			['amount'] = 3 },
		{ ['slicedpotato'] = { ['potato'] = 1, },
			['amount'] = 3 },
		{ ['chickenwrap'] = { ['shotnuggets'] = 1, ['lettuce'] = 1, } },
		{ ['cheesewrap'] = { ['cheddar'] = 1, ['lettuce'] = 1, } },
	},
	Fryer = {
		{ ['shotfries'] = { ['slicedpotato'] = 1, } },
		{ ['shotrings'] = { ['slicedonion'] = 1, } },
		{ ['shotnuggets'] = { ['frozennugget'] = 1, } },
	},
	Grill = {
		{ ['burgermeat'] = { ['burgerpatty'] = 1, } },
	},
	Prepare = {
		{ ['heartstopper'] = {
				['burgerbun'] = 1,
				['cheddar'] = 1,
				['lettuce'] = 1,
				['burgermeat'] = 1,
				['slicedonion'] = 1,
		} },
		{ ['bleeder'] = {
				['burgerbun'] = 1,
				['cheddar'] = 1,
				['lettuce'] = 1,
				['burgermeat'] = 1,
				['slicedonion'] = 1,
		} },
		{ ['torpedo'] = {
				['burgerbun'] = 1,
				['cheddar'] = 1,
				['lettuce'] = 1,
				['burgermeat'] = 1,
				['slicedonion'] = 1,
		} },
		{ ['meatfree'] = {
				['burgerbun'] = 1,
				['cheddar'] = 1,
				['lettuce'] = 1,
				['slicedonion'] = 1,
		} },
		{ ['moneyshot'] = {
				['burgerbun'] = 1,
				['cheddar'] = 1,
				['lettuce'] = 1,
				['burgermeat'] = 1,
				['slicedonion'] = 1,
		} },
	},
	Drink = {
		{ ['water_bottle'] = { } },
		{ ['bscoke'] = { } },
		{ ['bscoffee'] = { } },
		{ ['milkshake'] = { ['milk'] = 1, ['icecream'] = 1, } },
	},
	Donut = {
		{ ["rimjob"] = {} },
		{ ["creampie"] = {} },
	},
}

Config.Intercom = {
    ['Worker'] = vector3(-1192.00, -906.65, 14.09),
    ['Customer'] = vector3(-1204.79, -899.01, 13.30),
}

Loc = {}