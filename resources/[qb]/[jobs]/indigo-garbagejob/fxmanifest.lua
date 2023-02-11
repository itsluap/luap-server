fx_version 'cerulean'
game 'gta5'

description 'indigo-garbagejob'
version '1.0.0'

shared_scripts {
	'@indigo-core/shared/locale.lua',
	'locales/en.lua',
	'locales/*.lua',
	'config.lua'
}

client_script {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/main.lua'
}
server_script 'server/main.lua'

lua54 'yes'
