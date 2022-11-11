fx_version 'cerulean'
games { 'gta5' }

client_scripts {
  'client/cl_*.lua',
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
}

shared_script {
  'sh_config.lua',
}

server_scripts {
  'server/sv_*.lua',
}

ui_page ('ui/index.html')

files {
  'ui/*'
}

dependency 'PolyZone'
