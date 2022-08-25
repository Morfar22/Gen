--[[
---------------------------------------------------
LUXART VEHICLE CONTROL V3 (FOR FIVEM)
---------------------------------------------------
Coded by Lt.Caine
ELS Clicks by Faction
Additions by TrevorBarns
---------------------------------------------------
FILE: SIRENS.lua
PURPOSE: Associate specific sirens with specific
vehicles. Siren assignments. 
---------------------------------------------------
SIREN TONE TABLE: 
	ID- Generic Name	(SIREN STRING)									[vehicles.awc name]
	1 - Airhorn 		(SIRENS_AIRHORN)								[AIRHORN_EQD]
	2 - Wail 			(VEHICLES_HORNS_SIREN_1)						[SIREN_PA20A_WAIL]
	3 - Yelp 			(VEHICLES_HORNS_SIREN_2)						[SIREN_2]
	4 - Priority 		(VEHICLES_HORNS_POLICE_WARNING)					[POLICE_WARNING]
	5 - CustomA* 		(RESIDENT_VEHICLES_SIREN_WAIL_01)				[SIREN_WAIL_01]
	6 - CustomB* 		(RESIDENT_VEHICLES_SIREN_WAIL_02)				[SIREN_WAIL_02]
	7 - CustomC* 		(RESIDENT_VEHICLES_SIREN_WAIL_03)				[SIREN_WAIL_03]
	8 - CustomD* 		(RESIDENT_VEHICLES_SIREN_QUICK_01)				[SIREN_QUICK_01]
	9 - CustomE* 		(RESIDENT_VEHICLES_SIREN_QUICK_02)				[SIREN_QUICK_02]
	10 - CustomF* 		(RESIDENT_VEHICLES_SIREN_QUICK_03)				[SIREN_QUICK_03]
	11 - Powercall 		(VEHICLES_HORNS_AMBULANCE_WARNING)				[AMBULANCE_WARNING]
	12 - FireHorn	 	(VEHICLES_HORNS_FIRETRUCK_WARNING)				[FIRE_TRUCK_HORN]
	13 - Firesiren 		(RESIDENT_VEHICLES_SIREN_FIRETRUCK_WAIL_01)		[SIREN_FIRETRUCK_WAIL_01]
	14 - Firesiren2 	(RESIDENT_VEHICLES_SIREN_FIRETRUCK_QUICK_01)	[SIREN_FIRETRUCK_QUICK_01]
]]
RequestScriptAudioBank("DLC_WMSIRENS\\SIRENPACK_ONE", true)
-- CHANGE SIREN NAMES, AUDIONAME, AUDIOREF
SIRENS = {	
	--[[1]]	  { Name = 'Airhorn', 		String = 'SIRENS_AIRHORN', 								Ref = 0 }, --1
	--[[2]]	  { Name = 'Wail', 			String = 'VEHICLES_HORNS_SIREN_1', 						Ref = 0 }, --2
	--[[3]]	  { Name = 'Yelp', 			String = 'VEHICLES_HORNS_SIREN_2', 						Ref = 0 }, --3
	--[[4]]	  { Name = 'Priority', 		String = 'VEHICLES_HORNS_POLICE_WARNING', 				Ref = 0 }, --4
	--[[5]]	  { Name = 'CustomA', 		String = 'RESIDENT_VEHICLES_SIREN_WAIL_01', 			Ref = 0 }, --5
	--[[6]]	  { Name = 'CustomB', 		String = 'RESIDENT_VEHICLES_SIREN_WAIL_02', 			Ref = 0 }, --6
	--[[7]]	  { Name = 'CustomC', 		String = 'RESIDENT_VEHICLES_SIREN_WAIL_03', 			Ref = 0 }, --7
	--[[8]]	  { Name = 'CustomD', 		String = 'RESIDENT_VEHICLES_SIREN_QUICK_01', 			Ref = 0 }, --8
	--[[9]]	  { Name = 'CustomE',		String = 'RESIDENT_VEHICLES_SIREN_QUICK_02',			Ref = 0 }, --9
	--[[10]]  { Name = 'CustomF',		String = 'RESIDENT_VEHICLES_SIREN_QUICK_03', 			Ref = 0 }, --10
	--[[11]]  { Name = 'Powercall', 	String = 'VEHICLES_HORNS_AMBULANCE_WARNING', 			Ref = 0 }, --11
	--[[12]]  { Name = 'Fire Horn', 	String = 'VEHICLES_HORNS_FIRETRUCK_WARNING', 			Ref = 0 }, --12
	--[[13]]  { Name = 'Fire Yelp', 	String = 'RESIDENT_VEHICLES_SIREN_FIRETRUCK_WAIL_01', 	Ref = 0 }, --13
	--[[14]]  { Name = 'Fire Wail', 	String = 'RESIDENT_VEHICLES_SIREN_FIRETRUCK_QUICK_01', 	Ref = 0 }, --14
    --[[15]]  { Name = "Siren Alpha", 	String = "SIREN_ALPHA", 	        Ref = "DLC_WMSIRENS_SOUNDSET" }, --15
    --[[16]]  { Name = "Siren Bravo", 	String = "SIREN_BRAVO", 	Ref = "DLC_WMSIRENS_SOUNDSET" }, --16
    --[[17]]  { Name = "Siren Charilie", 	        String = "SIREN_CHARLIE", 	Ref = "DLC_WMSIRENS_SOUNDSET" }, --17
    --[[18]]  { Name = "Siren Delta", 	        String = "SIREN_DELTA", 	Ref = "DLC_WMSIRENS_SOUNDSET" }, --18
    --[[19]]  { Name = "Siren Echo", 	        String = "SIREN_ECHO", 	        Ref = "DLC_WMSIRENS_SOUNDSET" }, --19
    --[[20]]  { Name = "Siren Foxtrot", 	        String = "SIREN_FOXTROT", 	Ref = "DLC_WMSIRENS_SOUNDSET" }, --20
    --[[21]]  { Name = "Siren Golf", 	        String = "SIREN_GOLF", 	        Ref = "DLC_WMSIRENS_SOUNDSET" }, --21
    --[[22]]  { Name = "Siren Hotel", 	        String = "SIREN_HOTEL", 	Ref = "DLC_WMSIRENS_SOUNDSET" }, --22
}

