fx_version 'cerulean'
game 'gta5'


------------------------------------------------------------------------------------------------
--
--
--_______ _     _ _____        _______ ______  _______  _____   ______ _______
--|______  \___/    |   |      |______ |     \ |       |     | |_____/ |______
--|______ _/   \_ __|__ |_____ |______ |_____/ |_____  |_____| |    \_ |______
--                                                                           
--
------------------------------------------------------------------------------------------------                                                                                            



author 'TheExiled | ExiledVibe | !ExiledVibe!#1001'
description 'ExiledCore | https://discord.gg/XHxgRKzyGQ'
version '0.1'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua'
}

client_scripts {
    'discord/client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'discord/server.lua'
}

escrow_ignore {
    'config.lua'
  }

lua54 'yes'
dependency '/assetpacks'