Config = {}

Config.DebugPoly = false -- Show target polys (true or false)

Config.CoffeItem = "coffee"

Config.ReviveClientEvent = 'hospital:client:Revive'

Config.Locale = "en"

--Mr desk
Config.MrCoord = vector4(336.9098, -575.361, 43.186, 161.4)
--Xray desk
Config.Xray = vector4(348.4268, -579.877, 43.186, 162.51)

Config.TargetInfos = {
    ["EMSWertAmbulanceDuty"] = {
        Coord = vector3(307.55, -595.32, 43.28),
        Heading = 340,
        Lenght = 1.0,
        Width = 1,
        Minz = 42.2,
        Maxz = 43.8,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    ["EMSWertArmoryStash"] = {
        Coord = vector3(306.57, -602.33, 43.28),
        Heading = 340,
        Lenght = 0.6,
        Width = 2.2,
        Minz = 42.2,
        Maxz = 44.4,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    ["EMSWertBossMenu"] = {
        --Don't tuch event value
        Coord = vector3(335.54, -594.42, 43.28),
        Heading = 340,
        Lenght = 1.8,
        Width = 1.0,
        Minz = 42.2,
        Maxz = 43.8,
        Event = "qb-bossmenu:client:OpenMenu",
        Icon = "fas fa-clipboard",
        Label = "Boss Menu",
        Distance = 1.5
    },
    ["EMSWertMrComputer"] = {
        --Don't tuch event value
        Coord = vector3(341.33, -576.66, 43.28),
        Heading = 340,
        Lenght = 1.4,
        Width = 1.0,
        Minz = 42.8,
        Maxz = 44.0,
        Event = "wert-ambulancejob:mr-panel",
        Icon = "fas fa-desktop",
        Label = "MRI Computer",
        Distance = 1.0
    },
    ["EMSWertMrDesk"] = {
        --Don't tuch event value
        Coord = vector3(336.98, -575.21, 43.28),
        Heading = 340,
        Lenght = 2.6,
        Width = 1.0,
        Minz = 42.4,
        Maxz = 44.0,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    ["EMSWertXrayComputer"] = {
        --Don't tuch event value
        Coord = vector3(344.54, -577.97, 43.28),
        Heading = 340,
        Lenght = 1.4,
        Width = 0.8,
        Minz = 42.8,
        Maxz = 44.0,
        Event = "wert-ambulancejob:xray-panel",
        Icon = "fas fa-desktop",
        Label = "XRAY Computer",
        Distance = 1.0
    },
    ["EMSWertXrayDesk"] = {
        --Don't tuch event value
        Coord = vector3(348.6, -579.48, 43.28),
        Heading = 340,
        Lenght = 2.6,
        Width = 1.0,
        Minz = 42.4,
        Maxz = 44.0,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    --
    ["EMSWertAmbulanceComputer"] = {
        Coord = vector3(308.56, -593.79, 43.28),
        Heading = 315,
        Lenght = 0.8,
        Width = 0.8,
        Minz = 42.2,
        Maxz = 43.8,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },

    ["EMSBloodCard"] = {
        --Don't tuch event value
        Coord = vector3(311.8, -593.43, 43.28),
        Heading = 339,
        Lenght = 0.8,
        Width = 1.0,
        Minz = 42.8,
        Maxz = 43.8,
        Event = 'wert-ambulancejob:take-blood-card',
        Icon = "fa-solid fa-address-card",
        Label = 'Buy blood card',
        Distance = 1.5
    },
}

-- Armory items
Config.Items = {
    label = "Ambulance Armory",
    slots = 8,
    items = {
        [1] = {
            name = "radio",
            price = 0,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "bandage",
            price = 0,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_flashlight",
            price = 0,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_stungun",
            price = 0,
            amount = 100,
            info = {},
            type = "weapon",
            slot = 4,
        },
        [5] = {
            name = "painkillers",
            price = 0,
            amount = 100,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "emptytube",
            price = 0,
            amount = 100,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "emptysyringe",
            price = 0,
            amount = 100,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "emptybaggy",
            price = 0,
            amount = 100,
            info = {},
            type = "item",
            slot = 8,
        },
    }
}

-- Elevator coords
Config.ElevatorInfos = {
    [-1] = {
        Coord = vector3(339.88, -586.28, 28.8),
        Heading = 340,
        Lenght = 0.2,
        Width = 0.4,
        Minz = 29.0,
        Maxz = 29.3,
        Distance = 1.5,
        Tpcoord = vector4(339.82, -584.66, 28.8, 75.64),
    },
    [1] = {
        Coord = vector3(325.57, -603.57, 43.28),
        Heading = 70,
        Lenght = 0.2,
        Width = 0.4,
        Minz = 43.5,
        Maxz = 43.8,
        Distance = 1.5,
        Tpcoord = vector4(327.29, -603.33, 43.28, 340.34),
    },
    [2] = {
        Coord = vector3(338.13, -583.64, 74.16),
        Heading = 340,
        Lenght = 2.8,
        Width = 0.4,
        Minz = 73.80,
        Maxz = 74.56,
        Distance = 1.5,
        Tpcoord = vector4(339.12, -584.01, 74.16, 251.08),
    },
}

--Garage config

Config.GarageEnabled = false -- If you want don't use garage change false

Config.GarageNpcInfos = {
    --Pillbox
    ["pillbox"] = {
        ["car"] = {
            coord = vector4(340.53, -582.82, 28.8, 72.09),
            hash = GetHashKey("s_m_y_valet_01"),
            type = "car",
        },
        ["helicopter"] = {
            coord = vector4(337.74, -586.7, 74.16, 249.22),
            hash = GetHashKey("s_m_y_valet_01"),
            type = "helicopter",
        },
    },
}

Config.GarageSpawnCoords = {
    --Pillbox
    ["pillbox"] = {
        ["car"] = vector4(332.05, -578.33, 28.8, 340.2),
        ["helicopter"] = vector4(352.6, -588.51, 74.16, 69.65)
    },
}

Config.EmsVehicles = {
    ["car"] = {
        "ambulance",
        "lguard",
    },
    ["helicopter"] = {
        "polmav"
    },
}

-- Npc doctor

Config.NpcDoctors = {
    {coord = vector4(312.77, -594.62, 43.28, 345.11), name = "John" }, -- Gabz
}

Config.ReviveTime = 70000
Config.RestTime = 50000

Config.Beds = {
    ["John"] = {
        ["dead"] = {vector4(326.84, -570.82, 43.26, 161.06), vector4(315.28, -566.61, 43.28, 155.03)},
        ["rest"] = {vector4(307.81, -581.69, 43.2, 340.96), vector4(311.12, -583.02, 43.2, 333.79), vector4(314.52, -584.28, 43.2, 337.71), vector4(317.74, -585.4, 43.2, 337.33), vector4(322.69, -587.23, 43.2, 339.7), vector4(324.22, -582.84, 43.2, 158.46), vector4(319.32, -580.99, 43.2, 162.94)}
    },
}