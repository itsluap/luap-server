fx_version 'cerulean'
game 'gta5'

author 'KKaybe'
description 'KB-Business Script'
version '1.0.1'

shared_scripts {'config.lua', 'shared/business.lua'}
server_scripts {'server/main.lua', 'server/employeeActions-exampleS.lua'}
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/main.lua',
	'client/employeeActions-example.lua',
} 

ui_page 'html/index.html'

files {
	'html/*.html',
	'html/*.js',
	'html/*.png',
	'html/*.css',
}

escrow_ignore {
	'shared/business.lua',
	'README.md',
	'config.lua',
	'client/employeeActions-example.lua',
	'server/employeeActions-exampleS.lua',
}

lua54 'yes'

dependency '/assetpacks'