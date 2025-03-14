-- main variables
IN_GARAGE = false
IN_CASINO = false
INSIDE_TRACK = false
FORCE_INSIDE_TRACK = false
PLAYER_CHIPS = 0
PLAYER_MONEY = 0
PLAYER_IS_VIP = false
PLAYER_IS_BOSS = false
PLAYER_ITEMS = {}
CAN_INTERACT = true
CAN_SHOW_NOTIFY = true
INSTRUCTIONAL_BUTTONS_ACTIVE = false
CAN_MOVE = true
GAME_TIMER = GetGameTimer()
SERVER_TIMER = 0
SERVER_DATE = "0.0"
PLAYER_DRUNK_REFRESH_TIME = 0
PLAYER_DRUNK_LEVEL = 0.0
PLAYER_DRUNK_ANIM = 0
PLAYER_DRUNK_CAM = nil
PLAYER_CACHE = {}
GAME_POOL = {}
CASINO_BLIP = nil
MY_PLAYERID = nil
CASINO_ENTERS = 0
ENABLE_HUD = true
CASINO_BEING_KICKED = false
PLAYING_BLOCKED = false

local PLAYER_CHIPS_ANIMATED = -1
local LastCasinoUpdate = 0
local CasinoUpdateSpeed = 500
local CanInteractTime = 0
local NextInteractionCheck = 0
local NextTimerCheck = 0
local ServerTimeOffset = 0
local ServerTime = 0
local CasinoDoubleChecked = false

-- last game that player could interact with
LAST_INTERACTION_ENTITY = nil
LAST_INTERACTION_COORDS = nil
LAST_INTERACTION_GAME = nil
LAST_STARTED_GAME_TYPE = nil

-- info notification
local activeInfoNotification = nil

-- main ui elements
GAME_INFO_PANEL = nil

-- digital wall
local DigitalWall_Themes = {"CASINO_DIA_PL", "CASINO_HLW_PL", "CASINO_SNWFLK_PL", "CASINO_WIN_PL"}
local DigitalWall_RenderTarget = nil
local DigitalWall_Theme = 1
local DigitalWall_ClipTime = 0
local DigitalWall_PlayingConfetti = false
local DigitalWall_Alpha = 0
local DigitalWall_Start = 0

-- minimap
local miniMapHash = GetHashKey("ch_dlc_casino_back")

local function DrawCasinoMiniMap()
    -- SetRadarAsExteriorThisFrame()
    SetRadarAsInteriorThisFrame(miniMapHash, RADAR_MAP_POS.x, RADAR_MAP_POS.y, -31, 0)
    SetRadarZoomToDistance(Config.RADAR_ZOOMLEVEL)
end

-- blocks player interaction keys for x milliseconds
function BlockPlayerInteraction(delay)
    DebugStart("BlockPlayerInteraction")
    if GAME_TIMER + delay > CanInteractTime then
        CanInteractTime = GAME_TIMER + delay
    end
end

-- unblock player interaction keys
function UnblockPlayerInteraction()
    DebugStart("UnblockPlayerInteraction")
    CanInteractTime = GAME_TIMER
end

-- drunk toilet scene
function StartCasinoDrunkScene()
    DebugStart("StartCasinoDrunkScene")
    CreateThread(function()
        SetPedToRagdoll(PlayerPedId(), 5000, 5000, 0, 0, 0, 0)
        DoScreenFadeOut(3000)

        Wait(3000)

        if not IN_CASINO then
            DoScreenFadeIn(500)
            return
        end

        SetCasinoDrunkLevel(0.0)

        RequestAnimDictAndWait("anim@amb@clubhouse@respawn@male@")

        local toiletPos = vector3(1004.144592, 38.336006, 69.355537)
        local cameraPos = vector3(1001.307617, 35.408386, 72.337799)
        local cameraRot = vector3(-32.388695, 0.046790, -45.760590)
        local playerPos = toiletPos + vector3(0.0, 0.0, 0.30)

        SetEntityCoords(PlayerPedId(), toiletPos)

        if not PLAYER_DRUNK_CAM then
            PLAYER_DRUNK_CAM = Citizen.InvokeNative(0x5E3CF89C6BCCA67D, 26379945, 1)
        end

        SetCamParams(PLAYER_DRUNK_CAM, cameraPos.x, cameraPos.y, cameraPos.z, cameraRot.x, cameraRot.y, cameraRot.z,
            60.0, 0, 1, 1, 2)

        SetCamActive(PLAYER_DRUNK_CAM, true)
        RenderScriptCams(true, false, 3000, 1, 0, 0)
        SetCamFarClip(PLAYER_DRUNK_CAM, 1000.0)
        ShakeCam(PLAYER_DRUNK_CAM, "HAND_SHAKE", 0.65)

        local s = PlaySynchronizedScene(playerPos, vector3(0.0, 0.0, -40.0), "anim@amb@clubhouse@respawn@male@",
            "respawn_c", true)
        Wait(1000)
        DoScreenFadeIn(2000)
        WaitSynchronizedSceneToReachTime(s, 0.99, 10000, 500)

        ScenePed_AnnounceEnd()
        ClearPedTasks(PlayerPedId())
        ClearPedSecondaryTask(PlayerPedId())

        RenderScriptCams(false, true, 2000, true, false)
        Wait(1000)
        SetCamActive(PLAYER_DRUNK_CAM, false)
    end)
end

local function GetDrunkPercentage()
    -- get drunk level
    if Config.DrunkSystem == 2 then -- esx_status
        TriggerEvent("esx_status:getStatus", 'drunk', function(status)
            PLAYER_DRUNK_LEVEL = Clamp(status.val / 500000.0, 0.0, 1.0)
        end)
    elseif Config.DrunkSystem == 3 then -- evidence
        -- no function to get status? 
    elseif Config.DrunkSystem == 4 then -- rcore_drunk
        PLAYER_DRUNK_LEVEL = exports["rcore_drunk"].GetPlayerDrunkPercentage() / 100.0
    end
end

-- drunk level (0.0 => 1.0)
function SetCasinoDrunkLevel(level)
    DebugStart("SetCasinoDrunkLevel")
    if level < 0.0 then
        level = 0.0
    elseif level > 1.0 then
        level = 1.0
    end

    local percentage = math.ceil(level * 100)
    if Config.DrunkSystem == 2 then -- esx_status
        TriggerEvent('esx_status:add', 'drunk', percentage)
        GetDrunkPercentage()
        return
    elseif Config.DrunkSystem == 3 then -- evidence
        TriggerEvent("evidence:client:SetStatus", "alcohol", percentage)
        return
    elseif Config.DrunkSystem == 4 then -- rcore_drunk
        exports["rcore_drunk"]:AddPlayerDrunkPercentage(math.ceil(percentage / 2))
        GetDrunkPercentage()
        return
    end

    local animNames = {nil, "move_m@drunk@slightlydrunk", "move_m@drunk@moderatedrunk", "move_m@drunk@verydrunk"}
    local shakeIntensity = Lerp(0.0, 0.6, level)
    local animIndex = math.ceil(Lerp(0, 4, level))
    local animName = animNames[animIndex]

    -- if drunk animation has changed 
    if PLAYER_DRUNK_ANIM ~= animName then
        PLAYER_DRUNK_ANIM = animName
        if animName ~= nil then
            SetPedMovementClipset(PlayerPedId(), animName, true)
        else
            ClearTimecycleModifier()
            ResetPedMovementClipset(PlayerPedId(), 5.0)
            shakeIntensity = 0.0
        end
        ShakeGameplayCam("DRUNK_SHAKE", shakeIntensity)
    end

    SetTimecycleModifier("spectator5")
    SetTimecycleModifierStrength(level)
    PLAYER_DRUNK_LEVEL = level
end

-- chips
local chipsCallback = nil
local moneyCallback = nil
local itemsCallback = nil
local payCallback = nil

