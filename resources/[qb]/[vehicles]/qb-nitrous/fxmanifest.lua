fx_version 'bodacious'
game 'gta5'

name 'qb-nitro'
description ' '
author ' '
url ' '

client_script 'client/ptfx.lua'
client_script 'client/boost.lua'
client_script 'client/purge.lua'
client_script 'client/main.lua'

server_script 'server/main.lua'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
}