--ASSIGN SIRENS TO VEHICLES
SIREN_ASSIGNMENTS = {
	--['<gameName>'] = {tones},
	['DEFAULT'] = {1, 15, 16, 17}, 
['nf1'] = {1, 15, 16, 17},
['HP1'] = {1, 18, 19, 19},
['hp2'] = {1, 18, 19, 19},
['hp3'] = {1, 18, 19, 19},
['hp4'] = {1, 18, 19, 19},
['hp5'] = {1, 18, 19, 19},
['hp#'] = {1, 18, 19, 19},
['HP11'] = {1, 18, 19, 19},
['HP7'] = {1, 18, 19, 19},
['SO#'] = {1, 21, 22, 21},
['20fpiu'] = {1, 18, 19, 19},
['LCSO1'] = {1, 21, 22,20 },
['LCSO2'] = {1, 21, 22,20 },
['GU1'] = {1, 15, 16,20 },
['GU2'] = {1, 15, 16,20 },
['poracle'] = {1, 15, 16,20 },
['pminivan'] = {1, 15, 16,20 },
['camerobb'] = {1, 15, 16,20 },
['LeadCharger'] = {1, 15, 16,20 },
['LeadTahoe'] = {1, 15, 16,20 },
['PD1'] = { 1, 15, 16,17 }, 
['PD2'] = { 1, 15, 16,17 }, 
['PD3'] = { 1, 15, 16,17 }, 
['PD4'] = { 1, 15, 16,17 }, 
['PD5'] = { 1, 15, 16,17 }, 
['PD6'] = { 1, 15, 16,17 }, 
['PD7'] = { 1, 15, 16,17 }, 
['PD8'] = { 1, 15, 16,17 }, 
['PD9'] = { 1, 15, 16,17 }, 
['PD11'] = { 1, 15, 16,17 }, 
['PD12'] = { 1, 15, 16,17 }, 
['PD13'] = { 1, 15, 16,17 }, 
['PD14'] = { 1, 15, 16,17 }, 
['PD15'] = { 1, 15, 16,17 }, 
['PD16'] = { 1, 15, 16,17 }, 
['PD17'] = { 1, 15, 16,17 }, 
['PD18'] = { 1, 15, 16,17 }, 
['PD19'] = { 1, 15, 16,17 }, 
['PD20'] = { 1, 15, 16,17 }, 
['PD21'] = { 1, 15, 16,17 }, 
['PD22'] = { 1, 15, 16,17 }, 
['PD23'] = { 1, 15, 16,17 }, 
['PD24'] = { 1, 15, 16,17 }, 
['PD25'] = { 1, 15, 16,17 }, 
['PD26'] = { 1, 15, 16,17 }, 
['PD27'] = { 1, 15, 16,17 }, 
['PD28'] = { 1, 15, 16,17 }, 
['PD29'] = { 1, 15, 16,17 }, 
['PD30'] = { 1, 15, 16,17 }, 
['PD31'] = { 1, 15, 16,17 }, 
['PD32'] = { 1, 15, 16,17 }, 
['PD33'] = { 1, 15, 16,17 }, 
['PD34'] = { 1, 15, 16,17 }, 
['PD35'] = { 1, 15, 16,17 }, 
['PD36'] = { 1, 15, 16,17 }, 
['leobike'] = { 1, 15, 16,17 }, 
['Recruit14'] = { 1, 15, 16,17 }, 
['ST1'] = { 1, 15, 16,17 },
['sru#'] = {1, 21, 22,20 }, 
['Trainer18'] = {1, 21, 22,20 },
['UPD1'] = {1, 21, 22,20 },
['atvleo'] = { 1, 15, 16,17 }, 
['atvparks'] = { 1, 15, 16,17 }, 
['atvport'] = { 1, 15, 16,17 }, 
['DPS#'] = {1, 21, 22, 21},
['fd#'] = { 12, 13, 14, 11 },
['fdatv'] = { 12, 13, 14, 11 },
['fto#'] = { 12, 13, 14, 11 },
['FR5'] = { 12, 13, 14, 11 },


}