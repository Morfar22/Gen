Config = {}

Config.Core = "QBCore"
Config.OldQBCore = false
Config.CoreFolderName = "qb-core" 

Config.Printer = { 
    [1] = {coords = vector3(-42.3, -1749.29, 29.42), heading = 320.32, model = "v_med_cor_photocopy", z_offset = -1.0, count = 50, capacity = 100, show3dText = true},     
    [2] = {coords = vector3(458.10, -986.04, 30.62), heading = 269.39, model = "v_med_cor_photocopy", z_offset = -0.9, count = 50, capacity = 100, show3dText = true}, 
}
-- Add new coord and heading 
-- model (spawn machine prop name, should be nil if you dont want to spawn the prop)
-- some props name that you can use - "prop_printer_01", "prop_printer_02", "v_res_printer", "v_ret_gc_print"
-- capacity (Maximum number of A4 sheets machine can carry)
-- count (Initial count of A4 sheets in printer, when resource start)
-- z_offset to align prop vertically (perfect placement to ground), else set z_offset = 0.0
-- show3dText - whether to show 3d text or not at that printer location. If set to false, that printer will be just a prop that is spawned and none of the functionality like capacity, refill etc will work.

--[[
    * Notify Config
    * Set only one to true 
    * Config.QBCoreNotify - Uses default QBCore notify system
    * Config.okokNotify - Uses OkOkNotify system
    * Config.pNotify - Uses pNotify system

    * Config.pNotifyLayout - set layout of where the notification will show. Check the layouts below. 
    * Layouts:
                top
                topLeft
                topCenter
                topRight
                center
                centerLeft
                centerRight
                bottom
                bottomLeft
                bottomCenter
                bottomRight
    
    * Config.OkOkNotifyTitle - Title to show on okokNotify
]]--
Config.Notify = {
    ['QBCore'] = true, --(Default)
    ['okokNotify'] = false,
    ['pNotify'] = false,
    ["QBCore_2"] = false -- (for people who have title parameters on base qbcore notify (title will be taken from OkOkNotifyTitle))
}

Config.pNotifyLayout = "centerRight" --more options can be found in pNotify Readme. Make sure you put the right layout name.
Config.OkOkNotifyTitle = "HP Printer" --Title that displays on okoknotify


--Format of Config.Locale
--[[
    * name = label
    * Do not alter the name (for eg. ["invalid_url"] -> do not change this)
    * change the label (for eg. "Invalid URL!" can be changed to whatever you want.)
]]--

Config.Locale = {
    ["invalid_url"] = "Ugyldig URL!",
    ["file_url_required"] = "Fil-URL påkrævet",
    ["file_name"] = "Filnavn påkrævet",
    ["not_enough_sheets"] = "Har ikke plads nok til flere A4-ark",
    ["no_sheets"] = "Du har ikke A4-ark!",
    ["refilling"] = "Genfyldning af A4-ark",
    ["printing"] = "Udskrivning af dokument",
    ["paper_count"] = "Papirantal",
    ["refill"] = "~r~K~w~ - Genopfyld",
    ["use"] = '~g~E~w~ - Brug',
    ["wrong_image"] = "Billedet findes ikke i den rigtige discord-kanal",
}

Config.RestrictMode = true --set to to true if you want to restrict people from using any images and use only the images from Allowed Discord Channels, if false users can use any link for images

--[[
    Just add as many channels you want if you set RestrictMode to true
]]--
Config.AllowedChannels = { --Allowed Discord channels for PNG upload
    "https://cdn.discordapp.com/attachments/909905066671108136",  -- the number after "attachments/" is the channel id, to get that, just right click on the channel and copy id (for now this is the teasers channel on my discord)
    -- "https://cdn.discordapp.com/attachments/909905066671108136",  

}

Config.DefaultURL = "https://cdn.discordapp.com/attachments/909899891705278534/979867084186091520/404-error-desktop-not-found-1080P-wallpaper.jpg" --Default URL to show if the image is not found