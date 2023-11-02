fx_version "cerulean"
game "gta5"

author "Nuno Radio Man"
description "[Robbery] Essentials"
version "1.2.1"

lua54 "yes"

server_scripts { 
	"server/server.lua",
}

files {
	--Interactables & Props
	"stream/props/[PROP]/robbery_props.ytyp",
	"stream/props/[PROP_BUTTON]/robbery_button_props.ytyp",
	"stream/props/[PROP_CASE]/robbery_case_props.ytyp",
	"stream/props/[PROP_CHAIN]/robbery_chain_props.ytyp",
	"stream/props/[PROP_CHEMICAL]/robbery_chemical_props.ytyp",
	"stream/props/[PROP_CONTAINER]/robbery_container_props.ytyp",
	"stream/props/[PROP_CRATE]/robbery_crate_props.ytyp",
	"stream/props/[PROP_ELECTRICALBOX]/robbery_electricalbox_props.ytyp",
	"stream/props/[PROP_GRAB]/robbery_grab_props.ytyp",
	"stream/props/[PROP_GLASSDISPLAY]/robbery_glassdisplay_props.ytyp",
	"stream/props/[PROP_KEYCARD]/robbery_keycard_props.ytyp",
	"stream/props/[PROP_KEYPAD]/robbery_keypad_props.ytyp",
	"stream/props/[PROP_LEVER]/robbery_leverbox_props.ytyp",
	"stream/props/[PROP_LEVER]/robbery_leverbox_props.ytyp",
	"stream/props/[PROP_LOCKBOX]/robbery_lockbox_props.ytyp",
	"stream/props/[PROP_PAINTING]/robbery_painting_props.ytyp",
	"stream/props/[PROP_SAFE]/robbery_safe_props.ytyp",
	"stream/props/[PROP_SECURITYPANEL]/robbery_securitypanel_props.ytyp",
	"stream/props/[PROP_SHOWCASE]/robbery_showcase_props.ytyp",
	"stream/props/[PROP_STACK]/robbery_stack_props.ytyp",
	"stream/props/[PROP_TROLLY]/robbery_trolly_props.ytyp",

	--Robbery
	"stream/props/[ROBBERY_MAZEBANK]/robbery_mazebank_props.ytyp",

	--Audio
	"audio/audioconfig/sp_sounds.dat54.rel",
	"audio/script/fbi_05_grab_toxin.awc",
	"audio/audioconfig/jewelery_robbery_sounds.dat54.rel",
	"audio/dlc_jewelery_robbery/jewelery_robbery.awc",
}

--Interactables & Props
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP]/robbery_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_BUTTON]/robbery_button_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_CASE]/robbery_case_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_CHAIN]/robbery_chain_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_CHEMICAL]/robbery_chemical_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_CONTAINER]/robbery_container_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_CRATE]/robbery_crate_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_ELECTRICALBOX]/robbery_electricalbox_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_GRAB]/robbery_grab_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_GLASSDISPLAY]/robbery_glassdisplay_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_KEYCARD]/robbery_keycard_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_KEYPAD]/robbery_keypad_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_LEVER]/robbery_leverbox_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_LOCKBOX]/robbery_lockbox_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_PAINTING]/robbery_painting_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_SAFE]/robbery_safe_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_SECURITYPANEL]/robbery_securitypanel_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_SHOWCASE]/robbery_showcase_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_STACK]/robbery_stack_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/[PROP_TROLLY]/robbery_trolly_props.ytyp"

--Robbery
data_file "DLC_ITYP_REQUEST" "stream/props/[ROBBERY_MAZEBANK]/robbery_mazebank_props.ytyp"

--Audio
data_file "AUDIO_WAVEPACK" "audio/dlc_jewelery_robbery"
data_file "AUDIO_SOUNDDATA" "audio/audioconfig/jewelery_robbery_sounds.dat"

data_file "AUDIO_WAVEPACK" "audio/script"
data_file "AUDIO_SOUNDDATA" "audio/audioconfig/sp_sounds.dat"
dependency '/assetpacks'