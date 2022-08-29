local QBCore = select(2,...)

local uniqueId,job,group
local idTrackers,jobTrackers,groupTrackers = {},{},{}

local module = {}

module.isReady = function()
  local data = QBCore.Functions.GetPlayerData()
  return (type(data) == 'table' and type(data.citizenid) == 'string')
end

module.awaitReadySync = function()
  local data = QBCore.Functions.GetPlayerData()

  while not data or not data.citizenid do
    Wait(500)
    data = QBCore.Functions.GetPlayerData()
  end
end

module.awaitReadyAsync = function(cb)
  Citizen.CreateThread(function()
    local data = QBCore.Functions.GetPlayerData()

    while not data or not data.citizenid do
      Wait(500)
      data = QBCore.Functions.GetPlayerData()
    end

    cb()
  end)
end

module.getName = function()
  local char = QBCore.Functions.GetPlayerData().charinfo
  return char.firstname or "Unknown",char.lastname  or "Unknown"
end

module.getUniqueId = function()
  return QBCore.Functions.GetPlayerData().citizenid
end

module.getJob = function()
  local job = QBCore.Functions.GetPlayerData().job

  if not job then
    return
  end

  return job.name,job.grade.level,job.label,job.grade.name
end

module.getGroup = function()
  local gang = QBCore.Functions.GetPlayerData().gang

  if not gang then
    return
  end

  return gang.name,gang.grade.level,gang.label,gang.grade.name
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
  local playerData =  QBCore.Functions.GetPlayerData()

  return {
    cash = playerData.money["cash"],
    bank = playerData.money["bank"]
  }
end

module.getInventory = function()
  return QBCore.Functions.GetPlayerData().items
end

RegisterNetEvent("QBCore:Client:OnJobUpdate",function(job)
  for _,cb in ipairs(jobTrackers) do
    cb(job.name,job.grade.level)
  end
end)

RegisterNetEvent("QBCore:Client:OnGangUpdate",function(gang)
  for _,cb in ipairs(groupTrackers) do
    cb(gang.name,gang.grade.level)
  end
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded",function()
  local data = QBCore.Functions.GetPlayerData()

  for _,cb in ipairs(idTrackers) do
    cb(data.citizenid)
  end  
  
  for _,cb in ipairs(jobTrackers) do
    cb(data.job.name,data.job.grade.level)
  end

  for _,cb in ipairs(groupTrackers) do
    cb(data.gang.name,data.gang.grade.level)
  end
end)

RegisterNetEvent("QBCore:Player:UpdatePlayerData",function(data)
  for _,cb in ipairs(idTrackers) do
    cb(data.citizenid)
  end  
  
  for _,cb in ipairs(jobTrackers) do
    cb(data.job.name,data.job.grade.level)
  end

  for _,cb in ipairs(groupTrackers) do
    cb(data.gang.name,data.gang.grade.level)
  end
end)

return module