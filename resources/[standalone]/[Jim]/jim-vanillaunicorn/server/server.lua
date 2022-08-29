local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Server:UpdateObject', function() if source ~= '' then return false end	QBCore = exports['qb-core']:GetCoreObject() end)

AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	for k, v in pairs(Crafting) do for i = 1, #v do
			for l, b in pairs(v[i]) do if not QBCore.Shared.Items[l] then print("^5Debug^7: ^6Crafting^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..l.."^7'") end
				for j in pairs(b) do if not QBCore.Shared.Items[j] then print("^5Debug^7: ^6Crafting^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..j.."^7'") end end end end end
	for i = 1, #Config.DrinkItems.items do
		if not QBCore.Shared.Items[Config.DrinkItems.items[i].name] then print("^5Debug^7: ^6Store^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..Config.DrinkItems.items[i].name.."^7'") end
	end
	for i = 1, #Config.FoodItems.items do
		if not QBCore.Shared.Items[Config.FoodItems.items[i].name] then print("^5Debug^7: ^6Store^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..Config.FoodItems.items[i].name.."^7'") end
	end
	if not QBCore.Shared.Jobs["vanilla"] then print("^5Debug^7: ^1Error^7: ^2Job role not found ^7- '^6vanilla^7'") end
end)

--Consumables
CreateThread(function()
	local cocktails = { "gin", "rum", "amaretto", "amarettosour", "bellini", "bloodymary", "cosmopolitan", "longisland", "margarita", "pinacolada", "sangria", "screwdriver", "strawdaquiri", "strawmargarita", "midori", "prosecco", "tequila", "triplsec" }
    for _, v in pairs(cocktails) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-vanillaunicorn:client:DrinkAlcohol', source, item.name) end) end

	local beers = { "ambeer", "dusche", "logger", "pisswasser", "pisswasser2", "pisswasser3" }
    for _, v in pairs(beers) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-vanillaunicorn:client:DrinkAlcohol', source, item.name) end) end

	local drinks = { "sprunk", "sprunklight", "ecola", "ecolalight", "cranberry", "pinejuice" }
    for _, v in pairs(drinks) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-vanillaunicorn:client:Drink', source, item.name) end) end

	local food = { "chocolate", "vusliders", "vutacos", "nplate", "tots", "nachos", "crisps" }
    for _,v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-vanillaunicorn:client:Eat', source, item.name) end) end
end)

QBCore.Functions.CreateCallback('jim-vanillaunicorn:GetCash', function(source, cb)
	cb(QBCore.Functions.GetPlayer(source).Functions.GetMoney("cash"))
end)
RegisterServerEvent("jim-vanillaunicorn:StrepTip", function()
	QBCore.Functions.GetPlayer(source).Functions.RemoveMoney("cash", Config.TipCost)
end)

---Crafting
RegisterServerEvent('jim-vanillaunicorn:Crafting:GetItem', function(ItemMake, craftable)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	--This grabs the table from client and removes the item requirements
	local amount = 1
	if craftable then
		if craftable["amount"] then amount = craftable["amount"] end
		for k, v in pairs(craftable[ItemMake]) do
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(k)], "remove", v)
			Player.Functions.RemoveItem(tostring(k), v)
			if Config.Debug then print("^5Debug^7: ^1Removing ^2from Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[k].label.."^7(^2x^6"..v.."^7)'") end
		end
	end
	--This should give the item, while the rest removes the requirements
	Player.Functions.AddItem(ItemMake, amount)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ItemMake], "add", amount)
	if Config.Debug then print("^5Debug^7: ^4Giving ^2Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[ItemMake].label.."^7(^2x^6"..amount.."^7)'") end
end)

---ITEM REQUIREMENT CHECKS
QBCore.Functions.CreateCallback('jim-vanillaunicorn:Crafting:get', function(source, cb, item, craftable)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local hasitem = true
	local testtable = {}
	for k in pairs(craftable[item]) do testtable[k] = false end
	for k, v in pairs(craftable[item]) do
		if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(k) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(k).amount >= v then
			testtable[k] = true --[[if Config.Debug then print("^5Debug^7: ^2Crafting check ^7'^6"..QBCore.Shared.Items[k].label.." ^7(^2x^6"..v.."^7)' ^2found^7") end ]]
		end
	end
	for k, v in pairs(testtable) do
		if not v then hasitem = false --[[if Config.Debug then print("^5Debug^7: ^2Crafting check ^7'^6"..QBCore.Shared.Items[k].label.."^7' ^1NOT ^2found^7") end]] end
	end
	cb(hasitem)
end)


-- Server Side Built in DJ Booth stuff
local xSound = exports.xsound
RegisterNetEvent('jim-vanillaunicorn:server:playMusic', function(song, zoneNum)
    local src = source
	local Booth = Config.Locations[zoneNum].Booth
	local zoneLabel = Config.Locations[zoneNum].job..zoneNum
    xSound:PlayUrlPos(-1, zoneLabel, song, Booth.DefaultVolume, GetEntityCoords(GetPlayerPed(src)))
    xSound:Distance(-1, zoneLabel, Booth.radius)
    Config.Locations[zoneNum].Booth.playing = true
    TriggerClientEvent('jim-vanillaunicorn:client:playMusic', src, { zone = zoneNum })
end)
RegisterNetEvent('jim-vanillaunicorn:server:stopMusic', function(data)
    local src = source
	local zoneLabel = Config.Locations[data.zoneNum].job..data.zoneNum
    if Config.Locations[data.zoneNum].Booth.playing then
        Config.Locations[data.zoneNum].Booth.playing = false
        xSound:Destroy(-1, zoneLabel)
    end
    TriggerClientEvent('jim-vanillaunicorn:client:playMusic', src, { zone = data.zoneNum })
end)
RegisterNetEvent('jim-vanillaunicorn:server:pauseMusic', function(data)
    local src = source
	local zoneLabel = Config.Locations[data.zoneNum].job..data.zoneNum
    if Config.Locations[data.zoneNum].Booth.playing then
        Config.Locations[data.zoneNum].Booth.playing = false
        xSound:Pause(-1, zoneLabel)
    end
    TriggerClientEvent('jim-vanillaunicorn:client:playMusic', src, { zone = data.zoneNum })
end)
RegisterNetEvent('jim-vanillaunicorn:server:resumeMusic', function(data)
    local src = source
	local zoneLabel = Config.Locations[data.zoneNum].job..data.zoneNum
    if not Config.Locations[data.zoneNum].Booth.playing then
        Config.Locations[data.zoneNum].Booth.playing = true
        xSound:Resume(-1, zoneLabel)
    end
    TriggerClientEvent('jim-vanillaunicorn:client:playMusic', src, { zone = data.zoneNum })
end)
RegisterNetEvent('jim-vanillaunicorn:server:changeVolume', function(volume, zoneNum)
    local src = source
	local Booth = Config.Locations[zoneNum].Booth
	local zoneLabel = Config.Locations[zoneNum].job..zoneNum
    if not tonumber(volume) then return end
    if Config.Locations[zoneNum].Booth.playing then xSound:setVolume(-1, zoneLabel, volume) end
    TriggerClientEvent('jim-vanillaunicorn:client:playMusic', src, { zone = zoneNum })
end)

RegisterNetEvent('jim-vanillaunicorn:server:toggleItem', function(give, item, amount)
	local src = source
	if give == 0 or give == false then
		if QBCore.Functions.GetPlayer(src).Functions.RemoveItem(item, amount or 1) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount or 1)
		end
	else
		if QBCore.Functions.GetPlayer(src).Functions.AddItem(item, amount or 1) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount or 1)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	for i = 1, #Config.Locations do
		if Config.Locations[i].Booth.playing then
			local zoneLabel = Config.Locations[i].job..i
			xSound:Destroy(-1, zoneLabel)
		end
	end
end)