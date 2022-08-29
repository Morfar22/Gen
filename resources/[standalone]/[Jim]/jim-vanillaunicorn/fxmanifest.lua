name "Jim-VanillaUnicorn"
author "Jimathy"
version "v1.6.3"
description "Vanilla Unicorn Job Script By Jimathy"
fx_version "cerulean"
game "gta5"

shared_scripts {
    'config.lua',
    'shared/*.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/*.lua',
}

server_scripts { 'server/*.lua' }

lua54 'yes'

escrow_ignore {
	'*.lua*',
	'client/*.lua*',
	'server/*.lua*',
    'shared/*.lua'
}
dependency '/assetpacks'