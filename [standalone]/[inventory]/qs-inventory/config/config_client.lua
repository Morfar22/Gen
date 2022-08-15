local lib, anim = 'missminuteman_1ig_2' , 'handsup_base'
local canUseInventoryAndHotbar = true
local canHandsUp = true

AddEventHandler('canUseInventoryAndHotbar:toggle', function(parameter)
	canUseInventoryAndHotbar = parameter
end)

AddEventHandler('canHandsUp:toggle', function(parameter)
	canHandsUp = parameter
end)

RegisterKeyMapping(Config.Commands["handsup"], Config.HandsUpKeyMappingName, 'keyboard', Config.HandsUpKey)

RegisterCommand(Config.Commands["handsup"], function ()
    if Config.HandsUp then
        local playerPed = PlayerPedId()
        if not IsPedInAnyVehicle(playerPed, false) then
            RequestAnimDict(lib)
            while not HasAnimDictLoaded(lib) do
                Citizen.Wait(100)
            end
            if Config.BlockHotBarPhone then
                if IsEntityPlayingAnim(playerPed, lib, anim, 3) then
                    ClearPedSecondaryTask(playerPed)
                elseif not exports['qs-smartphone']:InPhone() then
                    if canHandsUp then
                        TaskPlayAnim(playerPed, lib, anim, 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
                    end
                end
            else
                if IsEntityPlayingAnim(playerPed, lib, anim, 3) then
                    ClearPedSecondaryTask(playerPed)
                else
                    if canHandsUp then
                        TaskPlayAnim(playerPed, lib, anim, 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
                    end
                end
            end
        end
	end
end)

RegisterKeyMapping(Config.Commands["openinventory"], 'OpenInventory', 'keyboard', Config.Keys['OpenInventory'])

RegisterCommand(Config.Commands["openinventory"], function()
    if Config.Framework == 'ESX' then
        if IsPedDeadOrDying(PlayerPedId(), 1) then
            return
        end
    elseif Config.Framework == 'QBCore' then
        local data = QBCore.Functions.GetPlayerData()
        if data and data.metadata then 
            if data.metadata['isdead'] or data.metadata['inlaststand'] or data.metadata['ishandcuffed'] then 
                return
            end 
        end
    end
    Citizen.CreateThread(function()
        if IsInputDisabled(0) and not isCrafting and canUseInventoryAndHotbar then
            local pCoords = GetEntityCoords(PlayerPedId())
            local garbage = nil
            local pCoords = GetEntityCoords(PlayerPedId())
            local entity, entityDst = GetClosestObject(pCoords, Config.GarbageProps)
            local CurrentGarbage = {}
            if DoesEntityExist(entity) and entityDst <= 2 and not IsPedInAnyVehicle(PlayerPedId()) then
                local x, y, z = table.unpack(GetEntityCoords(entity))
                local _, floorZ = GetGroundZFor_3dCoord(x, y, z)
                garbage = getOwnerFromCoordsForGarbage(vector3(x, y, floorZ))
                CurrentGarbage.label = Lang("GARBAGE_LABEL")
                CurrentGarbage.items = Config.RandomGarbageItems
                CurrentGarbage.slots = 30
            end
            curVeh = nil
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                CurrentGlovebox = GetVehicleNumberPlateText(vehicle)
                curVeh = vehicle
                CurrentVehicle = nil
            else
                local vehicle
                if Config.Framework == 'ESX' then
                    vehicle = ESX.Game.GetClosestVehicle()
                elseif Config.Framework == 'QBCore' then
                    vehicle = QBCore.Functions.GetClosestVehicle()
                end
                if vehicle ~= 0 and vehicle ~= nil then
                    local pos = GetEntityCoords(PlayerPedId())
                    local trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                    end
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, trunkpos) < 2.0) and not IsPedInAnyVehicle(PlayerPedId()) then
                        if GetVehicleDoorLockStatus(vehicle) < 2 then
                            CurrentVehicle = GetVehicleNumberPlateText(vehicle)
                            curVeh = vehicle
                            CurrentGlovebox = nil
                        else
                            SendTextMessage(Lang("VEHICLE_LOCKED"), 'error')
                            CurrentVehicle = nil
                            curVeh = nil
                            CurrentGlovebox = nil
                        end
                    else
                        CurrentVehicle = nil
                    end
                else
                    CurrentVehicle = nil
                end
            end

            if CurrentVehicle ~= nil then
                local maxweight = 0
                local slots = 0
                if Config.TrunkWeightVehicles and Config.TrunkWeightVehicles[GetEntityModel(curVeh)] then
                    maxweight = Config.TrunkWeightVehicles[GetEntityModel(curVeh)].maxweight
                    slots = Config.TrunkWeightVehicles[GetEntityModel(curVeh)].slots
                else
                    if GetVehicleClass(curVeh) == 0 then
                        maxweight = Config.TrunkWeight["compacts"].maxweight
                        slots = Config.TrunkWeight["compacts"].slots
                    elseif GetVehicleClass(curVeh) == 1 then
                        maxweight = Config.TrunkWeight["sedans"].maxweight
                        slots = Config.TrunkWeight["sedans"].slots
                    elseif GetVehicleClass(curVeh) == 2 then
                        maxweight = Config.TrunkWeight["suvs"].maxweight
                        slots = Config.TrunkWeight["suvs"].slots
                    elseif GetVehicleClass(curVeh) == 3 then
                        maxweight = Config.TrunkWeight["coupes"].maxweight
                        slots = Config.TrunkWeight["coupes"].slots
                    elseif GetVehicleClass(curVeh) == 4 then
                        maxweight = Config.TrunkWeight["muscle"].maxweight
                        slots = Config.TrunkWeight["muscle"].slots
                    elseif GetVehicleClass(curVeh) == 5 then
                        maxweight = Config.TrunkWeight["sportclassics"].maxweight
                        slots = Config.TrunkWeight["sportclassics"].slots
                    elseif GetVehicleClass(curVeh) == 6 then
                        maxweight = Config.TrunkWeight["sports"].maxweight
                        slots = Config.TrunkWeight["sports"].slots
                    elseif GetVehicleClass(curVeh) == 7 then
                        maxweight = Config.TrunkWeight["super"].maxweight
                        slots = Config.TrunkWeight["super"].slots
                    elseif GetVehicleClass(curVeh) == 8 then
                        maxweight = Config.TrunkWeight["motorcycles"].maxweight
                        slots = Config.TrunkWeight["motorcycles"].slots
                    elseif GetVehicleClass(curVeh) == 9 then
                        maxweight = Config.TrunkWeight["offroad"].maxweight
                        slots = Config.TrunkWeight["offroad"].slots
                    elseif GetVehicleClass(curVeh) == 10 then
                        maxweight = Config.TrunkWeight["industrial"].maxweight
                        slots = Config.TrunkWeight["industrial"].slots
                    elseif GetVehicleClass(curVeh) == 11 then
                        maxweight = Config.TrunkWeight["utility"].maxweight
                        slots = Config.TrunkWeight["utility"].slots
                    elseif GetVehicleClass(curVeh) == 12 then
                        maxweight = Config.TrunkWeight["vans"].maxweight
                        slots = Config.TrunkWeight["vans"].slots
                    elseif GetVehicleClass(curVeh) == 13 then
                        maxweight = Config.TrunkWeight["cycles"].maxweight
                        slots = Config.TrunkWeight["cycles"].slots
                    elseif GetVehicleClass(curVeh) == 14 then
                        maxweight = Config.TrunkWeight["boats"].maxweight
                        slots = Config.TrunkWeight["boats"].slots
                    elseif GetVehicleClass(curVeh) == 15 then
                        maxweight = Config.TrunkWeight["helicopters"].maxweight
                        slots = Config.TrunkWeight["helicopters"].slots
                    elseif GetVehicleClass(curVeh) == 16 then
                        maxweight = Config.TrunkWeight["planes"].maxweight
                        slots = Config.TrunkWeight["planes"].slots
                    elseif GetVehicleClass(curVeh) == 17 then
                        maxweight = Config.TrunkWeight["service"].maxweight
                        slots = Config.TrunkWeight["service"].slots
                    elseif GetVehicleClass(curVeh) == 18 then
                        maxweight = Config.TrunkWeight["emergency"].maxweight
                        slots = Config.TrunkWeight["emergency"].slots
                    elseif GetVehicleClass(curVeh) == 19 then
                        maxweight = Config.TrunkWeight["military"].maxweight
                        slots = Config.TrunkWeight["military"].slots
                    elseif GetVehicleClass(curVeh) == 20 then
                        maxweight = Config.TrunkWeight["commercial"].maxweight
                        slots = Config.TrunkWeight["commercial"].slots
                    elseif GetVehicleClass(curVeh) == 21 then
                        maxweight = Config.TrunkWeight["trains"].maxweight
                        slots = Config.TrunkWeight["trains"].slots
                    end
                end
                local other = {
                    maxweight = maxweight,
                    slots = slots,
                }
                TriggerServerEvent("inventory:server:OpenInventory", "trunk", CurrentVehicle, other)
                OpenTrunk()
            elseif CurrentGlovebox ~= nil then
                TriggerServerEvent("inventory:server:OpenInventory", "glovebox", CurrentGlovebox)
            elseif CurrentDrop ~= 0 and not IsPedInAnyVehicle(PlayerPedId()) then
                if Config.OpenAnimation then
                    TriggerEvent('randPickupAnim')
                end
                TriggerServerEvent("inventory:server:OpenInventory", "drop", CurrentDrop)
            elseif garbage ~= nil and not IsPedInAnyVehicle(PlayerPedId()) then
                TriggerServerEvent("inventory:server:OpenInventory", 'garbage', garbage, CurrentGarbage) 
                OpenGarbage()
            else
                if Config.OpenAnimation then
                    TriggerEvent('randPickupAnim')
                end
                TriggerServerEvent("inventory:server:OpenInventory")
            end
        end
    end)
end)

