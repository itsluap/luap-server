fx_version 'cerulean'
game 'gta5'

description 'amir_expert#1911 - tattoo'
version '1.0.4'

client_script 'client/main.lua'
shared_script 'config.lua'
server_scripts{
	'server/main.lua',
	'@oxmysql/lib/MySQL.lua',
}

file 'tattoos.json'

lua54 'yes'

escrow_ignore {
	'client/main.lua',
	'config.lua',
	'tattoos.json',
	'tattoos.sql',
	'LICENSE',
	'README.md',
}
dependency '/assetpacks'