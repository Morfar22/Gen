local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("bluepeyoteplant", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("tk-peyote:client:bluepeyote", src, item.name)
end)

QBCore.Functions.CreateUseableItem("pinkpeyoteplant", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("tk-peyote:client:pinkpeyote", src, item.name)
end)

QBCore.Functions.CreateUseableItem("whitepeyoteplant", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("tk-peyote:client:whitepeyote", src, item.name)
end)

QBCore.Functions.CreateUseableItem("yellowpeyoteplant", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("tk-peyote:client:yellowpeyote", src, item.name)
end)