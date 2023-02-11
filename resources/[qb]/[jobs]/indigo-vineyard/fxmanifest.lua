fx_version 'cerulean'
game 'gta5'

description 'indigo-vineyard'
version '1.1.0'

shared_scripts {
    '@indigo-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

server_script 'server.lua'
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client.lua'
}

dependencies {
    'indigo-core',
    'PolyZone'
}

lua54 'yes'