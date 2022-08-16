
-- ** Releases stress of the src on the server side ** ----
local function RelieveStress(src, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    local Stress = Player.PlayerData.metadata['stress']
    if not Stress then
        Player.PlayerData.metadata['stress'] = 0

        Stress = Player.PlayerData.metadata['stress']
    end

    if Stress - amount < 0 then
        Stress = 0
    else
        Stress = Player.PlayerData.metadata['stress'] - amount
    end


    Player.Functions.SetMetaData('stress', Stress)
    TriggerClientEvent('hud:client:UpdateStress', src, Stress)
    TriggerClientEvent('QBCore:Notify', src, 'You feel more relaxed', 4500, "success")
end

---- ** Updates the src needs server side ** ---
local function GiveFood(src, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    local Thirst = Player.PlayerData.metadata["thirst"]
    local newFood = Player.PlayerData.metadata["hunger"]

    newFood = newFood + amount

    Player.Functions.SetMetaData('hunger', newFood)
    TriggerClientEvent("hud:client:UpdateNeeds", src, newFood, Thirst)
end

RegisterNetEvent('qb-businesses:server:foodBuffsAmt', function(src, CID, Table)
    if source ~= '' then return false end -- Safety check if the event was not called from the server.
    local hunger, sugar, protein, healthy, dairy, grain, seasoning = Table.hunger, Table.sugarAmt, Table.proteinAmt, Table.healthyAmt, Table.dairyAmt, Table.grainAmt, Table.seasoningAmt


    -- Hunger is the amount of food value the food contains. --
    -- Sugar is the amount of sugar the food contains. --
    -- Protein is the amount of protein the food contains. --
    -- Healthy is the amount of healthy the food contains. --
    -- Dairy is the amount of dairy the food contains. --
    -- Grain is the amount of grain the food contains. --
    -- Seasoning is the amount of seasoning the food contains. --

    
    GiveFood(src, hunger)

    -- If you don't use buffs tnj Buffs, you can then still use these numbers to whatever you'd like.

    if Config.EnableBuffs then
        local buffTable = {}

        -- ** Here's all the healthy buffs that excists, we call these server side as we dont want people to have them client side ** --
        if healthy >= 5 and healthy < 15 or seasoning >= 5 or healthy + seasoning >= 5 then
            exports['tnj-buffs']:AddBuff(src, CID, 'luck', 10*60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel more lucky', 4500, "success")
        end

        if healthy >= 15 then
            exports['tnj-buffs']:AddBuff(src, CID, 'luck', 35*60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel more lucky', 4500, "success")
        end

        -- ** Here's the relief stress part of the buffs, you can add or increase it however you'd like ** --
        if dairy >= 5 and dairy < 15 then 
            RelieveStress(src, math.random(1,3))
        end

        if dairy >= 15 then
            RelieveStress(src, math.random(5,10))
        end

        -- ** Here's the grain buff which makes it so people dont need to eat as often, make sure to read the TNJ install guide to make sure this is correctly implemented ** --
        if grain >= 5 and grain < 15 then
            exports['tnj-buffs']:AddBuff(src, CID, 'super-hunger', math.random(10, 15) * 60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel more full', 4500, "success")
        end

        if grain >= 15 then
            exports['tnj-buffs']:AddBuff(src, CID, 'super-hunger', math.random(25, 35) * 60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel more full', 4500, "success")
        end

        -- ** Here's the sugar buff, makes it so people run slightly faster for a period of time, you can change the duration and amount, the amount cannot be higher than 1.49. ** --
        if sugar >= 5 and sugar < 15 then
            buffTable[#buffTable+1] = {
                buff = "stamina",
                duration = math.random(5, 10) * 1000,
                amount = 1.10
            }
            TriggerClientEvent('QBCore:Notify', src, 'You feel the sugar running through you', 4500, "success")
        end

        if sugar >= 15 then
            buffTable[#buffTable+1] = {
                buff = "stamina",
                duration = math.random(10, 20) * 1000,
                amount = 1.20
            }
            TriggerClientEvent('QBCore:Notify', src, 'You feel the sugar running through you', 4500, "success")
        end

        -- ** Here's the super buff, you can change this fi you'd like but this is gonna make it slightly easier to hack. ** --
        if (protein + healthy + dairy + grain + seasoning) >= 24 then -- Super food effective for hacking, means they needs atleast 6 ingredients with 4 values of each.
            exports['tnj-buffs']:AddBuff(src, CID, 'intelligence', 20*60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel smarter', 4500, "success")
        end

        TriggerClientEvent('qb-businesses:client:SendClientBuffs', src, buffTable)
    end
end)

local function GiveWater(src, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    local newThirst = Player.PlayerData.metadata["thirst"]
    local Food = Player.PlayerData.metadata["hunger"]

    newThirst = newThirst + amount

    Player.Functions.SetMetaData('thirst', newThirst)
    TriggerClientEvent("hud:client:UpdateNeeds", src, Food, newThirst)
end

RegisterNetEvent('qb-businesses:server:DrinkBuffsAmt', function(src, CID, Table)
    if source ~= '' then return false end -- Safety check if the event was not called from the server.
    local thirst, sugar, alcohol = Table.thirst, Table.sugarAmt, Table.alcoholAmt


    -- Thirst is the amount of food value the food contains. --
    -- Sugar is the amount of sugar the food contains. --
    -- Alcohol is the amount of protein the food contains. --

    
    GiveWater(src, thirst)

    if alcohol > 0 then
        TriggerClientEvent('qb-businesses:client:BecomeDrunk', src, alcohol)
    end

    if Config.EnableBuffs then
        local buffTable = {}

        -- ** Here's the grain buff which makes it so people dont need to eat as often, make sure to read the TNJ install guide to make sure this is correctly implemented ** --
        if thirst >= 5 and thirst < 15 then
            exports['tnj-buffs']:AddBuff(src, CID, 'super-thirst', math.random(10, 15) * 60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel less thirsty', 4500, "success")
        end

        if thirst >= 15 then
            exports['tnj-buffs']:AddBuff(src, CID, 'super-thirst', math.random(25, 35) * 60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel less thirsty', 4500, "success")
        end

        -- ** Here's the sugar buff, makes it so people run slightly faster for a period of time, you can change the duration and amount, the amount cannot be higher than 1.49. ** --
        if sugar >= 5 and sugar < 15 then
            buffTable[#buffTable+1] = {
                buff = "swimming",
                duration = math.random(5, 10) * 1000,
                amount = 1.10
            }
            TriggerClientEvent('QBCore:Notify', src, 'You feel the sugar running through you', 4500, "success")
        end

        if sugar >= 15 then
            buffTable[#buffTable+1] = {
                buff = "swimming",
                duration = math.random(10, 20) * 1000,
                amount = 1.20
            }
            TriggerClientEvent('QBCore:Notify', src, 'You feel the sugar running through you', 4500, "success")
        end

        TriggerClientEvent('qb-businesses:client:SendClientBuffs', src, buffTable)
    end
end)