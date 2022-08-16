Crafting = {
	Tools = {
		{ ['mechanic_tools'] = { ['iron'] = 1, } },
		{ ['toolbox'] = { ['iron'] = 1, } },
		{ ['ducttape'] = { ['plastic'] = 1, } },
		{ ['paintcan'] = { ['aluminum'] = 1, } },
		{ ['tint_supplies'] = { ['iron'] = 1, } },
		{ ['underglow_controller'] = { ['iron'] = 1, } },
		{ ['cleaningkit'] = { ['rubber'] = 1, } },

				-- Example : Delete me --
		-- Support for multiple items in recipes --
		-- Support for multiple resulting items --
		-- Support to limit items to certain job roles --
		{ ['cleaningkit'] = { ['rubber'] = 1, ["engine2"] = 1, ['plastic'] = 1 },
				["amount"] = 2, ["job"] = { ["mechanic"] = 4, ["tuner"] = 4, } },
				-- Example : Delete me --

	},
	Perform = {
		{ ['turbo'] = { ['steel'] = 90, } },
		--tuner
		{ ['tunerchip1'] = { ['plastic'] = 10, } },
		{ ['tunerchip2'] = { ['plastic'] = 11, } },
		{ ['tunerchip3'] = { ['plastic'] = 12, } },
		--tuner
		{ ['keeptablet'] = { ['plastic'] = 10, } },
		{ ['car_armor'] = { ['plastic'] = 13, } },
		{ ['engine1'] = { ['steel'] = 110, } },
		{ ['engine2'] = { ['steel'] = 120, } },
		{ ['engine3'] = { ['steel'] = 130, } },
		{ ['engine4'] = { ['steel'] = 140, } },
		{ ['transmission1'] = { ['steel'] = 90, } },
		{ ['transmission2'] = { ['steel'] = 100, } },
		{ ['transmission3'] = { ['steel'] = 110, } },
		{ ['brakes1'] = { ['steel'] = 50, } },
		{ ['brakes2'] = { ['steel'] = 60, } },
		{ ['brakes3'] = { ['steel'] = 70, } },
		{ ['suspension1'] = { ['steel'] = 118, } },
		{ ['suspension2'] = { ['steel'] = 140, } },
		{ ['suspension3'] = { ['steel'] = 110, } },
		{ ['suspension4'] = { ['steel'] = 123, } },
		{ ['bprooftires'] = { ['rubber'] = 345, } },
		{ ['drifttires'] = { ['rubber'] = 450, } },
		{ ['nos'] = { ['noscan'] = 1, } },
		{ ['noscan'] = { ['steel'] = 110, } },
	},
	Cosmetic = {
		{ ['hood'] = { ['plastic'] = 14, } },
		{ ['roof'] = { ['plastic'] = 11, } },
		{ ['spoiler'] = { ['plastic'] = 9, } },
		{ ['bumper'] = { ['plastic'] = 9, } },
		{ ['skirts'] = { ['plastic'] = 12, } },
		{ ['exhaust'] = { ['iron'] = 110, } },
		{ ['seat'] = { ['plastic'] = 13, } },
		{ ['livery'] = { ['plastic'] = 15 }, },
		{ ['tires'] = { ['rubber'] = 190, } },
		{ ['horn'] = { ['plastic'] = 11, } },
		{ ['internals'] = { ['plastic'] = 13, } },
		{ ['externals'] = { ['plastic'] = 10, } },
		{ ['customplate'] = { ['steel'] = 30, } },
		{ ['headlights'] = { ['plastic'] = 11, } },
		{ ['rims'] = { ['iron'] = 110, } },
		{ ['rollcage'] = { ['steel'] = 340, } },
	},
}

Stores = {
	ToolItems = {
		label = Loc[Config.Lan]["stores"].tools,
		slots = 7,
		items = {
			{ name = "mechanic_tools", price = 0, amount = 10, info = {}, type = "item", slot = 1, },
			{ name = "toolbox", price = 0, amount = 10, info = {}, type = "item", slot = 2, },
			{ name = "ducttape", price = 0, amount = 100, info = {}, type = "item", slot = 3, },
			{ name = "paintcan", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "tint_supplies", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "underglow_controller", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "cleaningkit", price = 0, amount = 100, info = {}, type = "item", slot = 7, },
			{ name = "keeptablet", price = 0, amount = 100, info = {}, type = "item", slot = 8, },
		},
	},
	PerformItems = {
		label = Loc[Config.Lan]["stores"].perform,
		slots = 19,
		items = {
			{ name = "turbo", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "engine1", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "engine2", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "engine3", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "engine4", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "transmission1", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "transmission2", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "transmission3", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "brakes1", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "brakes2", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "brakes3", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "car_armor", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
			{ name = "suspension1", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
			{ name = "suspension2", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
			{ name = "suspension3", price = 0, amount = 50, info = {}, type = "item", slot = 15, },
			{ name = "suspension4", price = 0, amount = 50, info = {}, type = "item", slot = 16, },
			{ name = "bprooftires", price = 0, amount = 50, info = {}, type = "item", slot = 17, },
			{ name = "drifttires", price = 0, amount = 50, info = {}, type = "item", slot = 18, },
			{ name = "nos", price = 0, amount = 50, info = {}, type = "item", slot = 19, },
		},
	},
	StoreItems = {
		label = Loc[Config.Lan]["stores"].cosmetic,
		slots = 16,
		items = {
			{ name = "hood", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "roof", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "spoiler", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "bumper", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "skirts", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "exhaust", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "seat", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "livery", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "tires", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "horn", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "internals", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "externals", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
			{ name = "customplate", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
			{ name = "headlights", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
			{ name = "rims", price = 0, amount = 100, info = {}, type = "item", slot = 15, },
			{ name = "rollcage", price = 0, amount = 50, info = {}, type = "item", slot = 16, },
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