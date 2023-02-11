name "Jim-Payments"
author "Jimathy"
version "v2.8.4"
description "Payment Script By Jimathy"
fx_version "cerulean"
game "gta5"
lua54 'yes'

dependencies { 'indigo-input', 'indigo-target', }
client_scripts { 'client/*.lua', 'locales/*.lua' }
server_scripts { '@oxmysql/lib/MySQL.lua', 'server/*.lua' }
shared_scripts { 'config.lua', 'shared/*.lua', 'locales/*.lua' }