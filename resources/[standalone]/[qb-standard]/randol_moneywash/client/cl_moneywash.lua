local QBCore = exports['qb-core']:GetCoreObject()

-----------------------
-- EVENTS/FUNCTIONS --
-----------------------

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    DirtyDan()
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
        DirtyDan()  
    end
end)

AddEventHandler('onResourceStop', function(resourceName) 
	if GetCurrentResourceName() == resourceName then
        if DoesEntityExist(dirtydan) then
            DeletePed(dirtydan)
        end
	end 
end)

local NoCreationNpcLocations = {
    {Coord = vector3(-96.07, 995.17, 235.75), Range = 20.5},  -- chicken time :D
    {Coord = vector3(-1042.78149, -2748.72363, 26.9355), Range = 70.0},-- airport
    {Coord = vector3(1690.3414, 2592.9392, 45.559), Range = 50.0},-- prison
    {Coord = vector3(-454.59271, 6010.60352, 31.34), Range = 50.0},-- sheriff paleto
}

Citizen.CreateThread(function()
    for k,v in ipairs(NoCreationNpcLocations) do
        local centerPoint = v.Coord
        local radiusSize = v.Range
        AddScenarioBlockingArea(centerPoint - radiusSize, centerPoint + radiusSize, false, true, true, true)
        AddPopMultiplierArea(centerPoint - radiusSize, centerPoint + radiusSize, 0.0, 0.0, false)
        SetPedNonCreationArea(centerPoint - radiusSize, centerPoint + radiusSize)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    if DoesEntityExist(dirtydan) then
        DeletePed(dirtydan)
    end
end)

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function DirtyDan()

    if not DoesEntityExist(dirtydan) then

        model = Config.PedModel

        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end

        dirtydan = CreatePed(6, model, Config.PedLocation, false, true)
        

        SetEntityAsMissionEntity(dirtydan)
        SetPedFleeAttributes(dirtydan, 0, 0)
        SetBlockingOfNonTemporaryEvents(dirtydan, true)
        SetEntityInvincible(dirtydan, true)
        FreezeEntityPosition(dirtydan, true)

        -- To make ped perform an animation. I chose to make him sit. Comment out/change if you know what you're doing.
        loadAnimDict("timetable@ron@ig_3_couch")        
        TaskPlayAnim(dirtydan, "timetable@ron@ig_3_couch", "base", 8.0, 1.0, -1, 01, 0, 0, 0, 0)

        exports['qb-target']:AddTargetEntity(dirtydan, {
            options = {
                {
                    type = "server",
                    event = "randol_moneywash:server:checkforbills",
                    icon = "fa-solid fa-sack-dollar",
                    label = "Exchange Bills",
                    item = "markedbills",
                },
            },
            distance = 1.5,
        })
    end
end


RegisterNetEvent('randol_moneywash:client:exchangebills')
AddEventHandler('randol_moneywash:client:exchangebills', function(ServerDataWorth)
    local ped = PlayerPedId()
    TriggerEvent('animations:client:EmoteCommandStart', {"windowshop"})
    QBCore.Functions.Progressbar("cleanbills", "Exchanging marked bills..", 10000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("randol_moneywash:server:returncleancash", ServerDataWorth)
    end)
end)

-------------------------------------------------------------------------------
-- DEBUG COMMAND (MAKE SURE YOU COMMENT THIS OUT WHEN YOU'RE DONE DEBUGGING) --
-------------------------------------------------------------------------------

-- /debugwash

-- RegisterCommand('debugwash', function()
--     if DoesEntityExist(dirtydan) then
--         tptodan = GetEntityCoords(dirtydan)
--         SetEntityCoords(PlayerPedId(), tptodan)
--     end
-- end)