function Casino_AnimateBalance()
    UpdateBuiltInHud()
    if not ENABLE_HUD then
        return
    end
    if not Config.ShowChipsHud then
        return
    end
    DebugStart("Casino_AnimateBalance")
    if not PLAYER_CHIPS then
        PLAYER_CHIPS = 0
    end
    if PLAYER_CHIPS == PLAYER_CHIPS_ANIMATED then
        return
    end
    CreateThread(function()
        -- load chips hud & chips changed hud
        for i = 21, 22 do
            while not HasScaleformScriptHudMovieLoaded(i) and IN_CASINO do
                RequestScaleformScriptHudMovie(i)
                Wait(33)
            end
            if not IsScriptedHudComponentActive(i) then
                BeginScaleformScriptHudMovieMethod(i, "SHOW")
                ScaleformMovieMethodAddParamBool(1)
                EndScaleformMovieMethod()
            end
        end

        -- don't animate the initial show up
        if PLAYER_CHIPS_ANIMATED == -1 then
            PLAYER_CHIPS_ANIMATED = PLAYER_CHIPS
            BeginScaleformScriptHudMovieMethod(21, "SET_PLAYER_CHIPS")
            ScaleformMovieMethodAddParamInt(PLAYER_CHIPS)
            EndScaleformMovieMethod()
            return
        end
        -- animate the change
        local t = GAME_TIMER + 2000
        PLAYER_CHIPS = math.ceil(PLAYER_CHIPS)
        local append = PLAYER_CHIPS > PLAYER_CHIPS_ANIMATED
        local diff = math.abs(PLAYER_CHIPS - PLAYER_CHIPS_ANIMATED)
        local actualStep = PLAYER_CHIPS_ANIMATED + 0.01
        PLAYER_CHIPS_ANIMATED = PLAYER_CHIPS

        BeginScaleformScriptHudMovieMethod(22, "SET_PLAYER_CHIP_CHANGE")
        ScaleformMovieMethodAddParamInt(math.ceil(diff))
        ScaleformMovieMethodAddParamBool(append)
        EndScaleformMovieMethod()

        local s = 0.1
        while GAME_TIMER < t and IN_CASINO do
            s = s * (1.07)
            actualStep = Lerp(actualStep, PLAYER_CHIPS, s)
            local i = actualStep < 0.5 and 0 or math.floor(actualStep)

            BeginScaleformScriptHudMovieMethod(21, "SET_PLAYER_CHIPS")
            ScaleformMovieMethodAddParamInt(math.ceil(i))
            EndScaleformMovieMethod()
            Wait(0)
        end

        BeginScaleformScriptHudMovieMethod(21, "SET_PLAYER_CHIPS")
        ScaleformMovieMethodAddParamInt(PLAYER_CHIPS)
        EndScaleformMovieMethod()

        Wait(1000)

        -- hide the chips changed hud
        BeginScaleformScriptHudMovieMethod(22, "HIDE")
        ScaleformMovieMethodAddParamBool(1)
        EndScaleformMovieMethod()
        RemoveScaleformScriptHudMovie(22)
    end)
end

function RequestPlayerChips(callback)
    DebugStart("RequestPlayerChips")
    chipsCallback = callback
    TriggerServerEvent("Casino:GetChips")
end

function RequestPlayerMoney(callback)
    DebugStart("RequestPlayerMoney")
    moneyCallback = callback
    TriggerServerEvent("Casino:GetMoney")
end

function RequestPlayerItems(callback)
    DebugStart("RequestPlayerItems")
    itemsCallback = callback
    TriggerServerEvent("Casino:GetItems")
end

function ForgotLastInteractionEntity()
    LAST_INTERACTION_ENTITY = nil
    LAST_INTERACTION_COORDS = nil
    LAST_INTERACTION_GAME = nil
end

function ForgotLastStartedGameType(ifGame)
    if LAST_STARTED_GAME_TYPE == ifGame then
        LAST_STARTED_GAME_TYPE = nil
    end
end

-- handle interaction buttons

-- interaction key pressed
local function InteractionKeyPressed()
    DebugStart("InteractionKeyPressed")
    if not CAN_INTERACT then
        return
    end

    if LAST_INTERACTION_GAME == nil then
        return
    end

    if not IsActivityEnabled(LAST_INTERACTION_GAME) then
        InfoPanel_Update(nil, nil, nil, nil, nil)
        InfoPanel_UpdateNotification(Translation.GAME_STATE_DISABLED)
        return
    end

    -- i can interact with slots
    if LAST_INTERACTION_GAME == "slots" then
        Slots_OnInteraction()
    elseif LAST_INTERACTION_GAME == "luckywheel" then
        LuckyWheel_OnInteraction()
    elseif LAST_INTERACTION_GAME == "insidetrack" then
        InsideTrack_OnInteraction()
    elseif LAST_INTERACTION_GAME == "drinkingbar" then
        DrinkingBar_OnInteraction()
    elseif LAST_INTERACTION_GAME == "roulette" then
        Roulette_OnInteraction()
    elseif LAST_INTERACTION_GAME == "poker" then
        Poker_OnInteraction()
    elseif LAST_INTERACTION_GAME == "blackjack" then
        Blackjack_OnInteraction()
    elseif LAST_INTERACTION_GAME == "cashier" then
        Cashier_OnInteraction()
    elseif LAST_INTERACTION_GAME == "seating" then
        Seating_OnInteraction()
    elseif LAST_INTERACTION_GAME == "cameras" or LAST_INTERACTION_GAME == "officeelevator" or LAST_INTERACTION_GAME ==
        "officeelevatorout" then
        Office.OnInteraction()
    elseif LAST_INTERACTION_GAME == "casinoleaving" then
        StartCasinoLeaveScene()
    end
end

-- leave key pressed
local function LeaveKeyPressed()
    DebugStart("LeaveKeyPressed")
    if not CAN_INTERACT then
        return
    end

    if GAME_INFO_PANEL ~= nil then
        InfoPanel_Update(nil, nil, nil, nil, nil)
        InfoPanel_UpdateNotification(nil)
        CAN_SHOW_NOTIFY = true
        ForgotLastInteractionEntity()
        return
    end
    -- i can interact with slots
    if LAST_STARTED_GAME_TYPE == "slots" then
        Slots_OnInteractionQuit()
    elseif LAST_STARTED_GAME_TYPE == "luckywheel" then
        LuckyWheel_OnInteractionQuit()
    elseif LAST_STARTED_GAME_TYPE == "insidetrack" then
        InsideTrack_OnInteractionQuit()
    elseif LAST_STARTED_GAME_TYPE == "drinkingbar" then
        DrinkingBar_OnQuit()
    elseif LAST_STARTED_GAME_TYPE == "roulette" then
        Roulette_OnQuit()
    elseif LAST_STARTED_GAME_TYPE == "poker" then
        Poker_OnQuit()
    elseif LAST_STARTED_GAME_TYPE == "blackjack" then
        Blackjack_OnQuit()
    elseif LAST_STARTED_GAME_TYPE == "cashier" then
        Cashier_OnQuit()
    elseif LAST_STARTED_GAME_TYPE == "seating" then
        Seating_OnInteractionQuit()
    elseif LAST_STARTED_GAME_TYPE == "cameras" then
        Office.CameraLeaveRequest()
    end
end

-- check if a button was pressed
local function HandleControls()
    DebugStart("HandleControls")
    if IsDisabledControlJustReleased(0, 46) then
        InteractionKeyPressed()
    elseif IsDisabledControlJustReleased(0, 202) then -- 177 (BACKSPACE / ESC / RIGHT MOUSE BUTTON) > 202 (BACKSPACE / ESC)
        LeaveKeyPressed()
    end
end

-- update actual info notification
function InfoPanel_UpdateNotification(newNotification)
    if not ENABLE_HUD then
        return
    end
    DebugStart("InfoPanel_UpdateNotification")

    if Config.UIFontName and newNotification then
        newNotification = "<font face=\"" .. Config.UIFontName .. "\">" .. newNotification .. "</font>"
    end

    AddTextEntry("CasinoNotify", (newNotification ~= nil and newNotification or ""))
    activeInfoNotification = newNotification
