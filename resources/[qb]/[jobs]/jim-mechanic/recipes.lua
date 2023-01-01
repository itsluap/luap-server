Crafting = {
	Tools = {
		{ ['mechanic_tools'] = { ['iron'] = 8, ['copper'] = 4, } },
		{ ['toolbox'] = { ['steel'] = 6, ['iron'] = 4, } },
		{ ['ducttape'] = { ['plastic'] = 1, ['rubber'] = 1, } },
		{ ['paintcan'] = { ['aluminum'] = 6, } },
		{ ['tint_supplies'] = { ['rubber'] = 2, ['plastic'] = 2, } },
		{ ['underglow_controller'] = { ['aluminum'] = 4, ['plastic'] = 4, } },
		{ ['cleaningkit'] = { ['plastic'] = 4, ['rubber'] = 4, ['copper'] = 2, } },

				-- Example : Delete me --
		-- Support for multiple items in recipes --
		-- Support for multiple resulting items --
		-- Support to limit items to certain job roles --
		-- { ['cleaningkit'] = { ['rubber'] = 1, ["engine2"] = 1, ['plastic'] = 1 },
				-- ["amount"] = 2, ["job"] = { ["mechanic"] = 4, ["tuner"] = 4, } },
				-- Example : Delete me --

	},
	Perform = {
		{ ['turbo'] = { ['steel'] = 195, ['aluminum'] = 95, } },
		-- { ['car_armor'] = { ['steel'] = 10, ['aluminum'] = 5, } },
		{ ['engine1'] = { ['steel'] = 75, ['aluminum'] = 45, } },
		{ ['engine2'] = { ['steel'] = 110, ['aluminum'] = 90, } },
		{ ['engine3'] = { ['steel'] = 145, ['aluminum'] = 105, } },
		{ ['engine4'] = { ['steel'] = 175, ['aluminum'] = 125, } },
		{ ['transmission1'] = { ['steel'] = 66, ['copper'] = 22, } },
		{ ['transmission2'] = { ['steel'] = 96, ['copper'] = 32, } },
		{ ['transmission3'] = { ['steel'] = 132, ['copper'] = 44, } },
		{ ['brakes1'] = { ['aluminum'] = 56, } },
		{ ['brakes2'] = { ['aluminum'] = 80, } },
		{ ['brakes3'] = { ['aluminum'] = 96, } },
		{ ['suspension1'] = { ['aluminum'] = 60, ['rubber'] = 30, } },
		{ ['suspension2'] = { ['aluminum'] = 84, ['rubber'] = 42, } },
		{ ['suspension3'] = { ['aluminum'] = 120, ['rubber'] = 60, } },
		{ ['suspension4'] = { ['aluminum'] = 144, ['rubber'] = 72, } },
		-- { ['bprooftires'] = { ['rubber'] = 1, } },
		{ ['drifttires'] = { ['rubber'] = 8, } },
		{ ['nos'] = { ['noscan'] = 1, } },
		{ ['noscan'] = { ['steel'] = 6, ['aluminum'] = 2, } },
	},
	Cosmetic = {
		{ ['hood'] = { ['aluminum'] = 10, ['plastic'] = 4, } },
		{ ['roof'] = { ['aluminum'] = 10, ['plastic'] = 4, } },
		{ ['spoiler'] = { ['aluminum'] = 10, ['plastic'] = 4, } },
		{ ['bumper'] = { ['aluminum'] = 4, ['plastic'] = 10, } },
		{ ['skirts'] = { ['aluminum'] = 4, ['plastic'] = 10, } },
		{ ['exhaust'] = { ['iron'] = 6, ['aluminum'] = 4, } },
		{ ['seat'] = { ['plastic'] = 6, } },
		{ ['livery'] = { ['rubber'] = 4, ['plastic'] = 10, }, },
		{ ['tires'] = { ['rubber'] = 8, } },
		{ ['horn'] = { ['plastic'] = 6, } },
		{ ['internals'] = { ['plastic'] = 6, } },
		{ ['externals'] = { ['plastic'] = 6, } },
		{ ['customplate'] = { ['aluminum'] = 2, } },
		{ ['headlights'] = { ['plastic'] = 6, } },
		{ ['rims'] = { ['iron'] = 3, ['aluminum'] = 4, } },
		{ ['rollcage'] = { ['steel'] = 6, } },
		{ ['noscolour'] = { ['plastic'] = 2, } },
	},
}

