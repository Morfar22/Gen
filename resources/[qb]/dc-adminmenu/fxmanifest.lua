fx_version 'cerulean'
game 'gta5'

author 'Disabled Coding'
description 'Admin menu specifically made for the QBCore framework'
version '2.1.1'
repository 'https://github.com/Disabled-Coding/dc-adminmenu'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/da.lua', -- Change to the language you want
}

client_scripts {
    '@menuv/menuv.lua',
    'client/noclip.lua',
    'client/blipsnames.lua',
    'client/main.lua',
    'client/selfmenu.lua',
    'client/playersmenu.lua',
    'client/servermenu.lua',
    'client/vehiclemenu.lua',
    'client/devmenu.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server/config.lua',
    'server/main.lua',
    'server/commands.lua',
    'server/playersmenu.lua',
}

ui_page 'html/index.html'

files { -- Credits to https://github.com/LVRP-BEN/bl_coords for clipboard copy method
    'html/index.html',
    'html/index.js'
}

dependency 'menuv'

lua54 'yes'