RegisterKeyMapping('+' .. Config.Commands["openhotbar"], 'OpenHotBar', 'keyboard', Config.Keys['OpenHotBar'])

local openHotBar = false
RegisterCommand('+' .. Config.Commands["openhotbar"], function()
    if canUseInventoryAndHotbar then
        ToggleHotbar(true)
    end
end)

RegisterCommand('-'.. Config.Commands["openhotbar"], function()
    ToggleHotbar(false)
end, false)

-- Function in Steal button
AddEventHandler('inventory:client:search', function()
    if Config.Framework == 'ESX' then
        local player, distance = ESX.Game.GetClosestPlayer()
        if player ~= -1 and distance < 3.0 then
            local playerId = GetPlayerServerId(player)
            local searchPlayerPed = GetPlayerPed(player)
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if DoesEntityExist(searchPlayerPed) and (IsEntityPlayingAnim(searchPlayerPed, lib, anim, 3) or IsEntityDeadCheck(searchPlayerPed)) then
                loadanimdict('combat@aim_variations@arrest')
                TaskPlayAnim(PlayerPedId(), 'combat@aim_variations@arrest', 'cop_med_arrest_01', 8.0, -8,3750, 2, 0, 0, 0, 0)
                exports['progressbar']:Progress({
                    name = "robbing",
                    duration = 5000,
                    label = 'Robbing...',
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                }, function(cancelled)
                    if not cancelled then
                        TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", playerId)
                    else
                        SendTextMessage(Lang("STOP_ROBBERY"))
                    end
                end)
                Citizen.Wait(5000)
                ClearPedTasks(PlayerPedId())
                ClearPedSecondaryTask(PlayerPedId())
            else
                SendTextMessage(Lang("PLAYER_SEARCH"))
            end
        else
            SendTextMessage(Lang("NO_PLAYERS"))
        end
    elseif Config.Framework == 'QBCore' then
        local pCoords = GetEntityCoords(PlayerPedId())
        local player, distance = QBCore.Functions.GetClosestPlayer(pCoords)
        if player ~= -1 and distance < 3.0 then
            local playerId = GetPlayerServerId(player)
            local searchPlayerPed = GetPlayerPed(player)
            local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer(pCoords)
            if DoesEntityExist(searchPlayerPed) and (IsEntityPlayingAnim(searchPlayerPed, lib, anim, 3) or IsEntityDeadCheck(searchPlayerPed)) then
                loadanimdict('combat@aim_variations@arrest')
                TaskPlayAnim(PlayerPedId(), 'combat@aim_variations@arrest', 'cop_med_arrest_01', 8.0, -8,3750, 2, 0, 0, 0, 0)
                exports['progressbar']:Progress({
                    name = "robbing",
                    duration = 5000,
                    label = 'Robbing',
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                }, function(cancelled)
                    if not cancelled then
                        TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", playerId)
                    else
                        SendTextMessage(Lang("STOP_ROBBERY"))
                    end
                end)
                Citizen.Wait(5000)
                ClearPedTasks(PlayerPedId())
                ClearPedSecondaryTask(PlayerPedId())
            else
                SendTextMessage(Lang("PLAYER_SEARCH"))
            end
        else
            SendTextMessage(Lang("NO_PLAYERS"))
        end
    end
end)

