RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent("lambra-antiCL:server:registerCitizen")
end)

function loadClothes(clothes, ped)
    TriggerEvent('qb-clothing:client:loadPlayerClothing', clothes, ped)
end

function hasPerms()
    --You can code here if you want to restrict it for admins or something
    return true
end