If you purchased this anywhere other than my Tebex page you have purchased a leak and supported thieves.

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/xKgQZ6wZvS

# INSTALLATION

## Add the script to the server resources
- I highly recommend putting the `jim-mechanic` folder in a new folder called `[jim]`
- Then add `ensure [jim]` AFTER your other scripts in your server.cfg

---
# Item installation
- Add the image files from the zip to your `qb-inventory > html > images` folder

- Add these lines to your qb-core > shared lua under the Items section
```lua
	--Jim-Mechanic Vehicles
	["mechanic_tools"] 				= {["name"] = "mechanic_tools", 			["label"] = "Mechanic tools", 		    ["weight"] = 0, 		["type"] = "item", 		["image"] = "mechanic_tools.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Needed for vehicle repairs"},
	["toolbox"] 					= {["name"] = "toolbox", 			 	  	["label"] = "Toolbox", 		            ["weight"] = 0, 		["type"] = "item", 		["image"] = "toolbox.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Needed for Performance part removal"},
	["ducttape"] 					= {["name"] = "ducttape", 			 	  	["label"] = "Duct Tape", 		       	["weight"] = 0, 		["type"] = "item", 		["image"] = "bodyrepair.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Good for quick fixes"},
	["mechboard"] 					= {["name"] = "mechboard", 			 	  	["label"] = "Mechanic Sheet", 		   	["weight"] = 0, 		["type"] = "item", 		["image"] = "mechboard.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

	--Performance
	["turbo"] 		 	 		 	= {["name"] = "turbo", 						["label"] = "Supercharger Turbo", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "turbo.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Who doesn't need a 65mm Turbo??"},
	["car_armor"] 					= {["name"] = "car_armor", 					["label"] = "Vehicle Armor", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "armour.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

	["nos"] 					    = {["name"] = "nos", 			 	  	  	["label"] = "NOS Bottle", 		        ["weight"] = 0, 		["type"] = "item", 		["image"] = "nos.png", 				    ["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "A full bottle of NOS"},
	["noscan"] 					    = {["name"] = "noscan", 			 	  	["label"] = "Empty NOS Bottle", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "noscan.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,  ["combinable"] = nil,   ["description"] = "An Empty bottle of NOS"},
	["noscolour"] 					= {["name"] = "noscolour", 			 	  	["label"] = "NOS Colour Injector", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "noscolour.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,  ["combinable"] = nil,   ["description"] = "Make that purge spray"},

	["engine1"] 				    = {["name"] = "engine1", 			 	  	["label"] = "Shonen Engine",            ["weight"] = 0, 		["type"] = "item", 		["image"] = "shonen.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["engine2"] 				    = {["name"] = "engine2", 			 	  	["label"] = "V8 Engine",        	    ["weight"] = 0, 		["type"] = "item", 		["image"] = "v8engine.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["engine3"] 				    = {["name"] = "engine3", 			 	  	["label"] = "V10 Engine",          		["weight"] = 0, 		["type"] = "item", 		["image"] = "v10engine.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["engine4"] 				    = {["name"] = "engine4", 			 	  	["label"] = "V12 Engine",               ["weight"] = 0, 		["type"] = "item", 		["image"] = "v12engine.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

	["transmission1"] 				= {["name"] = "transmission1", 				["label"] = "Transmission Lvl 1",       ["weight"] = 0, 		["type"] = "item", 		["image"] = "transmission1.png",  		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["transmission2"] 				= {["name"] = "transmission2", 				["label"] = "Transmission Lvl 2",       ["weight"] = 0, 		["type"] = "item", 		["image"] = "transmission2.png",  		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["transmission3"] 				= {["name"] = "transmission3",				["label"] = "Transmission Lvl 3",       ["weight"] = 0, 		["type"] = "item", 		["image"] = "transmission3.png",   		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

	["brakes1"] 					= {["name"] = "brakes1", 			 		["label"] = "Performance Brakes",       ["weight"] = 0, 		["type"] = "item", 		["image"] = "brakes1.png", 		    	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["brakes2"] 					= {["name"] = "brakes2", 			 		["label"] = "GT Big Brakes",            ["weight"] = 0, 		["type"] = "item", 		["image"] = "brakes2.png", 		    	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["brakes3"] 					= {["name"] = "brakes3", 			 		["label"] = "Competition Brakes",       ["weight"] = 0, 		["type"] = "item", 		["image"] = "brakes3.png", 		    	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

	["suspension1"] 				= {["name"] = "suspension1", 				["label"] = "Lowered Suspension", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "suspension1.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["suspension2"] 				= {["name"] = "suspension2",  				["label"] = "Street Suspension",		["weight"] = 0, 		["type"] = "item", 		["image"] = "suspension2.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Street Racing level Suspension"},
	["suspension3"] 				= {["name"] = "suspension3",  				["label"] = "Racing Suspension",		["weight"] = 0, 		["type"] = "item", 		["image"] = "suspension3.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Street Racing level Suspension"},
	["suspension4"] 				= {["name"] = "suspension4",  				["label"] = "Rally Suspension",			["weight"] = 0, 		["type"] = "item", 		["image"] = "suspension4.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Street Racing level Suspension"},

	["bprooftires"] 				= {["name"] = "bprooftires", 			   	["label"] = "Bulletproof Tires", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "bprooftires.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["drifttires"] 					= {["name"] = "drifttires", 			   	["label"] = "Drift Tires", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "drifttires.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

	--Cosmetics
	["underglow_controller"] 		 = {["name"] = "underglow_controller", 		["label"] = "Neon Controller", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "underglow_controller.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   	["description"] = "RGB LED Vehicle Remote"},
	["headlights"] 		 	 		 = {["name"] = "headlights", 				["label"] = "Xenon Headlights", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "headlights.png", 			["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   	["description"] = "8k HID headlights"},

	["tint_supplies"] 				 = {["name"] = "tint_supplies", 			["label"] = "Tint Supplies", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "tint_supplies.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,    ["description"] = "Supplies for window tinting"},

	["customplate"] 				 = {["name"] = "customplate", 				["label"] = "Customized Plates", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "plate.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["hood"] 						 = {["name"] = "hood", 						["label"] = "Vehicle Hood", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "hood.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["roof"] 						 = {["name"] = "roof", 						["label"] = "Vehicle Roof", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "roof.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["spoiler"] 					 = {["name"] = "spoiler", 					["label"] = "Vehicle Spoiler", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "spoiler.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["bumper"] 						 = {["name"] = "bumper", 					["label"] = "Vehicle Bumper", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "bumper.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["skirts"] 						 = {["name"] = "skirts", 					["label"] = "Vehicle Skirts", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "skirts.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["exhaust"] 					 = {["name"] = "exhaust", 					["label"] = "Vehicle Exhaust", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "exhaust.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["seat"] 						 = {["name"] = "seat", 						["label"] = "Seat Cosmetics", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "seat.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["rollcage"] 					 = {["name"] = "rollcage", 					["label"] = "Roll Cage", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "rollcage.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

	["rims"] 						 = {["name"] = "rims", 						["label"] = "Custom Wheel Rims", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "rims.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

	["livery"] 						 = {["name"] = "livery", 					["label"] = "Livery Roll", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "livery.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["paintcan"] 					 = {["name"] = "paintcan", 					["label"] = "Vehicle Spray Can", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "spraycan.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["tires"] 						 = {["name"] = "tires", 					["label"] = "Drift Smoke Tires",        ["weight"] = 0, 		["type"] = "item", 		["image"] = "tires.png", 	  		    ["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

	["horn"] 						 = {["name"] = "horn", 						["label"] = "Custom Vehicle Horn", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "horn.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

	["internals"] 					 = {["name"] = "internals", 				["label"] = "Internal Cosmetics", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "internals.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
	["externals"] 					 = {["name"] = "externals", 				["label"] = "Exterior Cosmetics", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "mirror.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

```

