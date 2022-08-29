local ESX = select(2,...)

local module = {}
local sharedList
local mysql = exports["oxmysql"]

RegisterNetEvent("ti_utils:" .. GetCurrentResourceName() .. ":getSharedVehicleList",function()
    local _source = source

    while not sharedList do
        Wait(500)
    end

    TriggerClientEvent("ti_utils:gotSharedVehicleList",_source,sharedList)
end)

Citizen.CreateThread(function()
    Wait(0)

    local rows = mysql:executeSync("SELECT * FROM vehicles")

    local list = {}

    for _,row in ipairs(rows) do
        list[row.model:lower()] = {
            name = row.name,
            model = row.model:lower(),
            price = row.price,
            category = row.category,
            hash = GetHashKey(row.model)%0x100000000,
            shop = row.shop or "none"
        }
    end

    sharedList = list
end)

module.awaitSharedList = function(cb)
    while not sharedList do
        Wait(0)
    end

    cb(sharedList)
end

module.getSharedList = function()
    return sharedList
end

return module