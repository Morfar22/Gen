local invName

local resStates = {
	missing = false,
	started = true,
	starting = true,
	stopped = true,
	stopping = true,
	uninitialized = true,
	unknown = false
}

if resStates[GetResourceState("mf-inventory")] then
	invName = "mf-inventory"
elseif resStates[GetResourceState("ox_inventory")] then
	invName = "ox_inventory"
else
	invName = "default"
end

return exports['es_extended']:getSharedObject(),invName