end

function InfoPanel_DrawNotificationThisFrame(text)
    BeginTextCommandDisplayHelp('STRING')
    if Config.UIFontName and text then
        text = "<font face=\"" .. Config.UIFontName .. "\">" .. text .. "</font>"
    end
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, false, -1)
end

-- update / delete the info panel UI
function InfoPanel_Update(txtDict, txtName, label, description, description2, sound)
    DebugStart("InfoPanel_Update")
    if GAME_INFO_PANEL ~= nil then
        RageUI.Visible(GAME_INFO_PANEL, false)
        RageUI.CloseAll()
        -- destroy fundtion here / release textures
        GAME_INFO_PANEL = nil
    end

    if txtDict == nil then
        -- don't continue, just destroy the active ui if exists
        return
    end

    local panel = RageUI.CreateMenu("", label, 25, 25, txtDict, txtName);
    panel.EnableMouse = false
    panel.Display.PageCounter = false
    panel.ConfirmCaption = Translation.MENU_PLAY_OPTION
    panel.ConfirmKey = 46

    function RageUI.PoolMenus:InfoUI()
        panel:IsVisible(function(i)
            i:AddText(description)
            if description2 ~= nil then
                i:AddText(description2)
            end
        end, function(Panels)
        end)
    end

    RageUI.Visible(panel, true)
    GAME_INFO_PANEL = panel

    if sound then
        PlaySoundFrontend(-1, "DLC_VW_RULES", "dlc_vw_table_games_frontend_sounds", true)
    end

    return panel
end

-- interactable object was lost
local function InteractableObjectLost()
    DebugStart("InteractableObjectLost")
    InfoPanel_Update(nil, nil, nil, nil)
    InfoPanel_UpdateNotification(nil)
end

-- new interactable object was found
local function InteractableObjectFound(game, entity, coords, model)
    DebugStart("InteractableObjectFound")
    InfoPanel_Update(nil, nil, nil, nil)

    if PLAYING_BLOCKED then
        return
    end

    if PLAYER_DRUNK_LEVEL >= 0.9 then
        InfoPanel_UpdateNotification(Translation.DRUNK_MESSAGE)
        return
    end

    if not IsActivityEnabled(game) then
        InfoPanel_UpdateNotification(Translation.GAME_STATE_DISABLED)
        return
    end

    if game == "slots" then
        Slots_ShowNotifyUI(entity, coords)
    elseif game == "luckywheel" then
        LuckyWheel_ShowNotifyUI()

    elseif game == "insidetrack" then
        InsideTrack_ShowNotifyUI()

    elseif game == "drinkingbar" then
        DrinkingBar_ShowNotifyUI(entity ~= nil and 1 or 2)

    elseif game == "roulette" then
        Roulette_ShowNotifyUI(entity, coords)

    elseif game == "poker" then
        Poker_ShowNotifyUI(entity, coords)

    elseif game == "blackjack" then
        Blackjack_ShowNotifyUI(entity, coords)

    elseif game == "cashier" then
        Cashier_ShowNotifyUI(coords)

    elseif game == "seating" then
        Seating_ShowNotifyUI(coords)

    elseif game == "cameras" then
        Office.ShowNotifyUI("cameras")

    elseif game == "officeelevator" or game == "officeelevatorout" then
        Office.ShowNotifyUI(game)

    elseif game == "casinoleaving" then
        LAST_INTERACTION_GAME = "casinoleaving"
        InfoPanel_UpdateNotification(Translation.PRESS_TO_LEAVE_CASINO)
    end
end

-- player is standing next to something interecting (chair, lucky wheel, slots..)
-- let's check if the object is something new, not the one from previous check
local function InteractableObjectExists(game, entity, coords)
    DebugStart("InteractableObjectExists")

    if PLAYING_BLOCKED then
        return
    end

    if LAST_INTERACTION_GAME == "drinkingbar" and game == nil then
        DrinkingBar_OnWalkAway()
    end

    -- if entity found, but it's same from previous check
    if entity ~= nil and entity == LAST_INTERACTION_ENTITY then
        return
        -- if entity wasn't found, lets use coords for checking
    elseif entity == nil and coords ~= nil and coords == LAST_INTERACTION_COORDS then
        return
        -- if entity & coords are null, lets use game type for checking
    elseif coords == nil and game == LAST_INTERACTION_GAME then
        return
    end

    LAST_INTERACTION_GAME = game
    LAST_INTERACTION_ENTITY = entity
    LAST_INTERACTION_COORDS = coords

    if game ~= nil then
        InteractableObjectFound(game, entity, coords)
    else
        InteractableObjectLost()
    end
end

-- rescan casino tables
local function RescanTables()
    DebugStart("RescanTables")
    GAME_POOL["CObject"] = GetGamePool("CObject")
    Poker_RescanTables()
    Blackjack_RescanTables()
    Roulette_RescanTables()
end

local function OneSecondTimer()
    if GAME_TIMER < NextTimerCheck then
        return
    end
    DebugStart("OneSecondTimer")
    NextTimerCheck = GAME_TIMER + 1000

    -- disable idle camera
    if Config.DISABLE_IDLE_CAM then
        InvalidateIdleCam()
        InvalidateVehicleIdleCam()
    end

    RageUI.RefreshNUIInstructionalState()
end

