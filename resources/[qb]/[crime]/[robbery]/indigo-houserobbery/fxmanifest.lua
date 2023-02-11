fx_version 'cerulean'
game 'gta5'

description 'indigo-houserobbery'
version '1.0.0'

shared_scripts {
    'config.lua',
    '@indigo-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_script 'client/main.lua'
server_script 'server/main.lua'

dependencies {
    'indigo-lockpick',
    'indigo-skillbar'
}

lua54 'yes'
