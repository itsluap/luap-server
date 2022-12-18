Crafting = {
	Tools = {
		{ ['mechanic_tools'] = { ['iron'] = 4, ['copper'] = 2, } },
		{ ['toolbox'] = { ['steel'] = 3, ['iron'] = 2, } },
		{ ['ducttape'] = { ['plastic'] = 2, ['rubber'] = 2, } },
		{ ['paintcan'] = { ['aluminum'] = 3, } },
		{ ['tint_supplies'] = { ['rubber'] = 1, ['plastic'] = 1, } },
		{ ['underglow_controller'] = { ['aluminum'] = 2, ['plastic'] = 2, } },
		{ ['cleaningkit'] = { ['plastic'] = 2, ['rubber'] = 2, ['copper'] = 1, } },

				-- Example : Delete me --
		-- Support for multiple items in recipes --
		-- Support for multiple resulting items --
		-- Support to limit items to certain job roles --
		-- { ['cleaningkit'] = { ['rubber'] = 1, ["engine2"] = 1, ['plastic'] = 1 },
				-- ["amount"] = 2, ["job"] = { ["mechanic"] = 4, ["tuner"] = 4, } },
				-- Example : Delete me --

	},
	Perform = {
		{ ['turbo'] = { ['steel'] = 5, ['aluminum'] = 3, } },
		-- { ['car_armor'] = { ['steel'] = 10, ['aluminum'] = 5, } },
		{ ['engine1'] = { ['steel'] = 5, ['aluminum'] = 3, } },
		{ ['engine2'] = { ['steel'] = 10, ['aluminum'] = 6, } },
		{ ['engine3'] = { ['steel'] = 20, ['aluminum'] = 12, } },
		{ ['engine4'] = { ['steel'] = 40, ['aluminum'] = 24, } },
		{ ['transmission1'] = { ['steel'] = 3, ['copper'] = 1, } },
		{ ['transmission2'] = { ['steel'] = 6, ['copper'] = 2, } },
		{ ['transmission3'] = { ['steel'] = 12, ['copper'] = 4, } },
		{ ['brakes1'] = { ['aluminum'] = 4, } },
		{ ['brakes2'] = { ['aluminum'] = 8, } },
		{ ['brakes3'] = { ['aluminum'] = 16, } },
		{ ['suspension1'] = { ['aluminum'] = 6, ['rubber'] = 3, } },
		{ ['suspension2'] = { ['aluminum'] = 12, ['rubber'] = 6, } },
		{ ['suspension3'] = { ['aluminum'] = 24, ['rubber'] = 12, } },
		{ ['suspension4'] = { ['aluminum'] = 48, ['rubber'] = 24, } },
		-- { ['bprooftires'] = { ['rubber'] = 1, } },
		{ ['drifttires'] = { ['rubber'] = 4, } },
		{ ['nos'] = { ['noscan'] = 1, } },
		{ ['noscan'] = { ['steel'] = 3, ['aluminum'] = 1, } },
	},
	Cosmetic = {
		{ ['hood'] = { ['aluminum'] = 5, ['plastic'] = 2, } },
		{ ['roof'] = { ['aluminum'] = 5, ['plastic'] = 2, } },
		{ ['spoiler'] = { ['aluminum'] = 5, ['plastic'] = 2, } },
		{ ['bumper'] = { ['aluminum'] = 2, ['plastic'] = 5, } },
		{ ['skirts'] = { ['aluminum'] = 2, ['plastic'] = 5, } },
		{ ['exhaust'] = { ['iron'] = 3, ['aluminum'] = 2, } },
		{ ['seat'] = { ['plastic'] = 3, } },
		{ ['livery'] = { ['rubber'] = 2, ['plastic'] = 5, }, },
		{ ['tires'] = { ['rubber'] = 4, } },
		{ ['horn'] = { ['plastic'] = 3, } },
		{ ['internals'] = { ['plastic'] = 3, } },
		{ ['externals'] = { ['plastic'] = 3, } },
		{ ['customplate'] = { ['aluminum'] = 1, } },
		{ ['headlights'] = { ['plastic'] = 3, } },
		{ ['rims'] = { ['iron'] = 3, ['aluminum'] = 2, } },
		{ ['rollcage'] = { ['steel'] = 3, } },
		{ ['noscolour'] = { ['plastic'] = 1, } },
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
			{ name = "turbo", price = 6200, amount = 50, info = {}, type = "item", },
			{ name = "engine1", price = 1700, amount = 50, info = {}, type = "item", },
			{ name = "engine2", price = 3400, amount = 50, info = {}, type = "item", },
			{ name = "engine3", price = 6800, amount = 50, info = {}, type = "item", },
			{ name = "engine4", price = 13600, amount = 50, info = {}, type = "item", },
			{ name = "transmission1", price = 2300, amount = 50, info = {}, type = "item", },
			{ name = "transmission2", price = 4600, amount = 50, info = {}, type = "item", },
			{ name = "transmission3", price = 9200, amount = 50, info = {}, type = "item", },
			{ name = "brakes1", price = 950, amount = 50, info = {}, type = "item", },
			{ name = "brakes2", price = 1900, amount = 50, info = {}, type = "item", },
			{ name = "brakes3", price = 3800, amount = 50, info = {}, type = "item", },
			-- { name = "car_armor", price = 200, amount = 50, info = {}, type = "item", },
			{ name = "suspension1", price = 1600, amount = 50, info = {}, type = "item", },
			{ name = "suspension2", price = 3200, amount = 50, info = {}, type = "item", },
			{ name = "suspension3", price = 6400, amount = 50, info = {}, type = "item", },
			{ name = "suspension4", price = 12800, amount = 50, info = {}, type = "item", },
			-- { name = "bprooftires", price = 200, amount = 50, info = {}, type = "item", },
			{ name = "drifttires", price = 450, amount = 50, info = {}, type = "item", },
			{ name = "nos", price = 1250, amount = 50, info = {}, type = "item", },
			{ name = "harness", price = 150, amount = 100, info = {}, type = "item", },
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