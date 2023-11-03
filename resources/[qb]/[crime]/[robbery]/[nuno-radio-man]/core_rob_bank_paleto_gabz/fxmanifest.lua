fx_version "cerulean"
game "gta5"

author "Nuno Radio Man"
description "[Robbery] Paleto Gabz"
version "1.1.8"

dependencies { 
	"/onesync",
	"/server:5181",
	"/gameBuild:2189",
	"core_rob_essentials",
	"core_rob_minigames",
}

lua54 'yes'

client_scripts {
	"cfg/cfg.lua",
	"cfg/cfg_robbery.lua",
	"client/dependency.lua",
	"client/functions.lua",
	"client/client.lua",
}
server_scripts { 
	"@vrp/lib/utils.lua",

	"cfg/cfg.lua",
	"cfg/cfg_logs.lua",
	"cfg/cfg_robbery.lua",
	"server/dependency.lua",
	"server/functions.lua",
	"server/server.lua",
}

escrow_ignore {
	"cfg/cfg.lua",
	"cfg/cfg_logs.lua",
	"cfg/cfg_robbery.lua",
	"client/functions.lua",
	"server/functions.lua",
}
dependency '/assetpacks'