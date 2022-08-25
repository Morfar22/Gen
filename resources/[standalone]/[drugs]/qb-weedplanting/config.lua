Config = {}

Config.OldQBCore = false -- set to true if you are using old QBCore

Config.Core = "QBCore"

Config.CoreFolderName = "qb-core"

Config.Debug = false -- set to false if you dont want to print soil hash in f8.. (can enable it on test and disable it on live)

--[[
    * The script will only work if you are using qb-target
    * Script doesnt support bt-target because bt-target lacks functionality that is needed to check the plants
    * only change this if you have renamed qb-target to something else for the exports to work fine
]]--
Config.Target = "qb-target"

--[[
    The EnableTargetExports config value is for those who want to add targets from outside the script.
    The event for target is 

    --type = "client",
	--event = "qb-weedplanting:client:checkClosestPlant",

    You will need to add this in config for qb-target.
]]--

Config.EnableTargetExports = true


--[[
    * ph decides the acidic and alkaline nature of the soil 
    * fertility decides growth rate of the crop (between 0 to 1.0)
    * if Fertility is 0.5, the plant will take double the time to grow
]]--
Config.Soil = {
    ["1109728704"]  = { ph="acidic", fertility=1.0 },
    ["-1942898710"] = { ph="neutral", fertility=1.0 },
    ["-1286696947"] = { ph="neutral", fertility=0.5 },
    ["-1885547121"] = { ph="neutral", fertility=0.5 },
    ["312396330"]   = { ph="acidic", fertility=0.7 },
    ["1288448767"]  = { ph="basic", fertility=0.8 },
    ["-1595148316"] = { ph="basic", fertility=0.7 },
    ["510490462"]   = { ph="basic", fertility=0.7 },
    ["1333033863"]  = { ph="neutral", fertility=0.6 },
}

Config.CanBurnPlants = true --True if you want anyone to burn down and destroy the plants.
Config.DestroyOptions = true --True if you want to display the destroy option on nui.
--[[
    * Notify Config
    * Set only one to true 
    * Config.QBCoreNotify - Uses default QBCore notify system
    * Config.okokNotify - Uses OkOkNotify system
    * Config.pNotify - Uses pNotify system

    * Config.pNotifyLayout - set layout of where the notification will show. Check the layouts below. 
    * Layouts:
                top
                topLeft
                topCenter
                topRight
                center
                centerLeft
                centerRight
                bottom
                bottomLeft
                bottomCenter
                bottomRight
    
    * Config.OkOkNotifyTitle - Title to show on okokNotify
]]--
Config.QBCoreNotify = false --Set to true if you are using base QBCore notify system
Config.okokNotify = true -- Set to true if you are using base OKOK notify system
Config.pNotify = false

Config.pNotifyLayout = "centerRight" --more options can be found in pNotify Readme. Make sure you put the right layout name.
Config.OkOkNotifyTitle = "Weed Planting" --Title that displays on okoknotify

-- End of Notify Options 

Config.InfectionProbability = 10    --between 1 to 100
Config.InsecticideEffect = 5        --Health increament of plant / insecticide 

Config.GrowthRate = 10              --Increase in progress of each plant / cycle time 
Config.CycleTime = 15            --Cycle time in minutes
--Total time of growth in minutes = (CycleTime x GrowthRate)
-- So every 15 minutes, the plant will grow by 10%.

Config.Items = {
    ["acidic_soil_item"] = "alkaline_bottle", --item required if soil is acidic
    ["alkaline_soil_item"] = "acid_bottle", --item required if soil is basic/alkaline
    ["insecticide"] = "weed_insecticide" --insecticide item name
}

