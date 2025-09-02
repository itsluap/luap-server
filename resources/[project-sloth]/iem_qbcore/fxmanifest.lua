fx_version 'cerulean'
game 'gta5'

author 'IndigoRP Economy Manager'
description 'QBCore integration for economy tracking and management'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/transactions.lua',
    'server/networth.lua',
    'server/tax.lua',
    'server/exports.lua'
}

client_scripts {
    'client/main.lua'
}

dependencies {
    'qb-core',
    'oxmysql'
}

lua54 'yes'
