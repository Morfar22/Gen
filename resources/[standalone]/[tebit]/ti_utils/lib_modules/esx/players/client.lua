local ESX = select(2,...)

local uniqueId,job,group
local idTrackers,jobTrackers,groupTrackers = {},{},{}

local module = {}

module.isReady = function()
  return ESX.IsPlayerLoaded()
end

module.awaitReadySync = function()
  while not ESX.IsPlayerLoaded() do
    Wait(500)
  end
end

module.awaitReadyAsync = function(cb)
  Citizen.CreateThread(function()
    while not ESX.IsPlayerLoaded() do
      Wait(500)
    end

    cb()
  end)
end

module.getName = function()
  local xPlayer = ESX.GetPlayerData()
  return xPlayer.firstName or xPlayer.firstname or "Unknown",xPlayer.lastName or xPlayer.lastname or "Unknown"
end

module.getUniqueId = function()
  return ESX.GetPlayerData().identifier
end

module.getJob = function()
  local job = ESX.GetPlayerData().job

  if not job then
    return
  end

  return job.name,job.grade,job.label,job.grade_name
end

module.getGroup = function()
  local gang = ESX.GetPlayerData().job

  if not gang then
    return
  end

  return gang.name,gang.grade
end

module.trackUniqueId = function(cb)
  table.insert(idTrackers,cb)

  local id = module.getUniqueId()

  cb(id)
end

module.trackJob = function(cb)
  table.insert(jobTrackers,cb)

  local name,rank = module.getJob()

  cb(name,rank)
end

module.trackGroup = function(cb)
  table.insert(groupTrackers,cb)

  local name,rank = module.getGroup()

  cb(name,rank)
end

module.hasPermissions = function(characterPermissions,jobPermissions,groupPermissions)
  if  not characterPermissions
  and not jobPermissions
  and not groupPermissions
  then
    return true
  end

  if jobPermissions then
    if jobPermissions[playerJob.name] and jobPermissions[playerJob.name] <= playerJob.rank then
      return true
    end
  end

  if groupPermissions then
    if groupPermissions[playerGroup.name] and groupPermissions[playerGroup.name] <= playerGroup.rank then
      return true
    end
  end

  if characterPermissions then
    for _,uid in ipairs(characterPermissions) do
      if uid == uniqueId then
        return true
      end
    end
  end
  
  return false
end

module.trackUniqueId(function(uid)
  uniqueId = uid
end)

module.trackJob(function(name,rank)
  playerJob = {
    name = name,
    rank = rank
  }
end)

module.trackGroup(function(name,rank)
  playerGroup = {
    name = name,
    rank = rank
  }
end)

module.getAccounts = function()
  local playerData =  ESX.GetPlayerData()

  local bank = 0
  local cash = 0

  for _,acc in ipairs(playerData.accounts) do
    if acc.name == "money" then
      cash = acc.money or 0
    elseif acc.name == "bank" then
      bank = acc.money or 0
    end
  end

  return {
    cash = cash,
    bank = bank
  }
end

module.getInventory = function()
  return ESX.GetPlayerData().inventory
end

RegisterNetEvent("esx:setJob",function(job)
  for _,cb in ipairs(jobTrackers) do
    cb(job.name,job.grade)
  end
end)

-- RegisterNetEvent("esx:setGroup",function(group)
--   for _,cb in ipairs(groupTrackers) do
--     cb(group.name,group.grade)
--   end
-- end)

RegisterNetEvent("esx:playerLoaded",function()
  Wait(0)

  local data = ESX.GetPlayerData()

  for _,cb in ipairs(idTrackers) do
    cb(data.citizenid)
  end  
  
  for _,cb in ipairs(jobTrackers) do
    cb(data.job.name,data.job.grade)
  end

  for _,cb in ipairs(groupTrackers) do
    cb(data.job.name,data.job.grade)
  end
end)

return module