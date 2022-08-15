-- Commands
if Config.Framework == 'ESX' then
	ESX.RegisterCommand("repairweapon", "superadmin", function(xPlayer, args)
		if args[1] and tonumber(args[1]) then
			TriggerClientEvent('weapons:client:SetWeaponQuality', xPlayer.source, tonumber(args[1]))
		else 
			TriggerClientEvent('weapons:client:SetWeaponQuality', xPlayer.source, 100)
		end
	end)
elseif Config.Framework == 'QBCore' then
	QBCore.Commands.Add("repairweapon", "repair weapon", {}, false, function(xPlayer, args)
		if args[1] and tonumber(args[1]) then
			TriggerClientEvent('weapons:client:SetWeaponQuality', xPlayer.source, tonumber(args[1]))
		end
	end)
end

if Config.Framework == 'ESX' then
	ESX.RegisterCommand(Config.Commands["giveweapon"], 'superadmin', function(xPlayer, args)
		TriggerEvent('giveweapon:command', args)
	end, true, {help = 'Giveitem', validate = false, arguments = {
		{name = 'player', help = 'Player ID', type = 'number'},
		{name = 'weapon', help = 'Weapon Name', type = 'string'},
		{name = 'ammo', help = 'Quantity of bullets', type = 'number'}
	}})
elseif Config.Framework == 'QBCore' then
	QBCore.Commands.Add(Config.Commands["giveweapon"], "Give weapon", {}, false, function(xPlayer, args)
		if args[1] and args[2] and args[3] then
			TriggerEvent('giveweapon:command', args)
		end
	end)
end

if Config.Framework == 'ESX' then
	ESX.RegisterCommand(Config.Commands["giveweaponcolor"], 'superadmin', function(xPlayer, args)
		TriggerEvent('giveweaponcolor:command', args)
	end, true, {help = 'Giveitem', validate = true, arguments = {
		{name = 'player', help = 'Player ID', type = 'number'},
		{name = 'weapon', help = 'Weapon Name', type = 'string'},
		{name = 'ammo', help = 'Quantity of bullets', type = 'number'},
		{name = 'color', help = 'Options: green, gold, pink, army, lspd, orange or platinum', type = 'string'},
	}})
elseif Config.Framework == 'QBCore' then
	QBCore.Commands.Add(Config.Commands["giveweaponcolor"], "Give weapon with color", {}, false, function(xPlayer, args)
		if args[1] and args[2] and args[3] and args[4] then
			TriggerEvent('giveweaponcolor:command', args)
		end
	end)
end

if Config.Framework == 'ESX' then
	ESX.RegisterCommand(Config.Commands["giveitem"], 'superadmin', function(xPlayer, args)
		TriggerEvent('giveitem:command', args)
	end, true, {help = 'Giveitem', validate = true, arguments = {
		{name = 'player', help = 'Player', type = 'number'},
		{name = 'item', help = 'Item name', type = 'string'},
		{name = 'count', help = 'Quantity', type = 'number'}
	}})
elseif Config.Framework == 'QBCore' then
	QBCore.Commands.Add("giveitem", "Give An Item (Admin Only)", {{name="id", help="Player ID"},{name="item", help="Name of the item (not a label)"}, {name="amount", help="Amount of items"}}, true, function(source, args)
		local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
		local amount = tonumber(args[3])
		local itemData = QBCore.Shared.Items[tostring(args[2]):lower()]
		if Player ~= nil then
			if amount and amount > 0 then
				if itemData ~= nil then
					-- check iteminfo
					local info = {}
					if itemData["name"] == "id_card" then
						info.citizenid = Player.PlayerData.citizenid
						info.firstname = Player.PlayerData.charinfo.firstname
						info.lastname = Player.PlayerData.charinfo.lastname
						info.birthdate = Player.PlayerData.charinfo.birthdate
						info.gender = Player.PlayerData.charinfo.gender
						info.nationality = Player.PlayerData.charinfo.nationality
					elseif itemData["type"] == "weapon" then
						amount = 1
						info.serie = tostring(Config.RandomInt(2) .. Config.RandomStr(3) .. Config.RandomInt(1) .. Config.RandomStr(2) .. Config.RandomInt(3) .. Config.RandomStr(4))
					elseif itemData["name"] == "harness" then
						info.uses = 20
					elseif itemData["name"] == "markedbills" then
						info.worth = math.random(5000, 10000)
					elseif itemData["name"] == "labkey" then
						info.lab = exports["qb-methlab"]:GenerateRandomLab()
					elseif itemData["name"] == "printerdocument" then
						info.url = "https://cdn.discordapp.com/attachments/645995539208470549/707609551733522482/image0.png"
					end
	
					if Player.Functions.AddItem(itemData["name"], amount, false, info) then
						TriggerClientEvent('QBCore:Notify', source, "You Have Given " ..GetPlayerName(tonumber(args[1])).." "..amount.." "..itemData["name"].. "", "success")
					else
						TriggerClientEvent('QBCore:Notify', source,  "Can't give item!", "error")
					end
				else
					TriggerClientEvent('QBCore:Notify', source,  "Item Does Not Exist", "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source,  "Invalid Amount", "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source,  "Player Is Not Online", "error")
		end
	end, "admin")
