fx_version 'cerulean'
game 'gta5'

name "Cayo Perico Loader/Unloader"
author "TayMcKenzieNZ"
version "4.1.7"
description "Spawns the island into freeroam without requiring a hopper"
url  "https://forum.cfx.re/t/releases-free-cayo-perico-improvements-freeroam-4-1-6/1944991"



--- Server build must be on 3324 or higher, however FiveM and myself recommend that you update the server build to the LATEST RECOMMENDED at least once a month
-- Server MUST be on gamebuild 2189 or higher for this resource to run sucessfully



this_is_a_map 'yes'


data_file 'DLC_ITYP_REQUEST' 'stream/ytyp/mads_no_exp_pumps.ytyp' -- Stops petrol pumps from exploding. Credit to MadsL on the FiveM Forums for this.


client_scripts {

    'scripts/cayo_perico_entitysets.lua', -- Responsible for spawning in heist props in El Rubio's Mansion safe. You can use this file to change the prop that appears.
	 'scripts/cp_config.lua', -- Both Islands visible in game, however opposite island gets concealed (ENABLED BY DEFAULT, Island hangar won't work otherwise)
	'scripts/blips.lua', -- Map Blips
	'scripts/zones.lua', -- Displays all map zones, fixing the bug of showing North Yankton, and instead showing Cayo Perico
	'scripts/peds_config.lua', -- Invincible peds that appear on the island, ie merryweather
	'scripts/main_peds.lua', -- Don't touch
	'scripts/static_emitters.lua' -- Disables static emitters from Arena Wars location near North Yankton / Cayo Perico
	
	
}



---                                                                     ---
---   THIS IS A FREE RESOURCE PROVIDED TO CFXRE FORUMS FOR FIVEM USAGE   ---
---        DO NOT REUPLOAD OR MODIFY WITHOUT MY PERMISSION               ---
---        DO NOT CONVERT FOR SINGLE PLAYER USAGE WITHOUT MY PERMISSION  ---
---    YOU CAN COMMENT OUT PEDS AND TELEPORTERS IF YOU WISH TO          ---
---    DO NOT DM ME FOR ONE ON ONE SUPPORT.                             ---
