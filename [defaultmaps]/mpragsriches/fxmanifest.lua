fx_version 'adamant'
game 'gta5'
lua54 'yes'

this_is_a_map = 'yes'

data_file 'GTXD_PARENTING_DATA' 'stream/gtxd.meta'
data_file 'GTXD_PARENTING_DATA' 'stream/dlc.rpf/common/data/gtxd.meta'
data_file 'AUDIO_GAMEDATA' 'stream/dlc.rpf/x64/audio/config/dlcspragsriches_game.dat'
data_file 'AUDIO_WAVEPACK' 'dlcspragsriches'
data_file 'AUDIO_GAMEDATA' 'stream/dlc.rpf/x64/audio/config/mhc_spagym_game.dat'
data_file 'AUDIO_DYNAMIXDATA' 'stream/dlc.rpf/x64/audio/config/mhc_spagym_mix.dat'
data_file 'AUDIO_GAMEDATA' 'stream/dlc.rpf/x64/audio/config/dlcspragsriches_game.dat'
data_file 'AUDIO_GAMEDATA' 'stream/dlc.rpf/x64/audio/config/amb_mhc_hotel_floor_1_game.dat'
data_file 'AUDIO_DYNAMIXDATA' 'stream/dlc.rpf/x64/audio/config/amb_mhc_hotel_floor_1_mix.dat'
data_file 'HANDLING_FILE' 'stream/dlc.rpf/common/data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'stream/dlc.rpf/common/data/levels/gta5/vehicles.meta'
data_file 'CARCOLS_FILE' 'stream/dlc.rpf/common/data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'stream/dlc.rpf/common/data/carvariations.meta'


files {
	'stream/gtxd.meta',
	'stream/dlc.rpf/common/data/gtxd.meta',
	'stream/dlc.rpf/x64/audio/config/dlcspragsriches_game.dat151.rel',
	'stream/dlc.rpf/x64/audio/config/dlcspragsriches_game.dat151.rel',
	'stream/dlc.rpf/x64/audio/config/mhc_spagym_game.dat151.rel',
	'stream/dlc.rpf/x64/audio/config/mhc_spagym_mix.dat15.rel',
	'stream/dlc.rpf/x64/audio/config/amb_mhc_hotel_floor_1_game.dat151.rel',
	'stream/dlc.rpf/x64/audio/config/amb_mhc_hotel_floor_1_mix.dat15.rel',
	'stream/dlc.rpf/common/data/levels/gta5/vehicles.meta',
	'stream/dlc.rpf/common/data/carvariations.meta',
	'stream/dlc.rpf/common/data/carcols.meta',
	'stream/dlc.rpf/common/data/handling.meta',
}
server_scripts
{
  'startup.lua',
  'tag.lua',
}
dependency '/assetpacks'