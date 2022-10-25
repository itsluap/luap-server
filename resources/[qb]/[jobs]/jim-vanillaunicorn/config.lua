print("^2Jim^7-^2VanillaUnicorn ^7v^41^7.^46^7.^47 ^7- ^2Vanilla Unicorn Job Script by ^1Jimathy^7")

-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {
	Debug = false,  -- false to remove green boxes
	Lan = "en", -- Pick your language here

	img = "qb-inventory/html/images/", -- Change this to your inventory's name and image folder (SET TO "" IF YOU HAVE DOUBLE IMAGES)
	JimShop = false, -- Enable this to use jim-shops for buying ingredients
	CheckMarks = true, -- If true this will show the player if they have the correct items to be able to craft the items
	TipCost = 100, -- How much a Stripper Tip costs
	TipStress = 5, -- How much stress relief per tip
	Notify = "qb",

	MLO = "van",		--Set to "van" for the default interior
						--Set to "gabz" for Gabz VU interior

	Locations = {
		{
			zoneEnable = true,
			job = "vanilla",
			label = "Vanilla Unicorn",
			zones = {
				vector2(106.45397186279, -1340.5074462891),
				vector2(72.271331787109, -1276.0433349609),
				vector2(146.02534484863, -1265.64453125),
				vector2(164.9525604248, -1292.0209960938)
			},
			blip = vector3(111.05, -1287.96, 28.26),
			blipcolor = 61,
			garage = { spawn = vector4(151.4, -1287.78, 28.68, 210.15),
				out = vector4(149.25, -1290.13, 29.23, 301.17),
				list = { "panto", "burrito3" }
			},
			--Custom DJ Booth Stuff
			Booth = {
				enableBooth = false, -- Set false if using external DJ/Music stuff.
				DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
				radius = 30, -- The radius of the sound from the booth
				coords = vector3(120.0, -1281.72, 29.48), -- Where the booth is located
				playing = false,
			},
		},
	},
	DrinkItems = {
		label = "Drinks Store",
		slots = 18,
		items = {
			{ name = "cranberry", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "gin", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "rum", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "amaretto", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "vodka", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "midori", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "pinejuice", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "prosecco", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "tequila", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "triplsec", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "sprunk", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
			{ name = "ecola", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
			{ name = "ecolalight", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
			{ name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 15, },
			{ name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 16, },
			{ name = "lime", price = 0, amount = 50, info = {}, type = "item", slot = 17, },
			{ name = "lemon", price = 0, amount = 50, info = {}, type = "item", slot = 18, },
		},
	},
	FoodItems = {
		label = "Food Fridge Store",
		slots = 14,
		items = {
			{ name = "meat", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "nachos", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "potato", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "lettuce", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "cheddar", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "chocolate", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "lime", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "lemon", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "cubasil", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "mintleaf", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
			{ name = "peach", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
			{ name = "strawberry", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
		},
	},
}
Crafting = {
	Cocktails = {
		{ ['amarettosour'] = { ['amaretto'] = 1, ['lemon'] = 1, } },
		{ ['bellini'] = { ['prosecco'] = 1, ['peach'] = 1, } },
		{ ['cosmopolitan'] = { ['vodka'] = 1, ['orange'] = 1,	['cranberry'] = 1, ['cubasil'] = 1,	} },
		{ ['longisland'] = { ['gin'] = 1, ['tequila'] = 1, ['vodka'] = 1, ['ecola'] = 1, ['lemon'] = 1, } },
		{ ['margarita'] = { ['tequila'] = 1, ['lime'] = 1, ['orange'] = 1, } },
		{ ['pinacolada'] = { ['rum'] = 1, ['pinejuice'] = 1, } },
		{ ['sangria'] = { ['prosecco'] = 1, ['sprunk'] = 1, ['orange'] = 1, ['mintleaf'] = 1, } },
		{ ['screwdriver'] = { ['vodka'] = 1, ['orange'] = 1, } },
		{ ['strawdaquiri'] = { ['rum'] = 1, ['strawberry'] = 1,	} },
		{ ['strawmargarita'] = { ['tequila'] = 1, ['strawberry'] = 1, } },
	},
	Food = {
		{ ['vusliders'] = { ['meat'] = 1, ['lettuce'] = 1, } },
		{ ['vutacos'] = { ['meat'] = 1, ['lettuce'] = 1, } },
		{ ['nplate'] = { ['nachos'] = 1, ['cheddar'] = 1, } },
		{ ['tots'] = { ['potato'] = 1, } },
	},
	Beer = {
		{ ['ambeer'] = { } },
		{ ['dusche'] = { } },
		{ ['logger'] = { } },
		{ ['pisswasser'] = { } },
		{ ['pisswasser2'] = { } },
		{ ['pisswasser3'] = { } },
	},
}

-- stage effects update --

Config.CurrentEffect = {}

Config.EffectsMenu = {
    [1] = {['Name'] = 'Firework',           ['Desc'] = 'Turn on the fireworks effect.',         ['Dict'] = 'proj_xmas_firework',  ['Effect'] = 'scr_firework_xmas_ring_burst_rgw',  ['Event'] = 'qb-stripclub:server:set:effect'},
    [2] = {['Name'] = 'Star Fountain',      ['Desc'] = 'Turn on the star fountain effect.',     ['Dict'] = 'scr_indep_fireworks', ['Effect'] = 'scr_indep_firework_fountain',       ['Event'] = 'qb-stripclub:server:set:effect'},
    [3] = {['Name'] = 'Water Fountain',     ['Desc'] = 'Turn on the water fountain effect.',    ['Dict'] = 'scr_carwash',         ['Effect'] = 'ent_amb_car_wash_jet',              ['Event'] = 'qb-stripclub:server:set:effect'},
    [4] = {['Name'] = 'Fire Fountain',      ['Desc'] = 'Turn on the fire fountain effect.',     ['Dict'] = 'core',                ['Effect'] = 'ent_amb_fbi_fire_beam',             ['Event'] = 'qb-stripclub:server:set:effect'},
}

Config.Effects = {
    ['scr_indep_firework_fountain'] = {
        [1] = {['Coords'] = {['X'] = 109.59, ['Y'] = -1290.86, ['Z'] = 28.41}},
        [2] = {['Coords'] = {['X'] = 107.85, ['Y'] = -1287.83, ['Z'] = 28.41}},
        [3] = {['Coords'] = {['X'] = 101.44, ['Y'] = -1288.69, ['Z'] = 28.41}},
        [4] = {['Coords'] = {['X'] = 105.62, ['Y'] = -1295.97, ['Z'] = 28.41}},
    },
    ['ent_amb_car_wash_jet'] = {
        [1] = {['Coords'] = {['X'] = 109.59, ['Y'] = -1290.86, ['Z'] = 28.41}},
        [2] = {['Coords'] = {['X'] = 107.85, ['Y'] = -1287.83, ['Z'] = 28.41}},
        [3] = {['Coords'] = {['X'] = 101.44, ['Y'] = -1288.69, ['Z'] = 28.41}},
        [4] = {['Coords'] = {['X'] = 105.62, ['Y'] = -1295.97, ['Z'] = 28.41}},
    },
    ['ent_amb_fbi_fire_beam'] = {
        [1] = {['Coords'] = {['X'] = 109.59, ['Y'] = -1290.86, ['Z'] = 28.71}},
        [2] = {['Coords'] = {['X'] = 107.85, ['Y'] = -1287.83, ['Z'] = 28.71}},
        [3] = {['Coords'] = {['X'] = 101.44, ['Y'] = -1288.69, ['Z'] = 28.71}},
        [4] = {['Coords'] = {['X'] = 105.62, ['Y'] = -1295.97, ['Z'] = 28.71}},
    },
    ['scr_firework_xmas_ring_burst_rgw'] = {
        [1] = {['Coords'] = {['X'] = 104.65, ['Y'] = -1291.79, ['Z'] = 27.41}},
    },
}

Loc = {}