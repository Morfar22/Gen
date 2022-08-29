fx_version 'cerulean'
games { 'gta5' }

name "D&P Hookers"
description "Hookers script for FiveM ESX/QBServers"
author "D&P Store"
version "1.0.1"

game { 'gta5' }

lua54 'yes'

shared_scripts {
	'config.lua',
}

client_scripts {
	'client/functions.lua',
	'client/main.lua',
	'locale.lua',
	"locales/*.lua"
}

server_scripts {
	'server/main.lua',
	'locale.lua',
	"locales/*.lua"
}

ui_page 'html/index.html'

files {
	'html/locales/locales.js',
	'html/script.js',
	'html/notification.js',
	'html/responsive-blog-card-slider.js',
	'html/responsive-blog-card-slider-1.js',
	'html/miner.jpg',
	'html/*.jpg',
	'html/index.html',
	'html/assets/js/script.js',
	'html/assets/css/*.css',
	'html/assets/js/*.js',
	'html/assets/bootstrap/css/*.css',
	'html/assets/bootstrap/js/*.js'
}

escrow_ignore {
    'locales/*.lua',
    'config.lua'
}


dependency '/assetpacks'