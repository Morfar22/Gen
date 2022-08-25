fx_version 'cerulean'
game 'gta5'

description 'Tk-Peyote'
version '0.5.0'

server_scripts {
    'server.lua'
}

client_scripts {
	'client.lua'
}

lua54 'yes'

escrow_ignore {
    'server.lua',
    'client.lua'
  }
dependency '/assetpacks'