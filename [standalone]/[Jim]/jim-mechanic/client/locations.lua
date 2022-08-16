local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
			for k, v in pairs(Config.JobRoles) do if v == PlayerJob.name then havejob = true end end
			if havejob then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate') AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty') AddEventHandler('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
		QBCore.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
			for k, v in pairs(Config.JobRoles) do if v == PlayerJob.name then havejob = true end end
			if havejob then onDuty = PlayerJob.onduty end end) 
	end
	Wait(500)
end)

Config.Locations = {
	{	job = "tuner",
	zones = {
		vector2(2525.65234375, 4104.78515625),
		vector2(2514.9565429688, 4110.2348632813),
		vector2(2522.7133789063, 4127.24609375),
		vector2(2534.0258789063, 4121.462890625)
	},
	stash = { { coords = vector3(128.74, -3014.41, 7.04), w = 3.6, d = 0.6, heading = 0, }, },
	store = { { coords = vector3(128.55, -3008.27, 7.04), w = 0.85, d = 1.8, heading = 359.0, }, },
	crafting = { { coords = vector3(121.42, -3025.09, 7.04), w = 2.8, d = 1.0, heading = 270.0, }, },
	clockin = { { coords = vector3(124.61, -3030.95, 6.83), heading = 270.0, }, },
	garage = { spawn = vector4(145.38, -3013.23, 7.93, 242.36),
			   out = vector4(155.87, -3029.08, 7.03, 265.18),
			   list = { "towtruck", "panto" , "flatbed", "slamtruck", "cheburek", "utillitruck3" } },
	payments = { coords = vector3(-339.02, -156.6, 44.47), heading = 0.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png width=150px></p>" },
	blip = vector3(166.9, -3030.77, 6.24),
	bliplabel = "tuner",
	blipcolor = 67,
},

	{	job = "tox",
	zones = {
		vector2(-229.17712402344, -1318.9700927734),
		vector2(-217.88652038574, -1318.9375),
		vector2(-217.96313476563, -1322.0101318359),
		vector2(-217.24877929688, -1322.0810546875),
		vector2(-217.40863037109, -1315.2252197266),
		vector2(-213.79582214355, -1315.4105224609),
		vector2(-213.79455566406, -1310.8781738281),
		vector2(-203.0055847168, -1310.9509277344),
		vector2(-202.90579223633, -1316.5187988281),
		vector2(-202.3010559082, -1316.4146728516),
		vector2(-202.46166992188, -1313.6201171875),
		vector2(-195.05113220215, -1314.052734375),
		vector2(-195.06610107422, -1321.5408935547),
		vector2(-194.90126037598, -1343.3129882813),
		vector2(-205.16375732422, -1343.1351318359),
		vector2(-229.26737976074, -1335.3651123047)
	},
	stash = { { coords = vector3(-224.29, -1319.46, 30.89), w = 3.6, d = 0.6, heading = 0, }, },
	store = { { coords = vector3(-199.29, -1314.51, 31.09), w = 0.85, d = 1.8, heading = 359.0, }, },
	crafting = { { coords = vector3(-228.36, -1327.09, 30.89), w = 2.8, d = 1.0, heading = 270.0, }, },
	clockin = { { coords = vector3(-200.04, -1318.13, 31.08), heading = 101.57, }, },
	garage = { spawn =  vector4(-205.19, -1304.31, 31.3, 284.06),
			   out = vector4(-208.14, -1311.24, 30.89, 179.39),
			   list = { "towtruck", "panto" , "flatbed", "slamtruck", "cheburek", "utillitruck3" } },
	payments = { coords = vector3(-339.02, -156.6, 44.47), heading = 0.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png width=150px></p>" },
	blip = vector3(-205.19, -1304.31, 31.3),
	bliplabel = "DB AUTO",
	blipcolor = 67,
},

{	job = "picaros",
zones = {
	vector2(-44.31343460083, -1068.5541992188),
	vector2(-40.614532470703, -1057.7924804688),
	vector2(-37.741569519043, -1058.9620361328),
	vector2(-37.474666595459, -1058.3653564453),
	vector2(-43.877975463867, -1056.1607666016),
	vector2(-42.622379302979, -1052.7233886719),
	vector2(-46.685390472412, -1051.1958007813),
	vector2(-43.07527923584, -1041.0617675781),
	vector2(-37.793064117432, -1043.0905761719),
	vector2(-37.53284072876, -1042.4587402344),
	vector2(-40.350002288818, -1041.5446777344),
	vector2(-37.568943023682, -1034.447265625),
	vector2(-30.345546722412, -1037.2359619141),
	vector2(-25.094295501709, -1039.2303466797),
	vector2(-28.449684143066, -1050.8745117188),
	vector2(-22.005027770996, -1053.1912841797),
	vector2(-25.587991714478, -1062.5432128906),
	vector2(-28.021905899048, -1061.8040771484),
	vector2(-24.945468902588, -1063.4816894531),
	vector2(-29.027669906616, -1074.1885986328)
},
stash = { { coords = vector3(-42.41, -1064.03, 28.4), w = 3.6, d = 0.6, heading = 0, }, },
store = { { coords = vector3(-31.08, -1072.98, 28.4), w = 0.85, d = 1.8, heading = 359.0, }, },
crafting = { { coords = vector3(-36.25, -1070.98, 28.41), w = 2.8, d = 1.0, heading = 270.0, }, },
clockin = { { coords = vector3(-35.94, -1040.34, 28.63), heading = 101.57, }, },
garage = { spawn =  vector4(-35.6, -1051.73, 28.4, 46.46),
		   out = vector4(-44.56, -1046.07, 28.4, 250.43),
		   list = { "towtruck", "panto" , "flatbed", "slamtruck", "cheburek", "utillitruck3" } },
payments = { coords = vector3(-339.02, -156.6, 44.47), heading = 0.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png width=150px></p>" },
blip = vector3(-43.22, -1047.08, 28.4),
bliplabel = "Picaros Mech",
blipcolor = 67,
},

{	job = "ap",
zones = {
	vector2(534.44439697266, -165.57015991211),
	vector2(534.45587158203, -171.46482849121),
	vector2(552.11859130859, -165.54582214355),
	vector2(551.89697265625, -179.54200744629),
	vector2(547.58532714844, -179.57566833496),
	vector2(547.53363037109, -186.35386657715),
	vector2(548.15106201172, -186.34588623047),
	vector2(549.72497558594, -187.93923950195),
	vector2(551.88159179688, -187.92683410645),
	vector2(551.89556884766, -195.1739654541),
	vector2(550.64990234375, -195.26231384277),
	vector2(550.55749511719, -195.39562988281),
	vector2(551.3017578125, -195.47320556641),
	vector2(551.31127929688, -202.0140838623),
	vector2(545.64343261719, -202.00831604004),
	vector2(545.62365722656, -195.41816711426),
	vector2(546.35784912109, -195.41122436523),
	vector2(546.33361816406, -195.22450256348),
	vector2(545.62365722656, -195.14521789551),
	vector2(544.12768554688, -193.11889648438),
	vector2(541.28729248047, -193.01434326172),
	vector2(534.78668212891, -192.92961120605)
},
stash = { { coords = vector3(551.24, -189.93, 54.49), w = 3.6, d = 0.6, heading = 0, }, },
store = { { coords = vector3(-31.08, -1072.98, 28.4), w = 0.85, d = 1.8, heading = 359.0, }, },
crafting = { { coords = vector3(542.51, -185.38, 54.49), w = 2.8, d = 1.0, heading = 270.0, }, },
clockin = { { coords = vector3(551.43, -174.95, 54.30), heading = -50.57, }, },
garage = { spawn =  vector4(532.94, -181.82, 54.27, 104.44),
		   out = vector4(541.82, -182.01, 54.49, 278.27),
		   list = { "towtruck", "panto" , "flatbed", "slamtruck", "cheburek", "utillitruck3" } },
payments = { coords = vector3(-339.02, -156.6, 44.47), heading = 0.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png width=150px></p>" },
blip = vector3(533.66, -182.34, 54.24),
bliplabel = "ap Mech",
blipcolor = 67,
},

{	job = "tuner",
zones = {
	vector2(-350.98095703125, -174.92129516602),
	vector2(-362.08489990234, -156.15759277344),
	vector2(-351.41442871094, -150.06047058105),
	vector2(-349.5368347168, -149.83061218262),
	vector2(-357.18347167969, -138.76159667969),
	vector2(-346.09948730469, -108.72393035889),
	vector2(-378.17462158203, -97.062576293945),
	vector2(-371.24652099609, -77.819633483887),
	vector2(-305.06600952148, -101.70606231689),
	vector2(-328.95449829102, -166.86395263672)
},
stash = { { coords = vector3(-318.92, -136.37, 39.02), w = 3.6, d = 0.6, heading = 0, }, },
store = { { coords = vector3(-31.08, -1072.98, 28.4), w = 0.85, d = 1.8, heading = 359.0, }, },
crafting = { { coords = vector3(-321.9, -145.42, 39.02), w = 2.8, d = 1.0, heading = 270.0, }, },
clockin = { { coords = vector3(-346.11, -109.73, 38.80), heading = 101.57, }, },
garage = { spawn =  vector4(-365.04, -127.32, 38.7, 50.67),
		   out = vector4(-354.59, -132.22, 39.01, 261.37),
		   list = { "towtruck", "panto" , "flatbed", "slamtruck", "cheburek", "utillitruck3" } },
payments = { coords = vector3(-339.02, -156.6, 44.47), heading = 0.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png width=150px></p>" },
blip = vector3(-365.28, -127.13, 38.7),
bliplabel = "tuner Mech",
blipcolor = 67,
},
	
    -- Add a new job like this with location
	-- Check out https://github.com/mkafrin/PolyZone/wiki/Using-the-creation-script for information on how to make polyzones, its really easy
	-- When you have the vectors, copy them into a new zone below and it should work!
	-- The "job" is the players Job Role eg. "mechanic", if you set Config.JobRequiredForLocation to false, this can be whatever.
    --{	job = "mechanic",
	--	zones = {
	--		vector2(-308.60556030273, -983.15423583984),
	--		vector2(-294.68597412109, -988.24194335938),
	--		vector2(-297.03381347656, -994.37298583984),
	--		vector2(-346.31329345703, -976.38232421875),
	--		vector2(-343.78552246094, -970.34112548828)
	--	},
	--	stash = { coords = vector3(478.84, -1326.94, 29.21), w = 1.6, d = 0.6, heading = 27.0, },
	--	store = { coords = vector3(474.83, -1308.06, 29.21), w = 1.6, d = 0.5, heading = 295.0, },
	--	clockin = { coords = vector3(485.88, -1319.49, 29.11), heading = 284.0, },
	--	payments = { coords = vector3(471.76, -1311.61, 29.20), heading = 120.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/0/0c/HayesAutoBodyShop-GTAV-Logo.png width=150px></p>" },
	--	},
	
	--SIMPLE BLIP SETUP
	--If blip info is there it will generate a blip
	--If blip label is added (can be removed) it will add the chosen blip name otherwise it will default to "Mechanic Shop"
	--Blip colours can be found here: https://docs.fivem.net/docs/game-references/blips/
	--	blip = vector3(480.52, -1318.24, 29.2),
	--  bliplabel = "Hayes Autos",    -- Hayes Autos
	--	blipcolor = 55,
    --},
}

local till = {}
local laptop = {}
local parking = {}
local Targets = {}
CreateThread(function()
	if Config.LocationRequired then
		for k, v in pairs(Config.Locations) do
			JobLocation = PolyZone:Create(Config.Locations[k].zones, { name = Config.Locations[k].label, debugPoly = Config.Debug })
			JobLocation:onPlayerInOut(function(isPointInside)
				if isPointInside then
					if Config.RequiresJob and PlayerJob.name == tostring(Config.Locations[k].label) then	injob = true
					else injob = true end
				else injob = false end
			end)		
		end
	end
	if Config.LocationBlips then
		for k, v in pairs(Config.Locations) do
			if Config.Locations[k].blip ~= nil then
				local blip = AddBlipForCoord(Config.Locations[k].blip)
				SetBlipAsShortRange(blip, true)
				SetBlipSprite(blip, 446)
				SetBlipColour(blip, Config.Locations[k].blipcolor)
				SetBlipScale(blip, 0.7)
				SetBlipDisplay(blip, 6)
				BeginTextCommandSetBlipName('STRING')
				if Config.Locations[k].bliplabel ~= nil then AddTextComponentString(Config.Locations[k].bliplabel)
				else AddTextComponentString("Mechanic Shop") end
				EndTextCommandSetBlipName(blip)
			end
		end
	end
	--Make Crafting Locations
	if Config.Crafting then
		for k, v in pairs(Config.Locations) do job = v.job 
			if v.crafting then
				for l, b in pairs(v.crafting) do
					Targets[#Targets] = 
					exports['qb-target']:AddBoxZone("MechCraft: "..k..l, b.coords, b.w, b.d, { name="MechCraft: "..k..l, heading = b.heading, debugPoly=Config.Debug, minZ=b.coords.z-1.0, maxZ=b.coords.z+1.0 }, 
						{ options = { { event = "jim-mechanic:client:Crafting:Menu", icon = "fas fa-cogs", label = Loc[Config.Lan]["crafting"].menuheader, job = job }, },
						  distance = 2.0 })
				end
			end
		end
	end
	--Make Store Locations
	if Config.Stores then
		for k, v in pairs(Config.Locations) do job = v.job
			if v.store then
				for l, b in pairs(v.store) do
					Targets[#Targets] = 
					exports['qb-target']:AddBoxZone("MechStore: "..k..l, b.coords, b.w, b.d, { name="MechStore: "..k..l, heading = b.heading, debugPoly=Config.Debug, minZ=b.coords.z-1.0, maxZ=b.coords.z+1.0 }, 
						{ options = { { event = "jim-mechanic:client:Store:Menu", icon = "fas fa-cogs", label = Loc[Config.Lan]["stores"].browse, job = job }, },
						  distance = 2.0 })
				end
			end
		end
	end
	--Make Cash Register Locations
	for k, v in pairs(Config.Locations) do job = v.job
		if v.payments then v = v.payments
			Targets[#Targets] = 
			exports['qb-target']:AddBoxZone("MechReceipt: "..k, v.coords, 0.47, 0.34, { name="MechReceipt: "..k, heading = v.heading, debugPoly=Config.Debug, minZ=v.coords.z-0.1, maxZ=v.coords.z+0.4 }, 
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan]["payments"].charge, job = job, img = v.img }, },
				  distance = 2.0
			})
			RequestModel(`prop_till_03`) while not HasModelLoaded(`prop_till_03`) do Citizen.Wait(1) end
			till[#till+1] = CreateObject(`prop_till_03`, v.coords.x, v.coords.y, v.coords.z,false,false,false)
			SetEntityHeading(till[#till],v.heading+0.0)
			FreezeEntityPosition(till[#till], true)
		end
	end
	--Make Mechanic Stash locations
	if Config.RequiresJob and (Config.StashRepair or Config.StashCraft) and not Config.FreeRepair then
		for k, v in pairs(Config.Locations) do job = v.job
			if v.stash then
				for l, b in pairs(v.stash) do
					exports['qb-target']:AddBoxZone("MechSafe: "..k..l, b.coords, b.w, b.d, { name="MechSafe: "..k..l, heading = b.heading, debugPoly=Config.Debug, minZ=b.coords.z-1.0, maxZ=b.coords.z+1.0 }, 
						{ options = { { event = "jim-mechanic:client:Safe", icon = "fas fa-cogs", label = Loc[Config.Lan]["repair"].browse, job = job }, },
						  distance = 2.0 })
				end
			end
		end
	end
	--Make Clockin Locations
	for k, v in pairs(Config.Locations) do job = v.job
		if v.clockin then
			for l, b in pairs(v.clockin) do
				Targets[#Targets] = 
				exports['qb-target']:AddBoxZone("MechClock: "..k..l, vector3(b.coords.x, b.coords.y, b.coords.z), 0.45, 0.4, { name="MechClock: "..k..l, heading = b.heading, debugPoly=Config.Debug, minZ=b.coords.z-0.1, maxZ=b.coords.z+0.4 }, 
					{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-clipboard", label = "Duty Toggle", job = job }, },
					distance = 2.0 })
				RequestModel(`prop_laptop_01a`) while not HasModelLoaded(`prop_laptop_01a`) do Citizen.Wait(1) end
				laptop[#laptop+1] = CreateObject(`prop_laptop_01a`, b.coords.x, b.coords.y, b.coords.z,false,false,false)
				SetEntityHeading(laptop[#laptop],b.heading+0.0)
				FreezeEntityPosition(laptop[#laptop], true)
			end
		end
	end
	--Garage Locations
	for k, v in pairs(Config.Locations) do job = v.job
		if v.garage then
			local out = v.garage.out
			Targets[#Targets] = 
			exports['qb-target']:AddBoxZone("MechGarage: "..k, vector3(out.x, out.y, out.z-1.03), 0.8, 0.5, { name="MechGarage: "..k, heading = out[4]+180.0, debugPoly=Config.Debug, minZ=(out.z-1.03)-0.1, maxZ=out.z-1.03+1.3 }, 
				{ options = { { event = "jim-mechanic:client:Garage:Menu", icon = "fas fa-clipboard", label = Loc[Config.Lan]["garage"].jobgarage, job = job, coords = v.garage.spawn, list = v.garage.list }, },
				distance = 2.0 })
			RequestModel(`prop_parkingpay`) while not HasModelLoaded(`prop_parkingpay`) do Citizen.Wait(1) end
			parking[#parking+1] = CreateObject(`prop_parkingpay`, out.x, out.y, out.z-1.03,false,false,false)
			SetEntityHeading(parking[#parking], out[4]+180.0)
			FreezeEntityPosition(parking[#parking], true)
		end
	end
end)

----- CRAFTING STUFF -------
RegisterNetEvent('jim-mechanic:client:Crafting:Menu', function()
    exports['qb-menu']:openMenu({
        { isMenuHeader = true, header = Loc[Config.Lan]["crafting"].menuheader, txt = "", },
		{ header = "", txt = Loc[Config.Lan]["common"].close, params = { event = "" } },
		{ header = Loc[Config.Lan]["crafting"].toolheader, txt = #Crafting.Tools..Loc[Config.Lan]["crafting"].numitems, params = { event = "jim-mechanic:Crafting", args = { craftable = Crafting.Tools, header = Loc[Config.Lan]["crafting"].toolheader, } } },
        { header = Loc[Config.Lan]["crafting"].performheader, txt = #Crafting.Perform..Loc[Config.Lan]["crafting"].numitems, params = { event = "jim-mechanic:Crafting", args = { craftable = Crafting.Perform, header = Loc[Config.Lan]["crafting"].performheader, } } },
        { header = Loc[Config.Lan]["crafting"].cosmetheader, txt = #Crafting.Cosmetic..Loc[Config.Lan]["crafting"].numitems, params = { event = "jim-mechanic:Crafting", args = { craftable = Crafting.Cosmetic, header = Loc[Config.Lan]["crafting"].cosmetheader, } } },
    })
end)

RegisterNetEvent('jim-mechanic:Crafting', function(data)
	local Menu = {}
	Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
	Menu[#Menu + 1] = { header = "", txt = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Crafting:Menu" } }
		for i = 1, #data.craftable do
			for k, v in pairs(data.craftable[i]) do
				if k ~= "amount" and k ~= "job" then
					if data.craftable[i]["job"] then hasjob = false
						for l, b in pairs(data.craftable[i]["job"]) do
							if l == PlayerJob.name and b >= PlayerJob.grade.level then hasjob = true end
						end
					end
					if data.craftable[i]["job"] and hasjob == false then else
						local text = ""
						setheader = QBCore.Shared.Items[tostring(k)].label seticon = ""
						if Config.JimMenu then seticon = k else setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[k].image.." width=30px> "..setheader end
						if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
						for l, b in pairs(data.craftable[i][tostring(k)]) do
							if b == 1 then number = "" else number = " x"..b end
							text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
							settext = text
						end
						Menu[#Menu + 1] = { icon = seticon, header = setheader, txt = settext, params = { event = "jim-mechanic:Crafting:MakeItem", args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } } }
						settext, setheader = nil
					end
				end
			end
		end
	exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('jim-mechanic:Crafting:MakeItem', function(data)
	QBCore.Functions.TriggerCallback('jim-mechanic:Crafting:get', function(amount) 
		if not amount then TriggerEvent('QBCore:Notify', Loc[Config.Lan]["crafting"].ingredients, 'error') else TriggerEvent('jim-mechanic:Crafting:ItemProgress', data) end		
	end, data.item, data.craft)
end)

RegisterNetEvent('jim-mechanic:Crafting:ItemProgress', function(data)
	QBCore.Functions.Progressbar('making_food', "Crafting "..QBCore.Shared.Items[data.item].label, 7000, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, }, 
	{ animDict = "mini@repair", anim = "fixing_a_ped", flags = 8, },
	{}, {}, function()
		TriggerServerEvent('jim-mechanic:Crafting:GetItem', data.item, data.craft)
		emptyHands(PlayerPedId())
		TriggerEvent("jim-mechanic:Crafting", data)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		emptyHands(PlayerPedId())
	end)
end)

------ Store Stuff ------
-- Menu to pick the store
RegisterNetEvent('jim-mechanic:client:Store:Menu', function(data)
    exports['qb-menu']:openMenu({
        { header = Loc[Config.Lan]["stores"].tools, txt = "", params = { event = "jim-mechanic:client:Store", args = { id = 1, job = data.job } } },
        { header = Loc[Config.Lan]["stores"].perform, txt = "", params = { event = "jim-mechanic:client:Store", args = { id = 2, job = data.job } } },
        { header = Loc[Config.Lan]["stores"].cosmetic, txt = "", params = { event = "jim-mechanic:client:Store", args = { id = 3, job = data.job } } },
    })
end)

-- Open the selected store
RegisterNetEvent('jim-mechanic:client:Store', function(data)
	local event = "inventory:server:OpenInventory" if Config.JimShops then event = "jim-shops:ShopOpen" end
	if data.id == 1 then TriggerServerEvent(event, "shop", data.job, Stores.ToolItems) 
	elseif data.id == 2 then TriggerServerEvent(event, "shop", data.job, Stores.PerformItems)
	elseif data.id == 3 then TriggerServerEvent(event, "shop", data.job, Stores.StoreItems) end
end)

------ Repair Stash Stuff -----
RegisterNetEvent('jim-mechanic:client:Safe', function(data) TriggerEvent("inventory:client:SetCurrentStash", data.job.."Safe") TriggerServerEvent("inventory:server:OpenInventory", "stash", data.job.."Safe", { maxweight = 4000000, slots = 50, }) end)

-------- Garage Stuff ---------
local currentVeh = { out = false, current = nil }
local garageBlip = nil

RegisterNetEvent('jim-mechanic:client:Garage:Menu', function(data)
	RequestAnimDict('amb@prop_human_atm@male@enter') while not HasAnimDictLoaded('amb@prop_human_atm@male@enter') do Wait(1) end
	if HasAnimDictLoaded('amb@prop_human_atm@male@enter') then TaskPlayAnim(PlayerPedId(), 'amb@prop_human_atm@male@enter', "enter", 1.0,-1.0, 1500, 1, 1, true, true, true) end
	local vehicleMenu = { { icon = "fas fa-car-tunnel", header = Loc[Config.Lan]["garage"].jobgarage, isMenuHeader = true } }	
	if Config.JimMenu then vehicleMenu[#vehicleMenu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = string.gsub(Loc[Config.Lan]["common"].close, "❌ ", ""), params = { event = "jim-mechanic:client:Menu:Close" } }
	else vehicleMenu[#vehicleMenu + 1] = { header = "", txt = Loc[Config.Lan]["common"].close, params = { event = "jim-mechanic:client:Menu:Close" } } end
	if currentVeh.out and DoesEntityExist(currentVeh.current) then
		local col1, col2 = GetVehicleColours(currentVeh.current)
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsClassic) do if col1 == v.id then col1 = v.name end end
		vehicleMenu[#vehicleMenu+1] = { icon = "fas fa-clipboard-list", header = Loc[Config.Lan]["garage"].vehout, 
									    txt = searchCar(currentVeh.current)..Loc[Config.Lan]["paint"].primary..": "..col1.."<br>"..Loc[Config.Lan]["check"].plate..trim(GetVehicleNumberPlateText(currentVeh.current)).."]" ,
										params = { event = "jim-mechanic:client:Garage:Blip", }, }
		vehicleMenu[#vehicleMenu+1] = { icon = "fas fa-car-burst", header = Loc[Config.Lan]["garage"].remveh, params = { event = "jim-mechanic:client:Garage:RemSpawn" } }
	else
		currentVeh = { out = false, current = nil }
		table.sort(data.list, function(a, b) return a:lower() < b:lower() end)
		for k,v in pairs(data.list) do
			local spawnName = v
			v = string.lower(GetDisplayNameFromVehicleModel(GetHashKey(spawnName)))	v = v:sub(1,1):upper()..v:sub(2).." "..GetMakeNameFromVehicleModel(GetHashKey(tostring(spawnName)))
			vehicleMenu[#vehicleMenu+1] = { header = v, params = { event = "jim-mechanic:client:Garage:SpawnList", args = { spawnName = spawnName, coords = data.coords } } }
		end
	end
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent("jim-mechanic:client:Garage:SpawnList", function(data)
	local oldveh = GetClosestVehicle(data.coords.x, data.coords.y, data.coords.z, 2.5, 0, 71)
	if oldveh ~= 0 then
		local name = GetDisplayNameFromVehicleModel(GetEntityModel(oldveh)):lower()
		for k, v in pairs(QBCore.Shared.Vehicles) do
			if tonumber(v.hash) == GetEntityModel(oldveh) then
			if Config.Debug then print("Vehicle: "..v.hash.." ("..v.label..")") end
			name = QBCore.Shared.Vehicles[k].name break
			end
		end
		TriggerEvent("QBCore:Notify", name..Loc[Config.Lan]["garage"].cantspawn, "error")
	else
		QBCore.Functions.SpawnVehicle(data.spawnName, function(veh)
			currentVeh = { out = true, current = veh }
			SetVehicleModKit(veh, 0)
			NetworkRequestControlOfEntity(veh)
			SetEntityAsMissionEntity(veh, true, true)
			SetVehicleColours(veh, Loc[Config.Lan].vehicleResprayOptionsClassic[math.random(1, #Loc[Config.Lan].vehicleResprayOptionsClassic)].id, Loc[Config.Lan].vehicleResprayOptionsClassic[math.random(1, #Loc[Config.Lan].vehicleResprayOptionsClassic)].id)
			SetVehicleNumberPlateText(veh, string.sub(PlayerJob.label, 1, 5)..tostring(math.random(100, 999)))
			SetEntityHeading(veh, data.coords.w)
			TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
			TriggerEvent("vehiclekeys:client:SetOwner", trim(GetVehicleNumberPlateText(veh)))
			SetVehicleEngineOn(veh, true, true)
			Wait(250)
			if GetNumVehicleMods(veh, 48) > 0 or GetVehicleLiveryCount(veh) > -1 then TriggerEvent("jim-mechanic:client:Preview:Livery", {close=true}) end
			TriggerEvent("QBCore:Notify", GetDisplayNameFromVehicleModel(data.spawnName).." ["..trim(GetVehicleNumberPlateText(currentVeh.current)).."]")
		end, data.coords, true)
	end
end)

RegisterNetEvent("jim-mechanic:client:Garage:RemSpawn", function(data)
	SetVehicleEngineHealth(currentVeh.current, 200.0)
	SetVehicleBodyHealth(currentVeh.current, 200.0)
	for i = 0, 7 do SmashVehicleWindow(currentVeh.current, i) Wait(150) end PopOutVehicleWindscreen(currentVeh.current)
	for i = 0, 5 do	SetVehicleTyreBurst(currentVeh.current, i, true, 0) Wait(150) end
	for i = 0, 5 do SetVehicleDoorBroken(currentVeh.current, i, false) Wait(150) end
	Wait(800)
	DeleteEntity(currentVeh.current) currentVeh = { out = false, current = nil }
end)

local markerOn = false
RegisterNetEvent("jim-mechanic:client:Garage:Blip", function(data)
	TriggerEvent("QBCore:Notify", Loc[Config.Lan]["garage"].marker)
	if markerOn then markerOn = not markerOn end
	markerOn = true
	local carBlip = GetEntityCoords(currentVeh.current)
	if not DoesBlipExist(garageBlip) then 
		garageBlip = AddBlipForCoord(carBlip.x, carBlip.y, carBlip.z)
		SetBlipColour(garageBlip, 8)
		SetBlipRoute(garageBlip, true)
		SetBlipSprite(garageBlip, 85)
		SetBlipRouteColour(garageBlip, 3)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(Loc[Config.Lan]["garage"].markername)
		EndTextCommandSetBlipName(garageBlip)
	end
	while markerOn do
		local time = 5000
		local carLoc = GetEntityCoords(currentVeh.current)
		local playerLoc = GetEntityCoords(PlayerPedId())
		if DoesEntityExist(currentVeh.current) then
			if #(carLoc - playerLoc) <= 30.0 then time = 100
			elseif #(carLoc - playerLoc) <= 1.5 then
				RemoveBlip(garageBlip)
				garageBlip = nil
				markerOn = not markerOn
			else time = 5000 end
		else
			RemoveBlip(garageBlip)
			garageBlip = nil
			markerOn = not markerOn
		end
		Wait(time)
	end
end)

AddEventHandler('onResourceStop', function(r) 
	if r == GetCurrentResourceName() then
		for k, v in pairs(Config.Locations) do if v.crafting then for l, b in pairs(v.crafting) do exports['qb-target']:RemoveZone("MechCraft: "..k..l) end end end
		for k, v in pairs(Config.Locations) do if v.store then for l, b in pairs(v.store) do exports['qb-target']:RemoveZone("MechStore: "..k..l) end end end
		for k, v in pairs(Config.Locations) do if v.payments then exports['qb-target']:RemoveZone("MechReceipt: "..k) end end
		for k, v in pairs(Config.Locations) do if v.stash then for l, b in pairs(v.stash) do exports['qb-target']:RemoveZone("MechSafe: "..k..l) end end end
		for k, v in pairs(Config.Locations) do if v.clockin then for l, b in pairs(v.clockin) do exports['qb-target']:RemoveZone("MechClock: "..k..l) end end end
		for k, v in pairs(Config.Locations) do if v.garage then exports['qb-target']:RemoveZone("MechGarage: "..k) end end
		for i = 1, #till do DeleteEntity(till[i]) end
		for i = 1, #laptop do DeleteEntity(laptop[i]) end
		for i = 1, #parking do DeleteEntity(parking[i]) end
	end
end)