end

if Config.Framework == 'ESX' then
	ESX.RegisterCommand(Config.Commands["randomitems"], "superadmin", function(xPlayer, args)
		TriggerEvent('randomitems:command', xPlayer.source)
	end)
elseif Config.Framework == 'QBCore' then
	QBCore.Commands.Add("randomitems", "Give Random Items (God Only)", {}, false, function(source, args)
		local Player = QBCore.Functions.GetPlayer(source)
		local filteredItems = {}
		for k, v in pairs(QBCore.Shared.Items) do
			if QBCore.Shared.Items[k]["type"] ~= "weapon" then
				table.insert(filteredItems, v)
			end
		end
		for i = 1, 10, 1 do
			local randitem = filteredItems[math.random(1, #filteredItems)]
			local amount = math.random(1, 10)
			if randitem["unique"] then
				amount = 1
			end
			if Player.Functions.AddItem(randitem["name"], amount) then
				Citizen.Wait(500)
			end
		end
	end, "god")
end

if Config.Framework == 'ESX' then
	ESX.RegisterCommand(Config.Commands["clearinventory"], "superadmin", function(xPlayer, args)
		TriggerEvent('clearinventory:command', xPlayer.source, args)
	end)
elseif Config.Framework == 'QBCore' then
	QBCore.Commands.Add(Config.Commands["clearinventory"], "Clear Inventory Items (God Only)", {}, false, function(source, args)
		TriggerEvent('clearinventory:command', source, args)
	end, "god")
end

if Config.Framework == 'ESX' then
	ESX.RegisterCommand(Config.Commands["openinventorytarget"], "superadmin", function(xPlayer, args)
		if args[1] then
			local Player = QS.GetPlayerFromId(tonumber(args[1]))
			if Player then
				TriggerClientEvent('inventory:client:RobPlayer:Admin', xPlayer.source, tonumber(args[1]))
			else 
				TriggerClientEvent('QBCore:Notify', xPlayer.source,  "Player Is Not Online", "error")
			end
		end
	end)
elseif Config.Framework == 'QBCore' then
	QBCore.Commands.Add(Config.Commands["openinventorytarget"], "Open Inventory of Target (God Only)", {}, false, function(source, args)
		if args[1] then
			local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
			if Player then
				TriggerClientEvent('inventory:client:RobPlayer:Admin', source, tonumber(args[1]))
			else 
				TriggerClientEvent('QBCore:Notify', source,  "Player Is Not Online", "error")
			end
		end
	end, "god")
end

if Config.Framework == 'ESX' then
	ESX.RegisterCommand(Config.Commands["opentrunk"], "superadmin", function(xPlayer, args)
		local plate
		if args[1] then 
			if args[1] and args[2] then 
				plate = args[1] .. ' ' .. args[2]
			else 
				plate = args[1]
			end
			local other = {
				maxweight = 100000,
				slots = 41,
			}
			TriggerClientEvent('inventory:server:Trunk:Admin', xPlayer.source, plate, other)
		end
	end)
elseif Config.Framework == 'QBCore' then
	QBCore.Commands.Add(Config.Commands["opentrunk"], "Open Trunk of Vehicle Plate (God Only)", {}, false, function(source, args)
		local plate
		if args[1] then 
			if args[1] and args[2] then 
				plate = args[1] .. ' ' .. args[2]
			else 
				plate = args[1]
			end
			local other = {
				maxweight = 100000,
				slots = 41,
			}
			TriggerClientEvent('inventory:server:Trunk:Admin', source, plate, other)
		end
	end, "god")
end

if Config.Framework == 'ESX' then
	ESX.RegisterCommand(Config.Commands["openglovebox"], "superadmin", function(xPlayer, args)
		local plate
		if args[1] then 
			if args[1] and args[2] then 
				plate = args[1] .. ' ' .. args[2]
			else 
				plate = args[1]
			end
			TriggerClientEvent('inventory:server:Glovebox:Admin', xPlayer.source, plate)
		end
	end)
elseif Config.Framework == 'QBCore' then
	QBCore.Commands.Add(Config.Commands["openglovebox"], "Open Glovebox of Vehicle Plate (God Only)", {}, false, function(source, args)
		local plate
		if args[1] then 
			if args[1] and args[2] then 
				plate = args[1] .. ' ' .. args[2]
			else 
				plate = args[1]
			end
			TriggerClientEvent('inventory:server:Glovebox:Admin', source, plate)
		end
	end, "god")
end