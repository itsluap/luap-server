Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/jixelpatterns

-------------------------------------------------------------------------------------------------

# Installation

Add the item images to your inventory script
For Example:
	`[qb]` > `qb-inventory` > `html` > `images`

THESE GO IN YOUR SHARED.LUA IN indigo-core:

Under the QBShared.Items in items.lua

	--BurgerShot
	["potato"] 						 = {["name"] = "potato",					["label"] = "Potatoes",					["weight"] = 500,		["type"] = "item",		["image"] = "potatoes.png",				["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Bag of Potatos"},
	["slicedpotato"] 				 = {["name"] = "slicedpotato",				["label"] = "Sliced Potatoes",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-slicedpotato.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Sliced Potato"},
	["slicedonion"] 				 = {["name"] = "slicedonion",				["label"] = "Sliced Onions",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-slicedonion.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Sliced Onion"},
	["icecream"] 					 = {["name"] = "icecream",					["label"] = "Ice Cream",				["weight"] = 500,		["type"] = "item",		["image"] = "burger-icecream.png",		["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Ice Cream."},
	["milk"] 						 = {["name"] = "milk",						["label"] = "Milk",						["weight"] = 500,		["type"] = "item",		["image"] = "burger-milk.png",			["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "Carton of Milk", ['thirst'] = math.random(35, 54) },
	["lettuce"] 	 			 	 = {["name"] = "lettuce",       			["label"] = "Lettuce",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "lettuce.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Some big taco brother"},
	["onion"] 						 = {["name"] = "onion",						["label"] = "Onion",					["weight"] = 500,		["type"] = "item",		["image"] = "burger-onion.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "An onion"},
	["frozennugget"] 				 = {["name"] = "frozennugget",				["label"] = "Frozen Nuggets",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-frozennugget.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Bag of Frozen Nuggets"},
	["cheddar"] 					 = {["name"] = "cheddar",					["label"] = "Cheddar Slice",			["weight"] = 500,		["type"] = "item",		["image"] = "cheddar.png",				["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Slice of Cheese"},
	["burgerbun"] 		 			 = {["name"] = "burgerbun",       		    ["label"] = "Burger Bun",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "burgerbun.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "Some big burger brother"},
	["burgerpatty"] 				 = {["name"] = "burgerpatty",				["label"] = "Burger Patty",				["weight"] = 500,		["type"] = "item",		["image"] = "burgerpatty.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Raw Patty"},
	["burgermeat"] 				 	 = {["name"] = "burgermeat",				["label"] = "Burger Meat",				["weight"] = 500,		["type"] = "item",		["image"] = "burgermeat.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Cooked Burger Meat"},
	["milkshake"] 					 = {["name"] = "milkshake",					["label"] = "Milkshake",				["weight"] = 500,		["type"] = "item",		["image"] = "burger-milkshake.png",		["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,	 	["combinable"] = nil,	["description"] = "BurgerShot Milkshake", ['thirst'] = math.random(35, 54) },
	["shotnuggets"] 				 = {["name"] = "shotnuggets", 			  	["label"] = "Shot Nuggets", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-shotnuggets.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Burgershot Nuggets", ['hunger'] = math.random(40, 50) },
	["shotrings"] 				 	 = {["name"] = "shotrings", 			  	["label"] = "Ring Shots", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-shotrings.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Burgershot Onion Rings", ['hunger'] = math.random(40, 50) },
	["heartstopper"] 			 	 = {["name"] = "heartstopper",       		["label"] = "HeartStopper",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-heartstopper.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Heartstopper", ['hunger'] = math.random(50, 60) },
	["shotfries"] 		 			 = {["name"] = "shotfries",       			["label"] = "Shot Fries",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-fries.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Shot Fries", ['hunger'] = math.random(40, 50) },
	["moneyshot"] 		 			 = {["name"] = "moneyshot",       			["label"] = "Money Shot",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-moneyshot.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Money Shot", ['hunger'] = math.random(40, 50) },
	["meatfree"] 		 			 = {["name"] = "meatfree",       			["label"] = "Meat Free",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-meatfree.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Meat Free", ['hunger'] = math.random(40, 50) },
	["bleeder"] 		 			 = {["name"] = "bleeder",       			["label"] = "The Bleeder",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-bleeder.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "The Bleeder", ['hunger'] = math.random(40, 50) },
	["bscoffee"] 		 			 = {["name"] = "bscoffee",       			["label"] = "BurgerShot Coffee",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-coffee.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Coffee", ['thirst'] = math.random(35, 54) },
	["bscoke"] 		 				 = {["name"] = "bscoke",       				["label"] = "BurgerShot Coke",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-softdrink.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Cola", ['thirst'] = math.random(35, 54) },
	["torpedo"] 		 			 = {["name"] = "torpedo",       			["label"] = "Torpedo",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-torpedo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Torpedo", ['hunger'] = math.random(40, 50) },
	["rimjob"] 		 				 = {["name"] = "rimjob",  	     			["label"] = "Rim Job",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-rimjob.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Donut", ['hunger'] = math.random(40, 50) },
	["creampie"] 		 			 = {["name"] = "creampie",  	     		["label"] = "Creampie",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-creampie.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Apple Pie", ['hunger'] = math.random(40, 50) },
	["cheesewrap"] 					 = {["name"] = "cheesewrap", 				["label"] = "BS Cheese Wrap", 	     	["weight"] = 150, 		["type"] = "item", 		["image"] = "burger-chickenwrap.png", 	["unique"] = false,   	["useable"] = true,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Cheese Wrap", ['hunger'] = math.random(40, 50) },
	["chickenwrap"] 				 = {["name"] = "chickenwrap", 				["label"] = "BS Goat Cheese Wrap", 	    ["weight"] = 150, 		["type"] = "item", 		["image"] = "burger-goatwrap.png", 		["unique"] = false,   	["useable"] = true,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Goat Cheese Wrap", ['hunger'] = math.random(40, 50)},
	["murderbag"] 					 = {["name"] = "murderbag", 				["label"] = "Murder Bag", 	   			["weight"] = 0, 		["type"] = "item", 		["image"] = "burgerbag.png", 			["unique"] = true,   	["useable"] = true,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Grab a Murder Bag of Burgers", },

Under the QBShared.Jobs in jobs.lua

	['burgershot'] = {
		label = 'BurgerShot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},

--------------------------------------------------------------------------------------------------

## indigo-management:

	- Update to the latest github version
	- Make sure the job "burgershot" has been added to the database
	- The menu's targets should be accessible to bosses from the clock in spot

--------------------------------------------------------------------------------------------------

## Emotes:

Custom emotes currently run through dpemotes, its the easier option and adds extra emotes for you to use :)

These go in your `[standalone]` > `dpemotes` > `client` > `AnimationList.lua`

Place these under DP.PropEmotes = {

	--Jim-BurgerShot
   ["milk"] = {"mp_player_intdrink", "loop_bottle", "Milk", AnimationOptions =
   {    Prop = "v_res_tt_milk", PropBone = 18905, PropPlacement = {0.10, 0.008, 0.07, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["bscoke"] = {"mp_player_intdrink", "loop_bottle", "BS Coke", AnimationOptions =
   {    Prop = "prop_food_bs_juice01", PropBone = 18905, PropPlacement = {0.04, -0.10, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["bscoffee"] = {"mp_player_intdrink", "loop_bottle", "BS Coffee", AnimationOptions =
   {    Prop = "prop_food_bs_coffee", PropBone = 18905, PropPlacement = {0.08, -0.10, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["glass"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tall Glass", AnimationOptions =
   {   Prop = 'prop_wheat_grass_glass', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.1, 0.0, 0.0, 0.0},
       EmoteLoop = true, EmoteMoving = true, }},

   ["torpedo"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Torpedo", AnimationOptions =
   {    Prop = "prop_food_bs_burger2", PropBone = 18905, PropPlacement = {0.10, -0.07, 0.091, 15.0, 135.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["bsfries"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Fries", AnimationOptions =
   {    Prop = "prop_food_bs_chips", PropBone = 18905, PropPlacement = {0.09, -0.06, 0.05, 300.0, 150.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["donut2"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut2", AnimationOptions =
   {   Prop = 'prop_donut_02', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 100.0, 270.0},
       EmoteMoving = true, EmoteLoop = true, }},

--------------------------------------------------------------------------------------------------

## Jim-Consuambles item setup
- In Jim-Burgershot `config.lua` set `JimConsumables` to true
- Add the emotes above to Jim-Consumables `config.lua` under the `Emotes = {` section
- Add these lines to Jim-Consumables `config.lua` under the `Consumables = {` section

	--Jim-Bakery-Drinks
	["bscoffee"] = { emote = "bscoffee", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
	["bscoke"] = { emote = "bscoke", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},

	--Jim-BurgerShot-Food
	["heartstopper"] = { emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
	["torpedo"] = {	emote = "torpedo", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
	["shotfries"] = { emote = "bsfries", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
	["meatfree"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
	["shotnuggets"] = {	emote = "bsfries", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
	["shotrings"] = { emote = "bsfries", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
	["moneyshot"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
	["bleeder"] = {	emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
	["rimjob"] = { emote = "donut", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
	["creampie"] = { emote = "donut", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
	["cheesewrap"] = { emote = "sandwich", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
	["chickenwrap"] = {	emote = "sandwich", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},

--------------------------------------------------------------------------------------------------

## Changelog

### v2.3.7
	- Updated install.md
		- Included instructions to make use of Jim-Consuambles if wanted
	- Updated built-in client and server `Hasitem` events to be more accurate

### v2.3.6
	- Forgot to swap and old event, it was still trying to check for items incorrectly

### v2.3.5
    - Workaround for the `HasItem()` allowing crafting when items aren't there

### v2.3.4
	- Made the `HasItem` functions built in, so no edits to core needed
		- This allows optimizations + makes crafting menus open/load much faster
	- Add item duping protection to item crafting

### v2.3.3
	- Add "cn" locale
	- Add item duping protection

### v2.3.1
	- Fixes to QBCore item Changes
	- Greatly reduced the size of MurderBag stashes

### v2.3
	- New shared file with all the functions in
	- Optimised Chair code
	- Optimized spawning of props

### v2.2.1
	- Fixed built in job garage not being selectable
	- Optimisations
		- Did some tidying up of code
		- Worked in some unloading of props and such to help reduce memory usage

### v2.2
	- Added full support for NoPixels MLO
		- All Chairs usable
		- All Locations usable
		- DUI changing support
		- Interior and External DUI's are linked as the textures use the same names
		- Notes: Come collisions are a bit off so you have to aim at very specific places a lot of the time
	- Dui Fixes
		- Optimizations: Unless you manually set the image in dui.lua or in game, it wont try load a DUI
		- Support for NoPixels internal Images, which changes the external ones too

### v2.1.1
	- Hotfix for wrong events left in for Smallo's MLO

### v2.1
	- Added support for changing the DUI images above the counters
		- Support for both GN Mods and Smallo's MLO
	- Fixed Burger Grill checkmarks not working at all
	- Added Support for ps-progressbar
	- Finally caved in and moved the config.lua based locations over to client.lua
	- Introduced new item, the "Murder Bag". Grab these from their pickup locations and put your items inside.
		- Don't forget to add the new item and image.

### v2.0
	- Added Support for CheckMarks
		- This is a toggle in the config, if it causes issues(like lag) disable it
	- Added Support for Jim-Shops
	- Added support for new indigo-menu icons
	- Finally fixed missing missing tray in GN mods MLO
		- It was always there but had to be moved slightly to the side for it to actually not be invisible
	- Added missing ATM to other entrance under the 2nd "ATM Machine" sign
	- Added Job Garage for delivery vehicles
	- QoL Fixes and Optimizations
	- Added simple support for Toys/Prizes
	- BossMenu is now accessible from the same areas as clock in targets

----------------------------------------------------------------------------------------------------