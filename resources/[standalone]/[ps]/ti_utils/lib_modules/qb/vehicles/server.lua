local QBCore = select(2,...)

local module = {}

module.getSharedList = function()
    return QBCore.Shared.Vehicles
end

return module