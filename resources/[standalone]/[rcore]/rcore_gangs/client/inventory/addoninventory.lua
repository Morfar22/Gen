if Config.Inventory == nil or Config.Inventory == 0 then
    if GetResourceState('esx_inventoryhud') == 'missing' and (GetResourceState('esx_addoninventory') == 'starting' or GetResourceState('esx_addoninventory') == 'started') then
        Config.Inventory = 7
    end
end

CreateThread(function()
    if Config.Inventory == 7 then
        local ESX = Citizen.Await(GetSharedObjectSafe())

        GetInventoryItems = function()
            local items = {}
        
            for _, item in pairs(GetInventory()) do
                table.insert(items, item.count > 0 and item or nil)
            end
        
            return items
        end

        OpenStorage = function()
            ESX.TriggerServerCallback('esx_addoninventory:getStorageItems', function(items)
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_storage', {
                    title = _U('menu_subtitle_checkpoint_storage'),
                    align = 'top-right',
                    elements = {
                        { label = 'Put Item', type = 'put' },
                        { label = 'Grab Item', type = 'grab' }
                    }
                }, function(data, menu)
                    if data.current.type == 'put' then
                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_storage_put', {
                            title = _U('menu_subtitle_checkpoint_storage'),
                            align = 'top-right',
                            elements = GetInventoryItems()
                        }, function(data, _menu)
                            _menu.close()
                            menu.close()
        
                            TriggerServerEvent('esx_addoninventory:putStorageItem', MyGang.tag, data.current.name)
        
                            OpenStorage()
                        end, function(data, _menu)
                            _menu.close()
                        end)
                    end
        
                    if data.current.type == 'grab' then
                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_storage_grab', {
                            title = _U('menu_subtitle_checkpoint_storage'),
                            align = 'top-right',
                            elements = items
                        }, function(data, _menu)
                            _menu.close()
                            menu.close()
        
                            TriggerServerEvent('esx_addoninventory:grabStorageItem', MyGang.tag, data.current.name)
        
                            OpenStorage()
                        end, function(data, _menu)
                            _menu.close()
                        end)
                    end
                end, function(data, menu)
                    menu.close()
                end)
            end, MyGang.tag)
        end

        OpenPlayerInventory = function(player)
            ESX.TriggerServerCallback('esx_addoninventory:getPlayerItems', function(items)
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_robbery', {
                    title = GetPlayerName(player),
                    align = 'top-right',
                    elements = items
                }, function(data, menu)
                    TriggerServerEvent('esx_addoninventory:grabPlayerItem', GetPlayerServerId(player), data.current.name, data.current.count)
        
                    OpenPlayerInventory(player)
                end, function(data, menu)
                    menu.close()
                end)
            end, GetPlayerServerId(player))
        end
    end
end)