fx_version 'cerulean'
game 'gta5'

description 'indigo-houses'
version '2.1.0'

ui_page 'html/index.html'

shared_scripts {
    'config.lua',
    '@indigo-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_scripts {
    'client/main.lua',
    'client/decorate.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

files {
    'html/index.html',
    'html/reset.css',
    'html/style.css',
    'html/script.js',
    'html/img/dynasty8-logo.png'
}

dependencies {
    'indigo-core',
    'indigo-interior',
    'indigo-clothing',
    'indigo-weathersync'
}

lua54 'yes'