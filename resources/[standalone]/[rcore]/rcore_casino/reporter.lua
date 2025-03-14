local AddEventHandler_ = AddEventHandler
local CreateThread_ = CreateThread
local Errors = {}
local Functions = {}
local LastFunctions = {"", ""}

function Debug(...)
    if Config.Debug then
        local i = debug.getinfo(2)
        if i ~= nil then
            print(i.short_src, i.currentline, ...)
        else
            print(...)
        end
    end
end

function DebugStart(funcName)
    LastFunctions[2] = LastFunctions[1]
    LastFunctions[1] = funcName
    Functions[funcName] = GetGameTimer()
end

function DebugGetFunctions()
    local str = "[" .. LastFunctions[1] .. ", " .. LastFunctions[2] .. "]"
    local time = GetGameTimer()
    for k, v in pairs(Functions) do
        if time - v < 33 then
            str = str .. ", " .. k
        end
    end
    return str
end

function ReportErrors()
    local msgPack = {}
    for _, v in pairs(Errors) do
        if not v.sent then
            v.sent = true
            table.insert(msgPack, v)
        end
    end
    if #msgPack > 0 then
        local json = json.encode(msgPack)
        -- send exception to the server if client-side 
        if not IsDuplicityVersion() then
            TriggerServerEvent("Casino:Report", json)
        else
            -- use PerformHttpRequest for server-side
            PerformHttpRequest('https://robinko.eu/rcore_casino/index.php', function(err, text, header)
            end, 'POST', json)
        end
    end
end

-- check if this exact error message is already logged
function ErrorExists(err)
    for _, v in pairs(Errors) do
        if v.error == err then
            return true
        end
    end
    return false
end

-- log the error message 
function LogError(err, data)
    -- make it still show up in the console
    local errorData = tostring(err) .. (data and ", " .. data or "") .. DebugGetFunctions()
    print("^1Exception: " .. errorData .. "^7")
    -- extra info if exists
    err = err .. ", " .. tostring(debug.traceback())
    if not Config.BETA_ERROR_REPORTING or ErrorExists(err) then
        return
    end

    local e = {
        error = errorData,
        sent = false
    }
    -- if client, add gameplay info
    if not IsDuplicityVersion() then
        e.coords = GetEntityCoords(PlayerPedId())
        e.lastGame = LAST_INTERACTION_GAME
        e.lastStartedGame = LAST_STARTED_GAME_TYPE
    end
    table.insert(Errors, e)
end

-- replacement for CreateThread
function CreateThread(methodFunction, isImportant)
    CreateThread_(function()
        local status, err = xpcall(methodFunction, debug.traceback)
        if not status then
            LogError(err, nil)
            -- if the thread has important role, run it again
            if isImportant == true then
                CreateThread(methodFunction, isImportant)
            end
        end
    end)
end

-- replacement for AddEventHandler
function AddEventHandler(eventName, eventRoutine)
    AddEventHandler_(eventName, function(retEvent, retId, refId, a1, a2, a3, a4, a5, a6, a7, a8, a9)
        local status, err = xpcall(function()
            eventRoutine(retEvent, retId, refId, a1, a2, a3, a4, a5, a6, a7, a8, a9)
        end, debug.traceback)
        if not status then
            LogError(err, eventName)
        end
    end)
end

if Config.BETA_ERROR_REPORTING then

    -- if server, create event handler for client exceptions
    if IsDuplicityVersion() then
        RegisterNetEvent("Casino:Report")
        AddEventHandler("Casino:Report", function(json)
            pcall(function()
                PerformHttpRequest('https://robinko.eu/rcore_casino/index.php', function(err, text, header)
                end, 'POST', json)
            end)
        end)
    end

    -- check if new errors are avaiable to send & send them
    CreateThread(function()
        while true do
            Wait(1000)
            pcall(ReportErrors)
        end
    end)
end