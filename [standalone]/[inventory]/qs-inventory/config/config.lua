Config = {}

--░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░
--██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░
--██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░
--██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░
--╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗
--░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝

Config.status_onTick = "esx_status:onTick" --Modify it if you use an Status Custom.
Config.status_getStatus = "esx_status:getStatus" --Modify it if you use an Status Custom.

Config.NotificationType = 'DrawText3D' -- 'ShowHelpNotification', 'DrawText3D', 'CustomNotify' (Edit the function 'CustomNotify below') or 'disable'.

Config.DropRefreshTime = 18000000 --Time for me to refresh the Drops.

--Player.
Config.MaxWeight = 120000 --This is the maximum weight of each player (Remember to add the same in qs-core/config.lua)
Config.MaxInventorySlots = 41 --The maximum slots of each player (Remember to add the same in qs-core/config.lua)

--Stashes.
Config.StashWeight = 100000 --Stash's maximum weight (Everyone will have this maximum)
Config.StashSlots = 50 --Stash's maximum slots (Everyone will have this maximum)

--Glovebox.
Config.GloveboxWeight = 10000 --Glovebox's maximum weight (Everyone will have this maximum)
Config.GloveboxSlots = 5 --Glovebox's maximum slots (Everyone will have this maximum)

--Hotbar.
Config.EnableVisualHotBar = true -- Enable the visual hotbar by default in TAB
Config.ShowWeapons = true -- Show a notification every time you use a weapon.
Config.ShowItems = true -- Show a notification every time you use an item.

Config.ItemsUsableFromHotbar = true -- Set if the items can be used from the hotbar or not.
Config.ItemsUsableFromHotbarInVehicle = true -- If the option above its true, you can only disable usage of items in vehicles (Not weapons).

Config.UpdateWeaponQuality = true
--Handsup.
Config.HandsUp = false --Hands Up is important, as it will allow other players to steal when they raise their hands.
Config.HandsUpKeyMappingName = 'Handsup' -- Name of the key mapping.
Config.HandsUpKey = 'X' -- Hands Up key.
Config.WeaponNeededToSteal = true -- True if you need a weapon in hand to steal someone else
Config.EnableSearchOtherPlayersInventory = true -- Enable or not search other players inventory
Config.EnableSearchOtherPlayersInventoryDead = true -- Enable or not search other players inventory if they are dead

Config.DistanceCheckEnable = true -- Enable distance check when you are stealing someone or not. (Only works in Onesync servers, DISABLE THIS IF YOU ARE NOT USING ONESYNC)
Config.DistanceCheckSteal = 10.0 -- Distance check to prevent hacker to open inventory of player that are far from them (Not recommended to lower it).

Config.ListAccountsSteal = { -- List of accounts to be stealed only in QBCore version.
    { account = 'cash' , name = 'Cash' },
    { account = 'crypto' , name = 'Crypto' },
}

Config.OpenAnimation = true --If you put true here, there will be an animation when opening the inventory.

-- Near players give items.
Config.ShowNameNearPlayer = true --Set to false it would just show the ID of the target.

-- Quasar Phone
Config.BlockHotBarPhone = false -- If you are using the quasar phone this option would block the hotbar when you are using it

-- Clothing as items
Config.ClothingAsItems = false -- Set true if you want to use clothes as items using the qs-clothes

Config.RenderPlayerClothesMenu = true -- Enable or disable render the player when you enter in the cloth menu of the inventory

-- To be able to use this you should be in ESX and follow the docs to add the event that trigger this once you join in the server for the first time.
-- Event to trigger only from serverside to serverside for segurity reason.
-- Event TriggerEvent('qs-inventory:GiveStarterItems', id)
Config.StarterItems = { 
    ['water_bottle'] = 3, -- Insert item first and then the amount.
    ['tosti'] = 5,
}

Config.Commands = { --Modify the commands as you want.
    ["fix"] = "inventoryfix",
    ["giveitem"] = "giveitem",
    ["giveweapon"] = "giveweapon",
    ["giveweaponcolor"] = "giveweaponcolor",
    ["randomitems"] = "randomitems",
    ["search"] = "search",
    ["handsup"] = "handsup",
    ["clearinventory"] = "clearinventory",

    ["openhotbar"] = "openhotbar",
    ["openinventory"] = "openinventory",
    ["openinventorytarget"] = "openinventorytarget",
    ["opentrunk"] = "opentrunk",
    ["openglovebox"] = "openglovebox",
}

