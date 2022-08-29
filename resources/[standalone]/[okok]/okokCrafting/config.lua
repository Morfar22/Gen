Config = {}

Config.UseOkokTextUI = true -- true = okokTextUI (I recommend you using this since it is way more optimized than the default ShowHelpNotification) | false = ShowHelpNotification

Config.Key = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.HideMinimap = true -- If true it'll hide the minimap when the Crafting menu is opened

Config.ShowBlips = false -- If true it'll show the crafting blips on the map

Config.ShowFloorBlips = true -- If true it'll show the crafting markers on the floor

Config.UseXP = true -- If you want to use the XP system or not

Config.MaxLevel = 20 -- Max level on the workbenches

Config.StartEXP = 100 -- First level XP

Config.LevelMultiplier = 1.05 -- How much the XP needed increases per level (1.05 = 5% | level 1 = 100 | level 2 = 205 | etc...)

Config.GiveXPOnCraftFailed = false -- If the player receives XP when he fails the craft of an item

Config.itemNames = { -- format: id = label
	barrel = 'Barrel',
	lower_reciever = 'Lower reciever',
	handle = 'handle',
	charging_bar = 'Charging bar',
	upper_reciever = 'Upper reciever',
	spring = 'spring',
	metalscrap = 'metalscrap',
	aluminum = 'aluminum',
	rubber = 'rubber',
	gunpowder = 'gunpowder',
	weapon_assaultrifle_blueprint = 'weapon_assaultrifle_blueprint',
	weapon_sawnoffshotgun_blueprint = 'weapon_sawnoffshotgun_blueprint',
	weapon_appistol_blueprint = 'weapon_appistol_blueprint',
	weapon_pistol_blueprint = 'weapon_pistol_blueprint',
	weapon_assaultrifle = 'Assault Rifle',
	weapon_sawnoffshotgun = 'Sawed off shotgun',
	weapon_pistol = 'Walther P99',
	weapon_appistol = 'Glock 18C',
	radio = 'Radio',
	diamond_ring = 'Example Ring',
	phone = 'Example Phone',
	goldchain = 'Example Chain',
	wine = 'Wine',
	pistol_ammo = 'Pistol ammo',
	shotgun_ammo = 'shotgun ammo',
	rifle_ammo = 'rifle ammo',
	armor = 'armor',
	lockpick = 'lockpick',
	advancedlockpick = 'advancedlockpick',
	appistol_extendedclip = 'appistol_extendedclip',
	pistol_flashlight = 'pistol_flashlight',
	pistol_suppressor = 'pistol_suppressor',
	cleaningkit = 'cleaningkit',
	metalscratchy = 'metalscratchy',
	weapon_shiv = 'weapon_shiv',
	weapon_switchblade = 'weapon_switchblade',
	weapon_hammer = 'weapon_hammer',
	weapon_wrench = 'weapon_wrench',
	weapon_bottle = 'weapon_bottle',
	bag = 'bag',
	ducttape = 'ducttape',
	electronickit = 'electronickit',
}

