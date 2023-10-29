fx_version 'cerulean'
game 'gta5'

author 'Danzo'
description 'Make Love Menu - Made by Danzo - Discord: https://discord.gg/8nFqCR4xVC'
version '1.0.5'

shared_script 'config.lua'
client_script 'client/*.lua'
server_scripts {
	'config_server.lua',
	'server/*.lua',
}

ui_page {
	'html/index.html'
}

files {
	'html/index.html',
	'html/style.css',
	'html/script.js',
}

lua54 'yes'

escrow_ignore {
	'config.lua',
	'config_server.lua',
}
dependency '/assetpacks'