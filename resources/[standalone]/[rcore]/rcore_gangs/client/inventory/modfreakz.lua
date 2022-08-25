if Config.Inventory == nil or Config.Inventory == 0 then
    if GetResourceState('mf-inventory') == 'starting' or GetResourceState('mf-inventory') == 'started' then
        Config.Inventory = 3
    end
end

CreateThread(function()
    if Config.Inventory == 3 then
        local ESX = Citizen.Await(GetSharedObjectSafe())
        
        GetInventoryItems = function()
            local promise = promise:new()
            
            exports['mf-inventory']:getInventoryItems(GetPlayerId(), function(items)
                promise:resolve(items)
            end)
            
            return Citizen.Await(promise)
        end

        OpenStorage = function()
            TriggerServerEvent('mf-inventory:createGangStorage', MyGang.tag)

            exports['mf-inventory']:openOtherInventory(MyGang.tag)
        end

        OpenPlayerInventory = function(player)
            ESX.TriggerServerCallback('esx:getOtherPlayerData', function(data)
                exports['mf-inventory']:openOtherInventory(data.identifier)
            end, GetPlayerServerId(player))
        end
    end
end)