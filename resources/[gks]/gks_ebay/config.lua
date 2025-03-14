Cfg              = {}
Config           = {}
Config.QBCoreNewversion = true

if Config.QBCoreNewversion then
    Config.CoreName = "QBCore"
    Config.Core = exports['qb-core']:GetCoreObject()
    Config.CoreNotify = "QBCore:Notify"
else
    Config.CoreName = "QBCore:GetObject"
    Config.Core = nil
    TriggerEvent(Config.CoreName, function(obj) Config.Core = obj end)
    Config.CoreNotify = "QBCore:Notify"
end

Cfg.NPCEnable = false
Cfg.NPCIdyenileehliyet	=  "g_f_y_vagos_01"
Cfg.NPCKonummrpd	=   {  x = 1353.38, y = 1156.89, z = 113.76, h = 221.36 }
Cfg.DrawDistance = 5
Cfg.EyeTarget        = false                -- required qb-target

Config.BlacklistItem = {
    "weapon_pistol",
    "weapon_appistol",
    "weapon_assaultrifle"
}

-- LANG

Config.APPName = "Ebay"
Config.Products = "Prudukter"
Config.Menu1Descript = "Prudukter i butikken"
Config.Menu2Label = "Put product in warehouse"
Config.Menu2Descript = "Adding products to the store"
Config.Menu3Label = "Stored"
Config.MenuDescript = "Products in the warehouse"
Config.TooMuch = "You entered too much"
Config.AddProduct = "Add product"
Config.Takeout = "You can\' t take out more than you own"
Config.Notmoney = "you dont have enough money"
Config.SameItem = "We already have this item in our shop"
Config.RemoveItem = "Remove the item and put a new price or put the same price"
Config.ItemBlacklist = "The item you want to add is a black list."
Config.ebayexploitmoney = "Tried to change the prices of products"
Config.ebayexploitnotowner = "The owner of the product and the item purchased are not equal"