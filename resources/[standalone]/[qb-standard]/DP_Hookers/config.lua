DP_Hookers = {}

-- LANGAGE
DP_Hookers.Locale = 'en' -- Change the langage here. You can add locales files. 

-- Script client configuration 

DP_Hookers.Prices = {
	['blowjob'] = 200,
	['blowjob+'] = 600,
	['allinone'] = 1200
} -- DO NOT FORGET TO MODIFY THE PRICES IN html/locales/locales.js ! 

DP_Hookers.ListHookers = { -- You can add more hookers peds if you want ! 
	"mp_f_deadhooker",
	"s_f_y_hooker_01",
	"s_f_y_hooker_02",
	"s_f_y_hooker_03"
}

-- How to trigger the script (Always set everything to false, command set line 22 on true or usable item set 25 on true and define usable item)
DP_Hookers.SearchByCommand 		= true 			-- Turn it to true if you want the players to make a command that will start the script searching for hookers.
DP_Hookers.CommandName 	   		= 'searchhookers' 	-- Modify the command name /yourcommand

DP_Hookers.SearchByUsingItem 	= false 			-- IF YOU TURN THIS ON TRUE, DO NOT FORGET TO PUT FALSE ON THE DP_Hookers.SearchByCommand ABOVE.
DP_Hookers.UsableItemName  		= 'item_name'  		-- Name of the item. (Don't forget to configure )
DP_Hookers.removeItemOnUse		= true				-- Set it to false if the item is not meant to be removed from the player inventory.

-- ESX / QBCore compatibility
DP_Hookers.LoadESX = false -- Change to false if not on ESX.
DP_Hookers.ESXSharedObjectEvent = 'esx:getSharedObject' -- Change the event of ESX to get the Shared Objects.

DP_Hookers.LoadQBCore = true -- Change to true if you are on QBCore (don't forget to put DP_Hookers.LoadESX on false).
if DP_Hookers.LoadQBCore then
	DP_Hookers.QBGetCoreObject = exports['qb-core']:GetCoreObject() -- Change the event of ESX to get the Shared Objects.
end

-- Add or do not add the used condom item when the player pays a with condom item
DP_Hookers.addCondomItem = false
DP_Hookers.UsedCondomItem = 'preser_usag' -- Put here the name of the useb condom item.
--


DP_Hookers.Functions = {
    -- Server-side get player data
    getPlayer = function(source) 
        local self = {}
		local player = nil

		if DP_Hookers.LoadESX then
        	player = Framework.GetPlayerFromId(source)
		elseif DP_Hookers.LoadQBCore then
			player = Framework.Functions.GetPlayer(source)
		end

        if (player ~= nil) then
            self.removeCash = function(price, type)
				if DP_Hookers.LoadESX then
					if player.getMoney() >= price then
						player.removeMoney(price)				-- Change this if needed
						TriggerClientEvent('DP_Hookers:PaymentComplete', source, type) -- DO NOT TOUCH
					else
						TriggerClientEvent('DP_Hookers:PaymentAborted', source, _U('not_enough_money'))
					end
				elseif DP_Hookers.LoadQBCore then
					if player.PlayerData.money.cash >= price then
						player.Functions.RemoveMoney("cash", price) -- Change this if needed
						TriggerClientEvent('DP_Hookers:PaymentComplete', source, type) -- DO NOT TOUCH
					else
						TriggerClientEvent('DP_Hookers:PaymentAborted', source, _U('not_enough_money'))
					end
				end
            end

			self.addCondomItem = function()
				if DP_Hookers.addCondomItem then
					if DP_Hookers.LoadESX then
						player.addInventoryItem(DP_Hookers.UsedCondomItem, 1)	-- Change this if needed
					elseif DP_Hookers.LoadQBCore then
						player.Functions.AddItem(DP_Hookers.UsedCondomItem, 1) 		-- Change this if needed
					end
				end
			end

			self.removeUsableItem = function(source, item)
				if DP_Hookers.LoadESX then
					if DP_Hookers.removeItemOnUse then -- Do not touch
						player.removeInventoryItem(DP_Hookers.UsableItemName, 1)
						TriggerClientEvent("DP_Hookers:ActivateSearchItem", source)
					else
						TriggerClientEvent("DP_Hookers:ActivateSearchItem", source)
					end
				elseif DP_Hookers.LoadQBCore then
					if player.Functions.GetItemByName(DP_Hookers.UsableItemName) then
						if DP_Hookers.removeItemOnUse then
							if player.Functions.RemoveItem(DP_Hookers.UsableItemName, 1, item.slot) then
								TriggerClientEvent("DP_Hookers:ActivateSearchItem", source)
							end
						else
							TriggerClientEvent("DP_Hookers:ActivateSearchItem", source)
						end
					end
				end
			end

            return self
        end
        return nil
    end,
	RegisterUsableItem = function()
		if DP_Hookers.LoadESX then -- ESX Part
			Framework.RegisterUsableItem(DP_Hookers.UsableItemName, function(source)
				local player = DP_Hookers.Functions.getPlayer(source)

				player.removeUsableItem(source, item)
			end)
		elseif DP_Hookers.LoadQBCore then -- QBCore
			Framework.Functions.CreateUseableItem(DP_Hookers.UsableItemName, function(source, item)
				local Player = DP_Hookers.Functions.getPlayer(source)

				Player.removeUsableItem(source, item)
			end)
		end
	end,
}