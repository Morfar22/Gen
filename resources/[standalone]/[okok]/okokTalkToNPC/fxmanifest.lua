fx_version 'adamant'

game 'gta5'

author 'okok#3488'
description 'okokTalkToNPC'

ui_page 'web/ui.html'

files {
	'web/*.*'
}

shared_script 'config.lua'

client_scripts {
	'client.lua',
}

lua54 'yes'

escrow_ignore {
	'config.lua',
	'client.lua'
}
dependency '/assetpacks'