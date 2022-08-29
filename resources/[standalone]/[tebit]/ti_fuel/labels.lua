ti.locales.set({
    en = {
        no_vehicles_nearby = "No vehicle nearby",
        empty_driverseat_required = "Vehicle must not have a driver",
        ev_requires_battery = "Electric vehicles must be charged with a booster battery",
        battery_on_petrol = "This can only be used on an electric vehicle",
        charge_on_petrol = "You can't charge a gasoline vehicle",
        invalid_mix = "You can't mix %s with %s",
        recharging = "Recharging",
        refueling = "Refueling",
        action_complete = "%s complete",
        battery_purchased = "You purchased a booster battery",
        jerrycan_purchased = "You purchased a jerry can",
        grab_fuel_lever = "~INPUT_PICKUP~ Grab Nozzle\n~INPUT_DETONATE~ Fuel Selection",
        attach_fuel_lever = "~INPUT_PICKUP~ Attach to Vehicle\n~INPUT_DETONATE~ Replace on Bowser",
        detach_fuel_lever = "~INPUT_DETONATE~ Remove from Vehicle",
        replace_fuel_lever = "~INPUT_DETONATE~ Replace on Bowser",
        leave_to_refill = "Leave the vehicle to refuel",
        ev_not_supported = "This station does not support electric vehicles",
        stock_depleted = "Stock depleted",
        no_pump_nearby = "No pump found",
        invalid_stock = "Not enough stock to facilitate this transaction",
        invalid_funds = "You don't have enough money to complete this transaction.",
    },
})

labels = setmetatable({},{
    __index = function(t,k)
        return ti.locales.get(k)
    end
})