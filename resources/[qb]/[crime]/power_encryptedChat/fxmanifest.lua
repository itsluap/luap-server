fx_version 'adamant'
game 'gta5'

author 'Power Scripts (power-scripts.com)'
description 'Encrypted Chat System'

lua54 'yes'
escrow_ignore {
 'config.lua',
 'README/*.*',
 'client.lua',
 'server.lua'
}


client_script 'encrypted/client.lua'
server_script 'encrypted/server.lua'

shared_script 'config.lua'

client_script 'client.lua'
server_script 'server.lua'

server_script '@mysql-async/lib/MySQL.lua'

ui_page('html/index.html')

files({
 'html/index.html',
 'html/script.js',
 'html/style.css',
 'html/devices.min.css',
})
dependency '/assetpacks'