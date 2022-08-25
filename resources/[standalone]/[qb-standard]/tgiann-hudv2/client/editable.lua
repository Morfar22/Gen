if config.framework == "esx" then
    Citizen.CreateThread(function()
		while config.myFramework == nil do
			TriggerEvent('esx:getSharedObject', function(obj) config.myFramework = obj end)
			Citizen.Wait(0)
		end
	end)

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function()
        firstLogin()
    end)

    -- Need Last version ESX STATUS - https://github.com/esx-framework/esx-legacy/tree/main/%5Besx_addons%5D/esx_status
    AddEventHandler('esx_status:onTick', function(data)
        SendNUIMessage({
            action = "updateStatus",
            data = data
        })
    end)
elseif config.framework == "qb" then
    config.myFramework = exports['qb-core']:GetCoreObject()
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        firstLogin()
    end)

    RegisterNetEvent('hud:client:UpdateNeeds')
    AddEventHandler('hud:client:UpdateNeeds', function(newHunger, newThirst)
        SendNUIMessage({
            action = "updateStatus",
            data = {
                {name = "hunger", percent = newHunger},
                {name = "thirst", percent = newThirst}
            }
        })
    end)

    RegisterNetEvent('hud:client:UpdateStress')
    AddEventHandler('hud:client:UpdateStress', function(newStress)
        stress = newStress
        SendNUIMessage({
            action = "updateStatus",
            data = {
                {name = "stress", percent = newStress}
            }
        })
    end) 
else
    Citizen.CreateThread(function()
        Citizen.Wait(3000)
        firstLogin()
    end) 
end

config.notify = function(msg, type, time)
    if config.framework == "esx" then
        config.myFramework.ShowNotification(msg)
    elseif config.framework == "qb" then
        QBCore.Functions.Notify(msg, type, time)
    else
        showNotification(msg)
    end
end

if config.testCommand then
    RegisterCommand("hunger", function(source, args)
        if args[1] then TriggerEvent("esx_status:set", "hunger", args[1]*10000) end
    end)

    RegisterCommand("thirst", function(source, args)
        if args[1] then TriggerEvent("esx_status:set", "thirst", args[1]*10000) end
    end)

    RegisterCommand("health", function(source, args)
        if args[1] then SetEntityHealth(playerPed, tonumber(args[1])+100) end
    end)

    RegisterCommand("armor", function(source, args)
        if args[1] then SetPedArmour(playerPed, tonumber(args[1])) end
    end) 

    RegisterCommand("engine", function(source, args)
        if args[1] then SetVehicleEngineHealth(vehicle,  tonumber(args[1])+0.0) end
    end) 
end