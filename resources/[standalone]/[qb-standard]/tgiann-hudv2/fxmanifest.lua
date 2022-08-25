fx_version 'cerulean'
game 'gta5'
lua54 'yes'

ui_page {
	'html/index.html',
}

escrow_ignore {
    'config.lua',
	'qbserver.lua',
	'qbclient.lua',
	'client/editable.lua',
}

files {
	'html/font/*.otf',
	'html/font/*.ttf',
	'html/css/*.css',
	'html/js/*.js',
	'html/index.html',
	'html/img/*.png',
}

client_scripts {
	'config.lua',
	'client/*.lua',
	'qbclient.lua',
}

server_scripts {
	'config.lua',
	'qbserver.lua',
}

server_script 'server/server.lua'
dependency '/assetpacks'