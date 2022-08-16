fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'momof513'
description 'momof-textui'
version '1.0.0'

ui_page 'html/build/index.html'

shared_script 'config.lua'

client_script 'client/main.lua'

files {
  'html/build/index.html',
  'html/build/**/*'
}

exports {
  'ShowText',
  'HideText',
}

escrow_ignore {
  'client/main.lua',
  'config.lua',
  'documentation.md',
}

dependency '/assetpacks'