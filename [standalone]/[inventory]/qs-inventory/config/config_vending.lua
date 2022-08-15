--██╗░░░██╗███████╗███╗░░██╗██████╗░  ███╗░░░███╗░█████╗░░█████╗░██╗░░██╗██╗███╗░░██╗███████╗░██████╗
--██║░░░██║██╔════╝████╗░██║██╔══██╗  ████╗░████║██╔══██╗██╔══██╗██║░░██║██║████╗░██║██╔════╝██╔════╝
--╚██╗░██╔╝█████╗░░██╔██╗██║██║░░██║  ██╔████╔██║███████║██║░░╚═╝███████║██║██╔██╗██║█████╗░░╚█████╗░
--░╚████╔╝░██╔══╝░░██║╚████║██║░░██║  ██║╚██╔╝██║██╔══██║██║░░██╗██╔══██║██║██║╚████║██╔══╝░░░╚═══██╗
--░░╚██╔╝░░███████╗██║░╚███║██████╔╝  ██║░╚═╝░██║██║░░██║╚█████╔╝██║░░██║██║██║░╚███║███████╗██████╔╝
--░░░╚═╝░░░╚══════╝╚═╝░░╚══╝╚═════╝░  ╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝╚══════╝╚═════╝░

Config.VendingAnimation = true
Config.VendingDistance = 1.2

Config.DispenseDict = {"mini@sprunk", "plyr_buy_drink_pt1"}
Config.PocketAnims = {"mp_common_miss", "put_away_coke"}

Config.VendingMachines = {
    ['drinks'] = {
        ['Label'] = 'Drinks',
        ['Items'] = {
            [1] = {
                ['name'] = "kurkakola",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 1,
            },
            [2] = {
                ['name'] = "water_bottle",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 2,
            },
        }
    },
    ['candy'] = {
        ['Label'] = 'Candy',
        ['Items'] = {
            [1] = {
                ['name'] = "chocolate",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 1,
            },
        }
    },
    ['coffee'] = {
        ['Label'] = 'Coffee',
        ['Items'] = {
            [1] = {
                ['name'] = "coffee",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 1,
            },
        }
    },
    ['water'] = {
        ['Label'] = 'Water',
        ['Items'] = {
            [1] = {
                ['name'] = "water_bottle",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 1,
            },
        }
    },
}

Config.Vendings = {
    [1] = {
        ['Model'] = 'prop_vend_coffe_01', -- Model name of prop.
        ['Category'] = 'coffee', -- Category from list above.
        ['Label'] = 'Coffee', -- Name of vending.
        ['Prop'] =  'p_ing_coffeecup_01', -- Bottle prop.
    },
    [2] = {
        ['Model'] = 'prop_vend_water_01',
        ['Category'] = 'water',
        ['Label'] = 'Water Dispenser',
        ['Prop'] =  'prop_ld_flow_bottle', 
    },
    [3] = {
        ['Model'] = 'prop_watercooler',
        ['Category'] = 'water',
        ['Label'] = 'Water Dispenser',
        ['Prop'] =  'prop_ld_flow_bottle', 
    },
    [4] = {
        ['Model'] = 'prop_watercooler_Dark',
        ['Category'] = 'water',
        ['Label'] = 'Water Dispenser',
        ['Prop'] =  'prop_ld_flow_bottle', 
    },
    [5] = {
        ['Model'] = 'prop_vend_snak_01',
        ['Category'] = 'candy',
        ['Label'] = 'Candy Vending',
        ['Prop'] =  'prop_candy_pqs', 
    },
    [6] = {
        ['Model'] = 'prop_vend_snak_01_tu',
        ['Category'] = 'candy',
        ['Label'] = 'Candy Vending',
        ['Prop'] =  'prop_candy_pqs', 
    },
    [7] = {
        ['Model'] = 'prop_vend_fridge01',
        ['Category'] = 'drinks',
        ['Label'] = 'Drinks Vending',
        ['Prop'] =  'prop_bottle_cognac', 
    },
    [8] = {
        ['Model'] = 'prop_vend_soda_01',
        ['Category'] = 'drinks',
        ['Label'] = 'Drinks Vending',
        ['Prop'] =  'ng_proc_sodacan_01a', 
    },
    [9] = {
        ['Model'] = 'prop_vend_soda_02',
        ['Category'] = 'drinks',
        ['Label'] = 'Drinks Vending',
        ['Prop'] =  'ng_proc_sodacan_01b', 
    },
}