-- Resource Metadata
fx_version 'cerulean'
games { 'gta5' }

author 'Vinipux322 <Vinipux322#0001>'
description 'GraffitiV'
version '1.2.3'

lua54 'yes'

ui_page "nui/dist/index.html"

-- What to run
client_scripts {
  'client.lua',
  'config_client.lua'
}

server_scripts {
  'server.lua',
  'config.lua',
  'apiExample.lua'
}

files {
  'data/*.*',
  "nui/dist/index.html",
  'nui/dist/js/*.js',
  'nui/dist/css/*.css',
}

escrow_ignore {
  'apiExample.lua',
  'config.lua',
  'config_client.lua'
}

replace_level_meta 'data/gta5'
dependency '/assetpacks'