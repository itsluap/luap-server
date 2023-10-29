fx_version 'cerulean'
game 'gta5'
author 'discord.gg/codesign'
description 'Codesign Strip Club'
version '1.0.0'
lua54 'yes'

shared_scripts {
    'configs/config.lua',
    'configs/locales.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

dependencies {
    'cd_drawtextui', --⚠️PLEASE READ⚠️; Remove this line if you don't use 'cd_drawtextui' and you have already edited the code accordingly.⚠️
    '/server:4960' -- ⚠️PLEASE READ⚠️; Requires at least server build 4960.
}

escrow_ignore {
    'configs/*.lua',
    'server/version_check.lua'
}
dependency '/assetpacks'