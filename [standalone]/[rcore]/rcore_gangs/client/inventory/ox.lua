if Config.Inventory == nil or Config.Inventory == 0 then
    if GetResourceState('ox_inventory') == 'starting' or GetResourceState('ox_inventory') == 'started' then
        Config.Inventory = 4
    end
end

CreateThread(function()
    if Config.Inventory == 4 then
        GetInventoryItems = function()
            local items = {}
        
            for _, item in pairs(GetInventory()) do
                table.insert(items, item.count > 0 and item or nil)
            end
        
            return items
        end

        OpenStorage = function()
            if exports['ox_inventory']:openInventory('stash', MyGang.tag) == false then
                TriggerServerEvent('ox_inventory:createGangStorage', MyGang.tag)

                exports['ox_inventory']:openInventory('stash', MyGang.tag)
            end
        end

        OpenPlayerInventory = function(player)
            TriggerEvent('ox_inventory:openInventory', 'player', GetPlayerServerId(player))
        end
    end
end)