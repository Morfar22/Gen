------------------------------------------------------------------------------------------------
--
--
--_______ _     _ _____        _______ ______  _______  _____   ______ _______
--|______  \___/    |   |      |______ |     \ |       |     | |_____/ |______
--|______ _/   \_ __|__ |_____ |______ |_____/ |_____  |_____| |    \_ |______
--
-- https://discord.gg/GqCk8ZkNZq
--
-- V 0.0.2
--
------------------------------------------------------------------------------------------------

-- Use https://www.spycolor.com/ for getting colors, pick a colour, search for it, then use the Decimal Value


Config = {}

Config.Debug = true
Config.ResourceStartHook = 'https://discord.com/api/webhooks/1011385434875629710/AG47zH9eIprfgqqAO2C8t1zkzmsQvENLhtKvUjzyi0HvZ2-xc7PTg2bdImTUiupdnrEQ' -- Webhook for resource initiated announcement
Config.ResourceStartColor = 1626375 -- Resource Initiated Color
Config.CommunityName = 'CommunityName' -- Community Name, Username of the announcement.

Config.PlayerJoin = {
        URL = 'https://discord.com/api/webhooks/1011385356106596474/8kcWZpiQHSsjn9i-DWFBfSVRD0M9G44F_RhqUErdFIeOPNclVMLg_txejZPQ5erO4iuy', -- Webhook for Player Joined Announcement
        Title = 'Just Flew In!', -- Joined Title
        Color = 1106047, -- Joined Color
        Image = 'https://cdn.discordapp.com/attachments/1005890372104364153/1010660551954800700/unavngivet.png' -- Joined Image
    }

Config.PlayerLeft = {
        URL = 'https://discord.com/api/webhooks/1011385545055801394/l2KzmURM29sMLNQtqj4wp-uy97PY8jzr9RTTo20rOjWDRhL0TKiDxMZoRu2ExlvKzVH3', -- Player Left Webhook
        Title = 'Just Left!', -- Left Title
        Color = 1401026, -- Left Color
        Image = 'https://cdn.discordapp.com/attachments/1005890372104364153/1010660551954800700/unavngivet.png' -- Left Image
}

Config.AdminLogout = {
        URL = 'https://discord.com/api/webhooks/1011385585103032340/mZqEY7Jx4OKoCEYDcsO_NUJK4KAON4rZKMcyHDCNztGPM5meIIwAqZJcw1GYD9okD_To', -- Admin Logout Webhook
        Title = 'Admin Logged Out', -- Admin Logout Title
        Color = 16730112, -- Admin Logout Color
        Image = 'https://cdn.discordapp.com/attachments/1005890372104364153/1010660551954800700/unavngivet.png', -- Admin Logout Image
        Message = '' -- Admin Logout Message
}

Config.Cuff = {
        URL = 'https://discord.com/api/webhooks/1011385623661269094/5aGVGgYvUpWPQEMvWjCKdk-tZNWJSRaJzx9rpZRkjHkRqT17RAI8fDBbKXqXqALp5ClU', -- Cuffed Webhook
        Title = 'Player Cuffed!', -- Cuffed Title
        Color = 1635897, -- Cuffed Color
        Image = '', -- Cuffed Image
        UnCuffTitle = 'Player Uncuffed!',
        UnCuffColor = 1234567,
        UnCuffImage = 'https://cdn.discordapp.com/attachments/1005890372104364153/1010660551954800700/unavngivet.png'
}

Config.Duty = {
        URL = 'https://discord.com/api/webhooks/1011385674705948692/iksB1xUidiLl57bV0ZDgEJs9maIEsSIekStBIrCKV6_hHPr_VHX_AzLEz2b1N6Pdr5Do',
        OnTitle = 'Clocking On!',
        OffTitle = 'Clocking Off!',
        OnColor = 7654321,
        OffColor = 2468135,
        OnImage = 'https://cdn.discordapp.com/attachments/1005890372104364153/1010660551954800700/unavngivet.png',
        OffImage = 'https://cdn.discordapp.com/attachments/1005890372104364153/1010660551954800700/unavngivet.png'
}