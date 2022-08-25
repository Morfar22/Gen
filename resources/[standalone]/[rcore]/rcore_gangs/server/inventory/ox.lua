if Config.Inventory == nil or Config.Inventory == 0 then
    if GetResourceState('ox_inventory') == 'starting' or GetResourceState('ox_inventory') == 'started' then
        Config.Inventory = 4
    end
end

CreateThread(function()
    if Config.Inventory == 4 then
        IsStorageEmpty = function(name)
            local inventory = exports['ox_inventory']:Inventory(name)

            return #inventory['items'] == 0
        end

        RegisterNetEvent('ox_inventory:createGangStorage')
        AddEventHandler('ox_inventory:createGangStorage', function(name)
            exports['ox_inventory']:RegisterStash(name, name, 50, 100000, false)
        end)
    end
end)