if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('es_extended') == 'starting' or GetResourceState('es_extended') == 'started' then
        Config.Framework = 1
    end
end

if Config.Framework == 1 then
    if Config.FrameworkTriggers['load'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['load'])) == 'esx' then
        Config.FrameworkTriggers['load'] = 'esx:playerLoaded'
    end

    if Config.FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['notify'])) == 'esx' then
        Config.FrameworkTriggers['notify'] = 'esx:showNotification'
    end

    if Config.FrameworkTriggers['object'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['object'])) == 'esx' then
        Config.FrameworkTriggers['object'] = 'esx:getSharedObject'
    end

    if Config.FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['resourceName'])) == 'esx' then
        Config.FrameworkTriggers['resourceName'] = 'es_extended'
    end

    if Config.FrameworkSQLTables['table'] == '' or string.strtrim(string.lower(Config.FrameworkSQLTables['table'])) == 'esx' then
        Config.FrameworkSQLTables['table'] = 'users'
    end

    if Config.FrameworkSQLTables['identifier'] or string.strtrim(string.lower(Config.FrameworkSQLTables['identifier'])) == 'esx' then
        Config.FrameworkSQLTables['identifier'] = 'identifier'
    end
end

CreateThread(function()
    if Config.Framework == 1 then
        local ESX = Citizen.Await(GetSharedObjectSafe())

        ShowNotification = function(source, text)
            TriggerClientEvent(Config.FrameworkTriggers['notify'], source, text)
        end

        GetPlayerId = function(source)
            return ESX.GetPlayerFromId(source).getIdentifier()
        end

        GetPlayerMoney = function(source)
            return ESX.GetPlayerFromId(source).getMoney()
        end

        GetPlayerItem = function(source, item)
            return ESX.GetPlayerFromId(source).getInventoryItem(item)
        end

        GetPoliceCount = function()
            local policeCount = 0

            for _, serverId in pairs(ESX.GetPlayers()) do
                Wait(0)
                
                local xPlayer = ESX.GetPlayerFromId(serverId)

                if xPlayer and xPlayer.job.name == 'police' then
                    policeCount += 1
                end
            end

            return policeCount
        end

        AddPlayerMoney = function(source, amount)
            if Config.OtherOptions['blackMoney'] then
                return ESX.GetPlayerFromId(source).addAccountMoney('black_money', amount)
            else
                return ESX.GetPlayerFromId(source).addMoney(amount)
            end
        end

        RemovePlayerMoney = function(source, amount)
            return ESX.GetPlayerFromId(source).removeMoney(amount)
        end

        RemovePlayerItem = function(source, item, amount)
            return ESX.GetPlayerFromId(source).removeInventoryItem(item, amount)
        end

        IsPlayerAllowed = function(source)
            return Config.AllowedGroups[ESX.GetPlayerFromId(source).getGroup()]
        end

        IsStorageEmpty = function(name)
            -- Place your inventory code here if we don't already support it
        end

        Dispatch = function(source)
            -- Place your dispatch code here if we don't already support it
        end
    end
end)