----------------------
# Dependancies

- This script requires `qb-menu` and `qb-input` for the menu systems
- This script requires `qb-target` for opening stores, crafting tables, cash registers, going on duty, nos refill

- This script is also designed to use `jim-payments` (https://github.com/jimathy/jim-payments) for charging customs and sending money to the society accounts

----------------------
## NOS + Odometer

There are expanded features included in this scripts with SQL
The included .SQL file needs to be imported into your player_vehicles database to add the appropriate columns (traveldistance, hasnitro, noslevel)

The `hasnitro` and `noslevel` columns being added enables the of saving Nitrous levels through server restarts

The `traveldistance` column adds an Odometer to the toolbox/mechanic_tools menus, this this can retrieved in miles or kilometers.

----------------------
# QB-MechanicJob

**You don't need `qb-mechanicjob` to use this script**

Extra damages will be enabled by default if you use `qb-mechanicjob` and `qb-vehiclefailure`

This needs to be added the the main script, but if you **DON'T** want to use qb-mechanicjob but have an updated qb-vehiclefailure
replace this event in qb-vehiclefailure > client.lua. This will make it only work if qb-mechanicjob is started.

```lua
-- Functions
local function DamageRandomComponent()
	if GetResourceState('qb-mechanicjob') ~= "started" then return end
    local dmgFctr = math.random() + math.random(0, 2)
    local randomComponent = DamageComponents[math.random(1, #DamageComponents)]
    local randomDamage = (math.random() + math.random(0, 1)) * dmgFctr
    exports['qb-mechanicjob']:SetVehicleStatus(QBCore.Functions.GetPlate(vehicle), randomComponent, exports['qb-mechanicjob']:GetVehicleStatus(QBCore.Functions.GetPlate(vehicle), randomComponent) - randomDamage)
end
```

----------------------
## Creating new polyzone for a new location

How do I create PolyZones for a new job location?

These locations determine where a person will be put on duty or taken off duty, and the places where items can be used, if you set them to be restricted to zones.

To start you need to be near the building you want to add.

Type `/pzcreate poly` to start creating a PolyZone. Pick a name, this doesn't matter as you can set this later in locations.lua
You will then get a red line right where you are standing.

Use your ARROW keys to move this around to the first corner/point you want to place.
When its in the correct place, type `/pzadd` and this will lock the current point and allow you to create another

Repeat this until your last corner/point where you will type `/pzfinish`.

This will save all the vectors of the points you have chosen and place them in a file called: `polyzone_created_zones.txt`

In this file is the vectors that you need to copy over to my scripts.

----------------------
## "mechboard" item

**This isn't fully required but helps organise multiples of the "mechboard"**

The MechBoard item is an item given to the person who uses the preview menu and makes changes

To make full use of this item you need to add the ability for the item to show item info in your inventory system

I have only done this with `qb-inventory` and `lj-inventory` as they are similar

`qb-inventory/html/js/app.js`

- Search for "harness" or Scroll down until you find:
```js
} else if (itemData.name == "harness") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p>" + itemData.info.uses + " uses left.</p>"
    );
```
- Directly underneath this add:
```js
} else if (itemData.name == "mechboard") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p>" + itemData.info.vehplate + "</p>" +
        "<p>" + itemData.info.veh + "</p>"
    );
```
When successfully added the mechboards will show the vehicle and plate number

----------------------

## Updating core events

To add the ability to save RGB paints, their colour finishes and drift/bulletproof tires you need to change two functions in your qb-core/client/functions.lua

Replace GetVehicleProperties and SetVehicleProperties functions with these:
```lua
function QBCore.Functions.GetVehicleProperties(vehicle)
    if DoesEntityExist(vehicle) then
        local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		local colorPrimary, colorSecondary = GetVehicleColours(vehicle)

        if GetIsVehiclePrimaryColourCustom(vehicle) then
            local r, g, b = GetVehicleCustomPrimaryColour(vehicle)
            colorPrimary = { r, g, b, colorPrimary }
        end
        if GetIsVehicleSecondaryColourCustom(vehicle) then
            local r, g, b = GetVehicleCustomSecondaryColour(vehicle)
            colorSecondary = { r, g, b, colorSecondary }
        end
        local extras = {}
        for extraId = 0, 12 do
            if DoesExtraExist(vehicle, extraId) then
                local state = IsVehicleExtraTurnedOn(vehicle, extraId) == 1
                extras[tostring(extraId)] = state
            end
        end
        local modLivery = GetVehicleMod(vehicle, 48)
        if GetVehicleMod(vehicle, 48) == -1 and GetVehicleLivery(vehicle) ~= 0 then modLivery = GetVehicleLivery(vehicle) end
        local tireHealth = {}
        for i = 0, 3 do tireHealth[i] = GetVehicleWheelHealth(vehicle, i) end
        local tireBurstState = {}
        for i = 0, 5 do tireBurstState[i] = IsVehicleTyreBurst(vehicle, i, false) end
        local tireBurstCompletely = {}
        for i = 0, 5 do tireBurstCompletely[i] = IsVehicleTyreBurst(vehicle, i, true) end
        local windowStatus = {}
        for i = 0, 7 do windowStatus[i] = IsVehicleWindowIntact(vehicle, i) == 1 end
        local doorStatus = {}
        for i = 0, 5 do doorStatus[i] = IsVehicleDoorDamaged(vehicle, i) == 1 end
        return {
            model = GetEntityModel(vehicle),
            plate = QBCore.Functions.GetPlate(vehicle),
            plateIndex = GetVehicleNumberPlateTextIndex(vehicle),
            bodyHealth = QBCore.Shared.Round(GetVehicleBodyHealth(vehicle), 0.1),
            engineHealth = QBCore.Shared.Round(GetVehicleEngineHealth(vehicle), 0.1),
            tankHealth = QBCore.Shared.Round(GetVehiclePetrolTankHealth(vehicle), 0.1),
            fuelLevel = QBCore.Shared.Round(GetVehicleFuelLevel(vehicle), 0.1),
            dirtLevel = QBCore.Shared.Round(GetVehicleDirtLevel(vehicle), 0.1),
            oilLevel = QBCore.Shared.Round(GetVehicleOilLevel(vehicle), 0.1),
            color1 = colorPrimary,
            color2 = colorSecondary,
            pearlescentColor = pearlescentColor,
            dashboardColor = GetVehicleDashboardColour(vehicle),
            wheelColor = wheelColor,
            wheels = GetVehicleWheelType(vehicle),
            wheelSize = GetVehicleWheelSize(vehicle),
            wheelWidth = GetVehicleWheelWidth(vehicle),
            tireHealth = tireHealth,
            tireBurstState = tireBurstState,
            tireBurstCompletely = tireBurstCompletely,
            windowTint = GetVehicleWindowTint(vehicle),
            windowStatus = windowStatus,
            doorStatus = doorStatus,
            xenonColor = GetVehicleXenonLightsColour(vehicle),
            neonEnabled = {
                IsVehicleNeonLightEnabled(vehicle, 0),
                IsVehicleNeonLightEnabled(vehicle, 1),
                IsVehicleNeonLightEnabled(vehicle, 2),
                IsVehicleNeonLightEnabled(vehicle, 3)
            },
            neonColor = table.pack(GetVehicleNeonLightsColour(vehicle)),
            headlightColor = GetVehicleHeadlightsColour(vehicle),
            interiorColor = GetVehicleInteriorColour(vehicle),
            extras = extras,
            tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(vehicle)),
            modSpoilers = GetVehicleMod(vehicle, 0),
            modFrontBumper = GetVehicleMod(vehicle, 1),
            modRearBumper = GetVehicleMod(vehicle, 2),
            modSideSkirt = GetVehicleMod(vehicle, 3),
            modExhaust = GetVehicleMod(vehicle, 4),
            modFrame = GetVehicleMod(vehicle, 5),
            modGrille = GetVehicleMod(vehicle, 6),
            modHood = GetVehicleMod(vehicle, 7),
            modFender = GetVehicleMod(vehicle, 8),
            modRightFender = GetVehicleMod(vehicle, 9),
            modRoof = GetVehicleMod(vehicle, 10),
            modEngine = GetVehicleMod(vehicle, 11),
            modBrakes = GetVehicleMod(vehicle, 12),
            modTransmission = GetVehicleMod(vehicle, 13),
            modHorns = GetVehicleMod(vehicle, 14),
            modSuspension = GetVehicleMod(vehicle, 15),
            modArmor = GetVehicleMod(vehicle, 16),
            modKit17 = GetVehicleMod(vehicle, 17),
            modTurbo = IsToggleModOn(vehicle, 18),
            modKit19 = GetVehicleMod(vehicle, 19),
            modSmokeEnabled = IsToggleModOn(vehicle, 20),
            modKit21 = GetVehicleMod(vehicle, 21),
            modXenon = IsToggleModOn(vehicle, 22),
            modFrontWheels = GetVehicleMod(vehicle, 23),
            modBackWheels = GetVehicleMod(vehicle, 24),
            modCustomTiresF = GetVehicleModVariation(vehicle, 23),
            modCustomTiresR = GetVehicleModVariation(vehicle, 24),
            modPlateHolder = GetVehicleMod(vehicle, 25),
            modVanityPlate = GetVehicleMod(vehicle, 26),
            modTrimA = GetVehicleMod(vehicle, 27),
            modOrnaments = GetVehicleMod(vehicle, 28),
            modDashboard = GetVehicleMod(vehicle, 29),
            modDial = GetVehicleMod(vehicle, 30),
            modDoorSpeaker = GetVehicleMod(vehicle, 31),
            modSeats = GetVehicleMod(vehicle, 32),
            modSteeringWheel = GetVehicleMod(vehicle, 33),
            modShifterLeavers = GetVehicleMod(vehicle, 34),
            modAPlate = GetVehicleMod(vehicle, 35),
            modSpeakers = GetVehicleMod(vehicle, 36),
            modTrunk = GetVehicleMod(vehicle, 37),
            modHydrolic = GetVehicleMod(vehicle, 38),
            modEngineBlock = GetVehicleMod(vehicle, 39),
            modAirFilter = GetVehicleMod(vehicle, 40),
            modStruts = GetVehicleMod(vehicle, 41),
            modArchCover = GetVehicleMod(vehicle, 42),
            modAerials = GetVehicleMod(vehicle, 43),
            modTrimB = GetVehicleMod(vehicle, 44),
            modTank = GetVehicleMod(vehicle, 45),
            modWindows = GetVehicleMod(vehicle, 46),
            modKit47 = GetVehicleMod(vehicle, 47),
            modLivery = modLivery,
            modKit49 = GetVehicleMod(vehicle, 49),
            liveryRoof = GetVehicleRoofLivery(vehicle),
			modDrift = GetDriftTyresEnabled(vehicle),
			modBProofTires = not GetVehicleTyresCanBurst(vehicle),
        }
    else
        return
    end
end

function QBCore.Functions.SetVehicleProperties(vehicle, props)
    if DoesEntityExist(vehicle) then
        if props.extras then
            for id, enabled in pairs(props.extras) do
                if enabled then
                    SetVehicleExtra(vehicle, tonumber(id), 0)
                else
                    SetVehicleExtra(vehicle, tonumber(id), 1)
                end
            end
        end
        local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
        local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
        SetVehicleModKit(vehicle, 0)
        if props.plate then SetVehicleNumberPlateText(vehicle, props.plate) end
        if props.plateIndex then SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex) end
        if props.bodyHealth then SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0) end
        if props.engineHealth then SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0) end
        if props.tankHealth then SetVehiclePetrolTankHealth(vehicle, props.tankHealth) end
        if props.fuelLevel then SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0) end
        if props.dirtLevel then SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0) end
        if props.oilLevel then SetVehicleOilLevel(vehicle, props.oilLevel) end
        if props.color1 then
			if type(props.color1) == "number" then
				colorPrimary = props.color1
				SetVehicleColours(vehicle, colorPrimary, colorSecondary)
			else
				colorPrimary = props.color1[4]
				SetVehicleCustomPrimaryColour(vehicle, props.color1[1], props.color1[2], props.color1[3])
				SetVehicleColours(vehicle, props.color1[4], colorSecondary)
           end
        end
        if props.color2 then
            if type(props.color2) == "number" then
				SetVehicleColours(vehicle, colorPrimary, props.color2)
			else
                SetVehicleCustomSecondaryColour(vehicle, props.color2[1], props.color2[2], props.color2[3])
				SetVehicleColours(vehicle, colorPrimary, props.color2[4])
           end
        end
        if props.pearlescentColor then SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor) end
        if props.interiorColor then SetVehicleInteriorColor(vehicle, props.interiorColor) end
        if props.dashboardColor then SetVehicleDashboardColour(vehicle, props.dashboardColor) end
        if props.wheelColor then SetVehicleExtraColours(vehicle, props.pearlescentColor or pearlescentColor, props.wheelColor) end
        if props.wheels then SetVehicleWheelType(vehicle, props.wheels) end
        if props.tireHealth then
            for wheelIndex, health in pairs(props.tireHealth) do
                SetVehicleWheelHealth(vehicle, wheelIndex, health)
            end
        end
        if props.tireBurstState then
            for wheelIndex, burstState in pairs(props.tireBurstState) do
                if burstState then
                    SetVehicleTyreBurst(vehicle, tonumber(wheelIndex), false, 1000.0)
                end
            end
        end
        if props.tireBurstCompletely then
            for wheelIndex, burstState in pairs(props.tireBurstCompletely) do
                if burstState then
                    SetVehicleTyreBurst(vehicle, tonumber(wheelIndex), true, 1000.0)
                end
            end
        end
        if props.windowTint then SetVehicleWindowTint(vehicle, props.windowTint) end
        if props.windowStatus then
			for windowIndex, smashWindow in pairs(props.windowStatus) do
                if not smashWindow then SmashVehicleWindow(vehicle, windowIndex) end
            end
        end
		if props.doorStatus then
            for doorIndex, breakDoor in pairs(props.doorStatus) do
                if breakDoor then
                    SetVehicleDoorBroken(vehicle, tonumber(doorIndex), true)
                end
            end
        end
        if props.neonEnabled then
            SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1])
            SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2])
            SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3])
            SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4])
        end
		if props.neonColor then SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3]) end
        if props.headlightColor then SetVehicleHeadlightsColour(vehicle, props.headlightColor) end
        if props.interiorColor then SetVehicleInteriorColour(vehicle, props.interiorColor) end
        if props.wheelSize then SetVehicleWheelSize(vehicle, props.wheelSize) end
        if props.wheelWidth then SetVehicleWheelWidth(vehicle, props.wheelWidth) end
        if props.tyreSmokeColor then SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3]) end
        if props.modSpoilers then SetVehicleMod(vehicle, 0, props.modSpoilers, false) end
        if props.modFrontBumper then SetVehicleMod(vehicle, 1, props.modFrontBumper, false) end
        if props.modRearBumper then SetVehicleMod(vehicle, 2, props.modRearBumper, false) end
        if props.modSideSkirt then SetVehicleMod(vehicle, 3, props.modSideSkirt, false) end
        if props.modExhaust then SetVehicleMod(vehicle, 4, props.modExhaust, false) end
        if props.modFrame then SetVehicleMod(vehicle, 5, props.modFrame, false) end
        if props.modGrille then SetVehicleMod(vehicle, 6, props.modGrille, false) end
        if props.modHood then SetVehicleMod(vehicle, 7, props.modHood, false) end
        if props.modFender then SetVehicleMod(vehicle, 8, props.modFender, false) end
        if props.modRightFender then SetVehicleMod(vehicle, 9, props.modRightFender, false) end
        if props.modRoof then SetVehicleMod(vehicle, 10, props.modRoof, false) end
        if props.modEngine then SetVehicleMod(vehicle, 11, props.modEngine, false) end
        if props.modBrakes then SetVehicleMod(vehicle, 12, props.modBrakes, false) end
		if props.modTransmission then SetVehicleMod(vehicle, 13, props.modTransmission, false) end
        if props.modHorns then SetVehicleMod(vehicle, 14, props.modHorns, false) end
        if props.modSuspension then SetVehicleMod(vehicle, 15, props.modSuspension, false) end
        if props.modArmor then SetVehicleMod(vehicle, 16, props.modArmor, false) end
        if props.modKit17 then SetVehicleMod(vehicle, 17, props.modKit17, false) end
        if props.modTurbo then ToggleVehicleMod(vehicle, 18, props.modTurbo) end
        if props.modKit19 then SetVehicleMod(vehicle, 19, props.modKit19, false) end
        if props.modSmokeEnabled then ToggleVehicleMod(vehicle, 20, props.modSmokeEnabled) end
        if props.modKit21 then SetVehicleMod(vehicle, 21, props.modKit21, false) end
        if props.modXenon then ToggleVehicleMod(vehicle, 22, props.modXenon) end
        if props.xenonColor then SetVehicleXenonLightsColor(vehicle, props.xenonColor) end
        if props.modFrontWheels then SetVehicleMod(vehicle, 23, props.modFrontWheels, false) end
        if props.modBackWheels then SetVehicleMod(vehicle, 24, props.modBackWheels, false) end
        if props.modCustomTiresF then SetVehicleMod(vehicle, 23, props.modFrontWheels, props.modCustomTiresF) end
        if props.modCustomTiresR then SetVehicleMod(vehicle, 24, props.modBackWheels, props.modCustomTiresR) end
		if props.modPlateHolder then SetVehicleMod(vehicle, 25, props.modPlateHolder, false) end
        if props.modVanityPlate then SetVehicleMod(vehicle, 26, props.modVanityPlate, false) end
        if props.modTrimA then SetVehicleMod(vehicle, 27, props.modTrimA, false) end
        if props.modOrnaments then SetVehicleMod(vehicle, 28, props.modOrnaments, false) end
        if props.modDashboard then SetVehicleMod(vehicle, 29, props.modDashboard, false) end
        if props.modDial then SetVehicleMod(vehicle, 30, props.modDial, false) end
        if props.modDoorSpeaker then SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false) end
        if props.modSeats then SetVehicleMod(vehicle, 32, props.modSeats, false) end
        if props.modSteeringWheel then SetVehicleMod(vehicle, 33, props.modSteeringWheel, false) end
        if props.modShifterLeavers then SetVehicleMod(vehicle, 34, props.modShifterLeavers, false) end
        if props.modAPlate then SetVehicleMod(vehicle, 35, props.modAPlate, false) end
        if props.modSpeakers then SetVehicleMod(vehicle, 36, props.modSpeakers, false) end
        if props.modTrunk then SetVehicleMod(vehicle, 37, props.modTrunk, false) end
        if props.modHydrolic then SetVehicleMod(vehicle, 38, props.modHydrolic, false) end
        if props.modEngineBlock then SetVehicleMod(vehicle, 39, props.modEngineBlock, false) end
        if props.modAirFilter then SetVehicleMod(vehicle, 40, props.modAirFilter, false) end
        if props.modStruts then SetVehicleMod(vehicle, 41, props.modStruts, false) end
        if props.modArchCover then SetVehicleMod(vehicle, 42, props.modArchCover, false) end
        if props.modAerials then SetVehicleMod(vehicle, 43, props.modAerials, false) end
        if props.modTrimB then SetVehicleMod(vehicle, 44, props.modTrimB, false) end
        if props.modTank then SetVehicleMod(vehicle, 45, props.modTank, false) end
        if props.modWindows then SetVehicleMod(vehicle, 46, props.modWindows, false) end
        if props.modKit47 then SetVehicleMod(vehicle, 47, props.modKit47, false) end
        if props.modLivery then SetVehicleMod(vehicle, 48, props.modLivery, false) SetVehicleLivery(vehicle, props.modLivery) end
        if props.modKit49 then SetVehicleMod(vehicle, 49, props.modKit49, false) end
        if props.liveryRoof then SetVehicleRoofLivery(vehicle, props.liveryRoof) end
		if props.modDrift then SetDriftTyresEnabled(vehicle, true) end
		SetVehicleTyresCanBurst(vehicle, not props.modBProofTires)
		TriggerServerEvent('jim-mechanic:server:loadStatus', props.plate)
    end
end
```

# Changelog:

## Update v2.8.6:
    - Added missing `updateCar` event to extras in externals
    - Fix exploit where boost speed was staying applied for other players, which would then apply back to the driver
    - Fix database not updating the NOS when driving around
        - Now saves to database when you stop boosting
    - Reduced car modification database saving timer to 20 seconds from 60.

## Update v2.8.5:
    - Added bossmenu (qb-managment) to clock in locations - locations.lua
    - Fix NOS boost sound for people who were in different cars - nos.lua
    - Fix muscle cars being able to do wheelies when boosting - nos.lua
    - Fix NOS overheat explosion not working - nos.lua
    - Add distance check on nos effects so only nearby people can see them - nos.lua
    - Fix brakes level 1 causing the script to break - brakes.lua

## Update v2.8.4:
    - Fix Interior Painting not working at all - paint.lua
    - Fix error and possible script break after installing rims - rims.lua
    - Fix Server load issue with vehicle being checked for ownership too much - extras.lua
        - Now saves current vehicle so it doesn't need to check over and over
    - Change updateCar() to work on a delay - functions.lua
        - This reduces server database load and only updates the changes to the vehicle when the player hasn't made modifications for 60 seconds
    - Fix underglow changes not saving - xenons.lua

## Update v2.8.3:
    - Fix NOS Warnings audio playing from the player, not the vehicle - nos.lua
    - Fix Extra Damage repairs not sticking - functions.lua
        - It was loading the values before saving them and resetting them instantly
    - Fix incorrect variable in forceproperties - functions.lua
    - Fix missing customisable variable registering when nos wasn't pressed anymore - nos.lua

## Update v2.8.2:
    - Fix Item Duping detection
        - Added "SetVehicleModKit(vehicle, 0)" when every performance related upgrade gives items
    - Fix new /preview exploit protection - functions.lua
    - Fix "Boost Mode" popup not leaving when "exiting" the vehicle - extras.lua
    - Fix Debug Mode Odometer showing incorrect upgrade levels of the vehicle - extras.lua
    - Added /preview "menu pause"? - preview.lua
        - Press the header (top of the menu) to grant 3 seconds to manually adjust the camera
    - Fixed Nos warning sounds so they actually stop - nos.lua
    - Moved Nos Control bindings to the config.lua
    - Fixed transmission qb-log breaking the scrpt when being removed from vehicle - transmission.lua
    - Fixed self inflicted brake duping - brakes.lua
    - Fixed xenons taking 70 seconds to remove - xenons.lua

## Update v2.8.1:
    - Fix Preview not finding plate after finishing preview - preview.lua
    - Fix NOS related sounds still playing after leaving/falling out of vehicle - nos.lua
    - Fix NOS Damage warning sound not playing - nos.lua
    - Fix NOS Purge spray not stopping when leaving the vehicle - nos.lua
    - Added DLC 2699 Vehicle Purge locations - nos.lua
    - Added "NosBoostPower" table to config.lua, these values are the accelleration power of the boost levels - config.lua/nos.lua
    - Added Vehicle Extras to externals item menu - exterior.lua
    - Added basic qb-log features to each file that changes vehicle mods - functions.lua

## Update v2.8:
    - UPDATED GUIDE: https://github.com/jimathy/jim-mechanicguide
    - Fix for job/grade locked crafting items not working correctly
    - Fix for extras.lua error when parking a vehicle
    - Fix DPI scaling of built-in drawtext popups
    - Fix exploit of saving previewed vehicles
    - Change to progressbar times for removing performance items, now maht.randoms to help enforce exploit protection
    - Added "discordimg" to locations in Locations.lua - Completely forgot that people would disable the payment systems making the image not work
    - New vehaddon.sql file
        - You should be able to use this file to add the new "noscolour" column when updating even if it gives an error
        - Now adds the columns at the end of the file, not after a specified column
    - FunctionServer.lua rearrange and fixes
        - Fix for nil/errornous "extras damage" data values found in the database - setting them all to "100" instead
        - Most database check/update events have been changed how they check the database to (hopefully) be more optimized
    - PaintRBG.lua changes
        - rgbToHex() and HexTorgb() moved from paintrgb.lua to functions.lua
        - Redo of RGB/HEX paint menus
        - You can now enter shorter hex and RGB codes and it will auto fill them
    - ManualRepair.lua changes
        - Rearranged so it does server checks if you're in a vehicle
        - Workaround for incorrect health values
        - If "repairAnimate" is false it will now show a Progressbar
        - New config option "ManualRepairCostBased"
            - When true, this makes manual repair prices set by "ManualRepairCost" always be this amount
            - When false, the price will be based on damage, with "ManualRepairCost" being the max amount
    - NOS Changes/Optimizations - nos.lua / nosserver.lua
        - Config options are now in the config.lua
        - File rewrite, less "while" loops on client side
        - Effects, when disabled are now disabled BEFORE trying to sync with players
        - NOS Purge Sounds added
        - NOS Cooldown Complete sound added (and config option to toggle)
        - Optimized NOS Database updates from two update events into one (should help decrease lag)
        - Config options added for "Explode vehicle on fail NOS Skill check"
            - Toggle to allow Mechanic Immunity from causing explosions.
            - 1 in 10 chance for it to explode
            - Shouldn't cause any major damage to car or player
    - NOS Purge Colour item
        - Use near vehicle with NOS to choose the colour of your Purge Spray

## Update v2.7.3:
    - NEW GUIDE LOCATION: https://github.com/jimathy/jim-mechanicguide
    - Rewrote the install.md
        - Changelog at the bottom now, so install instructions come first
    - Updated the GetVehicleProperties function to try and fix liveries
    - Attempted to add workaround for when there was an incorrect value for extra damages in the database - functionserver.lua
    - Small changes to try and fix server target issues related to manualrepair.lua
        - Repair Check added to stop players spamming events
    - nosBar() changes - functions.lua
        - Config.nosBarColour adds the ability to toggle colours on the generated bars
        - Config.nosBarFull is the symbol used to indicate a full segment - default: "▓"
        - Config.nosBarEmpty is the symbol used to indicate a empty segment - default: "░"
    - Added nosBar() features to mechanic_tools repair menu - repair.lua
    - Added nosBar() features to manualrepair.lua

## Update v2.7.2:
    - Fix for Config.DiscordDefault not doing anything - preview.lua
    - Fixed a script breaking unfinished callback for NON stash repairs - repairs.lua
    - Fix job and location checks for /preview - Config.lua/functions.lua/Preview.lua
        - Added new option check in config called PreviewLocation
    - Add Nos Refill stations - locations.lua
        - Change cost amount in config
        - Example can be seen in gabz tuners location in location.lua - "nosrefill"
    - Fix for classes being retrieved wrong - functions.lua
    - Improved logic if statement for Stash Repair - locations.lua
        - Enabling Config.FreeRepairs doesn't hide the stash target if Config.StashCraft is enabled

## Update v2.7.1:
    - Hot fix for repair.lua
        - Left a check the wrong way round when testing, extra damages were being forced to 100% every single time you opened repair menu

## Update v2.7:
	- Preview.lua upgrade
	    - Added discord channel support for Preview Receipts
		- Adds new config.lua options + possible options for each location in location.lua
        - Set default channel in config.lua
        - OR set location specific channels in locations.lua
	- Extras.lua fixes
		- Reduces lag for high population servers by reducing the amount of checks
		- Changed the values of the odometer values because people thought it was broken
        - Slight change to toggle sound command, optimised + removed need to add "on" or "off" to the command
    - Function.lua fixes
        - pushVehicle() now has an extra check in which will attempt to skip it if its not needed
        - searchDist() values reduced because people thought it was broken
    - Changes to Check_Tunes.lua
        - Attempt at optimising and tidying the code up as much as possible
        - Toolbox prop should now automatically clear after 15 seconds instead of getting stuck if player ESC's out of menu
        - This may cause some seemingly random return to idle pose, but its better than it being stuck in your hand
    - Nos.lua
        - Added qb-lock toggle for easy switching
    - Changes to all files
        - Attempt to reduce delay when using items caused by requiring to turn to the vehicle
        - Overhaul of menu's to use new(ish) icon system
        - Adjusted and improved the debug prints
    - Repair.lua
        - Attempt at a work around for previous nil value error from qb-mechanicjob
        - It should now forcibly set all values to 100% if it finds a nil value

## Update v2.6.1:
	- Remove fixFailure() event as it didn't do anything apparently
	- Changed the jim-mechanic:server:loadStatus to do a vehicle damage setup event to help fix nil values.
		- Replace repair.lua, function.lua and functionserver.lua
	- Installation instructions changed to fit new updated qb-vehiclefailure
	- Turned odometer into a vehicle debug screen if the debug mode is enabled

## Update v2.6:
	- Change the Config.UseMechJob toggle into a function that detects if "qb-mechanicjob" is started
		- This helps avoid confusion after updates/errors
		- This brings small changes to repair.lua, extras.lua, police.lua functions.lua, functionserver.lua, server/main.lua
	- Added game build detection for drifttyres - check_tunes.lua + tires.lua
		- They were introduced in `lstuners` and to use them/not get errors you need to have gamebuild `2372` or higher
	- New file - manualrepair.lua
		- Ability for non-mechanics repair at certain locations
		- Configurable automatic repair systems - check the config.lua for the new settings
		- This required ned functions in functionserver and function.lua
	- Removed print left over from testing in functions, showing all the vehicle mods on a car when updating it
	- Removed police bench default location "Bennys next to PDM" to make it a bench for manual repairs
	- Fixed a few missing locale'd strings in police.lua

## Update v2.5.2:
	- Updated default recipes to have the "rollcage" item - recipes.lua
	- Removed Color1 print message from the "GetVehicleProperties" left in after testing - install.md/qb-core
	- Added fixFailure() event to attempt to reset "nil" values when trying to get/repair extra vehicle damages - repair.lua/functions.lua
	- Enhanced updateCar() function to share the data between everyone
		- Adds new functions to function.lua and functionserver.lua
		- This shares the updated vehicle info with all players and forces it onto the cars for them
	- Fixed encryption on html folder
	- Removed unfinished and broken file as it was breaking police repairs.

## Update v2.5.1:
	- Added config options
		- "ShowOdo" wether the odometer is on by default
		- "OdoLocation" where the odometer shows on screen
	- Fixed Odometer breaking the script if the car wasn't owned
	- Moved drawtext files from qb-core over into this script
		- This allows for customied Odometer popups and locations
		- Changed popup text to be more like an actual odometer
		- You can now change the location of it to: "left", "right", "top", "top-right", "top-left", "bottom", "bottom-left", "bottom-right"
	- Slowed down the Odometer update speed incase of lag
	- Uncommented out the police bench locations (forgot to do this earlier while testing)

## Update v2.5:
	- New Item - Roll Cage
		- This is (obivously) the Roll Cage that is in the "externals" menu but independant
	- Added checks to all items wether vehicle is locked or not
		- `if lockedCar(vehicle) then return end`
		- This line has been added to all items and events, can't do any work on a vehicle until is unlocked
	- Added support for toggling between gks-phone and qb-phone for the preview emails in the config
	- Repairs now uses custom stash event, not requiring qb-inventory default events anymore.
		- This hopefully fixes a couple issues with certain different inventories
	- Add new strings to locales, don't forget to update these and make a github pull request
	- Added support for ps-progressbar
	- Fixed NOS "Old Flame" not syncing between players
	- Added toggles for disabling NOS Trails and NOS Screen Effects
	- Fixed RBG Paint issues not loading in the functions (mainly paint finishes but hopefully other issues)
		- Update with the the functions below
	- Added ability to show Mi/Km using qb-cores new built in "DrawText" export
		- This shows while driving and updates and hides when leaving the car
		- This can be disabled by typing "/showodo"

## Update v2.4:
	- Enhance the Locations script - locations.lua
		- Added support for job grades in crafting
		- Add support for Multiple locations for all execpt payments.
		- Add Job Garage locations support to pull out Job Vehicles (not personal vehicles)
		- Added Livery choice on spawning of vehicles, this required editing - preview.lua
	- Fixed issue with cars not showing lists of mods until one was forcibly applied - functions.lua
	- Fixed unessessary database checks being used by the odometer functions which were causing lag for some - extras.lua
	- Added saving extra vehicle damages through restarts - extras.lua + functionserver.lua
		- If "UseMechJob" is true it will attempt to save the damages the same time as the odometer and car customisations
		- This requires updating the qb-core SetVehicleProperties function with the event: `TriggerServerEvent('jim-mechanic:server:loadStatus', props.plate)` (check the qb-core functions below)
	- Updates are needed to locale files for garages

## Update v2.3.3:
	- Made /preview's rim's alphabetical - preview.lua
	- Removed F8 print spam from null named wheels - preview.lua
	- Further support for qb-menu edit
		- Mechanic_Tools menu support - repair.lua
		- Better ToolBox Support - check_tunes.lua
	- Fix spelling mistake in config

## Update v2.3.2:
	- Crafting Fixes
		- Job requirement for crafting now actually works - locations.lua
		- Fix for being able to craft from stash even if you didn't have items - craftingserver.lua
		- Small change that makes StashTidy only happen once in crafting, rather than twice to reduce server strain - craftingserver.lua
	- QB-Menu edit support added in Crafting menus and better support for toolbox menus - location.lua/check_tunes.lua
	- Caved in and added the ability to remove cosmetic items on use, enable the CosmeticRemoval in the config.lua
		- This adds an extra event to all files that deal with cosmetic items, replace the files to make use of this
	- Rims are now alphabetical again! - rims.lua

## Update v2.3.1:
	- Fixed Stash crafting breaking when consumimg a stack of items, or a single unique item. - repair.lua
	- Fixed F8 Console Spam when viewing "NULL" named rims - rims.lua
	- Fix not being able to cancel crafting progress bars - locations.lua
	- Added Custom "SaveStash" database event in an attempt to fix issues some where having with crafting/repairs - functionserver.lua + repair.lua + craftingserver.lua
	- Removed paymentserver.lua and thus the /charge command in favor of jim-payments (I forgot there was even a /charge command built in)
	- Added new rimNames.lua which adds the ability to give names to custom rims named "NULL"
		- Info here: https://github.com/jimathy/RimNames
	- Started adding support for a qb-menu edit that supports icon images on its own - check_tunes.lua
		- Currently only in the toolbox menu

## Update v2.3:
	- NOS Fixes (nos.lua + nosserver.lua)
		- Changes to how NOS is detected on server start, now gives correct numbers
		- Changes to how levels are saved during use, now updates the database on leaving vehicle
		- Added Boost Cooldown timer variable to top of nos.lua
	- Fixed typo in tires.lua that kicked people who didn't do anything wrong
	- Fixed typo in preview.lua that made Config.PreviewPhone do the complete opposite
	- Added Missing LS Customs on Popular Street locations

	- File Layout changes
		- Config.Lua has had a revamp
		- Crafting Receipes and Store Layouts are now in Config.lua
		- Crafting + Stores + Payments + Stash section of Repairs.lua are now all in Locations.lua
		- This brings changes to polyzone locations and how locations.lua is handled bringing all the locations into one file.
		- All this helps a new Item Check that is now in server/main.lua. This helps debug missing items
		- Plus I was getting sick of telling people which file does what. This cuts it back into one file

	- Changes to show NULL wheel ID's in previews/emails/mechboards and in rim modification menu

	- Locations.lua
		- Layout is very different and you should take a look at it and if you have any custom locations, adapt yours to work with it
	- Clock in is now a target location, in and out of building duty is removed.

	- Fixes for stash crafting items with custom multiple ingedient recipes
		- This works with a new feature "StashTidy" which orgainises your stash into 1 slot per item
	- Support in Crafting Recipes for locking Specified items behind Specified job roles

	- Separated jobChecks() to make locationChecks()
		- Every item/file has this extra line to check if you're in a work location if need

	- Rewrote the odometer fuctions to be ALOT more optimsed and accurate

	- To sum up the file changes
		- CHANGED: nos.lua, nosserver.lua, check_tunes.lua, functions.lua, locations.lua, preview.lua, tires.lua, main.lua, repair.lua, rims.lua
		- REMOVED: crafting.lua, stores.lua, payments.lua

	- Removed features from the GetVehicleProperties and SetVehicleProperties at the bottom of this file.
		- Got sick of people asking how to change it back.
---