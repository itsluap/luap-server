fx_version 'bodacious'
game 'gta5'

author 'Hellslicer'
description 'This resource allows you to integrate your own radios in place of the original radios'
version '2.0.0'

-- Example custom radios
supersede_radio 'RADIO_07_DANCE_01' { url = 'http://pulseedm.cdnstream1.com:8124/1373_128', volume = 0.2 }
supersede_radio 'RADIO_05_TALK_01' { url = 'http://74.82.59.197:8070/stream?type=http&nocache=385301', volume = 0.2 }
supersede_radio 'RADIO_14_DANCE_02' { url = 'http://94.130.242.5:8040/stream', volume = 0.2 }
supersede_radio 'RADIO_11_TALK_02' { url = 'http://94.130.242.5:8016/stream', volume = 0.2 }

files {
	'index.html'
}

ui_page 'index.html'

client_scripts {
	'data.js',
	'client.js'
}
