fx_version 'cerulean'
game 'gta5'
author 'discord.gg/gabz'
description 'Gabz Arm Wrestling'
version '1.0.0'
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
    'server/*.lua'
}

ui_page {
    'html/index.html',
}
files {
    'configs/locales_ui.js',
    'html/index.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/sounds/*.ogg',
}

dependencies {
    '/server:4960' -- ⚠️PLEASE READ⚠️; Requires at least server build 4960.
}

escrow_ignore {
    'configs/*.lua',
    'server/version_check.lua'
}
dependency '/assetpacks'