Config = {}

Config.Key = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.AutoCamPosition = true -- If true it'll set the camera position automatically

Config.AutoCamRotation = true -- If true it'll set the camera rotation automatically

Config.HideMinimap = true -- If true it'll hide the minimap when interacting with an NPC

Config.UseOkokTextUI = true -- If true it'll use okokTextUI 

Config.CameraAnimationTime = 1 -- Camera animation time in seconds

Config.TalkToNPC = {
	{
		npc = 'a_m_m_tranvest_01', 										-- Website too see peds name: https://wiki.rage.mp/index.php?title=Peds
		header = 'Employee of the', 								-- Text over the name
		name = 'gay dude', 										-- Text under the header
		uiText = "gay dude",							-- Name shown on the notification when near the NPC
		dialog = 'Hvad kan jeg gøre for dig?',						-- Text showm on the message bubble 
		coordinates = vector3(-336.82, -1214.17, 25.00), 				-- coordinates of NPC
		heading = 35.0,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Flour', 'okokTalk:toilet', 'c'},		-- 'c' for client
			{'Purple drank', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Blue crystals", 'okokTalk:safe', 'c'}, 
			{"xtx", 'okokTalk:card', 'c'}, 
			{"Mushrooms on steriods", 'okokTalk:lost', 'c'}, 
			{"li'l blunt", 'okokTalk:jennifer', 'c'},
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},
	--[[
	-- This is the template to create new NPCs
	{
		npc = "",
		header = "",
		name = "",
		uiText = "",
		dialog = "",
		coordinates = vector3(0.0, 0.0, 0.0),
		heading = 0.0,
		camOffset = vector3(0.0, 0.0, 0.0),
		camRotation = vector3(0.0, 0.0, 0.0),
		interactionRange = 0,
		options = {
			{"", 'client:event', 'c'},
			{"", 'client:event', 'c'},
			{"", 'client:event', 'c'}, 
			{"", 'server:event', 's'}, 
			{"", 'server:event', 's'}, 
			{"", 'server:event', 's'}, 
		},
		jobs = {	-- Example jobs
			'police',
			'ambulance',
		},
	},
	]]--
}