Config.Crafting = {
	{
		coordinates = vector3(-443.34, -2818.42, 7.29), -- coordinates of the table
		radius = 1, -- radius of the table
		maxCraftRadius = 5, -- if you are further it will stop the craft
		showBlipRadius = 50,
		blip = {blipId = 89, blipColor = 3, blipScale = 0.9, blipText = "Crafting"}, -- to get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
		tableName = 'General', -- Title
		tableID = 'general1', -- make a different one for every table with NO spaces
		crafts = { -- What items are available for crafting and the recipe
			{
				item = 'weapon_assaultrifle', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 75, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = false, -- if true = is item | if false = is weapon
				time = 6, -- Time to craft (in seconds)
				levelNeeded = 0, -- What level he needs to craft this item
				xpPerCraft = 100, -- How much XP he receives after crafting this item
				recipe = { -- Recipe to craft it
					{'weapon_assaultrifle_blueprint', 3, true}, -- item/amount/if the item should be removed when crafting
					{'barrel', 1, true},
					{'lower_reciever', 1, true},
					{'handle', 1, true},
					{'charging_bar', 1, true},
					{'upper_reciever', 1, true},
					{'spring', 1, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'barrel', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 5, -- Time to craft (in seconds)
				levelNeeded = 0,
				xpPerCraft = 50,
				recipe = { -- Recipe to craft it
					{'metalscrap', 80, true}, -- item/amount/if the item should be removed when crafting
					{'rubber', 45, true},
					{'aluminum', 55, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'lower_reciever', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 5, -- Time to craft (in seconds)
				levelNeeded = 0,
				xpPerCraft = 50,
				recipe = { -- Recipe to craft it
				{'metalscrap', 50, true}, -- item/amount/if the item should be removed when crafting
				{'rubber', 40, true},
				{'aluminum', 60, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'handle', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 5, -- Time to craft (in seconds)
				levelNeeded = 0,
				xpPerCraft = 50,
				recipe = { -- Recipe to craft it
					{'rubber', 170, true},
					{'aluminum', 140, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'charging_bar', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 5, -- Time to craft (in seconds)
				levelNeeded = 0,
				xpPerCraft = 50,
				recipe = { -- Recipe to craft it
					{'metalscrap', 30, true}, -- item/amount/if the item should be removed when crafting
					{'rubber', 20, true},
					{'aluminum', 50, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'upper_reciever', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 5, -- Time to craft (in seconds)
				levelNeeded = 0,
				xpPerCraft = 50,
				recipe = { -- Recipe to craft it
					{'metalscrap', 60, true}, -- item/amount/if the item should be removed when crafting
					{'rubber', 30, true},
					{'aluminum', 70, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'spring', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 5, -- Time to craft (in seconds)
				levelNeeded = 0,
				xpPerCraft = 50,
				recipe = { -- Recipe to craft it
					{'metalscrap', 300, true}, -- item/amount/if the item should be removed when crafting
					{'aluminum', 30, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			--shotgun
			{
				item = 'weapon_sawnoffshotgun', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 4, -- Time to craft (in seconds)
				levelNeeded = 1,
				xpPerCraft = 65,
				recipe = { -- Recipe to craft it
					{'barrel', 1, true},
					{'lower_reciever', 1, true},
					{'handle', 1, true},
					{'charging_bar', 1, true},
					{'upper_reciever', 1, true},
					{'spring', 6, true},				
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			--pistol
			{
				item = 'weapon_pistol', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 4, -- Time to craft (in seconds)
				levelNeeded = 1,
				xpPerCraft = 65,
				recipe = { -- Recipe to craft it
					{'barrel', 1, true},
					{'lower_reciever', 1, true},
					{'handle', 1, true},
					{'charging_bar', 1, true},
					{'upper_reciever', 1, true},
					{'spring', 2, true},				
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			--apppistol
			{
				item = 'weapon_appistol', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 4, -- Time to craft (in seconds)
				levelNeeded = 1,
				xpPerCraft = 65,
				recipe = { -- Recipe to craft it
					{'barrel', 1, true},
					{'lower_reciever', 1, true},
					{'handle', 1, true},
					{'charging_bar', 1, true},
					{'upper_reciever', 1, true},
					{'spring', 4, true},				
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'pistol_ammo', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 4, -- Time to craft (in seconds)
				levelNeeded = 1,
				xpPerCraft = 65,
				recipe = { -- Recipe to craft it
					{'metalscrap', 2, true}, -- item/amount/if the item should be removed when crafting
					{'gunpowder', 3, true}, -- item/amount/if the item should be removed when crafting
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'shotgun_ammo', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 4, -- Time to craft (in seconds)
				levelNeeded = 1,
				xpPerCraft = 65,
				recipe = { -- Recipe to craft it
					{'rubber', 70, true}, -- item/amount/if the item should be removed when crafting
					{'metalscrap', 2, true}, -- item/amount/if the item should be removed when crafting
					{'gunpowder', 3, true}, -- item/amount/if the item should be removed when crafting				
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'rifle_ammo', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 4, -- Time to craft (in seconds)
				levelNeeded = 1,
				xpPerCraft = 65,
				recipe = { -- Recipe to craft it
					{'metalscrap', 2, true}, -- item/amount/if the item should be removed when crafting
					{'gunpowder', 3, true}, -- item/amount/if the item should be removed when crafting				
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'radio', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'electronickit', 3, true}, -- item/amount/if the item should be removed when crafting
					{'rubber', 60, true},
					{'metalscrap', 30, true},
					{'spring', 10, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'armor', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'cleaningkit', 10, true}, -- item/amount/if the item should be removed when crafting
					{'rubber', 200, true},
					{'metalscrap', 30, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'lockpick', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'rubber', 80, true},
					{'metalscrap', 30, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'advancedlockpick', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'rubber', 99, true},
					{'metalscrap', 30, true},
					{'spring', 20, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'bandage', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'cleaningkit', 10, true}, -- item/amount/if the item should be removed when crafting
					{'rubber', 20, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'appistol_extendedclip', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'rubber', 20, true},
					{'metalscrap', 60, true},
					{'spring', 2, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'pistol_flashlight', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'electronickit', 10, true}, -- item/amount/if the item should be removed when crafting
					{'rubber', 20, true},
					{'metalscrap', 30, true},
					{'spring', 10, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'pistol_suppressor', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'cleaningkit', 10, true}, -- item/amount/if the item should be removed when crafting
					{'rubber', 20, true},
					{'metalscrap', 30, true},
					{'spring', 10, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'cleaningkit', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'rubber', 20, true},
					{'metalscrap', 30, true},
					{'spring', 10, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'metalscratchy', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'metalscrap', 15, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'weapon_shiv', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'metalscrap', 15, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'weapon_switchblade', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'metalscrap', 15, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'weapon_hammer', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'metalscrap', 15, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'weapon_machete', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'metalscrap', 15, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'weapon_wrench', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'metalscrap', 15, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'weapon_bottle', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'metalscrap', 15, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'bag', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'metalscrap', 15, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'metalscratchy', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'metalscrap', 3, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
			{
				item = 'ducttape', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 3, -- Time to craft (in seconds)
				levelNeeded = 2,
				xpPerCraft = 80,
				recipe = { -- Recipe to craft it
					{'metalscrap', 15, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'postop'
				},
			},
		},
	},
{
	coordinates = vector3(157.69, -1316.15, 29.36), -- coordinates of the table
	radius = 1, -- radius of the table
	maxCraftRadius = 5, -- if you are further it will stop the craft
	showBlipRadius = 50,
	blip = {blipId = 89, blipColor = 3, blipScale = 0.9, blipText = "Crafting"}, -- to get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
	tableName = 'General', -- Title
	tableID = 'general1', -- make a different one for every table with NO spaces
	crafts = { -- What items are available for crafting and the recipe
		{
			item = 'radio', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'electronickit', 10, true}, -- item/amount/if the item should be removed when crafting
				{'rubber', 20, true},
				{'metalscrap', 30, true},
				{'spring', 10, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'armor', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'cleaningkit', 5, true}, -- item/amount/if the item should be removed when crafting
				{'rubber', 10, true},
				{'metalscrap', 60, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'gunpowder', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'rubber', 20, true},
				{'metalscrap', 30, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'lockpick', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'rubber', 2, true},
				{'metalscrap', 3, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'advancedlockpick', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'rubber', 3, true},
				{'metalscrap', 3, true},
				{'spring', 2, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'bandage', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'cleaningkit', 2, true}, -- item/amount/if the item should be removed when crafting
				{'rubber', 1, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'appistol_extendedclip', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'rubber', 20, true},
				{'metalscrap', 60, true},
				{'spring', 20, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'pistol_flashlight', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'electronickit', 10, true}, -- item/amount/if the item should be removed when crafting
				{'rubber', 20, true},
				{'metalscrap', 30, true},
				{'spring', 10, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'pistol_suppressor', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'cleaningkit', 10, true}, -- item/amount/if the item should be removed when crafting
				{'rubber', 20, true},
				{'metalscrap', 30, true},
				{'spring', 10, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'cleaningkit', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'rubber', 20, true},
				{'metalscrap', 30, true},
				{'spring', 10, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'weapon_shiv', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'metalscrap', 150, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'bag', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'cleaning_kit', 15, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
		{
			item = 'ducttape', -- Item id and name of the image
			amount = 1,
			successCraftPercentage = 50, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
			isItem = true, -- if true = is item | if false = is weapon
			time = 3, -- Time to craft (in seconds)
			levelNeeded = 2,
			xpPerCraft = 80,
			recipe = { -- Recipe to craft it
				{'rubber', 150, true},
			},
			job = { -- What jobs can craft this item in this workbench
				''
			},
		},
	},
},
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 3

Config.BotName = 'generation' -- Write the desired bot name

Config.ServerName = 'generation' -- Write your server's name

Config.IconURL = 'https://cdn.discordapp.com/attachments/999792701140631735/1003397274094796860/LogoDiscordTransparent.png' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.StartCraftWebhookColor = '16127'

Config.ConcludeCraftWebhookColor = '65352'

Config.AnticheatProtectionWebhookColor = '16776960'

Config.FailWebhookColor = '16711680'