--Format of Config.Locale
--[[
    * Make sure the seeds you add here are not registered as usable items in some other scripts like qb-weed
    * ["weed_ak47_seed"] -> seed name (make sure its a useable item in shared.lua)
    * label = label that will be visible as 3d text on top of plant
    * returnItems = table of items that will be given when harvested
    * itemName = item name that will be given when harvested
    * amount = how much item will be given
    * probability - in percentage the chances of getting that item
    * basedOnHealth - based on plant health, the amount will be chosen (say plant health is 50%, you will get half of the amount)
]]--

Config.Seed = {
    ["weed_white-widow_seed"] = {
        label = "AK47 Weed",
        returnItems = {
            [1] = {itemName = "weed_white-widow_seed", amount = math.random(1,10), probability = 10, basedOnHealth = false},
            [2] = {itemName = "weed_white-widow", amount = 10, probability = 100, basedOnHealth = true},
           
        }
    },
    ["weed_skunk_seed"] = {
        label = "AK47 Weed",
        returnItems = {
            [1] = {itemName = "weed_skunk_seed", amount = math.random(1,10), probability = 10, basedOnHealth = false},
            [2] = {itemName = "weed_skunk", amount = 10, probability = 100, basedOnHealth = true},
           
        }
    },
    ["weed_purple-haze_seed"] = {
        label = "AK47 Weed",
        returnItems = {
            [1] = {itemName = "weed_purple-haze_seed", amount = math.random(1,10), probability = 10, basedOnHealth = false},
            [2] = {itemName = "weed_purple-haze", amount = 10, probability = 100, basedOnHealth = true},
           
        }
    },
    ["weed_og-kush_seed"] = {
        label = "AK47 Weed",
        returnItems = {
            [1] = {itemName = "weed_og-kush_seed", amount = math.random(1,10), probability = 10, basedOnHealth = false},
            [2] = {itemName = "weed_og-kush", amount = 10, probability = 100, basedOnHealth = true},
           
        }
    },
    ["weed_amnesia_seed"] = {
        label = "AK47 Weed",
        returnItems = {
            [1] = {itemName = "weed_amnesia_seed", amount = math.random(1,10), probability = 10, basedOnHealth = false},
            [2] = {itemName = "weed_amnesia", amount = 10, probability = 100, basedOnHealth = true},
           
        }
    },
    ["weed_ak47_seed"] = {
        label = "AK47 Weed",
        returnItems = {
            [1] = {itemName = "weed_ak47_seed", amount = math.random(1,10), probability = 10, basedOnHealth = false},
            [2] = {itemName = "weed_ak47", amount = 10, probability = 100, basedOnHealth = true},
           
        }
    },
}

--Format of Config.Locale
--[[
    * name = label
    * Do not alter the name (for eg. ["health_label"] -> do not change this)
    * change the label (for eg. "Health" can be changed to whatever you want.)
]]--
Config.Locale = {
    ["health_label"] = "Sundhed",
    ["collect_weed"] = "Saml ukrudt",
    ["harvesting_weed_progressbar"] = "Høst af ukrudtsblade",
    ["not_suitable_soil"] = "Jord er ikke egnet",
    ["near_another_plant"] = "Vælg en anden placering tæt på en anden fabrik.",
    ["plant_weed_progressbar"] = "Planter ukrudt",
    ["soil_acidity_notify"] = "Jorden er sur, skal bruge en flaske alkalisk for at gøre den neutral",
    ["soil_alkaline_notify"] = "Jorden er basisk, har brug for en flaske syre for at gøre den neutral",
    ["slant_surface_notify"] = "Overfladen er skrå",
    ["no_surface_notify"] = "Ingen overflade fundet",
    ["no_plant_nearby"] = "Ingen anlæg i nærheden!",
    ["near_another_plant_error"] = "Nær en anden plante!",
    ["inventory_full_error"] = "Ikke nok plads til at bære!",
    ["no_insecticide"] = "Du har ikke insekticid",
    ["plant_not_ready"] = "Planten er ikke klar endnu!",
    ["invalid_plant"] = "Ikke den rigtige plante!",
    ["destroying_plant"] = "Destroying_plant!",
}