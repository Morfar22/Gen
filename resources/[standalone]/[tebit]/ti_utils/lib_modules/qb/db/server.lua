local mysql = exports["oxmysql"]
local QBCore = select(2,...)

local module = {}

local dbNames = {
    players = "players",
    vehicles = "player_vehicles"
}

local dataMap = {
    players = {
        uniqueId = "citizenid",
    },

    vehicles = {
        owner = "citizenid",
        plate = "plate",
        props = "mods",
        state = "state",
        garage = "garage",
        balance = "balance",
        paymentamount = "paymentamount",
        paymentsleft = "paymentsleft",
        financetime = "financetime",
        financeshop = "financeshop"
    }
}

local function mapQueryData(map,data)
    local ret = {}

    for k,v in pairs(data) do
        ret[map[k]] = v
    end

    return ret
end

local function mapResultData(map,data)
    local ret = {}

    for _,row in ipairs(data) do
        local t = {}

        for k,v in pairs(row) do
            for key,val in pairs(map) do
                if k == val then
                    t[key] = v
                    break
                end
            end
        end

        table.insert(ret,t)
    end

    return ret
end

local function buildGetQuery(retData,dbTable,matchData)
    local query = "SELECT " .. retData .. " FROM `" .. dbTable .. "` WHERE "
    local arr = {}

    for k,v in pairs(matchData) do
        query = query .. "`" .. k .. "`=? AND "
        table.insert(arr,v)
    end

    query = query:sub(0,query:len()-5)

    return query,arr
end

local function buildUpdateQuery(dbTable,matchData,updateData)
    local query = "UPDATE `" .. dbTable .. "` SET "
    local arr = {}

    for k,v in pairs(updateData) do
        query = query .. "`" .. k .. "`=?,"
        table.insert(arr,v)
    end

    query = query:sub(0,query:len()-1) .. " WHERE "

    for k,v in pairs(matchData) do
        query = query .. "`" .. k .. "`=? AND "
        table.insert(arr,v)
    end

    query = query:sub(0,query:len()-5)

    return query,arr    
end

local function buildInsertQuery(dbTable,insertData)
    local query = "INSERT INTO `" .. dbTable .. "` ("
    local arr = {}

    for k,v in pairs(insertData) do
        query = query .. "`" .. k .. "`,"
        table.insert(arr,v)
    end

    local valueStr = ("?,"):rep(#arr)
    query = query:sub(0,query:len()-1) .. ") VALUES (" .. valueStr:sub(0,valueStr:len()-1) .. ")"

    return query,arr
end

local function buildRemoveQuery(dbTable,matchData)
    local query = "DELETE FROM `" .. dbTable .. "` WHERE "
    local arr = {}

    for k,v in pairs(matchData) do
        query = query .. "`" .. k .. "`=? AND "
        table.insert(arr,v)
    end

    query = query:sub(0,query:len()-5)

    return query,arr
end

module.players = {
    get = function(match)
        local result = {}

        if match then
            local queryData = mapQueryData(dataMap.players,match)
            local query,arr = buildGetQuery("*",dbNames.players,queryData)

            result = mysql:executeSync(query,arr)
        else
            result = mysql:executeSync("SELECT * FROM `".. dbNames.players .. "`")
        end

        return mapResultData(dataMap.players,result)
    end
}

module.vehicles = {
    get = function(match)
        local result = {}

        if match then
            local queryData = mapQueryData(dataMap.vehicles,match)
            local query,arr = buildGetQuery("*",dbNames.vehicles,queryData)

            result = mysql:executeSync(query,arr)
        else
            result = mysql:executeSync("SELECT * FROM `" .. dbNames.vehicles .. "`")
        end

        return mapResultData(dataMap.vehicles,result)
    end,

    update = function(match,update)
        if type(update) ~= "table" or type(match) ~= "table" then
            print("ti.db.vehicles.update requires 2 table arguments")
            return {}
        end

        local matchQueryData = mapQueryData(dataMap.vehicles,match)
        local updateQueryData = mapQueryData(dataMap.vehicles,update)
        local query,arr = buildUpdateQuery(dbNames.vehicles,matchQueryData,updateQueryData)

        return mysql:executeSync(query,arr)
    end,

    insert = function(insert)
        if type(insert) ~= "table" then
            print("ti.db.vehicles.insert requires a table argument")
            return {}
        end

        local queryData = mapQueryData(dataMap.vehicles,insert)
        local query,arr = buildInsertQuery(dbNames.vehicles,queryData)

        return mysql:executeSync(query,arr)
    end,

    remove = function(match)
        if type(match) ~= "table" then
            print("ti.db.vehicles.insert requires a table argument")
            return {}
        end

        local queryData = mapQueryData(dataMap.vehicles,match)
        local query,arr = buildRemoveQuery(dbNames.vehicles,queryData)

        local result = mysql:executeSync(query,arr)

        return result
    end
}

return module