-- check for avaiable object to interact with
local function CheckForInteractions()
    -- not yet
    if GAME_TIMER < NextInteractionCheck then
        return
    end
    DebugStart("CheckForInteractions")
    -- if can't show notify now
    if not CAN_SHOW_NOTIFY and LAST_INTERACTION_GAME ~= nil then
        LAST_INTERACTION_GAME = nil
        InteractableObjectLost()
    end
    -- can't interact right now
    if not CAN_INTERACT then
        return
    end

    -- prepare next check time
    NextInteractionCheck = GAME_TIMER + 1000

    -- check for slots
    local entity, distance = ReyCastAroundObjects(machineHashes, 1.8, true, false)
    if entity ~= 0 then
        InteractableObjectExists("slots", entity, GetEntityCoords(entity))
        return
    end

    local playerPos = GetPlayerPosition()

    -- check for lucky wheel
    local luckyDistance = #(playerPos - LuckyWheel_GetCoords())
    if luckyDistance < 2 then
        InteractableObjectExists("luckywheel", nil, nil)
        return
    end

    -- check for inside track
    if INSIDE_TRACK then
        local itCoords, itUsed = InsideTrack_GetClosestChairState()
        if itCoords ~= nil then
            InteractableObjectExists("insidetrack", nil, itCoords)
            return
        end
    end

    -- check for drinking bar
    local bartender = DrinkingBar_GetClosestBartender()
    if bartender ~= nil then
        InteractableObjectExists("drinkingbar", bartender.ped, bartender.initialPos)
        return
    end

    local barchair = DrinkingBar_GetClosestChair()
    if barchair ~= -1 then
        local chairCoords = vector3(DrinkingBarChairs[barchair].coords[1], DrinkingBarChairs[barchair].coords[2],
            DrinkingBarChairs[barchair].coords[3])
        if not Peds_SomeoneNearCoords(chairCoords) then
            InteractableObjectExists("drinkingbar", nil, chairCoords)
            return
        end
    end

    -- check for roulette
    local rouletteTable = ReyCastAroundObjects({GetHashKey("vw_prop_casino_roulette_01"),
                                                GetHashKey("vw_prop_casino_roulette_01b")}, 1.8, true, false)
    if rouletteTable ~= -0 then
        local pos = GetEntityCoords(rouletteTable)
        InteractableObjectExists("roulette", rouletteTable, pos)
        return
    end

    -- check for poker
    local pokerTable = ReyCastAroundObjects({GetHashKey("vw_prop_casino_3cardpoker_01"),
                                             GetHashKey("vw_prop_casino_3cardpoker_01b")}, 1.8, true, false)
    if pokerTable ~= -0 then
        local pos = GetEntityCoords(pokerTable)
        InteractableObjectExists("poker", pokerTable, pos)
        return
    end

    -- check for blackjack
    local blackjackTable = ReyCastAroundObjects({GetHashKey("vw_prop_casino_blckjack_01"),
                                                 GetHashKey("vw_prop_casino_blckjack_01b")}, 1.8, true, false)
    if blackjackTable ~= -0 then
        local pos = GetEntityCoords(blackjackTable)
        InteractableObjectExists("blackjack", blackjackTable, pos)
        return
    end

    -- check for cashier
    for _, o in pairs(CashierDatas) do
        if o.enabled and #(playerPos - o.coords) < 2.5 then
            InteractableObjectExists("cashier", nil, o.coords)
            return
        end
    end

    PLAYER_IS_BOSS = IsAtJob(Config.JobName, {
        [Config.BossName] = true
    }, Config.BossGrade)

    if CAN_INTERACT then
        local hasJob = IsPlayerWorkingAtCasino()
        for _, o in pairs(RestrictedAreas) do
            if (o.type == 1 and not PLAYER_IS_VIP) or (o.type == 2 and not hasJob) then
                if #(playerPos - o.coords) < o.radius then
                    BlockPlayerInteraction(1000)
                    CreateThread(function()
                        InfoPanel_UpdateNotification(o.type == 1 and Translation.RESTRICTED_AREA or
                                                         Translation.RESTRICTED_AREA_MANAGEMENT)
                        TaskGoStraightToCoord(PlayerPedId(), o.safearea, 1.0, 3.0, GetEntityHeading(PlayerPedId()), 0.0)
                        WaitForPlayerOnCoords(o.safearea, 5000)
                        TaskPedSlideToCoord(PlayerPedId(), o.safearea, GetEntityHeading(PlayerPedId()), 5000)
                        WaitForPlayerOnCoords(o.safearea, 5000)
                        SetEntityCoordsNoOffset(PlayerPedId(), o.safearea, true, true, true, true)
                        Wait(3000)
                        InfoPanel_UpdateNotification("")
                    end)
                end
            end
        end
    end

    -- check for seating

    for i = 1, #(CasinoSeating) do
        local o = CasinoSeating[i]
        if #(playerPos - o.coords) < 1.0 and not Peds_SomeoneNearCoords(o.coords) then
            InteractableObjectExists("seating", nil, i)
            return
        end
    end

    -- check fo office
    if #(playerPos - OfficeTableEnterPosition) < 1.0 and PLAYER_IS_BOSS then
        InteractableObjectExists("cameras", nil, nil)
        return
    end

    if #(playerPos - OfficeElevatorCheckpointPositions[1]) < 1.0 and PLAYER_IS_BOSS then
        InteractableObjectExists("officeelevator", nil, nil)
        return
    end

    if #(playerPos - OfficeElevatorCheckpointPositions[2]) < 1.0 and PLAYER_IS_BOSS then
        InteractableObjectExists("officeelevatorout", nil, nil)
        return
    end

    -- check for teleport leaving
    if Config.LeaveThroughTeleport then
        if #(playerPos - Config.LeaveArea) < 4.0 then
            InteractableObjectExists("casinoleaving", nil, nil)
            return
        end
    end

    -- interactable object wasn't found 
    InteractableObjectExists(nil, nil, nil)
end

local function DrawInfoPanel()
    if activeInfoNotification == nil then
        return
    end
    DisplayHelpTextThisFrame("CasinoNotify")
end

-- block extra controls (attacking, weapon Switch, etc.)
local function RestrictControls()
    if Config.RestrictControls then
        DisablePlayerFiring(PlayerId(), true) -- important?
        for k, v in pairs(restrictedControls) do
            DisableControlAction(0, v, true)
        end

        if IsGamepadControl() then
            -- restrict dpad UP & DOWN keys
            DisableControlAction(0, 27, true) -- DPAD UP
            DisableControlAction(0, 42, true)
            DisableControlAction(0, 172, true)
            DisableControlAction(0, 188, true)
            DisableControlAction(0, 232, true)
            DisableControlAction(0, 303, true)

            DisableControlAction(0, 19, true) -- DPAD DOWN
            DisableControlAction(0, 20, true)
            DisableControlAction(0, 43, true)
            DisableControlAction(0, 48, true)
            DisableControlAction(0, 173, true)
            DisableControlAction(0, 187, true)

            DisableControlAction(0, 233, true)
            DisableControlAction(0, 309, true)
            DisableControlAction(0, 311, true)

            DisableControlAction(0, 170, true)
            DisableControlAction(0, 171, true)
        end

        -- disable ESC button if UI exists
        if GAME_INFO_PANEL ~= nil then
            DisableControlAction(0, 177, true)
            DisableControlAction(0, 200, true)
            DisableControlAction(0, 202, true)
            DisableControlAction(0, 322, true)
        end

        if (RageUI.CurrentMenu and not RageUI.CurrentMenu.Closed) then
            DisableControlAction(0, 303, true)
        end
    end

    -- block movement while in menus
    if not CAN_MOVE then
        for i = 20, 40, 1 do
            DisableControlAction(0, i, true)
        end
    end
end

-- main thread
CreateThread(function()
    -- load custom fonts
    if Config.UIFontName then
        if tonumber(Config.UIFontName) and Config.UIFontName ~= -1 then
            Config.UIFontID = Config.UIFontName
        else
            RegisterFontFile(Config.UIFontName)
            Config.UIFontID = RegisterFontId(Config.UIFontName)
        end
    else
        Config.UIFontID = 0
    end

    while true do
        Wait(CasinoUpdateSpeed)
        if IN_CASINO then
            DrawCasinoMiniMap()
            RestrictControls()
            OneSecondTimer()
            CheckForInteractions()
            DrawInfoPanel()
            HandleControls()
            TimerBar.DrawAll()
            ScenePed_ProcessPedsShisFrame()
            SetPedCapsule(PlayerPedId(), 0.2)

            -- double-check table games
            if not CasinoDoubleChecked and #(GetPlayerPosition() - vector3(table.unpack(Config.CAS_DOUBLECHECK_COORDS))) <
                5 then
                CasinoDoubleChecked = true
                RescanTables()
            end

            if not ENABLE_HUD then
                HideHudAndRadarThisFrame()
            end
            -- calculate server time
            local elapsed = (GAME_TIMER - ServerTimeOffset) / 1000
            SERVER_TIMER = ServerTime + math.round(elapsed)

            if PLAYER_DRUNK_LEVEL >= 0.5 then
                SetAudioSpecialEffectMode(2)
            end

            if GAME_TIMER > PLAYER_DRUNK_REFRESH_TIME then
                PLAYER_DRUNK_REFRESH_TIME = GAME_TIMER + 60000
                if PLAYER_DRUNK_LEVEL >= 0.1 then
                    if PLAYER_DRUNK_LEVEL >= 1.0 and GetEntitySpeed(PlayerPedId()) > 0.75 then
                        StartCasinoDrunkScene()
                    elseif Config.DrunkSystem == 1 then
                        SetCasinoDrunkLevel(PLAYER_DRUNK_LEVEL - 0.1)
                    end
                end
            end
        end
        GAME_TIMER = GetGameTimer()
        CAN_INTERACT = GAME_TIMER > CanInteractTime
        if GAME_TIMER - LastCasinoUpdate > 500 then
            LastCasinoUpdate = GAME_TIMER
            local playerPosition = GetPlayerPosition()

            -- check if player is in casino, every 2 seconds, and call events for load/release stuff
            local c = IsEntityInArea(PlayerPedId(), CASINO_AREA_MIN, CASINO_AREA_MAX) -- casino area inside

            if c and not IsEntityInCasino(PlayerPedId()) or IN_GARAGE then
                c = false
            end

            local int = GetInteriorFromEntity(PlayerPedId())

            if int == 0 or not IsInteriorReady(int) then
                c = false
            end

            if CASINO_BEING_KICKED then
                c = false
            end

            if c ~= IN_CASINO then
                IN_CASINO = c
                if IN_CASINO then
                    OnEnterCasino()
                else
                    OnLeaveCasino()
                end
            end

            if IN_CASINO then
                -- check if player's around Inside Track & Start It
                local trackDistance = #(playerPosition - INSIDE_TRACK_AREA)
                if (trackDistance <= 20 or FORCE_INSIDE_TRACK) and not INSIDE_TRACK then
                    INSIDE_TRACK = true
                    InsideTrackStart()
                elseif trackDistance > 20 and not FORCE_INSIDE_TRACK then
                    OnLeaveInsideTrack()
                end
            else
                OnLeaveInsideTrack()
            end
        end
    end
end, true)

