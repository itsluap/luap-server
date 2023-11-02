fx_version "cerulean"
game "gta5"

author "Nuno Radio Man"
description "[Robbery] Essentials"
version "1.1.0"

lua54 "yes"

server_scripts { 
	"server/*"
}

files {
	"stream/props/props.ytyp",
	"stream/props/jewelery_showcase_props.ytyp",
	"stream/props/fib_props.ytyp",
	"stream/props/humanelabs_props.ytyp",
	"stream/props/union_props.ytyp",
	"stream/props/iaa_props.ytyp",
	"stream/props/liveinvader_props.ytyp",
	"stream/props/noose_props.ytyp",
	"stream/props/bunker_props.ytyp",
	"stream/props/cayoperico_props.ytyp",

	"audio/audioconfig/sp_sounds.dat54.rel",
	"audio/script/fbi_05_grab_toxin.awc",

	"audio/audioconfig/jewelery_robbery_sounds.dat54.rel",
	"audio/dlc_jewelery_robbery/jewelery_robbery.awc",
}

data_file "DLC_ITYP_REQUEST" "stream/props/props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/jewelery_showcase_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/fib_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/humanelabs_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/union_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/iaa_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/liveinvader_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/noose_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/bunker_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/props/cayoperico_props.ytyp"

--Audio
data_file "AUDIO_WAVEPACK" "audio/dlc_jewelery_robbery"
data_file "AUDIO_SOUNDDATA" "audio/audioconfig/jewelery_robbery_sounds.dat"

data_file "AUDIO_WAVEPACK" "audio/script"
data_file "AUDIO_SOUNDDATA" "audio/audioconfig/sp_sounds.dat"
dependency '/assetpacks'