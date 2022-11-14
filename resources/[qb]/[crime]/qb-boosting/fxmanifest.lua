fx_version 'cerulean'
games { 'gta5' }

client_scripts {
  'client/cl_*.lua',
  --'@unwind-rpc/client/cl_main.lua',
}

shared_scripts {
  'config.lua',
}

server_scripts {
  'server/sv_*.lua',
  --'@unwind-rpc/server/sv_main.lua',
}

ui_page 'ui/index.html'

files {
  'ui/*',
  'ui/images/*',
  'ui/css/*',
  'ui/webfonts/*'
}