-- global function for setting the digital wall theme
function DigitalWall_SetTheme(theme, save, alpha)
    DebugStart("DigitalWall_SetTheme")
    if save then
        DigitalWall_Theme = theme
    end
    DigitalWall_Start = GAME_TIMER
    DigitalWall_Alpha = alpha
    SetTvChannelPlaylist(0, DigitalWall_Themes[theme], true)
    SetTvAudioFrontend(true)
    SetTvVolume(-100.0)
    SetTvChannel(0)
end

-- global function for triggering confetti
function DigitalWall_Confetti()
    DebugStart("DigitalWall_Confetti")
    if DigitalWall_PlayingConfetti then
        return
    end
    CreateThread(function()
        DigitalWall_PlayingConfetti = true

        -- it shows 3x cuz it's nice :)
        for i = 1, 3, 1 do
            DigitalWall_SetTheme(4, false, 255)
            Wait(2500)
        end

        Wait(8000)

        -- back to normal(previous) theme
        DigitalWall_SetTheme(DigitalWall_Theme, false, 0)
        DigitalWall_PlayingConfetti = false
    end)
end

-- starts thread that draws digital walls
function StartDigitalWalls()
    DebugStart("StartDigitalWalls")
    Debug("Loading Digital Walls")
    CreateThread(function()
        -- setup rendertarget
        RegisterNamedRendertarget('casinoscreen_01')
        LinkNamedRendertarget(GetHashKey("vw_vwint01_video_overlay"))
        DigitalWall_RenderTarget = GetNamedRendertargetRenderId('casinoscreen_01')

        -- initial theme
        DigitalWall_SetTheme(DigitalWall_Theme, false, 0)

        -- draw cycle
        while IN_CASINO do
            if DigitalWall_Alpha < 255 then
                DigitalWall_Alpha = DigitalWall_Alpha + 1
            end
            SetTextRenderId(DigitalWall_RenderTarget)
            SetScriptGfxDrawOrder(4)
            SetScriptGfxDrawBehindPausemenu(true)
            -- DrawInteractiveSprite('Prop_Screen_Vinewood', 'BG_Wall_Colour_4x4', 0.25, 0.5, 0.5, 1.0, 0.0, 255, 255, 255, 255)
            DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, DigitalWall_Alpha)
            SetTextRenderId(GetDefaultScriptRendertargetRenderId())

            local elapsed = GAME_TIMER - DigitalWall_Start
            if elapsed >= 42800 then
                DigitalWall_SetTheme(DigitalWall_Theme, false, 255)
            end
            Wait(0)
        end
    end)
end

local function Garage_AnimateCamera(delay)
    DebugStart("Garage_AnimateCamera")
    CreateThread(function()
        RequestModel(GetHashKey("a_f_m_beach_01"))
        while not HasModelLoaded(GetHashKey("a_f_m_beach_01")) do
            Wait(100)
        end
        local openingSlave = CreatePed(2, GetHashKey("a_f_m_beach_01"), vector3(934.636780, 3.510904, 78.763962), 0,
            false, false)
        SetModelAsNoLongerNeeded(GetHashKey("a_f_m_beach_01"))
        SetEntityAlpha(openingSlave, 0.0)

        local camStartPos = vector3(939.335815, 5.958447, 81.711578)
        local camStartRot = vector3(-20.295437, 0.059129, 148.949219)
        local camFinalPos = vector3(947.474670, 18.910082, 81.815681)
        local camFinalRot = vector3(-20.702911, 0.058717, 149.681671)

        local garageCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", camStartPos, camStartRot, 50.0, false, 0)
        SetCamActive(garageCam, true)
        RenderScriptCams(true, 900, 900, true, false)

        Wait(delay)

        local start = GetGameTimer()
        while GetGameTimer() - start < 10000.0 do
            local offset = (GetGameTimer() - start) * 1.0 / 10000.0
            local actualPos = LerpVector3(camStartPos, camFinalPos, offset)
            local actualRot = LerpVector3(camStartRot, camFinalRot, offset)

            SetCamCoord(garageCam, actualPos)
            SetCamRot(garageCam, actualRot, 2)

            Wait(0)
        end

        DestroyCam(garageCam)
        RenderScriptCams(false, true, 1, true, true)
        DeleteEntity(openingSlave)
        garageCam = nil
    end)
end

local function Garage_ReplaceVehicle()
    if not CAN_INTERACT then
        return
    end
    BlockPlayerInteraction(1000)

    DebugStart("Garage_ReplaceVehicle")
    -- only boss can replace vehicles
    if not PLAYER_IS_BOSS then
        return
    end
    -- not sitting in any car
    local myVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    if myVeh == 0 then
        return
    end

    -- don't load Casino when IN_GARAGE
    IN_GARAGE = true

    -- send the new vehicle props to server

    local vehProps = GetVehicleProperties(myVeh) -- esx clone func

    if Framework.Active == 2 then -- qb
        vehProps = QBCore.Functions.GetVehicleProperties(myVeh)
    end

    vehProps.plate = GetVehicleNumberPlateText(myVeh)

    local myModel = GetEntityModel(myVeh)
    local modelname = GetDisplayNameFromVehicleModel(GetEntityModel(myVeh))
    local displayName = GetLabelText(modelname)

    TriggerServerEvent("Casino:PodiumReplace", modelname, vehProps)
end

local function CasinoGarage_ReplaceCallback(state)
    DebugStart("CasinoGarage_ReplaceCallback")
    if state then
        local myVeh = GetVehiclePedIsIn(PlayerPedId(), false)
        if myVeh == 0 then
            return
        end

        local myModel = GetEntityModel(myVeh)
        local modelname = GetDisplayNameFromVehicleModel(GetEntityModel(myVeh))
        local plate = GetVehicleNumberPlateText(myVeh)
        modelname = GetLabelText(modelname)

        if Config.MapType == 1 and not IsEntityInCasino(PlayerPedId()) then
            Garage_AnimateCamera(500)
            PlaySoundFrontend(-1, "Garage_Door_Open", "GTAO_Script_Doors_Faded_Screen_Sounds", true)
            SetVehicleDoorsLocked(myVeh, 2)
            SetEntityHeading(myVeh, 329.0)
            Wait(2000)
            TaskVehicleDriveToCoord(PlayerPedId(), myVeh, 948.051636, 19.730062, 80.743874, 5.0, 1.0, myModel, 16777216,
                1.0, true)
            Wait(2000)
        end

        ShowFullscreenBonusNotify(Translation.BOSS_FULLSCREEN_PODIUM_CAPT, Translation.BOSS_FULLSCREEN_PODIUM_DESC,
            modelname)
        Wait(4000)
        TaskLeaveVehicle(PlayerPedId(), myVeh, 0)
        DoScreenFadeOut(2000)
        Wait(3000)

        if Config.JOB_PODIUMCAR_DELETE_ORIGINAL_FUNCTION_CLIENT then
            pcall(function()
                Config.JOB_PODIUMCAR_DELETE_ORIGINAL_FUNCTION_CLIENT(myVeh, plate)
            end)
        end

        -- teleport player to the main Casino entrance
        if not IsEntityInCasino(PlayerPedId()) then
            SetEntityCoordsNoOffset(PlayerPedId(), 918.547363, 49.234009, 80.898590, true, true, true)
            SetEntityHeading(PlayerPedId(), 240.0)
        end

        DoScreenFadeIn(2000)
    else
        PushNUIInstructionalButtons({{
            key = 176,
            title = Translation.BTN_CONTINUE
        }})
        ShowFullScreenAlert(Translation.CAPT_ERROR, Translation.BOSS_REPLACE_OWNERSHIP_ERROR)
    end
    IN_GARAGE = false