AddEventHandler("inventory:client:OpenInventory", function(PlayerAmmo, inventory, other)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(PlayerPedId())

    if Config.Framework == 'ESX' then
        if IsPedDeadOrDying(PlayerPedId(), 1) then
            return
        end
        ToggleHotbar(false)
        SetNuiFocus(true, true)
        if other and other.id then
            local target = tonumber(other.id)
            local playerTarget = GetPlayerFromServerId(target)
            local pedTarget = GetPlayerPed(playerTarget)
            if other ~= nil then
                currentOtherInventory = other.name     
            end
            if target and DoesEntityExist(pedTarget) then
                local pos = GetEntityCoords(playerPed)
                local targetPos = GetEntityCoords(pedTarget)
                local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, targetPos.x, targetPos.y, targetPos.z, true)
                if distance < 3.0 then
                    inInventory = true
                    StealingPed = pedTarget
                    TriggerEvent('inventory:client:RobPlayer', target)
                end
            end
        else
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestPlayer and closestPlayer ~= -1 and closestDistance < 3.0 then
                local playerId = GetPlayerServerId(closestPlayer)
                local searchPlayerPed = GetPlayerPed(closestPlayer)
                if searchPlayerPed and searchPlayerPed ~= 0 then
                    if DoesEntityExist(searchPlayerPed) and (IsEntityPlayingAnim(searchPlayerPed, lib, anim, 3) or IsEntityDeadCheck(searchPlayerPed)) then
                        inInventory = true
                        StealingPed = searchPlayerPed
                        TriggerEvent('inventory:client:RobPlayer', playerId)
                    end
                end
            end
        end

        pid = GetPlayerServerId(PlayerId())
        data = ESX.GetPlayerData()
        job = data.job.label
        ranklabel = data.job.grade_label
        money, bank, blackmoney, vip = 0, 0, 0, 0
        
        for i = 1, #data.accounts do 
            if data.accounts[i].name == 'money' then 
                money = data.accounts[i].money
            elseif data.accounts[i].name == 'bank' then
                bank = data.accounts[i].money
            elseif data.accounts[i].name == 'black_money' then
                blackmoney = data.accounts[i].money
            end
        end

        SendNUIMessage({
            action = "open",
            inventory = inventory,
            slots = Config.MaxInventorySlots - 1,
            other = other,
            maxweight = Config.MaxWeight,
            Ammo = PlayerAmmo,

            playerhp = GetEntityHealth(PlayerPedId()),
            playerarmor = GetPedArmour(PlayerPedId()),
            playerhunger = hunger,
            playerthirst = thirst,

            playerId = GetPlayerServerId(PlayerId()),
            playerJob = ESX.GetPlayerData().job.label,
            playerMoney = money,
            playerBank = bank,
            playerBlackMoney = blackmoney,

            playerName = GetPlayerName(PlayerId()),
            notStolenItems = Config.notStolenItems,
            notStoredStashItems = Config.notStoredStashItems,
            qs = QS.Shared.Items,

            availableHud = Config.InventoryHud,
            InventoryPlayerName = Config.InventoryPlayerName,
            
            availableplayerhp = Config.InventoryBoxes.playerhp,
            availableplayerarmor = Config.InventoryBoxes.playerarmor,
            availableplayerhunger = Config.InventoryBoxes.playerhunger,
            availableplayerthirst = Config.InventoryBoxes.playerthirst,

            availableplayerid = Config.InventoryBoxes.playerid,
            availableplayermoney = Config.InventoryBoxes.playermoney,
            availableplayerbank = Config.InventoryBoxes.playerbank,
            availableblackmoney = Config.InventoryBoxes.playerblackmoney,
        })

        if Config.ToggleHud then
            ToggleHudFalse(toggle)
        end
        if Config.HideMinimap then
            DisplayRadar(false)
        end
    elseif Config.Framework == 'QBCore' then
        local data = QBCore.Functions.GetPlayerData()
        if data and data.metadata['isdead'] or data.metadata['inlaststand'] or data.metadata['ishandcuffed'] then 
            return 
        end
        ToggleHotbar(false)
        SetNuiFocus(true, true)
        if other and other.id then
            local target = tonumber(other.id)
            local playerTarget = GetPlayerFromServerId(target)
            local pedTarget = GetPlayerPed(playerTarget)
            if other ~= nil then
                currentOtherInventory = other.name     
            end
            if target and DoesEntityExist(pedTarget) then
                local pos = GetEntityCoords(playerPed)
                local targetPos = GetEntityCoords(pedTarget)
                local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, targetPos.x, targetPos.y, targetPos.z, true)
                if distance < 3.0 then
                    StealingPed = pedTarget
                    TriggerEvent('inventory:client:RobPlayer', target)
                end
            end
        else
            local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer(pCoords)
            if closestPlayer and closestPlayer ~= -1 and closestDistance < 3.0 then
                local playerId = GetPlayerServerId(closestPlayer)
                local searchPlayerPed = GetPlayerPed(closestPlayer)
                if searchPlayerPed and searchPlayerPed ~= 0 then 
                    if DoesEntityExist(searchPlayerPed) and (IsEntityPlayingAnim(searchPlayerPed, lib, anim, 3) or IsEntityDeadCheck(searchPlayerPed)) then
                        StealingPed = pedTarget
                        TriggerEvent('inventory:client:RobPlayer', playerId)
                    end
                end
            end
        end

        local PlayerData = QBCore.Functions.GetPlayerData()
        SendNUIMessage({
            action = "open",
            inventory = inventory,
            slots = Config.MaxInventorySlots - 1,
            other = other,
            maxweight = Config.MaxWeight,
            Ammo = PlayerAmmo,

            playerhp = GetEntityHealth(PlayerPedId()),
            playerarmor = GetPedArmour(PlayerPedId()),
            playerhunger = PlayerData.metadata['hunger'], 
            playerthirst = PlayerData.metadata['thirst'],

            playerId = GetPlayerServerId(PlayerId()),
            playerJob = QBCore.Functions.GetPlayerData().job.label,
            playerMoney = PlayerData.money['cash'],
            playerBank = PlayerData.money['bank'],
            playerBlackMoney = PlayerData.money['crypto'],

            playerName = GetPlayerName(PlayerId()),
            notStolenItems = Config.notStolenItems,
            notStoredStashItems = Config.notStoredStashItems,
            qs = QBCore.Shared.Items,

            availableHud = Config.InventoryHud,
            InventoryPlayerName = Config.InventoryPlayerName,
            
            availableplayerhp = Config.InventoryBoxes.playerhp,
            availableplayerarmor = Config.InventoryBoxes.playerarmor,
            availableplayerhunger = Config.InventoryBoxes.playerhunger,
            availableplayerthirst = Config.InventoryBoxes.playerthirst,

            availableplayerid = Config.InventoryBoxes.playerid,
            availableplayermoney = Config.InventoryBoxes.playermoney,
            availableplayerbank = Config.InventoryBoxes.playerbank,
            availableblackmoney = Config.InventoryBoxes.playerblackmoney,
        })
        inInventory = true
        if Config.ToggleHud then
            ToggleHudFalse(toggle)
        end
        if Config.HideMinimap then
            DisplayRadar(false)
        end
    end
