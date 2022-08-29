description 'TebIT - Persistent Vehicles'
version '1.0.0'

fx_version 'bodacious'
game 'gta5'

lua54 'yes'

util_modules {
  'vehicles',
  'streaming'
}

client_scripts {
  '@ti_utils/init.lua',
  'client/main.lua',
}

server_scripts {
  'server/main.lua',
}

dependencies {
  'ti_utils'
}
dependency '/assetpacks'