end

-- closes menus if open, and leaves chairs
local function StopFromPlaying()
    if IN_CASINO then
        -- close menus
        CAN_INTERACT = true
        LeaveKeyPressed()
        -- leave chairs
        CAN_INTERACT = true
        LeaveKeyPressed()
    end
end

function ShowFullScreenAlert(caption, message, onYes, onNo)
    Citizen.CreateThread(function()
        local s = RequestScaleformMovie("POPUP_WARNING")
        while not HasScaleformMovieLoaded(s) do
            Wait(10)
        end

        CallScaleformFunction(s, false, "SHOW_POPUP_WARNING", 1000, caption, message, "", true, 0, "")

        while true do
            DisableControlAction(1, 176, true)
            DisableControlAction(2, 177, true)

            if IsDisabledControlJustPressed(0, 176) then
                if onYes then
                    CreateThread(function()
                        onYes()
                    end)
                end
                break
            end

            if IsDisabledControlJustPressed(0, 177) then
                if onNo then
                    CreateThread(function()
                        onNo()
                    end)
                end
                break
            end

            DrawScaleformMovieFullscreen(s, 255, 255, 255, 255, 0)
            Wait(0)
        end

        SetScaleformMovieAsNoLongerNeeded(s)
        PushNUIInstructionalButtons(nil)
    end)
end

function CasinoGarage_OnInteraction()
    DebugStart("CasinoGarage_OnInteraction")
    -- reload boss state
    PLAYER_IS_BOSS = IsAtJob(Config.JobName, {
        [Config.BossName] = true
    }, Config.BossGrade)

    local hasAbility = IsAtJob(Config.JobName, nil, 1)
    -- only boss can replace vehicles
    if not hasAbility then
        return
    end

    -- if already doing something
    if IN_GARAGE then
        return
    end

    local myVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    if myVeh == 0 then
        return
    end

    Citizen.CreateThread(function()
        local keys = {{
            key = 176,
            title = Translation.BOSS_REPLACE_CONFIRM_YES
        }, {
            key = 177,
            title = Translation.BOSS_REPLACE_CONFIRM_NO
        }}

        PushNUIInstructionalButtons(keys)
        local s = RequestScaleformMovie("POPUP_WARNING")
        while not HasScaleformMovieLoaded(s) do
            Wait(10)
        end

        CallScaleformFunction(s, false, "SHOW_POPUP_WARNING", 1000, Translation.BOSS_REPLACE_CAPTION,
            Translation.BOSS_REPLACE_QUESTION, "", true, 0, "")

        while true do
            SetVehicleEngineOn(myVeh, false, true, false)
            DisableControlAction(1, 176, true)
            DisableControlAction(2, 177, true)

            if IsDisabledControlJustPressed(0, 176) then
                Garage_ReplaceVehicle()
                break
            end

            if IsDisabledControlJustPressed(0, 177) then
                break
            end

            DrawScaleformMovieFullscreen(s, 255, 255, 255, 255, 0)
            Wait(0)
        end

        SetScaleformMovieAsNoLongerNeeded(s)
        PushNUIInstructionalButtons(nil)
    end)
end

-- load sounds, animations, etc
function OnEnterCasino()
    local startTime = GetGameTimer()
    DebugStart("OnEnterCasino")
    Debug("Entered casino. Loading stuff")
    CAN_MOVE = true
    CASINO_ENTERS = CASINO_ENTERS + 1

    if not MY_PLAYERID then
        -- get my playerid
        TriggerServerEvent("Casino:GetServerId")
        Wait(100)
    end

    -- get initial drunk level
    GetDrunkPercentage()

    -- hide current weapon
    if Config.RestrictControls then
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), true)
    end

    -- hide exterior icon
    RemoveBlip(CASINO_BLIP)

    -- reset player animations if some are running
    ClearPedTasks(PlayerPedId())
    ClearPedSecondaryTask(PlayerPedId())

    -- stop weird fxs
    AnimpostfxStopAll()

    -- unfreeze player
    FreezeEntityPosition(PlayerPedId(), false)

    -- speed up the main thread
    CasinoUpdateSpeed = 0

    -- reset settings for scanning dealers
    CasinoDoubleChecked = false

    -- register strings
    for _, v in pairs(stringValues) do
        AddTextEntry(v[1], v[2])
    end

    if Config.ENTER_CASINO_FADEOUT ~= 0 and (Config.ENTER_CASINO_FADEOUT == 2 or CASINO_ENTERS == 1) then
        DoScreenFadeOut(500)
    end

    -- anim sets
    RequestAnimSetAndWait("move_m@drunk@slightlydrunk")
    RequestAnimSetAndWait("move_m@drunk@moderatedrunk")
    RequestAnimSetAndWait("move_m@drunk@verydrunk")

    -- main casino sounds
    RequestScriptAudioBank("DLC_VINEWOOD/CASINO_GENERAL", false, -1)

    -- drinking bar
    RequestScriptAudioBank("DLC_BATTLE/BTL_CHAMPAGNE_MINIGAME", false, -1)
    RequestScriptAudioBank("SAFEHOUSE_TREVOR_DRINK_WHISKEY", false, -1)

    -- slot machines audio
    RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_01", false, -1)
    RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_02", false, -1)
    RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_03", false, -1)

    -- Casino Digital Wall & Interior
    -- RequestStreamedTextureDictAndWait('Prop_Screen_Vinewood')

    -- bars
    RequestStreamedTextureDictAndWait('timerbars')

    -- lucky wheel
    RequestModelsAndWait({"vw_prop_vw_luckylight_on", "vw_prop_vw_luckylight_off", "vw_prop_vw_jackpot_on",
                          "vw_prop_vw_jackpot_off", "vw_prop_vw_luckywheel_01a", "vw_prop_vw_luckywheel_02a"})

    -- interior
    LoadCasinoAtCoordsAndWait()

    -- roulette
    RequestModelAndWait("vw_prop_roulette_ball")

    if IsScreenFadingOut() or IsScreenFadedOut() then
        DoScreenFadeIn(500)
    end

    Debug("[CASINO LOADING] Everything is loaded. Starting games...")

    -- everything is loaded, initialize casino stuff

    -- get game list of objects around first

    -- Citizen.Wait(1000)
    GAME_POOL["CObject"] = GetGamePool("CObject")

    -- initialize drinking bar
    DrinkingBar_Initialize()

    -- initialize games
    OnSlotsStart()

    -- iwnitialize wall
    StartDigitalWalls()

    -- load Lucky Wheel
    LuckyWheel_Load()

    -- load Scene Peds
    ScenePed_Start()

    -- load Roulette
    Roulette_Load()

    -- load Poker
    Poker_Load()

    -- load blackjack
    Blackjack_Load()

    -- load cashiers
    Cashier_Load()

    -- load seating
    Seating_Load()

    -- load clothing
    ClothingShop_Load()

    -- tells server the player entered casino
    TriggerServerEvent("Casino:Enter")

    -- stop scene
    NewLoadSceneStop()

    -- start ambient sounds
    PlayCasinoInteriorSound()

    SetCasinoBlip(BLIP_POS_TABLEGAMES, 680, Translation.BLIP_TABLE_GAMES, false)
    for _, v in pairs(RestrictedAreas) do
        SetCasinoBlip(v.coords, 679, Translation.BLIP_VIP, false)
    end
end

