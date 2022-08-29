local blips = {}
local blipIds = {}

local function renderBlip(id,position,label,sprite,color,scale,display,alpha,highDetail,shortRange)
  local blip = AddBlipForCoord(position)

  SetBlipSprite(blip,sprite)
  SetBlipColour(blip,color)
  SetBlipAlpha(blip,alpha)
  SetBlipScale(blip,scale)
  SetBlipDisplay(blip,display)
  SetBlipHighDetail(blip,highDetail)
  SetBlipAsShortRange(blip,shortRange)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(label)
  EndTextCommandSetBlipName(blip) 

  blipIds[id] = blip
end

local function removeBlip(id)
  RemoveBlip(blipIds[id])
  
  blipIds[id] = nil
end

local function isBlipRendered(id)
  return blipIds[id] ~= nil
end

local function hasPermissions(t)
  return ti.players.hasPermissions(t.characterRestriction,t.jobRestriction,t.groupRestriction)
end

local function ensureBlip(id)
  local blip = blips[id]

  if hasPermissions(blip) then
    if not isBlipRendered(id) then
      local blipOpts = blip.blipOpts
      renderBlip(id,blipOpts.position,blipOpts.label,blipOpts.sprite,blipOpts.color,blipOpts.scale,blipOpts.display,blipOpts.alpha,blipOpts.highDetail,blipOpts.shortRange)
    end
  else
    if isBlipRendered(id) then
      removeBlip(id)
    end
  end
end

local function ensureBlips()  
  for id in ipairs(blips) do
    ensureBlip(id)
  end
end

ti.players.trackUniqueId(ensureBlips)
ti.players.trackJob(ensureBlips)
ti.players.trackGroup(ensureBlips)

local module = {}

module.registerCoords = function(id,characterRestrictions,jobRestrictions,groupRestrictions,blipOpts)
  blips[id] = {
    id = id,
    characterRestrictions = characterRestrictions,
    jobRestrictions = jobRestrictions,
    groupRestrictions = groupRestrictions,
    blipOpts = blipOpts or {}
  }

  ensureBlip(id)
end

module.refresh = function(id,characterRestriction,jobRestrictions,groupRestrictions)
  local blip = blips[id]

  if not blip then
    return
  end

  blip.characterRestrictions = characterRestrictions or blip.characterRestrictions
  blip.jobRestrictions = jobRestrictions or blip.jobRestrictions
  blip.groupRestrictions = groupRestrictions or blip.groupRestrictions

  ensureBlip(id)
end

module.remove = function(id)
  removeBlip(id)
  blips[id] = nil
end

return module