
fx_version 'cerulean'

author 'KevinGirardx'

game 'gta5'

shared_script {
	'config.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua'
}

lua54 'yes'

files {
	'common/carvariations.meta',
	'common/vehicles.meta',
	'common/*.meta'
}
data_file 'VEHICLE_METADATA_FILE' 'common/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'common/carvariations.meta'
data_file 'DLC_ITYP_REQUEST' 'stream/box.ytyp'

escrow_ignore {
    'client/*.lua',
    'server/server.lua',
    'config.lua',
    'common/*.meta',
    'stream/*.ytd',
    'stream/*.yft',
    'stream/*.ydr'
}
dependency '/assetpacks'