Config.Keys = { --Basic inventory keys.
    ["OpenHotBar"] = "TAB",
    ["OpenInventory"] = "F2",
    ["OpenVending"] = "E",
    ["OpenStash"] = "E",
    ["RepairWeapon"] = "E",
    ["OpenCrafting"] = "E",
}

Config.notStolenItems = {
    ['id_card'] = true,
    ['water_bottle'] = true,
    ['tosti'] = true
}

Config.notStoredStashItems = {
    ['backpack'] = true, -- Don't modify this
}

function SendTextMessage(msg, type) --You can add your notification system here for simple messages.
    if type == 'inform' then 
      SetNotificationTextEntry('STRING')
      AddTextComponentString(msg)
      DrawNotification(0,1)
  
      --MORE EXAMPLES OF NOTIFICATIONS.
      --exports['qs-core']:Notify(msg, "primary")
      --exports['mythic_notify']:DoHudText('inform', msg)
    end
    if type == 'error' then 
      SetNotificationTextEntry('STRING')
      AddTextComponentString(msg)
      DrawNotification(0,1)
  
      --MORE EXAMPLES OF NOTIFICATIONS.
      --exports['qs-core']:Notify(msg, "error")
      --exports['mythic_notify']:DoHudText('error', msg)
    end
    if type == 'success' then 
      SetNotificationTextEntry('STRING')
      AddTextComponentString(msg)
      DrawNotification(0,1)
  
      --MORE EXAMPLES OF NOTIFICATIONS.
      --exports['qs-core']:Notify(msg, "success")
      --exports['mythic_notify']:DoHudText('success', msg)
    end
end

function CustomNotify(x, y, z, text)
    -- Add your custom draw notification system here.
end


--██╗░░░██╗██╗░██████╗██╗░░░██╗░█████╗░██╗░░░░░  ░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░
--██║░░░██║██║██╔════╝██║░░░██║██╔══██╗██║░░░░░  ██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░
--╚██╗░██╔╝██║╚█████╗░██║░░░██║███████║██║░░░░░  ██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░
--░╚████╔╝░██║░╚═══██╗██║░░░██║██╔══██║██║░░░░░  ██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗
--░░╚██╔╝░░██║██████╔╝╚██████╔╝██║░░██║███████╗  ╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝
--░░░╚═╝░░░╚═╝╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝  ░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░

Config.HideMinimap = false --If you activate this, you will hide the map when opening the inventory and reveal it when closing it.
Config.ToggleHud = true --If you don't use this option, just leave it false (Hide your hud when opening the inventory)

function ToggleHudTrue(toggle) --If your Hud has this system, you can add these functions.
    TriggerEvent("trew_hud_ui:toggleTrue")
end

function ToggleHudFalse(toggle) --If your Hud has this system, you can add these functions.
    TriggerEvent("trew_hud_ui:toggleFalse")
end

Config.RepairMarker = { --Modify the Stash marker as you like.
    enablemarker = true,
    type = 2, 
    scale = {x = 0.2, y = 0.2, z = 0.1}, 
    colour = {r = 71, g = 181, b = 255, a = 120},
    movement = 1, --Use 0 to disable movement.
    distanceMarker = 10.0,
    distanceText = 1.5,
}

Config.DropMarker = { --Modify the Drop marker as you like.
    enabletext = false,
    type = 2, 
    scale = {x = 0.2, y = 0.2, z = 0.1}, 
    colour = {r = 71, g = 181, b = 255, a = 120},
    movement = 1, --Use 0 to disable movement.
    distanceMarker = 7.5,
    distanceText = 2.5,
}

RegisterNetEvent('ActionNotifications')
AddEventHandler('ActionNotifications', function(data, source, name, item, count)
    NotificationActions(data, source, name, item, count)
end)

Config.EnableActionNotifications = true

