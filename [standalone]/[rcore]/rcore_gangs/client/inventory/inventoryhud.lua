if Config.Inventory == nil or Config.Inventory == 0 then
    if GetResourceState('esx_inventoryhud') == 'starting' or GetResourceState('esx_inventoryhud') == 'started' then
        Config.Inventory = 6
    end
end

CreateThread(function()
    if Config.Inventory == 6 then
        GetInventoryItems = function()
            local items = {}
        
            for _, item in pairs(GetInventory()) do
                table.insert(items, item.count > 0 and item or nil)
            end
        
            return items
        end

        OpenStorage = function()
            TriggerEvent('esx_inventoryhud:openStorageInventory', MyGang.tag)
        end

        OpenPlayerInventory = function(player)
            TriggerEvent('esx_inventoryhud:openPlayerInventory', GetPlayerServerId(player), GetPlayerName(player))
        end
    end
end)