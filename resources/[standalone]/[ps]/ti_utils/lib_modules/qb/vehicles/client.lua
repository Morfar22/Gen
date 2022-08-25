local QBCore = select(2,...)

local module = {}

module.isEmpty = function(veh,startIndex)
  for i=(startIndex or-1),GetVehicleModelNumberOfSeats(GetEntityModel(veh))-2,1 do
    if not IsVehicleSeatFree(veh,i) then
      return false,i
    end
  end

  return true
end

module.getNativeData = function(veh)  
  local model = GetEntityModel(veh)
  local class = GetVehicleClass(veh)
  local upgrades = ti.vehicles.getProperties(veh)
  
  upgrades.dirtLevel = 0.0

  local vehSpeed      = GetVehicleEstimatedMaxSpeed(veh)
  local vehAccel      = GetVehicleAcceleration(veh)*10
  local vehBraking    = GetVehicleMaxBraking(veh)*10
  local vehTraction   = GetVehicleMaxTraction(veh)*10

  local maxSpeed      = GetVehicleClassEstimatedMaxSpeed(class)
  local maxAccel      = GetVehicleClassMaxAcceleration(class)*10
  local maxBraking    = GetVehicleClassMaxBraking(class)*10
  local maxTraction   = GetVehicleClassMaxTraction(class)*10

  local accelPct = math.floor((vehAccel / maxAccel) * 100)
  local brakingPct = math.floor((vehBraking / maxBraking) * 100)
  local tractionPct = math.floor((vehTraction / maxTraction) * 100)

  local stats = {
      {
          name = "maxSpeed",
          label = "Maximum Speed",
          valueLabel = math.floor(vehSpeed * 3.6) .. " kph",
          min = 0,
          max = maxSpeed,
          value = vehSpeed
      },
      {
          name = "acceleration",
          label = "Acceleration",
          valueLabel = accelPct .. "%",
          min = 0,
          max = maxAccel,
          value = vehAccel
      },
      {
          name = "braking",
          label = "Braking",
          valueLabel = brakingPct .. "%",
          min = 0,
          max = maxBraking,
          value = vehBraking
      },
      {
          name = "traction",
          label = "Traction",
          valueLabel = tractionPct .. "%",
          min = 0,
          max = maxTraction,
          value = vehTraction
      },
  }

  return stats,upgrades
end

module.setProperties = function(veh,props)
  if type(props.customPrimaryColor == "table") then
    props.color1 = props.customPrimaryColor
  end

  if type(props.customSecondaryColor == "table") then
    props.color2 = props.customSecondaryColor
  end

  QBCore.Functions.SetVehicleProperties(veh,props)

  if props.fuelType then
    Entity(veh).state:set('fuelType',props.fuelType)
  end
end

module.getProperties = function(veh)
  local props = QBCore.Functions.GetVehicleProperties(veh)

  props.fuelType = Entity(veh).state.fuelType

  return props
end

module.getPlate = function(veh)
  return GetVehicleNumberPlateText(veh):gsub("%s+","")
end

module.getStats = function(veh)
  local stats = {}

  return stats
end

module.spawnAsync = function(model,cb,pos,head,networked)
  ti.streaming.model.loadAsync(model,function(loaded,hash)
    if not loaded then
      return cb()
    end

    QBCore.Functions.SpawnVehicle(hash,cb,vec4(pos.x,pos.y,pos.z,head),networked)
  end)
end

module.spawnSync = function(model,pos,head,networked)
  local loaded,hash = ti.streaming.model.loadSync(model)

  if not loaded then
    return
  end

  local ret,res

  QBCore.Functions.SpawnVehicle(hash,function(veh)
    res = veh
    ret = true
  end,vec4(pos.x,pos.y,pos.z,head),networked)

  while not ret do
    Wait(0)
  end

  return res
end

module.getSharedList = function()
  return QBCore.Shared.Vehicles
end

module.awaitSharedList = function()
  return QBCore.Shared.Vehicles
end

return module