function NotificationActions(data, source, name, item, count)
    if Config.EnableActionNotifications then
        if data then 
            if data == 'givetoplayer' then 
                --TriggerEvent('inform:sendInform', name .. ' give x' .. count .. ' '.. item, source)
            elseif data == 'otherplayer' then 
                --TriggerEvent('inform:sendInform', name .. ' start to search the target', source)
            elseif data == 'stash' then
                --TriggerEvent('inform:sendInform', name .. ' open an inventory', source)
            elseif data == 'trunk' then
                --TriggerEvent('inform:sendInform', name .. ' open the trunk', source)
            elseif data == 'glovebox' then
                --TriggerEvent('inform:sendInform', name .. ' open the glovebox', source)
            elseif data == 'shop' then
                --TriggerEvent('inform:sendInform', name .. ' its looking the products', source)
            elseif data == 'garbage' then
                --TriggerEvent('inform:sendInform', name .. ' its looking into the garbage', source)
            elseif data == '' then
            end
        end
    end
end


--██████╗░███████╗░██████╗░  ██╗████████╗███████╗███╗░░░███╗░██████╗
--██╔══██╗██╔════╝██╔═══██╗  ██║╚══██╔══╝██╔════╝████╗░████║██╔════╝
--██████╔╝█████╗░░██║██╗██║  ██║░░░██║░░░█████╗░░██╔████╔██║╚█████╗░
--██╔══██╗██╔══╝░░╚██████╔╝  ██║░░░██║░░░██╔══╝░░██║╚██╔╝██║░╚═══██╗
--██║░░██║███████╗░╚═██╔═╝░  ██║░░░██║░░░███████╗██║░╚═╝░██║██████╔╝
--╚═╝░░╚═╝╚══════╝░░░╚═╝░░░  ╚═╝░░░╚═╝░░░╚══════╝╚═╝░░░░░╚═╝╚═════╝░

Config.ReqItems = {
    {
        coords = vec3(2699.0739746094, 3296.3061523438, 55.703121185303),
        dist = 5.0,
        items = {
            'lockpick',
            'advancedlockpick'
        },
    },
    {
        coords = vec3(2691.1044921875, 3284.0744628906, 55.240516662598),
        dist = 5.0,
        items = {
            'sandwich',
            'advancedlockpick'
        },
    },
}

--██╗░░░██╗███████╗██╗░░██╗██╗░█████╗░██╗░░░░░███████╗░██████╗
--██║░░░██║██╔════╝██║░░██║██║██╔══██╗██║░░░░░██╔════╝██╔════╝
--╚██╗░██╔╝█████╗░░███████║██║██║░░╚═╝██║░░░░░█████╗░░╚█████╗░
--░╚████╔╝░██╔══╝░░██╔══██║██║██║░░██╗██║░░░░░██╔══╝░░░╚═══██╗
--░░╚██╔╝░░███████╗██║░░██║██║╚█████╔╝███████╗███████╗██████╔╝
--░░░╚═╝░░░╚══════╝╚═╝░░╚═╝╚═╝░╚════╝░╚══════╝╚══════╝╚═════╝░

-- Glovebox
Config.OpenGloveboxesAll = false -- Set to true to allow all players to open the glovebox of the vehicles / Set false to allow only the owner of the vehicle to open the glovebox
Config.OpenGloveboxesPolice = true -- If the option above its set to false, set if the police can open the trunk or not anyways
Config.OpenGloveboxesPoliceGrade = 0 -- Grade from the police will be able to open the gloveboxs

-- Trunk
Config.OpenTrunkAll = false -- Set to true to allow all players to open the trunk of the vehicles / Set false to allow only the owner of the vehicle to open the trunk
Config.OpenTrunkPolice = true -- If the option above its set to false, set if the police can open the trunk or not anyways
Config.OpenTrunkPoliceGrade = 0 -- Grade from the police will be able to open the trunks

Config.TrunkWeightVehicles = { -- Add here the vehicles you want to have an specific weight or slots in the trunk (Respect the type of quotation marks, if not it will not work)
    [`adder`] = { -- respect the type of quotation marks
        maxweight = 45000,
        slots = 40,
    },
}

