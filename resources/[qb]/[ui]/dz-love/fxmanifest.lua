fx_version 'cerulean'
game 'gta5'

shared_script 'config.lua'
client_script 'client/*.lua'
server_script 'server/*.lua'

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
}
dependency '/assetpacks'