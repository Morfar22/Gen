Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.10 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(-29.53, -1103.67, 26.42)-- Where the finance menu is located
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'managed',  -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the shop
            vector2(-59.171298980713, -1098.0219726562),
            vector2(-52.382118225098, -1079.4240722656),
            vector2(-45.066371917725, -1081.2681884766),
            vector2(-27.219314575195, -1088.2438964844),
            vector2(-33.021835327148, -1108.6146240234)
            },
            ['minZ'] = 26.0,  -- min height of the shop zone
            ['maxZ'] = 28.0,  -- max height of the shop zone
            ['size'] = 2.75, -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = true,  -- true or false
        ['blipSprite'] = 326,  -- Blip sprite
        ['blipColor'] = 3,  -- Blip color
        ['Categories'] = { -- Categories available to browse
            ['sportsclassics'] = 'Sports Classics',
            ['sedans'] = 'Sedans',
            ['coupes'] = 'Coupes',
            ['suvs'] = 'SUVs',
            ['offroad'] = 'Offroad',
            ['muscle'] = 'Muscle',
            ['sports'] = 'sports',
            ['compacts'] = 'Compacts',
            ['motorcycles'] = 'Motorcycles',
            ['vans'] = 'Vans',
            ['cycles'] = 'Bicycles',
            ['super'] = 'Super'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector3(-44.74, -1082.58, 26.68), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-42.14, -1101.5, 26.30, 19.46),
                defaultVehicle = 'zr350',
                chosenVehicle = 'zr350',
            },
            [2] = {
                coords = vector4(-54.58, -1097.09, 26.30, 31.02),
                defaultVehicle = 'calico',
                chosenVehicle = 'calico',
            },
            [3] = {
                coords = vector4(-50.01, -1083.48, 26.30, 251.83),
                defaultVehicle = 'jester4',
                chosenVehicle = 'jester4',
            },
            [4] = {
                coords = vector4(-37.05, -1093.44, 26.30, 18.96),
                defaultVehicle = 'rt3000',
                chosenVehicle = 'rt3000',
            },
            [5] = {
                coords = vector4(-47.3, -1091.95, 26.30, 94.8),
                defaultVehicle = 'comet6',
                chosenVehicle = 'comet6',
            }
        },
    },
    ['mc'] = {
        ['Type'] = 'managed', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(304.47640991211, -1149.3764648438),
                vector2(302.89022827148, -1168.3247070313),
                vector2(270.85153198242, -1171.4645996094),
                vector2(274.5432434082, -1149.1439208984)
            },
            ['minZ'] = 29.291990280151,
            ['maxZ'] = 33.266990661621,
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'MC Shop',
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {
            ['MCshop'] = 'MCshop',
            ['custom'] = 'custom',
n        },
        ['TestDriveTimeLimit'] = 2.5,
        ['Location'] = vector3(277.58, -1160.62, 33.27),
        ['ReturnLocation'] = vector3(-1231.46, -349.86, 37.33),
        ['VehicleSpawn'] = vector4(314.53, -1158.47, 29.29, 354.44),
        ['TestDriveSpawn'] = vector4(314.53, -1158.47, 29.29, 354.44), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(291.05, -1150.37, 28.95, 222.96),
                defaultVehicle = 'carbonrs',
                chosenVehicle = 'carbonrs'
            },
            [2] = {
                coords = vector4(293.09, -1150.45, 28.95, 216.13),
                defaultVehicle = 'carbonrs',
                chosenVehicle = 'carbonrs'
            },
            [3] = {
                coords = vector4(294.43, -1150.3, 28.95, 218.31),
                defaultVehicle = 'carbonrs',
                chosenVehicle = 'carbonrs'
            },
            [4] = {
                coords = vector4(296.36, -1150.58, 28.95, 220.26),
                defaultVehicle = 'hexer',
                chosenVehicle = 'hexer'
            },
            [5] = {
                coords = vector4(280.99, -1154.02, 28.93, 211.7),
                defaultVehicle = 'hexer',
                chosenVehicle = 'hexer'
            },
            [6] = {
                coords = vector4(283.36, -1150.6, 28.95, 54.05),
                defaultVehicle = 'hexer',
                chosenVehicle = 'hexer'
            },
        }
    }, -- Add your next table under this comma
    ['boats'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-729.39, -1315.84),
                vector2(-766.81, -1360.11),
                vector2(-754.21, -1371.49),
                vector2(-716.94, -1326.88)
            },
            ['minZ'] = 0.0, -- min height of the shop zone
            ['maxZ'] = 5.0, -- max height of the shop zone
            ['size'] = 6.2 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Marina Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 410, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['boats'] = 'Boats'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-738.25, -1334.38, 1.6), -- Blip Location
        ['ReturnLocation'] = vector3(-714.34, -1343.31, 0.0), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-727.87, -1353.1, -0.17, 137.09), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-722.23, -1351.98, 0.14, 135.33), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-727.05, -1326.59, 0.00, 229.5), -- where the vehicle will spawn on display
                defaultVehicle = 'seashark', -- Default display vehicle
                chosenVehicle = 'seashark' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-732.84, -1333.5, -0.50, 229.5),
                defaultVehicle = 'dinghy',
                chosenVehicle = 'dinghy'
            },
            [3] = {
                coords = vector4(-737.84, -1340.83, -0.50, 229.5),
                defaultVehicle = 'speeder',
                chosenVehicle = 'speeder'
            },
            [4] = {
                coords = vector4(-741.53, -1349.7, -2.00, 229.5),
                defaultVehicle = 'marquis',
                chosenVehicle = 'marquis'
            },
        },
    },
    ['air'] = {
        ['Type'] = 'managed', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-1607.58, -3141.7),
                vector2(-1672.54, -3103.87),
                vector2(-1703.49, -3158.02),
                vector2(-1646.03, -3190.84)
            },
            ['minZ'] = 12.99, -- min height of the shop zone
            ['maxZ'] = 16.99, -- max height of the shop zone
            ['size'] = 7.0, -- size of the vehicles zones
        },
        ['Job'] = 'plane', -- Name of job or none
        ['ShopLabel'] = 'Air Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 251, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['helicopters'] = 'Helicopters',
            ['planes'] = 'Planes'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-1652.76, -3143.4, 13.99), -- Blip Location
        ['ReturnLocation'] = vector3(-1628.44, -3104.7, 13.94), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-1617.49, -3086.17, 13.94, 329.2), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-1625.19, -3103.47, 13.94, 330.28), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1651.36, -3162.66, 12.99, 346.89), -- where the vehicle will spawn on display
                defaultVehicle = 'volatus', -- Default display vehicle
                chosenVehicle = 'volatus' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-1668.53, -3152.56, 12.99, 303.22),
                defaultVehicle = 'luxor2',
                chosenVehicle = 'luxor2'
            },
            [3] = {
                coords = vector4(-1632.02, -3144.48, 12.99, 31.08),
                defaultVehicle = 'nimbus',
                chosenVehicle = 'nimbus'
            },
            [4] = {
                coords = vector4(-1663.74, -3126.32, 12.99, 275.03),
                defaultVehicle = 'frogger',
                chosenVehicle = 'frogger'
            },
        },
    },
}
