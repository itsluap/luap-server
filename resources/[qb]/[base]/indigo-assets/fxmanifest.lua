fx_version 'cerulean'
game 'gta5'

description 'indigo-assets'
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

-- exports['indigo-assets']:AddProp('PropName')
-- exports['indigo-assets']:RemoveProp()

lua54 'yes'
use_experimental_fxv2_oal 'yes'