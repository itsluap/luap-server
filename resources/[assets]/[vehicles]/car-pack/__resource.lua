resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
description "Car Add-on"

data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'

-- add veryron sound

files {
    'data/**/handling.meta',
    'data/**/vehiclelayouts.meta',
    'data/**/vehicles.meta',
    'data/**/carcols.meta',
    'data/**/carvariations.meta',
    'audioconfig/w211_game.dat151.nametable',
    'audioconfig/w211_game.dat151.rel',
    'audioconfig/w211_sounds.dat54.nametable',
    'audioconfig/w211_sounds.dat54.rel',
    'audioconfig/488sound_game.dat151.rel',
    'audioconfig/488sound_sounds.dat54.rel',
    'audioconfig/apollosv8_game.dat151.rel',
    'audioconfig/apollosv8_sounds.dat54.rel',
    'audioconfig/avesv_game.dat151.rel',
    'audioconfig/avesv_sounds.dat54.rel',
    'audioconfig/avesv_game.dat151.rel',
    'audioconfig/avesv_sounds.dat54.rel',
    'audioconfig/c6v8sound_game.dat151.rel',
    'audioconfig/c6v8sound_sounds.dat54.rel',
    'audioconfig/diablov12_game.dat151.rel',
    'audioconfig/diablov12_sounds.dat54.rel',
    'audioconfig/f40v8_game.dat151.rel',
    'audioconfig/f40v8_sounds.dat54.rel',
    'audioconfig/f50v12_game.dat151.rel',
    'audioconfig/f50v12_sounds.dat54.rel',
    'audioconfig/ferrarif12_game.dat151.rel',
    'audioconfig/ferrarif12_sounds.dat54.rel',
    'audioconfig/gtaspanov10_game.dat151.rel',
    'audioconfig/gtaspanov10_sounds.dat54.rel',
    'audioconfig/laferrarisound_game.dat151.rel',
    'audioconfig/laferrarisound_sounds.dat54.rel',
    'audioconfig/mclarenv8_game.dat151.rel',
    'audioconfig/mclarenv8_sounds.dat54.rel',
    'audioconfig/murciev12_game.dat151.rel',
    'audioconfig/murciev12_sounds.dat54.rel',
    'audioconfig/perfov10_game.dat151.rel',
    'audioconfig/perfov10_sounds.dat54.rel',
    'audioconfig/sestov10_game.dat151.rel',
    'audioconfig/sestov10_sounds.dat54.rel',
    'audioconfig/urusv8_game.dat151.rel',
    'audioconfig/urusv8_sounds.dat54.rel',
    'audioconfig/veyronsound_game.dat151.rel',
    'audioconfig/veyronsound_sounds.dat54.rel',
    'audioconfig/viperv10_game.dat151.rel',
    'audioconfig/viperv10_sounds.dat54.rel',
    'sfx/dlc_w211/w211.awc',
    'sfx/dlc_w211/w211_npc.awc',
    'sfx/dlc_488sound/488sound.awc',
    'sfx/dlc_488sound/488sound_npc.awc',
    'sfx/dlc_apollosv8/apollosv8.awc',
    'sfx/dlc_apollosv8/apollosv8_npc.awc',
    'sfx/dlc_avesv/avesv.awc',
    'sfx/dlc_avesv/avesv_npc.awc',
    'sfx/dlc_avesvv12/avesvv12.awc',
    'sfx/dlc_avesvv12/avesvv12_npc.awc',
    'sfx/dlc_c6v8sound/c6v8sound.awc',
    'sfx/dlc_c6v8sound/c6v8sound_npc.awc',
    'sfx/dlc_diablov12/diablov12.awc',
    'sfx/dlc_diablov12/diablov12_npc.awc',
    'sfx/dlc_f40v8/f40v8.awc',
    'sfx/dlc_f40v8/f40v8_npc.awc',
    'sfx/dlc_f50v12/f50v12.awc',
    'sfx/dlc_f50v12/f50v12_npc.awc',
    'sfx/dlc_ferrarif12/ferrarif12.awc',
    'sfx/dlc_ferrarif12/ferrarif12_npc.awc',
    'sfx/dlc_gtaspanov10/gtaspanov10.awc',
    'sfx/dlc_gtaspanov10/gtaspanov10_npc.awc',
    'sfx/dlc_laferrarisound/laferrarisound.awc',
    'sfx/dlc_mclarenv8/mclarenv8.awc',
    'sfx/dlc_mclarenv8/mclarenv8_npc.awc',
    'sfx/dlc_murciev12/murciev12.awc',
    'sfx/dlc_murciev12/murciev12_npc.awc',
    'sfx/dlc_perfov10/perfov10.awc',
    'sfx/dlc_perfov10/perfov10_npc.awc',
    'sfx/dlc_sestov10/sestov10.awc',
    'sfx/dlc_sestov10/sestov10_npc.awc',
    'sfx/dlc_urusv8/urusv8.awc',
    'sfx/dlc_urusv8/urusv8_npc.awc',
    'sfx/dlc_veyronsound/veyronsound.awc',
    'sfx/dlc_veyronsound/veyronsound_npc.awc',
    'sfx/dlc_viperv10/viperv10.awc',
    'sfx/dlc_viperv10/viperv10_npc.awc',
    'sfx/dlc_viperv10/viperv10.awc',
    'sfx/dlc_viperv10/viperv10_npc.awc',
    'audioconfig/lambov10_game.dat151.rel',
    'audioconfig/lambov10_sounds.dat54.rel',
    'sfx/dlc_lambov10/lambov10.awc',
    'sfx/dlc_lambov10/lambov10_npc.awc',
    'audioconfig/musv8_game.dat151.rel',
    'audioconfig/musv8_sounds.dat54.rel',
    'sfx/dlc_musv8/musv8.awc',
    'sfx/dlc_musv8/musv8_npc.awc',
    'audioconfig/brabus850_game.dat151.rel',
    'audioconfig/brabus850_sounds.dat54.rel',
    'sfx/dlc_brabus850/brabus850.awc',
    'sfx/dlc_brabus850/brabus850_npc.awc',
    'audioconfig/shonen_game.dat151.rel',
    'audioconfig/shonen_sounds.dat54.rel',
    'sfx/dlc_shonen/shonen.awc',
    'sfx/dlc_shonen/shonen_npc.awc',
    'audioconfig/toysupmk4_game.dat151.nametable',
    'audioconfig/toysupmk4_game.dat151.rel',
    'audioconfig/toysupmk4_sounds.dat54.nametable',
    'audioconfig/toysupmk4_sounds.dat54.rel',
    'sfx/dlc_toysupmk4/toysupmk4.awc',
    'sfx/dlc_toysupmk4/toysupmk4_npc.awc',
    'audioconfig/rb26dett_amp.dat10.rel',
    'audioconfig/rb26dett_game.dat151.rel',
    'audioconfig/rb26dett_sounds.dat54.rel',
    'sfx/dlc_rb26dett/rb26dett.awc',
    'sfx/dlc_rb26dett/rb26dett_npc.awc',
    'audioconfig/rotary7_game.dat151.rel',
    'audioconfig/rotary7_sounds.dat54.rel',
    'sfx/dlc_rotary7/rotary7.awc',
    'sfx/dlc_rotary7/rotary7_npc.awc',
    'audioconfig/m297zonda_amp.dat10.nametable',
    'audioconfig/m297zonda_amp.dat10.rel',
    'audioconfig/m297zonda_game.dat151.nametable',
    'audioconfig/m297zonda_game.dat151.rel',
    'audioconfig/m297zonda_sounds.dat54.nametable',
    'audioconfig/m297zonda_sounds.dat54.rel',
    'sfx/dlc_m297zonda/m297zonda.awc',
    'sfx/dlc_m297zonda/m297zonda_npc.awc',
    'audioconfig/m158huayra_amp.dat10.nametable',
    'audioconfig/m158huayra_amp.dat10.rel',
    'audioconfig/m158huayra_game.dat151.nametable',
    'audioconfig/m158huayra_game.dat151.rel',
    'audioconfig/m158huayra_sounds.dat54.nametable',
    'audioconfig/m158huayra_sounds.dat54.rel',
    'sfx/dlc_m158huayra/m158huayra.awc',
    'sfx/dlc_m158huayra/m158huayra_npc.awc',
    'audioconfig/k20a_amp.dat10.nametable',
    'audioconfig/k20a_amp.dat10.rel',
    'audioconfig/k20a_game.dat151.nametable',
    'audioconfig/k20a_game.dat151.rel',
    'audioconfig/k20a_sounds.dat54.nametable',
    'audioconfig/k20a_sounds.dat54.rel',
    'sfx/dlc_k20a/k20a.awc',
    'sfx/dlc_k20a/k20a_npc.awc',
    'audioconfig/gt3flat6_amp.dat10.nametable',
    'audioconfig/gt3flat6_amp.dat10.rel',
    'audioconfig/gt3flat6_game.dat151.nametable',
    'audioconfig/gt3flat6_game.dat151.rel',
    'audioconfig/gt3flat6_sounds.dat54.nametable',
    'audioconfig/gt3flat6_sounds.dat54.rel',
    'sfx/dlc_gt3flat6/gt3flat6.awc',
    'sfx/dlc_gt3flat6/gt3flat6_npc.awc',
    'audioconfig/predatorv8_amp.dat10.nametable',
    'audioconfig/predatorv8_amp.dat10.rel',
    'audioconfig/predatorv8_game.dat151.nametable',
    'audioconfig/predatorv8_game.dat151.rel',
    'audioconfig/predatorv8_sounds.dat54.nametable',
    'audioconfig/predatorv8_sounds.dat54.rel',
    'sfx/dlc_predatorv8/predatorv8.awc',
    'sfx/dlc_predatorv8/predatorv8_npc.awc',
    'audioconfig/p60b40_amp.dat10.nametable',
    'audioconfig/p60b40_amp.dat10.rel',
    'audioconfig/p60b40_game.dat151.nametable',
    'audioconfig/p60b40_game.dat151.rel',
    'audioconfig/p60b40_sounds.dat54.nametable',
    'audioconfig/p60b40_sounds.dat54.rel',
    'sfx/dlc_p60b40/p60b40.awc',
    'sfx/dlc_p60b40/p60b40_npc.awc',
    'audioconfig/elegyx_amp.dat10.nametable',
    'audioconfig/elegyx_amp.dat10.rel',
    'audioconfig/elegyx_game.dat151.nametable',
    'audioconfig/elegyx_game.dat151.rel',
    'audioconfig/elegyx_sounds.dat54.nametable',
    'audioconfig/elegyx_sounds.dat54.rel',
    'sfx/dlc_elegyx/elegyx.awc',
    'sfx/dlc_elegyx/elegyx_npc.awc',
    'audioconfig/cvpiv8_game.dat151.rel',
    'audioconfig/cvpiv8_sounds.dat54.rel',
    'sfx/dlc_cvpiv8/cvpiv8.awc',
    'sfx/dlc_cvpiv8/cvpiv8_npc.awc'
}