end)

function IsEntityDeadCheck(pedX)
    local ped = pedX
    if Config.EnableSearchOtherPlayersInventoryDead then 
        if Config.Framework == 'ESX' then
            if IsPedDeadOrDying(ped, 1) then
                return true
            else 
                return false
            end
        elseif Config.Framework == 'QBCore' then
            if IsPedDeadOrDying(ped, 1) then 
                return true
            else 
                local isDead = nil
                local player = NetworkGetPlayerIndexFromPed(ped)
                if player and player ~= -1 then
                    local serverId = GetPlayerServerId(player)
                    if serverId then
                        QBCore.Functions.TriggerCallback('QBCore:CheckIfTargetItsDead', function(result)
                            isDead = result
                        end, serverId)
                        while isDead == nil do Wait(10) end
                        return isDead
                    else 
                        return false
                    end
                else 
                    return false
                end
            end
        end
    else 
        return false
    end
end 

Citizen.CreateThread(function()
    local initialPosition = nil
	while true do
		Wait(100)
        if inInventory then
            if not canUseInventoryAndHotbar then 
                SendNUIMessage({action = "close"})
            else 
                local ped = PlayerPedId()
                if CurrentGlovebox then -- Glovebox
                    if not IsPedInAnyVehicle(ped) then
                        SendNUIMessage({action = "close"})
                    end
                    initialPosition = nil
                elseif CurrentStash ~= nil then -- Stash
                    if initialPosition == nil then 
                        initialPosition = GetEntityCoords(ped)
                    else
                        local tempPosition = GetEntityCoords(ped)
                        if (GetDistanceBetweenCoords(initialPosition.x, initialPosition.y, initialPosition.z, tempPosition.x, tempPosition.y, tempPosition.z, true) > 2.5) then
                            SendNUIMessage({action = "close"})
                            initialPosition = nil
                        end
                    end
                elseif CurrentVehicle ~= nil then -- Trunk
                    local tempPosition = GetEntityCoords(ped)
                    local vehPosition = GetEntityCoords(curVeh)
                    if not DoesEntityExist(curVeh) or GetDistanceBetweenCoords(vehPosition.x, vehPosition.y, vehPosition.z, tempPosition.x, tempPosition.y, tempPosition.z, true) > 10.0 then 
                        SendNUIMessage({action = "close"})
                    end
                elseif CurrentDrop ~= 0 then
                    if initialPosition == nil then 
                        initialPosition = GetEntityCoords(ped)
                    else
                        local tempPosition = GetEntityCoords(ped)
                        if (GetDistanceBetweenCoords(initialPosition.x, initialPosition.y, initialPosition.z, tempPosition.x, tempPosition.y, tempPosition.z, true) > 4.0) or IsPedInAnyVehicle(ped) then
                            SendNUIMessage({action = "close"})
                            initialPosition = nil
                        end
                    end
                elseif StealingPed then -- Stealing player
                    if DoesEntityExist(StealingPed) then
                        local tempPosition = GetEntityCoords(ped)
                        local targetPosition = GetEntityCoords(StealingPed)
                        if (GetDistanceBetweenCoords(tempPosition.x, tempPosition.y, tempPosition.z, targetPosition.x, targetPosition.y, targetPosition.z, true) > 3.5) or IsPedInAnyVehicle(ped) then
                            SendNUIMessage({action = "close"})
                        end
                    else
                        SendNUIMessage({action = "close"})
                    end
                else -- Others
                    if IsPedInAnyVehicle(ped) then 
                        SendNUIMessage({action = "close"})
                    end
                    initialPosition = nil
                end
            end
        else 
            initialPosition = nil
        end
    end
end)

RegisterNetEvent("inventory:giveitemtoplayer:animation") -- Animation when you give an item to a player
AddEventHandler("inventory:giveitemtoplayer:animation", function()
    loadAnimDict('mp_common')
    TaskPlayAnim(PlayerPedId(),'mp_common', 'givetake1_a',5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    Wait(1000)
    ClearPedSecondaryTask(PlayerPedId())
end)

if Config.Framework == 'ESX' then
    Citizen.CreateThread(function()
        while true do
            Wait(1000)
            local ped = PlayerPedId()
            if IsPedDeadOrDying(ped, 1) then
                if inInventory then 
                    SendNUIMessage({
                        action = "close",
                    })
                end
            end
        end
    end)
elseif Config.Framework == 'QBCore' then
    Citizen.CreateThread(function()
        while not QBCore do Wait(100) end
        while true do
            Wait(1000)
            local data = QBCore.Functions.GetPlayerData()
            if data and data.metadata then 
                if data.metadata['isdead'] or data.metadata['inlaststand'] or data.metadata['ishandcuffed'] then 
                    if inInventory then 
                        SendNUIMessage({
                            action = "close",
                        })
                    end
                end
            end
        end
    end)
end