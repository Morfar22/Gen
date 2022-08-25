fx_version 'adamant'
game 'gta5'

replace_level_meta 'gta5'

files
{
	'gta5.meta',
  'doortuning.ymt',
}



lua54 'yes'

client_scripts {
    'client.lua',
     'lodlights.lua',
     'pool_water.lua',
	 'ipl_loader.lua',
    }


  escrow_ignore {
    'client.lua',
  }
dependency '/assetpacks'