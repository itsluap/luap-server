fx_version 'cerulean'
game 'gta5'

description 'indigo-smallresources'
version '1.1.0'

server_script 'server/*.lua'
client_script 'client/*.lua'

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

ui_page 'html/index.html'

files {
	'html/index.html',
 	'html/js/script.js',
 	'html/css/style.css',
	'events.meta',
	'popgroups.ymt',
	'relationships.dat'
}

shared_scripts {
	'config.lua',
}

exports {
	'RequestAnimationDict',
	'RequestModelHash',
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'