function PlayCasinoInteriorSound()
    if Config.AMBIENT_SOUNDS ~= true then
        -- StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
        return
    end
    DebugStart("PlayCasinoInteriorSound")
    StopStream()
    Wait(500)

    while not LoadStream("casino_walla", "DLC_VW_Casino_Interior_Sounds") and IN_CASINO do
        Wait(33)
    end

    if IN_CASINO then
        if not IsAudioSceneActive("dlc_vw_casino_slot_machines_playing") then
            StartAudioScene("dlc_vw_casino_slot_machines_playing")
        end
        PlayStreamFromPosition(GetPlayerPosition())
    end
end

-- get all loaded objects of type 
function Casino_GetObjectsOfTypes(models)
    local list = {}

    if not GAME_POOL["CObject"] then
        GAME_POOL["CObject"] = GetGamePool("CObject")
    end

    for _, v in pairs(GAME_POOL["CObject"]) do
        if DoesEntityExist(v) then
            local m = GetEntityModel(v)
            for _, v2 in pairs(models) do
                if not tonumber(v2) then
                    v2 = GetHashKey(v2)
                end
                if v2 == m then
                    table.insert(list, v)
                end
            end
        end
    end
    return list
end

-- destroy objects and release sounds & stuff
function OnLeaveCasino()
    DebugStart("OnLeaveCasino")
    Debug("Left casino. Unloading stuff")

    -- stop scene
    NewLoadSceneStop()

    -- stop listening to casino events
    TriggerServerEvent("Casino:Leave")

    StopStream()

    -- stop drunk effects
    SetCasinoDrunkLevel(0.0)

    -- hide casino chips hud
    for i = 21, 22 do
        BeginScaleformScriptHudMovieMethod(i, "HIDE")
        ScaleformMovieMethodAddParamBool(1)
        EndScaleformMovieMethod()
        RemoveScaleformScriptHudMovie(i)
    end
    PLAYER_CHIPS_ANIMATED = -1
    UnregisterBuiltInHud()

    -- clear mugshots
    ClearMugshotCache()
    -- main casino sounds
    ReleaseScriptAudioBank("DLC_VINEWOOD/CASINO_GENERAL")

    -- drinking bar
    ReleaseScriptAudioBank("DLC_BATTLE/BTL_CHAMPAGNE_MINIGAME")

    -- slot machines audio
    ReleaseScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_01")
    ReleaseScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_02")
    ReleaseScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_03")

    -- load slot machine animations
    RemoveAnimDict("anim_casino_a@amb@casino@games@slots@male")
    RemoveAnimDict("anim_casino_a@amb@casino@games@slots@female")

    -- Casino Digital Wall & Interior
    SetStreamedTextureDictAsNoLongerNeeded("Prop_Screen_Vinewood")

    -- Load Inside Track textures
    SetStreamedTextureDictAsNoLongerNeeded("Prop_Screen_VW_InsideTrack")

    -- Inside Track ped animations
    RemoveAnimDict("anim_casino_a@amb@casino@games@insidetrack@male")
    RemoveAnimDict("anim_casino_a@amb@casino@games@insidetrack@female")

    -- bars
    SetStreamedTextureDictAsNoLongerNeeded("timerbars")

    -- lucky wheel
    RemoveAnimDict("anim_casino_a@amb@casino@games@lucky7wheel@male")
    RemoveAnimDict("anim_casino_a@amb@casino@games@lucky7wheel@female")

    SetModelsAsNoLongerNeeded({"vw_prop_vw_luckylight_on", "vw_prop_vw_luckylight_off", "vw_prop_vw_jackpot_on",
                               "vw_prop_vw_jackpot_off", "vw_prop_vw_luckywheel_01a", "vw_prop_vw_luckywheel_02a"})

    -- interior
    -- LoadInteriorAtCoordsAndWait(948.712280, 39.588650, 71.462907) ???

    -- drinking bar
    RemoveAnimDict("anim@amb@nightclub@mini@drinking@bar@drink_v2@idle_a")

    SetModelsAsNoLongerNeeded({"a_f_y_juggalo_01", "ba_prop_battle_champ_closed_03", "ba_prop_battle_champ_open_03"})

    -- slows down the main thread
    CasinoUpdateSpeed = 500

    -- clean up games (destroy objects and stop threads)
    OnSlotsStop()

    -- clean up podium
    DestroyPodium()
    DestroyPodiumCar()

    -- destroy Lucky Wheel
    DestroyLuckyWheel()

    -- drinking bar
    DrinkingBar_Stop()

    -- destroy scenepeds
    ScenePeds_Reset()

    -- destroy roulette tables
    Roulette_Destroy()

    -- destroy poker tables
    Poker_Destroy()

    -- destroy blackjack tables
    Blackjack_Destroy()

    -- destroy cashiers
    Cashier_Destroy()

    -- destroy clothing shop
    ClothingShop_Destroy()

    -- destroy peds
    Peds_Destroy()

    -- unload digital wall
    if IsNamedRendertargetRegistered("casinoscreen_01") then
        ReleaseNamedRendertarget("casinoscreen_01")
    end

    -- load exterior icon
    CASINO_BLIP = SetCasinoBlip(BLIP_POS_EXTERIORBLIP, Config.CASINO_BLIP_ID, Translation.BLIP_CASINO, true)

    INSIDE_TRACK = false

    UnloadCasinoAssets()
    PLAYER_CACHE = {}
end

function OnLeaveInsideTrack()
    if INSIDE_TRACK then
        InsideTrackStop()
    end
    INSIDE_TRACK = false
end

function PlayExternalSound(sound, position, networked)
    BroadcastCasino('__chHyperSound:play', sound, false, position, 100, networked and -1 or PlayerPedId())
end

-- casino progress refresh
RegisterNetEvent("Casino:Progress")
AddEventHandler("Casino:Progress", function(balance, sTime, sDate, cache, gameStates)
    PLAYER_MONEY = balance.money
    PLAYER_CHIPS = balance.chips
    PLAYER_CACHE = cache
    PLAYER_IS_VIP = PLAYER_CACHE.vip
    SERVER_DATE = sDate
    GameStates = gameStates

    ServerTimeOffset = GetGameTimer()
    ServerTime = sTime
    local elapsed = (GAME_TIMER - ServerTimeOffset) / 1000
    SERVER_TIMER = ServerTime + math.round(elapsed)

    if PLAYER_CACHE.firstTime then
        CasinoAnnouncer:AnnounceAd()
    end

    RegisterBuiltInHud()
    Casino_AnimateBalance()
end)

-- casino garage callback
RegisterNetEvent("Casino:PodiumReplace")
AddEventHandler("Casino:PodiumReplace", function(state)
    CasinoGarage_ReplaceCallback(state)
end)

-- casino interior data
RegisterNetEvent("Casino:Interior")
AddEventHandler("Casino:Interior", function(podiumProps)
    local vehicleExists = (podiumProps and podiumProps ~= "")
    if vehicleExists then
        AnimatePodium(json.decode(podiumProps))
    end
    Peds_Load(vehicleExists)
end)

RegisterNetEvent("Casino:BecomeVIP")
AddEventHandler("Casino:BecomeVIP", function(playerId)
    -- scene started but it's me, ignoring
    if playerId == GetMyPlayerId() then
        PLAYER_IS_VIP = true
        Cashier_OnBecomeVIP()
    end
end)

-- chips callback
RegisterNetEvent("Casino:GetChips")
AddEventHandler("Casino:GetChips", function(chips)
    PLAYER_CHIPS = chips
    Casino_AnimateBalance()
    if chipsCallback ~= nil then
        chipsCallback(chips)
    end
    chipsCallback = nil
end)

-- money callback
RegisterNetEvent("Casino:GetMoney")
AddEventHandler("Casino:GetMoney", function(money)
    PLAYER_MONEY = money
    if moneyCallback ~= nil then
        moneyCallback(money)
    end
    moneyCallback = nil
end)

