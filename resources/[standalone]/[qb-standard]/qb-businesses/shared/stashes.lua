Config.Tables = {

    ---- ** Pizza This ** ----
    [1] = { coords = vector3(803.14, -751.54, 26.63), business = "pizza", },
    [2] = { coords = vector3(807.07, -751.52, 26.63), business = "pizza", },
    [3] = { coords = vector3(799.09, -751.55, 26.63), business = "pizza", },
    [4] = { coords = vector3(797.97, -748.9, 26.63), business = "pizza", },
    [5] = { coords = vector3(795.28, -751.52, 26.63), business = "pizza", },
    [6] = { coords = vector3(799.51, -755.05, 26.63), business = "pizza", },
    [7] = { coords = vector3(807.66, -754.62, 26.63), business = "pizza", },
    [8] = { coords = vector3(805.58, -754.69, 26.63), business = "pizza", },
    [9] = { coords = vector3(803.55, -754.6, 26.63), business = "pizza", },
    [10] = { coords = vector3(801.44, -754.67, 26.63), business = "pizza", },
    [11] = { coords = vector3(799.23, -757.61, 26.63), business = "pizza", },
    [12] = { coords = vector3(799.32, -759.73, 26.63), business = "pizza", },

    ---- ** Bean Machine ** ----
    [26] = { coords = vector3(120.55, -1040.72, 29.28), business = "beanmachine"},
    [27] = { coords = vector3(121.82, -1037.14, 29.23), business = "beanmachine"},

    ---- ** Cat Cafe ** ----
    [28] = { coords = vector3(-584.05, -1062.05, 22.29), business = "catcafe"},
    [29] = { coords = vector3(-584.06, -1059.25, 22.34), business = "catcafe"},

    --henhouse
    [30] = { coords = vector3(-302.4, 6267.9, 31.29), business = "henhouse"},
    [31] = { coords = vector3(-304.55, 6270.08, 31.29), business = "henhouse"},
    [32] = { coords = vector3(-307.23, 6257.45, 31.29), business = "henhouse"},
    [33] = { coords = vector3(-305.29, 6254.99, 31.29), business = "henhouse"},
    [34] = { coords = vector3(-297.9, 6263.18, 31.7), business = "henhouse"},
    [35] = { coords = vector3(-302.4, 6267.9, 31.29), business = "henhouse"},
    [36] = { coords = vector3(-303.75, 6275.55, 34.29), business = "henhouse"},
    [37] = { coords = vector3(-299.38, 6270.6, 34.27), business = "henhouse"},
    [38] = { coords = vector3(-298.69, 6261.05, 34.52), business = "henhouse"},

    -- burgershot
    [39] = { coords = vector3(-1194.38, -893.99, 14.1), business = "burgershot"},
    [40] = { coords = vector3(-1193.34, -895.32, 14.1), business = "burgershot"},
    [41] = { coords = vector3(-1192.48, -896.94, 14.1), business = "burgershot"},
    [42] = { coords = vector3(-1188.59, -895.73, 13.73), business = "burgershot"},
    [43] = { coords = vector3(-1186.88, -894.35, 13.76), business = "burgershot"},
    [44] = { coords = vector3(-1184.58, -893.31, 13.73), business = "burgershot"},
    [45] = { coords = vector3(-1186.96, -889.7, 13.73), business = "burgershot"},
    [46] = { coords = vector3(-1188.89, -891.17, 13.73), business = "burgershot"},
    [47] = { coords = vector3(-1192.08, -886.72, 13.75), business = "burgershot"},
}


Config.StaffStashes = {
    --pizza
    [1] = { coords = vector3(803.35, -757.01, 27.18), size = 0.77, job = {["pizza"] = 0}, stashsize = 1500000, stashslots = 300, name = "Pizzastash1" }, -- The name HAS to be unique

    -- catcafe
    [3] = { coords = vector3(-587.74, -1058.96, 22.29), size = 0.94, job = {["catcafe"] = 0}, stashsize = 1500000, stashslots = 300, name = "uwu_stash33" }, -- The name HAS to be unique
    [4] = { coords = vector3(-588.12, -1066.59, 22.64), size = 0.94, job = {["catcafe"] = 0}, stashsize = 1500000, stashslots = 300, name = "uwu_stash32" }, -- The name HAS to be unique
    
    -- burgershot
    [5] = { coords = vector3(-1200.04, -903.73, 13.89), size = 0.94, job = {["burgershot"] = 0}, stashsize = 1500000, stashslots = 300, name = "Burgershot1" }, -- The name HAS to be unique
    [6] = { coords = vector3(-1195.02, -897.49, 13.52), size = 0.94, job = {["burgershot"] = 0}, stashsize = 1500000, stashslots = 300, name = "Burgershot2" }, -- The name HAS to be unique

    -- catcafe
    [7] = { coords = vector3(-587.74, -1058.96, 22.29), size = 0.94, job = {["catcafe"] = 0}, stashsize = 1500000, stashslots = 300, name = "uwu_stash33" }, -- The name HAS to be unique

    -- henhouse
    [8] = { coords = vector3(-301.22, 6272.3, 31.49), size = 0.94, job = {["henhouse"] = 0}, stashsize = 1500000, stashslots = 300, name = "henhous1" }, -- The name HAS to be unique

    -- VU
    [9] = { coords = vector3(121.56, -1279.91, 29.48), size = 0.94, job = {["vu"] = 0}, stashsize = 1500000, stashslots = 300, name = "vu1" }, -- The name HAS to be unique
}