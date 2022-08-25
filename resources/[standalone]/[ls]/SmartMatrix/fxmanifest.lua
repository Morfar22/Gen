fx_version 'bodacious'

games { 'gta5' }

author 'London Studios'
description 'Setup and use a smart matrix board on any vehicle!'
version '1.0.0'
lua54 'yes'

client_scripts {
	'config.lua',
	'cl_utils.lua',
	'cl_matrix.lua',
}

server_scripts {
	-- "@vrp/lib/utils.lua",
	'config.lua',
	'sv_utils.lua',
	'sv_matrix.lua',
}

escrow_ignore {
    'stream/*.ytd',
    'stream/*.ytyp',
    'config.lua',
    'sv_utils.lua',
    'cl_utils.lua',
	"ui/dist/assets/index.*.js",
    "ui/dist/assets/*.css",
    "ui/dist/index.html",
}

ui_page {
    "ui/dist/index.html"
}

files {
    "ui/dist/assets/index.*.js",
    "ui/dist/assets/*.css",
    "ui/dist/index.html",
    'stream/*.ytyp',
}

data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'


-- Smart Matrix created by London Studios.
-- Join our Discord server here: https://discord.gg/htyaZNaG
dependency '/assetpacks'