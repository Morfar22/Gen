local QBCore = select(2,...)

local module = {}

module.getUniqueId = function(source)
  return QBCore.Functions.GetPlayer(source).PlayerData.citizenid
end

module.getLicense = function(source)
  return QBCore.Functions.GetPlayer(source).PlayerData.license
end

module.getInventory = function(source)
  local res = {}
  local items = QBCore.Functions.GetPlayer(source).PlayerData.items

  for slot,item in pairs(items) do
    if type(item) == "table" then
      table.insert(res,{
        name = item.name,
        label = item.label,
        count = item.count or item.amount,
        slot = slot,
        metadata = item.info or item.metadata or item.data
      })
    end
  end

  return res
end

module.getJob = function(source)
  local player = QBCore.Functions.GetPlayer(source)

  if not player then
    return
  end

  local job = player.PlayerData.job

  if not job or not job.grade then
    return
  end

  return job.name,job.grade.level
end

module.getDutyCount = function(jobName)
  return QBCore.Functions.GetDutyCount(jobName)
end

module.addInventoryItem = function(source,name,count,metadata)
  return QBCore.Functions.GetPlayer(source).Functions.AddItem(name,count,false,metadata)
end

module.removeInventoryItem = function(source,name,count,slot)
  return QBCore.Functions.GetPlayer(source).Functions.RemoveItem(name,count,slot)
end

module.getInventoryItemBySlot = function(source,slot)
  local item = QBCore.Functions.GetPlayer(source).Functions.GetItemBySlot(slot)

  local res = false

  if type(item) == "table" then
    res = {
      name = item.name,
      label = item.label,
      count = item.count or item.amount,
      slot = slot,
      metadata = item.info or item.metadata or item.data
    }
  end

  return res
end

module.getInventoryItemsByName = function(source,name)
  local items = QBCore.Functions.GetPlayer(source).Functions.GetItemsByName(name)

  local res = {}

  for _,item in pairs(items) do
    if type(item) == "table" then 
      table.insert(res,{
        name = item.name,
        label = item.label,
        count = item.count or item.amount,
        slot = slot,
        metadata = item.info or item.metadata or item.data
      })
    end
  end

  return res
end

module.getInventoryItemByName = function(source,name)
  local item = QBCore.Functions.GetPlayer(source).Functions.GetItemByName(name)

  local res = false

  if type(item) == "table" then
    res = {
      name = item.name,
      label = item.label,
      count = item.count or item.amount,
      slot = slot,
      metadata = item.info or item.metadata or item.data
    }
  end

  return res
end

module.notifyPlayer = function(source,msg,typeof)
  TriggerClientEvent('QBCore:Notify',source,msg,typeof or "primary")
end

module.getAccounts = function(source)
  local player = QBCore.Functions.GetPlayer(source)

  return {
    cash = player.PlayerData.money["cash"],
    bank = player.PlayerData.money["bank"]
  }
end

module.addAccountMoney = function(source,account,amount)
  return QBCore.Functions.GetPlayer(source).Functions.AddMoney(account,amount)
end

module.removeAccountMoney = function(source,account,amount)
  return QBCore.Functions.GetPlayer(source).Functions.RemoveMoney(account,amount)
end

module.hasPermissions = function(source,characterPermissions,jobPermissions,groupPermissions)
  if  not characterPermissions
  and not jobPermissions
  and not groupPermissions
  then
    return true
  end

  local ply = QBCore.Functions.GetPlayer(source)

  local uniqueId = ply.PlayerData.citizenid

  if characterPermissions then
    for _,uid in ipairs(characterPermissions) do
      if uid == uniqueId then
        return true
      end
    end
  end

  local jobName = ply.PlayerData.job.name
  local jobRank = ply.PlayerData.job.grade.level

  if jobPermissions then
    if jobPermissions[jobName] and jobPermissions[jobName] <= jobRank then
      return true
    end
  end

  local groupName = ply.PlayerData.gang.name
  local groupRank = ply.PlayerData.gang.grade.level

  if groupPermissions then
    if groupPermissions[groupName] and groupPermissions[groupName] <= groupRank then
      return true
    end
  end
  
  return false
end

return module