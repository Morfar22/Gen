local DRXCore = Config.CoreObject

local DB = Config.Database.Tables
local CM = Config.Database.Columns

-- Notifications (Change the event to whatever you may be using)
Notify = function(source, message, type)
    TriggerClientEvent('QBCore:Notify', source, message, type)
end

-- Duty (Toggle duty on/off, change it to your needs)
Duty = function(src, ply)
	if ply.PlayerData.job.onduty then
		ply.Functions.SetJobDuty(false)
        Notify(src, Notifications.OffDuty[1], Notifications.OffDuty[2])
	else
		ply.Functions.SetJobDuty(true)
        Notify(src, Notifications.OnDuty[1], Notifications.OnDuty[2])
	end
    TriggerClientEvent('QBCore:Client:SetDuty', src, ply.PlayerData.job.onduty)
end

-- Incident (Information about criminals added to the )
IncidentFunction = function(citizenid, fine, jail)
    if citizenid then
        print(citizenid, fine, jail)
    end
end

-- Event triggered when searching for profiles (Change it to your needs)
RegisterServerEvent('drx_mdw:searchProfiles', function(data)
    local src = source
    local search = {}
    MySQL.query('SELECT * FROM '..DB.Players..' WHERE '..CM.Charinfo..' LIKE ?', {string.lower('%'..data.ProfilesSearch..'%')}, function(result)
        for i=1, #result do
            if result[i].charinfo then
                local ply = json.decode(result[i].charinfo)
                ply.id = result[i].id
                ply.citizenid = result[i].citizenid
                ply.image = result[i].image
                ply.tags = json.decode(result[i].tags)
                ply.id = result[i].id
                table.insert(search, ply)
            end
        end
        TriggerClientEvent('drx_mdw:returnProfiles', src, search)
    end)
end)

-- When searching for incidents
RegisterServerEvent('drx_mdw:searchIncidents', function(data)
    local src = source
    MySQL.query('SELECT * FROM drx_mdw_incidents WHERE LOWER(`title`) LIKE @IncidentsSearch', {
		['@IncidentsSearch'] = string.lower('%'..data.IncidentsSearch..'%')
	}, function(result)
        TriggerClientEvent('drx_mdw:returnIncidents', src, result)
    end)
end)

-- When searching for reports
RegisterServerEvent('drx_mdw:searchReports', function(data)
    local src = source
    MySQL.query('SELECT * FROM drx_mdw_reports WHERE LOWER(`title`) LIKE @ReportsSearch', {
		['@ReportsSearch'] = string.lower('%'..data.ReportsSearch..'%')
	}, function(result)
        TriggerClientEvent('drx_mdw:returnReports', src, result)
    end)
end)

-- When searching for evidence
RegisterServerEvent('drx_mdw:evidenceSearch', function(data)
    local src = source
    MySQL.query('SELECT * FROM drx_mdw_evidence WHERE LOWER(`identifier`) LIKE @EvidenceSearch', {
		['@EvidenceSearch'] = string.lower('%'..data.EvidenceSearch..'%')
	}, function(result)
        TriggerClientEvent('drx_mdw:returnAllEvidence', src, result)
    end)
end)

-- When searching for a vehicle
RegisterServerEvent('drx_mdw:searchVehicles', function(data)
    local src = source
    MySQL.query('SELECT * FROM '..DB.Vehicles..' WHERE `plate` LIKE ?', {string.lower('%'..data.VehSearch..'%')}, function(result)
        TriggerClientEvent('drx_mdw:returnVehicles', src, result)
    end)
end)

-- When fetching a vehicle that's clicked on
RegisterServerEvent('drx_mdw:fetchVehicle', function(data)
    local src = source
    MySQL.query('SELECT * FROM '..DB.Vehicles..' WHERE plate = @plate', {['@plate'] = data.plate}, function(result)
        if result[1] then
            local r = result[1]
            MySQL.query('SELECT * FROM '..DB.Players..' WHERE '..CM.Identifier..'=@citizenid', {['@citizenid']=r.citizenid}, function(ply)
                if ply[1] then
                    local ci = json.decode(ply[1].charinfo)
                    r.fullname = '('..r.citizenid..') '..ci.firstname..' '..ci.lastname
                else
                    r.fullname = 'Unknown'
                end
                r.depotprice = '$'..result[1].depotprice
                r.veh_name = DRXCore.Shared.Vehicles[r.vehicle]['name']
                if not r.tags then
                    r.tags = {}
                else
                    r.tags = json.decode(r.tags)
                end
                if not r.evidence then
                    r.evidence = {}
                else
                    r.evidence = json.decode(r.evidence)
                end
                for i=1, #Config.Vehicles.States do
                    if Config.Vehicles.States[i].id == r.state then
                        r.state = Config.Vehicles.States[i].label
                    end
                end
                TriggerClientEvent('drx_mdw:returnVehicle', src, r)
            end)
        end
    end)
end)

-- When saving a vehicles data
RegisterServerEvent('drx_mdw:saveVehicle', function(data)
    MySQL.query('UPDATE '..DB.Vehicles..' SET note=@note,tags=@tags,evidence=@evidence WHERE id=@id', {
		['@id'] = data.id,
        ['@note'] = data.note,
        ['@tags'] = json.encode(data.tags),
        ['@evidence'] = json.encode(data.evidence),
	})
end)

-- When searching for legislations
RegisterServerEvent('drx_mdw:searchLegislations', function(data)
    local src = source
    MySQL.query('SELECT * FROM drx_mdw_legislation WHERE LOWER(`title`) LIKE @LegiSearch', {
		['@LegiSearch'] = string.lower('%'..data.LegiSearch..'%')
	}, function(result)
        TriggerClientEvent('drx_mdw:returnLegislations', src, result)
    end)
end)

-- When searching for a officer under the page "Staff"
RegisterServerEvent('drx_mdw:staffSearch', function(data)
    local src = source
    MySQL.query('SELECT * FROM drx_mdw_officers WHERE LOWER(firstname) LIKE @StaffSearch OR LOWER(lastname) LIKE @StaffSearch OR LOWER(alias) LIKE @StaffSearch', {
		['@StaffSearch'] = string.lower('%'..data.StaffSearch..'%')
	}, function(result)
        if result then
            TriggerClientEvent('drx_mdw:returnStaffs', src, result)
        end
    end)
end)