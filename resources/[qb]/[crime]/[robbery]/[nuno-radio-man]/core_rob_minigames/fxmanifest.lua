fx_version "cerulean"
game "gta5"

author "Nuno Radio Man"
description "[Robbery] Minigames"
version "1.0.7"

dependencies { 
    "/server:5181",
}

lua54 "yes"

client_scripts{ 
    "cfg/cfg.lua",

    "client/functions.lua",
    "client/minigame_datacrack.lua",
    "client/minigame_fingerprint_clone.lua",
    "client/minigame_fingerprint_hack.lua",
    "client/minigame_hotwire.lua",
    "client/minigame_memory_hack.lua",
    "client/minigame_signal.lua",
    "client/minigame_terminal.lua",
    "client/minigame_voltlab.lua",
}
server_scripts { 
	"server/server.lua"
}

escrow_ignore {
	"cfg/cfg.lua",
}
dependency '/assetpacks'