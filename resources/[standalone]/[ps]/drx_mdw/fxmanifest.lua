lua54 'yes'
fx_version 'adamant'
game 'gta5'

shared_scripts {
	'Config.lua'
}

ui_page 'client/html/index.html'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua',
	'server/extra.lua'
}

client_scripts {
	'client/client.lua',
	'client/extra.lua'
}

files {
	'client/html/images/*',
	'client/html/index.html',
	'client/html/style.css',
	'client/html/javascript.js'
}

escrow_ignore {
	'Config.lua',
	'client/extra.lua',
	'server/extra.lua'
}
dependency '/assetpacks'