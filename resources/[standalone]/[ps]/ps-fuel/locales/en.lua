local Translations = {
    notify = {
        ["no_money"] = "Har ikke penge nok",
        ["refuel_cancel"] = "Brændstofpåfyldning annulleret",
        ["jerrycan_full"] = "Denne jerrydåse er allerede fuld",
        ["jerrycan_empty"] = "Denne jerrydåse er tom",
        ["vehicle_full"] = "Dette køretøj er allerede fyldt",
        ["already_full"] = "Basidåsen er allerede fuld",
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
