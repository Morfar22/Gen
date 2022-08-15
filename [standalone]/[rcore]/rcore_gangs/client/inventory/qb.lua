if Config.Inventory == nil or Config.Inventory == 0 then
    if GetResourceState('qb-inventory') == 'starting' or GetResourceState('qb-inventory') == 'started' then
        Config.Inventory = 5
    end
end

CreateThread(function()
    if Config.Inventory == 5 then
        GetInventoryItems = function()
            return GetInventory()
        end

        OpenStorage = function()
            TriggerServerEvent('inventory:server:OpenInventory', 'stash', MyGang.tag)
            TriggerEvent("inventory:client:SetCurrentStash", MyGang.tag)
        end

        OpenPlayerInventory = function(player)
            TriggerServerEvent('inventory:server:OpenInventory', 'otherplayer', GetPlayerServerId(player))
        end
    end
end)