-- items callback
RegisterNetEvent("Casino:GetItems")
AddEventHandler("Casino:GetItems", function(items)
    PLAYER_ITEMS = items
    if PLAYER_ITEMS == nil then
        PLAYER_ITEMS = {}
    end
    if itemsCallback ~= nil then
        itemsCallback(items)
    end
    itemsCallback = nil
end)

-- warning message popup
RegisterNetEvent("Casino:WarningMessage")
AddEventHandler("Casino:WarningMessage", function(warningMessage)
    ShowHelpNotification(warningMessage)
end)

-- triggers the confetti effects
RegisterNetEvent("Casino:Jackpot")
AddEventHandler("Casino:Jackpot", function(game, data)
    DigitalWall_Confetti()

    -- announce why
    if game == "slots" then
        CasinoAnnouncer:AnnounceCustom(data, 2000)
    end
end)

-- new gamestates received from server (admin changed them)
RegisterNetEvent("Casino:NewGameStates")
AddEventHandler("Casino:NewGameStates", function(states)
    GameStates = states
end)

-- server allows player to open the menu & sends current states
RegisterNetEvent("Casino:AdminShowMenu")
AddEventHandler("Casino:AdminShowMenu", function(states)
    GameStates = states
    GameStates_ShowMenu()
end)

-- server stop me from playing
RegisterNetEvent("Casino:StopPlaying")
AddEventHandler("Casino:StopPlaying", function()
    StopFromPlaying()
end)

-- server blocks my playing
RegisterNetEvent("Casino:BlockPlaying")
AddEventHandler("Casino:BlockPlaying", function()
    PLAYING_BLOCKED = true
    StopFromPlaying()
end)

-- server resumes my playing
RegisterNetEvent("Casino:AllowPlaying")
AddEventHandler("Casino:AllowPlaying", function()
    PLAYING_BLOCKED = false
end)

-- server kicked me from the casino
RegisterNetEvent("Casino:BouncerKicked")
AddEventHandler("Casino:BouncerKicked", function()
    if not IN_CASINO then
        return
    end
    StopFromPlaying()
    StartCasinoBouncerScene()
end)

-- got my server id
RegisterNetEvent("Casino:GetServerId")
AddEventHandler("Casino:GetServerId", function(serverId)
    MY_PLAYERID = serverId
end)

-- podium vehicle changed
RegisterNetEvent("Casino:PodiumVehicleChanged")
AddEventHandler("Casino:PodiumVehicleChanged", function(podiumProps)
    AnimatePodium(json.decode(podiumProps))
end)

-- destroys all objects if the resource stops
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    -- destroys all objects (slots)
    OnLeaveCasino()
    -- reset Inside Track
    InsideTrackStop()
end)

RegisterCommand("casinoadmin", function(source, args, rawCommand)
    TriggerServerEvent("Casino:AdminShowMenu")
end)

RegisterCommand("casinoveh", function(source, args, rawCommand)
    CasinoGarage_OnInteraction()
end)

RegisterCommand("casinovehremove", function(source, args, rawCommand)
    TriggerServerEvent("Casino:PodiumRemove")
end)

if Config.Debug then
    RegisterCommand("office", function(source, args, rawCommand)
        SetEntityCoordsNoOffset(PlayerPedId(), 959.038757, 55.897293, 75.442551)
    end)
end

function StartCasinoLeaveScene()
    if CASINO_BEING_KICKED then
        -- already leaving / being kicked :D
        return
    end
    CASINO_BEING_KICKED = true
    CreateThread(function()
        DoScreenFadeOut(500)
        Wait(500)
        SetEntityCoordsNoOffset(PlayerPedId(), Config.LeavePosition)
        Wait(2000)
        DoScreenFadeIn(500)
        CASINO_BEING_KICKED = false
    end)
end

CASINO_BLIP = SetCasinoBlip(BLIP_POS_EXTERIORBLIP, Config.CASINO_BLIP_ID, Translation.BLIP_CASINO, true)

function StartCasinoBouncerScene()
    CASINO_BEING_KICKED = true
    CreateThread(function()
        while CASINO_BEING_KICKED do
            HideHudAndRadarThisFrame()
            Wait(0)
        end
    end)
    DoScreenFadeOut(500)
    Wait(500)
    SetEntityCoordsNoOffset(PlayerPedId(), 917.190674, 67.115181, 79.661957)
    Wait(500)

    local tOutDict = "mini@strip_club@throwout_d@"

    RequestModel(GetHashKey("s_m_m_bouncer_01"))
    RequestModel(GetHashKey("s_m_m_bouncer_02"))
    RequestAnimDict(tOutDict)

    while not HasAnimDictLoaded(tOutDict) or not HasModelLoaded(GetHashKey("s_m_m_bouncer_01")) or
        not HasModelLoaded(GetHashKey("s_m_m_bouncer_02")) do
        Wait(33)
    end

    local sceneCoords = vector3(922.668030, 42.495995, 81.106354 - 0.9)
    local bouncer1 = CreatePed(4, GetHashKey("s_m_m_bouncer_01"), sceneCoords)
    local bouncer2 = CreatePed(4, GetHashKey("s_m_m_bouncer_02"), sceneCoords)
    local myself = ClonePed(PlayerPedId(), 0.0, false)

    SetModelAsNoLongerNeeded(GetHashKey("s_m_m_bouncer_01"))
    SetModelAsNoLongerNeeded(GetHashKey("s_m_m_bouncer_02"))

    SetPedDefaultComponentVariation(bouncer1)
    SetPedComponentVariation(bouncer1, 0, 0, 2, 0)
    SetPedComponentVariation(bouncer1, 2, 1, 0, 0)
    SetPedComponentVariation(bouncer1, 3, 1, 1, 0)
    SetPedComponentVariation(bouncer1, 4, 0, 0, 0)
    SetPedComponentVariation(bouncer1, 11, 0, 0, 0)
    SetPedComponentVariation(bouncer1, 8, 1, 0, 0)

    local cam = CreateCam("DEFAULT_ANIMATED_CAMERA", true)
    SetCamCoord(cam, 922.668030, 42.495995, 81.106354)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1, true, true)
    PlayCamAnim(cam, "throwout_d_cam", tOutDict, 910.080, 45.454, 79.894, 0.0, 0.0, 200.0, 0, 0)

    local initialPos, initialRot = GetInitialAnimOffsets(tOutDict, "throwout_d_victim", sceneCoords, 0, 0, 0)
    local scene = CreateSynchronizedScene(initialPos, initialRot, 2)

    TaskSynchronizedScene(myself, scene, tOutDict, "throwout_d_victim", 2.0, -1.5, 13, 16, 2.0, 0)
    TaskSynchronizedScene(bouncer1, scene, tOutDict, "throwout_d_bouncer_a", 2.0, -1.5, 13, 16, 2.0, 0)
    TaskSynchronizedScene(bouncer2, scene, tOutDict, "throwout_d_bouncer_b", 2.0, -1.5, 13, 16, 2.0, 0)

    Wait(500)
    DoScreenFadeIn(1000)
    PlayPedAmbientSpeechWithVoiceNative(bouncer1, "BOUNCER_EJECT_GENERIC", "", "SPEECH_PARAMS_FORCE_NORMAL", 0)

    Wait(5000)
    PlayPedAmbientSpeechWithVoiceNative(bouncer1, "BOUNCER_EJECT_GENERIC", "", "SPEECH_PARAMS_FORCE_NORMAL", 0)

    Wait(2000)
    DoScreenFadeOut(1000)
    Wait(2000)

    ClearPedTasks(PlayerPedId())
    SetEntityCoordsNoOffset(PlayerPedId(), GetEntityCoords(myself))

    DeleteEntity(bouncer1)
    DeleteEntity(bouncer2)
    DeleteEntity(myself)

    RenderScriptCams(false, true, 1, true, true)
    SetCamActive(cam, false)
    DestroyCam(cam)
    CASINO_BEING_KICKED = false

    if Config.LeaveThroughTeleport then
        StartCasinoLeaveScene()
    else
        DoScreenFadeIn(1000)
    end
end

