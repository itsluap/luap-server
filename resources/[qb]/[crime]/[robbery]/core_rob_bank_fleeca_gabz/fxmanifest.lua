fx_version "cerulean"
game "gta5"

author "Nuno Radio Man"
description "[Robbery] Fleeca Gabz"
version "1.0.1"

dependencies { 
	"/onesync",
	"/server:5181",
	"/gameBuild:2189",
	"core_rob_essentials",
	"core_rob_minigames",
}

lua54 'yes'

client_scripts { 
	"client/*"
}
server_scripts { 
	"@vrp/lib/utils.lua",
	"cfg/*",
	"server/*"
}

escrow_ignore {
	'server/functions.lua',
	'client/functions.lua',
	'cfg/config.lua',
}
dependency '/assetpacks'