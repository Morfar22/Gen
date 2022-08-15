fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '1.6'
author 'Luxu.gg'
description 'CEX V2 - Advanced Edition'


ui_page('nui/index.html')

files { 'nui/index.html', 'nui/**/*', 'nui/*' }

shared_scripts { 'config.lua' }

client_scripts {
  'client.lua',
}

server_scripts { '@mysql-async/lib/MySQL.lua', 'server.lua' }

escrow_ignore {
  'config.lua',
}

dependency '/assetpacks'