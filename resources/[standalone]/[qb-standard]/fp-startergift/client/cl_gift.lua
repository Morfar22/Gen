RegisterNetEvent('cpl_tearp:starteritem', function()
    local item_array = { 'joint', 'joint', 'joint', 'joint', 'advancedlockpick', 'advancedlockpick', 'advancedlockpick', 'advancedlockpick', 'advancedlockpick', 'advancedlockpick', 'lockpick', 'lockpick', 'lockpick', 'lockpick', 'armor', 'bandage', 'bandage', 'bandage', 'bandage', 'bandage', 'painkillers', 'painkillers', 'painkillers', 'painkillers', 'painkillers', 'painkillers' }
    local ped = GetPlayerPed(PlayerId())
    local pedcoords = GetEntityCoords(ped)
    if not HasNamedPtfxAssetLoaded("scr_rcbarry1") then
        RequestNamedPtfxAsset("scr_rcbarry1")
        while not HasNamedPtfxAssetLoaded("scr_rcbarry1") do
            Wait(1)
        end
    end
    UseParticleFxAssetNextCall("scr_rcbarry1")
    local part = StartParticleFxLoopedAtCoord('scr_alien_teleport', pedcoords.x, pedcoords.y, pedcoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    for i,v in ipairs(item_array) do
        itemchance = math.random(0,1)
        if itemchance == 1 then
            TriggerEvent('cpl_tearp:starteritem:item', v)
        end
    end
end)

RegisterNetEvent("cpl_tearp:starteritem:item", function(v)
    local idfktbh = 'ghjgjbvhfhfh'
    TriggerServerEvent('cpl_tearp:starteritem:giveitem', v, idfktbh)
end)