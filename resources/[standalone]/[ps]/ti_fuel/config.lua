config = {
    -- Interact distance for players. Vehicle interact distance is 2x this.
    interactDist = 2.5,

    -- Hose distance, aka maximum distance for the nozzle to reach.
    hoseDist = 5.0,

    -- Minimum distance to stations to consider any actions.
    renderDist = 25.0,

    -- Size (litres) of a jerry can (or battery, for EVs).
    jerryCanSize = 10.0,

    -- How long it takes to refuel using a jerrycan (or battery).
    jerryCanTime = 5000,

    -- On refueling (nozzle attached to vehicle, actively pumping fuel), when player drives away with nozzle attached.
    allowRefuelingExplosions = true, 

    -- Keep nozzle attached after explosion? May help police figure out who caused a petrol bowser explosion in the area.
    keepNozzleAttached = true, 

    -- Controls how blips are displayed.
    -- 0 = off
    -- 1 = all on
    -- 2 = display only closest
    blipDisplay = 2,

    -- Blip data.
    blip = {
        label = "Fuel Station",
        sprite = 361,
        color = 1,
        alpha = 150,
        scale = 0.5,
        display = 2,
        highDetail = true,
        shortRange = true
    },

    -- How much fuel is drained per fuelDrainRate.
    fuelDrainRate = 0.01,

    -- How fast to drain fuel.
    -- NOTE: With 1.0 fuelDrainRate, and 1000 fuelDrainTime, the drain rate for any vehicle (other modifiers not considered)
    --       would equate to exactly 1% of your fuel being drained every 1000ms (1 second).
    fuelDrainTime = 10000,

    -- Base refuel rate.
    -- Can be supplemented further with individual station pump speeds.
    refuelAddRate = 5.0, 

    -- Fuel economy based on vehicle class
    -- Lower = less fuel used
    classEconomy = {
        [0] = 0.5,
        [1] = 0.8,
        [2] = 1.0,
        [3] = 0.7,
        [4] = 1.0,
        [5] = 1.0,
        [6] = 0.9,
        [7] = 1.0,
        [8] = 0.2,
        [9] = 1.5,
        [10] = 1.5,
        [11] = 0.6,
        [12] = 0.0,
        [13] = 0.0,
        [14] = 0.0,
        [15] = 0.0,
        [16] = 0.1,
        [17] = 0.1,
        [18] = 1.0,
        [19] = 1.0,
        [20] = 1.0,
        [21] = 0.0,
    },

    -- Fuel tank size based on vehicle class
    -- Lower value = less time to burn max fuel reserve,
    --               also less time to refuel vehicle at station.
    classTank = {
        [0] = 0.6,
        [1] = 1.0,
        [2] = 1.5,
        [3] = 0.8,
        [4] = 1.0,
        [5] = 1.0,
        [6] = 0.9,
        [7] = 0.8,
        [8] = 0.3,
        [9] = 0.7,
        [10] = 10.0,
        [11] = 2.0,
        [12] = 2.0,
        [13] = 1.0,
        [14] = 1.0,
        [15] = 100.0,
        [16] = 100.0,
        [17] = 5.0,
        [18] = 5.0,
        [19] = 5.0,
        [20] = 1.0,
        [21] = 1.0,
    },

    -- How much fuel is used at given RPM
    rpmUsage = {
        [1.0] = 1.00,
        [0.9] = 0.90,
        [0.8] = 0.80,
        [0.7] = 0.70,
        [0.6] = 0.60,
        [0.5] = 0.50,
        [0.4] = 0.40,
        [0.3] = 0.30,
        [0.2] = 0.20,
        [0.1] = 0.10,
        [0.0] = 0.00,
    },

    fuelTypes = {        
        ["Electric"] = {
            ["knock"]           = 0.0,  -- Knock Rating: Facilitates higher peak torque value with engine builder/tuning. Lower value is better.
            ["inefficiency"]    = 1.0,  -- Inefficiency  Rating: How fast this fuel will burn. Directly effects both engine efficiency and fuel drain rate. Lower is better.
            ["power"]           = 1.0,  -- Power Rating: Peak power output modifier for tuning and engine builder. Naturally aspirated engines will need access to high power fuels.
        },                              --               This will be the only defining factor in whether naturally aspirated engines can remain competitive against boosted variants.

        ["RON91"] = {
            ["knock"]           = 1.4,
            ["inefficiency"]    = 1.4,
            ["power"]           = 0.6,
        },
        
        ["RON95"] = {
            ["knock"]           = 1.2,
            ["inefficiency"]    = 1.2,
            ["power"]           = 0.8,
        },
        
        ["RON98"] = {
            ["knock"]           = 1.0,
            ["inefficiency"]    = 1.0,
            ["power"]           = 1.0,
        },
        
        ["MET100"] = {
            ["knock"]           = 0.8,
            ["inefficiency"]    = 1.5,
            ["power"]           = 1.25,
        },
        
        ["MET80/NIT20"] = {
            ["knock"]           = 0.6,
            ["inefficiency"]    = 2.0,
            ["power"]           = 1.5,
        },
        
        ["MET60/NIT40"] = {
            ["knock"]           = 0.4,
            ["inefficiency"]    = 3.0,
            ["power"]           = 2.0,
        },
    },

    -- Fuel station locations
    stations = {    
        {
            position = vector3(268.14,-1258.85,28.49),     
            pumpModel = `prop_gas_pump_1d`,
            pumpSpeed = 1.0,
            label = "Xero Gas",

            fuels = {
                ["Electric"] = {
                    stock = 100000.00,
                    price = 0.0,

                    restockTime = 1,
                    restockAmount = 100.0
                },

                ["RON91"] = {
                    stock = 1000.0,
                    price = 1.0,

                    restockTime = 30,
                    restockAmount = 10.0
                },

                ["RON95"] = {
                    stock = 500.0,
                    price = 1.5,

                    restockTime = 60,
                    restockAmount = 5.0                    
                },

                ["RON98"] = {
                    stock = 250.0,
                    price = 2.0,

                    restockTime = 60,
                    restockAmount = 5.0                    
                },

                ["MET100"] = {
                    stock = 100.0,
                    price = 4.0,

                    restockTime = 60,
                    restockAmount = 5.0                    
                },

                ["MET80/NIT20"] = {
                    stock = 50.0,
                    price = 5.0,

                    restockTime = 60,
                    restockAmount = 5.0                    
                },

                ["MET60/NIT40"] = {
                    stock = 50.0,
                    price = 10.0,

                    restockTime = 60,
                    restockAmount = 5.0                    
                },
            },

            pumps = {                
                vec3(256.4333801269531, -1253.46142578125, 28.2867317199707),
                vec3(256.4333801269531, -1261.29833984375, 28.29153060913086),
                vec3(256.4333801269531, -1268.6396484375, 28.29116821289062),
                vec3(265.0627136230469, -1268.6396484375, 28.29112243652343),
                vec3(265.0627136230469, -1261.29833984375, 28.29272079467773),
                vec3(265.0627136230469, -1253.46142578125, 28.28998565673828),
                vec3(273.8385925292969, -1253.46142578125, 28.29183197021484),
                vec3(273.8385925292969, -1261.29833984375, 28.2861328125),
                vec3(273.8385925292969, -1268.6396484375, 28.29059982299804)
            },

            addons = {
                {
                    position = vector3(284.11,-1267.82,29.26),
                    heading = 0.0,
                    model = `stt_prop_stunt_bowling_pin`,
                    fuels = {'Electric'}
                },
            }
        },
        {
            position = vec3(-2555.31, 2334.01, 33.06),
            pumpModel = `prop_gas_pump_1a`,
            pumpSpeed = 1.0,
            label = "LTD Gasoline",

            fuels = {
                ["Electric"] = {
                    stock = 100000.00,
                    price = 0.0,

                    restockTime = 1,
                    restockAmount = 100.0
                },

                ["RON91"] = {
                    stock = 1000.0,
                    price = 1.0,

                    restockTime = 30,
                    restockAmount = 10.0
                },

                ["RON95"] = {
                    stock = 500.0,
                    price = 1.5,

                    restockTime = 60,
                    restockAmount = 5.0                    
                },

                ["RON98"] = {
                    stock = 250.0,
                    price = 2.0,

                    restockTime = 60,
                    restockAmount = 5.0                    
                },

                ["MET100"] = {
                    stock = 100.0,
                    price = 4.0,

                    restockTime = 60,
                    restockAmount = 5.0                    
                },

                ["MET80/NIT20"] = {
                    stock = 50.0,
                    price = 5.0,

                    restockTime = 60,
                    restockAmount = 5.0                    
                },
            },

            pumps = {                
                vec3(-2551.396240234375, 2327.115478515625, 32.24691772460937),
                vec3(-2558.021484375, 2326.704345703125, 32.25613403320312),
                vec3(-2558.484619140625, 2334.1337890625, 32.2554702758789),
                vec3(-2552.607177734375, 2334.467529296875, 32.254150390625),
                vec3(-2552.3984375, 2341.8916015625, 32.21600341796875),
                vec3(-2558.7724609375, 2341.48779296875, 32.2252197265625)
            },

            addons = {
                {
                    position = vector3(-2541.44,2346.30,33.06),
                    heading = 3.18,
                    model = `stt_prop_stunt_bowling_pin`,
                    fuels = {"Electric"}
                },
            }
        }
    },

    electricVehicles = {
        `Imorgon`,
        `Neon`,
        `Raiden`,
        `Cyclone`,
        `Voltic`,
        `Voltic2`,
        `Tezeract`,
        `Dilettante`,
        `Dilettante2`,
        `Airtug`,
        `Caddy`,
        `Caddy2`,
        `Caddy3`,
        `Surge`,
        `Khamelion`,
        `RCBandito`,
        `teslax`,
    },
}

exports("getConfig",function(k)
    if k then
        return config[k]
    end

    return config
end)