if Config.Inventory == nil or Config.Inventory == 0 then
    if GetResourceState('qs-core') == 'starting' or GetResourceState('qs-core') == 'started' then
        Config.Inventory = 1
    end
end

CreateThread(function()
    if Config.Inventory == 1 then
        GetInventoryItems = function()
            local promise = promise:new()
        
            exports['qs-core']:GetInventory(function(items)
                promise:resolve(items)
            end)
        
           return Citizen.Await(promise)
        end

        OpenStorage = function()
            TriggerServerEvent('inventory:server:OpenInventory', 'stash', MyGang.tag)
            TriggerEvent('inventory:client:SetCurrentStash', MyGang.tag)
        end

        OpenPlayerInventory = function(player)
            TriggerServerEvent('inventory:server:OpenInventory', 'otherplayer', GetPlayerServerId(player))
        end
    end
end)