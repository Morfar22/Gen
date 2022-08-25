fx_version 'cerulean'
game 'gta5'

lua54 'yes'

ui_page 'ui/index.html'

files {
	'ui/**.*',
}

escrow_ignore {
  'config.lua',
}

shared_scripts {
	'config.lua'
}

client_scripts {
	'exports.lua',
	'functions.lua',
	'client.lua',
	'menu.lua',
	'pedCreate.lua',
	'rightMenu.lua',
}
--[[ 
-- mysql
server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'mysql.lua',
  	'server.lua'
}
]]
  
-- oxmysql
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'mysql.lua',
  	'server.lua'
} 

dependency '/assetpacks'