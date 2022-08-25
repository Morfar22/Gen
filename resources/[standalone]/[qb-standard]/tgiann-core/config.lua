config = {
    framework = "qb", -- "esx"     -     "qb"
    oxinventory = false, -- set to true if you are using ox inventory
    mysql = "oxmysql", -- "oxmysql"    -   "mysql"
    tgiannDrawText3D = true,
    test = false, -- Dont touch this
}

text = {
    alreadyError = "You are already doing something"
}

exports("getConfig", function()
    return config
end)