Config.TrunkWeight = { --You can check the type of vehicle here or in its META files https://wiki.rage.mp/index.php?title=Vehicles#Compacts.
    ["compacts"] = {
        maxweight = 38000,
        slots = 30,
    },
    ["sedans"] = {
        maxweight = 50000,
        slots = 40,
    },
    ["suvs"] = {
        maxweight = 75000,
        slots = 50,
    },
    ["coupes"] = {
        maxweight = 42000,
        slots = 35,
    },
    ["muscle"] = {
        maxweight = 38000,
        slots = 30,
    },
    ["sportclassics"] = {
        maxweight = 30000,
        slots = 25,
    },
    ["sports"] = {
        maxweight = 30000,
        slots = 25,
    },
    ["super"] = {
        maxweight = 30000,
        slots = 25,
    },
    
    ["motorcycles"] = {
        maxweight = 15000,
        slots = 15,
    },
    
    ["offroad"] = {
        maxweight = 60000,
        slots = 35,
    },
    
    ["industrial"] = {
        maxweight = 120000,
        slots = 35,
    },
    
    ["utility"] = {
        maxweight = 120000,
        slots = 35,
    },
    ["vans"] = {
        maxweight = 30000,
        slots = 25,
    },
    ["cycles"] = {
        maxweight = 30000,
        slots = 25,
    },
    
    ["boats"] = {
        maxweight = 15000,
        slots = 15,
    },
    
    ["helicopters"] = {
        maxweight = 60000,
        slots = 35,
    },
    
    ["planes"] = {
        maxweight = 120000,
        slots = 35,
    },
    
    ["service"] = {
        maxweight = 120000,
        slots = 35,
    },
    ["emergency"] = {
        maxweight = 30000,
        slots = 25,
    },
    ["military"] = {
        maxweight = 30000,
        slots = 25,
    },
    
    ["commercial"] = {
        maxweight = 15000,
        slots = 15,
    },
    
    ["trains"] = {
        maxweight = 60000,
        slots = 35,
    },
}

Config.BackEngineVehicles = { --The cars on this list will have the trunk in front.
    'ninef',
    'adder',
    'vagner',
    't20',
    'infernus',
    'zentorno',
    'reaper',
    'comet2',
    'comet3',
    'jester',
    'jester2',
    'cheetah',
    'cheetah2',
    'prototipo',
    'turismor',
    'pfister811',
    'ardent',
    'nero',
    'nero2',
    'tempesta',
    'vacca',
    'bullet',
    'osiris',
    'entityxf',
    'turismo2',
    'fmj',
    're7b',
    'tyrus',
    'italigtb',
    'penetrator',
    'monroe',
    'ninef2',
    'stingergt',
    'surfer',
    'surfer2',
    'comet3',
}


--░██████╗░░█████╗░██████╗░██████╗░░█████╗░░██████╗░███████╗
--██╔════╝░██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝░██╔════╝
--██║░░██╗░███████║██████╔╝██████╦╝███████║██║░░██╗░█████╗░░
--██║░░╚██╗██╔══██║██╔══██╗██╔══██╗██╔══██║██║░░╚██╗██╔══╝░░
--╚██████╔╝██║░░██║██║░░██║██████╦╝██║░░██║╚██████╔╝███████╗
--░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝░╚═════╝░╚══════╝

Config.GarbageItems = {}

Config.FreezeGarbages = true -- Recommendation to set this config true to freeze all garbages in the Config.Garbage Props config to not allow players to move them with a vehicle.

Config.GarbageRefreshTime = 3600000 --Time in milliseconds for new objects to appear in the trash.

Config.GarbageProps = { --Modify the props of the garbage cans (Search the props in google)
    [218085040] = true,
    [666561306] = true, 
	[-58485588] = true,
	[-206690185] = true,
	[1511880420] = true,
    [682791951] = true, 
}

Config.RandomGarbageItems = { --Add here the trash items (One of these random options will appear)
    [1] = {
        [1] = {
            name = "aluminum",
            amount = math.random(1, 4),
            price = 4,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "plastic",
            amount = math.random(1, 7),
            price = 4,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    [2] = {
        [1] = {
            name = "plastic",
            amount = math.random(1, 7),
            price = 4,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "metalscrap",
            amount = math.random(1, 5),
            price = 4,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    [3] = {
        [1] = {
            name = "glass",
            amount = math.random(1, 7),
            price = 4,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "joint",
            amount = 1,
            price = 4,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    [4] = {
        [1] = {
            name = "lighter",
            amount = math.random(1, 2),
            price = 4,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "metalscrap",
            amount = math.random(1, 7),
            price = 4,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    [5] = {
        [1] = {
            name = "metalscrap",
            amount = math.random(1, 10),
            price = 4,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "rubber",
            amount = math.random(1, 15),
            price = 4,
            info = {},
            type = "item",
            slot = 2,
        },
    },
}