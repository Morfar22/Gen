main = {
    spawnInDistance = 50.0, -- This is the spawn in distance of the boards for efficiency purposes
    matrixProp = `matrix_sign_long`,
    flashSpeed = 500.0, -- This is the flash speed between words in milliseconds
}

predefinedMessages = {
    "slow down",
    "DANGER AHEAD SLOW",
    "<<<<<< SLOW DOWN",
    '>>>>>> SLOW DOWN',
    'POLICE DO NOT PASS',
    'PULL OVER NOW',
    'STOP YOUR CAR',
    'WEAR YOUR BELT',
    '>>>>>>>',
    '<<<<<<<',
    'GO SLOW',
    'ROAD CLOSED POLICE',
    'FIRE AHEAD CAUTION',
    'CAUTION DANGER AHEAD',
    'POLICE ACCESS ONLY',
    'POLICE CRIME SCENE',
    'NO MOBILE PHONE USAGE',
    'NO DRINK DRIVING',
    'RANDOM STOP CHECKS',
    'PEOPLE IN ROAD CAUTION',
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
-- This is the configuration section for the /matrix and /settext command
-- Uses: /matrix install, /matrix remove
matrixCommand = {
    enabled = true,
    commandName = "matrix",
    setTextCommandName = "settext",
    install = "install",
    remove = "remove",

    acePermissions = {
        enabled = false,
        -- This enables ace permissions on the matrix and settext command
        -- You then give the permission command.matrix and command.settext
    },
    -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
    ESX = {
        enabled = false,
        checkJob = {
            enabled = false, -- Enable this to use ESX job check
            jobs = {"police"} -- A user can have any of the following jobs, allowing you to add multiple
        }
    },
    -- We've added vRP integration. All you need to do is enable it below. Then, configure if you wish to check for groups or permissions, or even both
    vRP = {
        enabled = false,
        checkGroup = {
            enabled = false, -- Enable this to use vRP group check
            groups = {"police]", "admin"}, -- A user can have any of the following groups, meaning you can add different jobs
        },
        checkPermission = {
            enabled = false, -- Enable this to use vRP permission check
            permissions = {"player.kick"} -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
    -- We've added QBCore integration. All you need to do is enable it below. Then, configure if you wish to check for jobs or permissions, or even both
    QBCore = {
        enabled = true,
        checkJob = {
            enabled = true, -- Enable this to use QBCore job check
            jobs = {"police"}, -- A user can have any of the following jobs, meaning you can add different jobs
        },
        checkPermission = {
            enabled = true, -- Enable this to use QBCore permission check
            permissions = {"god"}, -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
}

-- Here you can define a list of words which cannot be placed on matrix boards.
-- These are automatically removed and replaced with blank text
bannedWords = {
    "fuck",
    "shit",
}        

enableOnAllEmergencyVehicles = true -- This will enable it on all emergency vehicles by default using the boot bone name.
-- This checks for vehicle class 18 and allows you to install the matrix on emergency vehicles

-- If you want to have a CUSTOM position for some vehicles, you can set them below as seen by the two examples
vehicles = {
    -- offSet = {X, Y, Z}
    [`police4`] = {
        boneName = "boot",
        offSet = {0.0, 0.0, 0.0},
        rotation = {0.0, 0.0, 0.0},
    },
    [`fbi`] = {
        boneName = "boot",
        offSet = {0.0, 0.0, 0.0},
        rotation = {0.0, 0.0, 0.0},
    },
}

-- This section allows you to translate the resource into another language
translations = {
    noPermission = "~r~Error~w~: You do not have permission to access this command.",
    invalidMatrixArguments = "~r~Error~w~: Invalid command arguments.",
    noVehicleFound = "~r~Error~w~: No vehicle found.",
    vehicleNotAllowed = "~r~Error~w~: This vehicle does not support matrixes.",
    cannotPerformAction = "~r~Error~w~: You are unable to perform that action.",
    drivingVehicle = "~r~Error~w~: You must be in a vehicle to use this.",
    installedMatrix = "Installed Matrix",
    removedMatrix = "Removed Matrix",
    vehicle = "Vehicle: ",
    matrixCommandHelp = "Setup and use a Smart Matrix board",
    matrixCommandParameterOne = "Action",
    matrixCommandParameterOneHelp = "install/remove",
    setTextCommandHelp = "Set the text on a matrix board",
    setTextCommandHelp2 = "Open the matrix board menu",
    setTextCommandParameterOne = "Text",
    setTextCommandParameterOneHelp = "eg, SLOW",
    installed = "~g~Success~w~: Matrix installed.",
    removed = "~g~Success~w~: Matrix removed.",
}

enableMenu = true

-- We do not recommend editing below this section unless you know what you are doing

letterPositions = {
    offSet = {
        {-0.3820, -0.0720, 0.1210},
        {-0.2540, -0.0720, 0.1210},
        {-0.1270, -0.0720, 0.1210},
        {-0.0010, -0.0720, 0.1210},
        {0.1280, -0.0720, 0.1210},
        {0.2560, -0.0720, 0.1210},
        {0.3840, -0.0720, 0.1210},
    },
    centerPositions = {
        [7] = 1,
        [6] = 1,
        [5] = 2,
        [4] = 2,
        [3] = 3,
        [2] = 3,
        [1] = 4,
    }
}

-- You can add your own letters below
-- This allows you to retexture them into your own language
letterModels = {
    ["a"] = `matrix_font_a`,
    ["b"] = `matrix_font_b`,
    ["c"] = `matrix_font_c`,
    ["d"] = `matrix_font_d`,
    ["e"] = `matrix_font_e`,
    ["f"] = `matrix_font_f`,
    ["g"] = `matrix_font_g`,
    ["h"] = `matrix_font_h`,
    ["i"] = `matrix_font_i`,
    ["j"] = `matrix_font_j`,
    ["k"] = `matrix_font_k`,
    ["l"] = `matrix_font_l`,
    ["m"] = `matrix_font_m`,
    ["n"] = `matrix_font_n`,
    ["o"] = `matrix_font_o`,
    ["p"] = `matrix_font_p`,
    ["q"] = `matrix_font_q`,
    ["r"] = `matrix_font_r`,
    ["s"] = `matrix_font_s`,
    ["t"] = `matrix_font_t`,
    ["u"] = `matrix_font_u`,
    ["v"] = `matrix_font_v`,
    ["w"] = `matrix_font_w`,
    ["x"] = `matrix_font_x`,
    ["y"] = `matrix_font_y`,
    ["z"] = `matrix_font_z`,
    ["0"] = `matrix_font_0`,
    ["1"] = `matrix_font_1`,
    ["2"] = `matrix_font_2`,
    ["3"] = `matrix_font_3`,
    ["4"] = `matrix_font_4`,
    ["5"] = `matrix_font_5`,
    ["6"] = `matrix_font_6`,
    ["7"] = `matrix_font_7`,
    ["8"] = `matrix_font_8`,
    ["9"] = `matrix_font_9`,
    ["&"] = `matrix_font_and`,
    ["-"] = `matrix_font_dash`,
    ["$"] = `matrix_font_dollar`,
    ["="] = `matrix_font_equals`,
    ["!"] = `matrix_font_exclamation`,
    ["."] = `matrix_font_fullstop`,
    ["%"] = `matrix_font_percentage`,
    ["+"] = `matrix_font_plus`,
    ["£"] = `matrix_font_pounds`,
    ["?"] = `matrix_font_question`,
    [">"] = `matrix_font_right`,
    ["<"] = `matrix_font_left`,
    [""] = `matrix_font_question`,
}