Stores = {
	ToolItems = {
		label = Loc[Config.Lan]["stores"].tools,
		items = {
			{ name = "mechanic_tools", price = 250, amount = 10, info = {}, type = "item", },
			{ name = "toolbox", price = 250, amount = 10, info = {}, type = "item", },
			{ name = "ducttape", price = 75, amount = 100, info = {}, type = "item", },
			{ name = "paintcan", price = 275, amount = 50, info = {}, type = "item", },
			{ name = "tint_supplies", price = 100, amount = 50, info = {}, type = "item", },
			{ name = "underglow_controller", price = 150, amount = 50, info = {}, type = "item", },
			{ name = "cleaningkit", price = 50, amount = 100, info = {}, type = "item", },
		},
	},
	PerformItems = {
		label = Loc[Config.Lan]["stores"].perform,
		items = {
			{ name = "turbo", price = 55000, amount = 50, info = {}, type = "item", },
			{ name = "engine1", price = 7000, amount = 50, info = {}, type = "item", },
			{ name = "engine2", price = 13000, amount = 50, info = {}, type = "item", },
			{ name = "engine3", price = 55000, amount = 50, info = {}, type = "item", },
			{ name = "engine4", price = 75000, amount = 50, info = {}, type = "item", },
			{ name = "transmission1", price = 5000, amount = 50, info = {}, type = "item", },
			{ name = "transmission2", price = 10000, amount = 50, info = {}, type = "item", },
			{ name = "transmission3", price = 25000, amount = 50, info = {}, type = "item", },
			{ name = "brakes1", price = 2500, amount = 50, info = {}, type = "item", },
			{ name = "brakes2", price = 5000, amount = 50, info = {}, type = "item", },
			{ name = "brakes3", price = 10000, amount = 50, info = {}, type = "item", },
			-- { name = "car_armor", price = 200, amount = 50, info = {}, type = "item", },
			{ name = "suspension1", price = 2500, amount = 50, info = {}, type = "item", },
			{ name = "suspension2", price = 5000, amount = 50, info = {}, type = "item", },
			{ name = "suspension3", price = 10000, amount = 50, info = {}, type = "item", },
			{ name = "suspension4", price = 20000, amount = 50, info = {}, type = "item", },
			-- { name = "bprooftires", price = 200, amount = 50, info = {}, type = "item", },
			{ name = "drifttires", price = 450, amount = 50, info = {}, type = "item", },
			{ name = "nos", price = 2250, amount = 50, info = {}, type = "item", },
			{ name = "harness", price = 250, amount = 100, info = {}, type = "item", },
		},
	},
	StoreItems = {
		label = Loc[Config.Lan]["stores"].cosmetic,
		items = {
			{ name = "hood", price = 475, amount = 50, info = {}, type = "item", },
			{ name = "roof", price = 475, amount = 50, info = {}, type = "item", },
			{ name = "spoiler", price = 325, amount = 50, info = {}, type = "item", },
			{ name = "bumper", price = 325, amount = 50, info = {}, type = "item", },
			{ name = "skirts", price = 325, amount = 50, info = {}, type = "item", },
			{ name = "exhaust", price = 250, amount = 50, info = {}, type = "item", },
			{ name = "seat", price = 225, amount = 50, info = {}, type = "item", },
			{ name = "livery", price = 475, amount = 50, info = {}, type = "item", },
			{ name = "tires", price = 225, amount = 50, info = {}, type = "item", },
			{ name = "horn", price = 125, amount = 50, info = {}, type = "item", },
			{ name = "internals", price = 225, amount = 50, info = {}, type = "item", },
			{ name = "externals", price = 225, amount = 50, info = {}, type = "item", },
			{ name = "customplate", price = 325, amount = 50, info = {}, type = "item", },
			{ name = "headlights", price = 250, amount = 50, info = {}, type = "item", },
			{ name = "rims", price = 475, amount = 100, info = {}, type = "item", },
			{ name = "rollcage", price = 475, amount = 50, info = {}, type = "item", },
			{ name = "noscolour", price = 175, amount = 50, info = {}, type = "item", },
		},
	},
}

-- No Touch
	-- This is corrective code to help simplify the stores for people removing the slot info
	-- Jim shops doesn't use it but other inventories do
	-- Most people don't even edit the slots, these lines generate the slot info autoamtically
Stores.StoreItems.slots = #Stores.StoreItems.items
for k in pairs(Stores.StoreItems.items) do Stores.StoreItems.items[k].slot = k end
Stores.PerformItems.slots = #Stores.PerformItems.items
for k in pairs(Stores.PerformItems.items) do Stores.PerformItems.items[k].slot = k end
Stores.ToolItems.slots = #Stores.ToolItems.items
for k in pairs(Stores.ToolItems.items) do Stores.ToolItems.items[k].slot = k end