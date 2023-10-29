fx_version 'cerulean'
game 'gta5'
author 'discord.gg/gabz'
description 'Gabz Door Lock'
version '1.0.4'
lua54 'yes'

shared_scripts {
    'configs/locales.lua',
    'configs/config.lua'
}

client_scripts {
    'configs/client_customise_me.lua',
    'client/*.lua'
}

server_scripts {
    'configs/server_customise_me.lua',
    'configs/server_webhooks.lua',
    'server/*.lua',
    'server/*.js',
    --'@vrp/lib/utils.lua', --⚠️PLEASE READ⚠️; Uncomment this line if you use 'vrp'.⚠️
    --'@vrp/lib/Tunnel.lua', --⚠️PLEASE READ⚠️; Uncomment this line if you use 'vrp'.⚠️
	--'@vrp/lib/Proxy.lua', --⚠️PLEASE READ⚠️; Uncomment this line if you use 'vrp'.⚠️
}


ui_page {
    'html/index.html',
}
files {
    'configs/locales_ui.js',
    'configs/config_ui.js',
    'html/index.html',
    'html/assets/*.css',
    'html/assets/*.js',
    'html/fonts/*.woff2',
    'html/css/vendor/*.css',
    'sounds/*.ogg'
}

exports {
    'GetDoorState_closest',
    'GetDoorState_name'
}

dependencies {
    '/server:4960' -- ⚠️PLEASE READ⚠️; Requires at least server build 4960.
}

escrow_ignore {
    'client/functions.lua',
    'configs/*.lua',
    'server/version_check.lua'
}

dependency '/assetpacks'