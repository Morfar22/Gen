local resName,ESX,invName = ...

local module = {}
local Inventory = exports[invName]

module.getUniqueId = function(source)
  return ESX.GetPlayerFromId(source).identifier
end

module.getLicense = function(source)
  return ESX.GetPlayerFromId(source).identifier
end

module.getInventory = function(source)
  local items = {}

  if invName == "mf-inventory" then
    local uid = module.getUniqueId(source)
    items = Inventory:getInventoryItems(uid)
  else
    items = ESX.GetPlayerFromId(source).getInventory(false)
  end

  local ret = {}

  for slot,item in pairs(items) do
    if type(item) == "table" then
      table.insert(ret,{
        name = item.name,
        label = item.label,
        count = item.count,
        slot = item.slot or slot,
        metadata = item.datadata or {}
      })
    end
  end

  return ret
end

module.getJob = function(source)
  local player = ESX.GetPlayerFromId(source)

  if not player then
    return
  end

  local job = player.job

  if not job or not job.grade then
    return
  end

  return job.name,job.grade
end

module.getDutyCount = function(jobName)
  return #ESX.GetExtendedPlayers("job",jobName)
end

module.addInventoryItem = function(source,name,count,metadata)
  if invName == "mf-inventory" then
    return Inventory:addInventoryItem(module.getUniqueId(source),name,count,source,100.0,metadata)
  else
    return ESX.GetPlayerFromId(source).addInventoryItem(name,count,metadata)
  end
end

module.removeInventoryItem = function(source,name,count,slot)
  if invName == "mf-inventory" then
    local uid = module.getUniqueId(source)

    if slot then
      return Inventory:removeItemAtSlot(uid,slot,name,source)
    else
      return Inventory:removeInventoryItem(uid,name,count,source)
    end
  else
    return ESX.GetPlayerFromId(source).removeInventoryItem(name,count,false,slot)
  end
end

module.getInventoryItemBySlot = function(source,slot)  
  if invName == "mf-inventory" then
    local uid = module.getUniqueId(source)
    local items = Inventory:getInventoryItems(uid)
    return items[slot]
  elseif invName == "ox_inventory" then
    return Inventory:GetSlot(source,slot)
  end
end

module.getInventoryItemsByName = function(source,name)
  if invName == "mf-inventory" then
    local uid = module.getUniqueId(source)  
    local items = Inventory:getInventoryItems(uid)

    local res = {}

    for slot,item in pairs(items) do
      if type(item) == "table" and item.name and item.name == name then
        item.slot = slot
        table.insert(res,item)
      end
    end

    return res
  elseif invName == "ox_inventory" then
    local inv = module.getInventory(source)
    local res = {}

    for _,item in pairs(inv) do
      if type(item) == "table" and item.name == name then
        table.insert(res,item)
      end
    end

    return res
  else
    return ESX.GetPlayerFromId(source).getInventoryItem(name)
  end
end

module.getInventoryItemByName = function(source,name)
  if invName == "mf-inventory" then
    local uid = module.getUniqueId(source)  
    return Inventory:getInventoryItem(uid,name)
  elseif invName == "ox_inventory" then
    return Inventory:GetItem(source,name,nil,false)[1]
  else
    return ESX.GetPlayerFromId(source).getInventoryItem(name)
  end
end

module.notifyPlayer = function(source,msg,typeof)
  TriggerClientEvent('esx:showNotification',source,msg)
end

module.getAccounts = function(source)
  local player = ESX.GetPlayerFromId(source)

  return {
    cash = player.getAccount('money').money,
    bank = player.getAccount('bank').money
  }
end

module.addAccountMoney = function(source,account,amount)
  if account == "cash" then
    account = "money"
  end

  return ESX.GetPlayerFromId(source).addAccountMoney(account,amount)
end

module.removeAccountMoney = function(source,account,amount)
  if account == "cash" then
    account = "money"
  end
  
  return ESX.GetPlayerFromId(source).removeAccountMoney(account,amount)
end

module.hasPermissions = function(source,characterPermissions,jobPermissions,groupPermissions)
  if  not characterPermissions
  and not jobPermissions
  and not groupPermissions
  then
    return true
  end

  local ply = ESX.GetPlayerFromId(source)

  local uniqueId = ply.identifier

  if characterPermissions then
    for _,uid in ipairs(characterPermissions) do
      if uid == uniqueId then
        return true
      end
    end
  end

  local jobName = ply.job.name
  local jobRank = ply.job.grade

  if jobPermissions then
    if jobPermissions[jobName] and jobPermissions[jobName] <= jobRank then
      return true
    end
  end

  if groupPermissions then
    if groupPermissions[jobName] and groupPermissions[jobName] <= jobRank then
      return true
    end
  end
  
  return false
end

return module