-- mercedes sound
data_file 'AUDIO_GAMEDATA' 'audioconfig/w211_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/w211_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_w211'

-- for bdragon

data_file 'AUDIO_GAMEDATA' 'audioconfig/elegyx_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/elegyx_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_elegyx'

-- sound pack

data_file 'AUDIO_GAMEDATA' 'audioconfig/lambov10_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/lambov10_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_lambov10'
data_file 'AUDIO_GAMEDATA' 'audioconfig/musv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/musv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_musv8'
data_file 'AUDIO_GAMEDATA' 'audioconfig/brabus850_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/brabus850_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_brabus850'
data_file 'AUDIO_GAMEDATA' 'audioconfig/shonen_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/shonen_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_shonen'
data_file 'AUDIO_GAMEDATA' 'audioconfig/toysupmk4_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/toysupmk4_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_toysupmk4'
data_file 'AUDIO_SYNTHDATA' 'audioconfig/rb26dett_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/rb26dett_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/rb26dett_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_rb26dett'
data_file 'AUDIO_GAMEDATA' 'audioconfig/rotary7_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/rotary7_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_rotary7'
data_file 'AUDIO_SYNTHDATA' 'audioconfig/m297zonda_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/m297zonda_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/m297zonda_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_diablov12'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_f40v8'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_f50v12'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_ferrarif12'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_murciev12'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_sestov10'
data_file 'AUDIO_GAMEDATA' 'audioconfig/diablov12_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/diablov12_sounds.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/f40v8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/f40v8_sounds.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/f50v12_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/f50v12_sounds.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/ferrarif12_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/ferrarif12_sounds.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/murciev12_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/murciev12_sounds.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/sestov10_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/sestov10_sounds.dat'
data_file 'AUDIO_SYNTHDATA' 'audioconfig/m158huayra_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/m158huayra_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/m158huayra_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_m158huayra'
data_file 'AUDIO_SYNTHDATA' 'audioconfig/k20a_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/k20a_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/k20a_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_k20a'
data_file 'AUDIO_SYNTHDATA' 'audioconfig/gt3flat6_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/gt3flat6_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/gt3flat6_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_gt3flat6'
data_file 'AUDIO_SYNTHDATA' 'audioconfig/predatorv8_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/predatorv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/predatorv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_predatorv8'
data_file 'AUDIO_SYNTHDATA' 'audioconfig/p60b40_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/p60b40_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/p60b40_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_p60b40'
data_file 'AUDIO_GAMEDATA' 'audioconfig/cvpiv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/cvpiv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_cvpiv8'
data_file 'AUDIO_GAMEDATA' 'audioconfig/apollosv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/apollosv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_apollosv8'
data_file 'AUDIO_GAMEDATA' 'audioconfig/488sound_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/488sound_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_488sound'
data_file 'AUDIO_GAMEDATA' 'audioconfig/avesv_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/avesv_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_avesv'
--data_file 'AUDIO_GAMEDATA' 'audioconfig/avesvv12_game.dat'
--data_file 'AUDIO_SOUNDDATA' 'audioconfig/avesvv12_sounds.dat'
--data_file 'AUDIO_WAVEPACK' 'sfx/dlc_avesvv12'
data_file 'AUDIO_GAMEDATA' 'audioconfig/c6v8sound_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/c6v8sound_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_c6v8sound'
data_file 'AUDIO_GAMEDATA' 'audioconfig/gtaspanov10_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/gtaspanov10_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_gtaspanov10'
data_file 'AUDIO_GAMEDATA' 'audioconfig/laferrarisound_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/laferrarisound_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_laferrarisound'
data_file 'AUDIO_GAMEDATA' 'audioconfig/mclarenv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/mclarenv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_mclarenv8'
data_file 'AUDIO_GAMEDATA' 'audioconfig/perfov10_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/perfov10_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_perfov10'
data_file 'AUDIO_GAMEDATA' 'audioconfig/urusv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/urusv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_urusv8'