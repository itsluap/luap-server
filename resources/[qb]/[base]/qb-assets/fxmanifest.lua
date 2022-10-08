fx_version 'cerulean'
game 'gta5'

description 'qb-assets'
version '1.1.0'

shared_script 'config.lua'
server_script 'server/*.lua'
client_script 'client/*.lua'


exports {
 'AddProp',
 'RemoveProp',
 'GetPropStatus',
 'RequestAnimationDict',
 'RequestModelHash',
}

-- exports['qb-assets']:AddProp('PropName')
-- exports['qb-assets']:RemoveProp()

lua54 'yes'
use_experimental_fxv2_oal 'yes'