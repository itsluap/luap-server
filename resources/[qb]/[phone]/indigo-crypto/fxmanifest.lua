fx_version 'cerulean'
game 'gta5'

description 'indigo-crypto'
version '1.0.0'

shared_scripts {
    '@indigo-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}
client_script 'client/main.lua'

dependency 'mhacking'

lua54 'yes'
