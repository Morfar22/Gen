ESX = nil
QBCore = nil

CreateThread(function()
    if Config.FrameWork == 1 then
        local breakMe = 0
        while ESX == nil do
            Wait(100)
            breakMe = breakMe + 1
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            if breakMe > 10 then
                break
            end
        end
    end

    if Config.FrameWork == 2 then
        QBCore = Config.GetQBCoreObject()

        ESX = {}
        ESX.Game = {}
        ESX.Game.GetVehicleProperties = function(vehicle)
            return QBCore.Functions.GetVehicleProperties(vehicle)
        end
    end
end)

-- this will send information to server.
function CheckPlayerCar(vehicle)
    if ESX then
        local veh = ESX.Game.GetVehicleProperties(vehicle)
        TriggerServerEvent("rcore_radiocar:openUI", veh.plate)
    else
        local plate = GetVehicleNumberPlateText(vehicle)

        if Config.ForceTrim then
            plate = Trim(plate)
        end

        TriggerServerEvent("rcore_radiocar:openUI", plate)
    end
end

function GetVehiclePlate()
    if ESX then
        local spz = ESX.Game.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId())).plate
        return spz
    else
        local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()))

        if Config.ForceTrim then
            plate = Trim(plate)
        end

        return plate
    end
    return "none"
end

AddEventHandler("rcore_radiocar:updateMusicInfo", function(data)
    if ESX then
        local spz = ESX.Game.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId())).plate
        TriggerServerEvent("rcore_radiocar:updateMusicInfo", data.label, data.url, spz, data.oldLabel, data.oldURL)
    else
        local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()))

        if Config.ForceTrim then
            plate = Trim(plate)
        end

        TriggerServerEvent("rcore_radiocar:updateMusicInfo", data.label, data.url, plate, data.oldLabel, data.oldURL)
    end
end)

RegisterNUICallback("removeSong", function(data)
    if ESX then
        local spz = ESX.Game.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId())).plate
        TriggerServerEvent("rcore_radiocar:removeMusic", spz, data.oldLabel, data.oldURL)
    else
        local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()))

        if Config.ForceTrim then
            plate = Trim(plate)
        end

        TriggerServerEvent("rcore_radiocar:removeMusic", plate, data.oldLabel, data.oldURL)
    end
end)