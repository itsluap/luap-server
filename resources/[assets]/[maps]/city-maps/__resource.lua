fx_version 'bodacious'
games {'gta5'}

this_is_a_map 'yes'

data_file 'TIMECYCLEMOD_FILE' 'nutt_timecycle_mods_1.xml'

files {
    'shellprops.ytyp',
    'stream/bossroom/gta5.meta',
    'stream/bossroom/water.xml',
    "nutt_timecycle_mods_1.xml",
    "interiorproxies.meta"
}

data_file 'DLC_ITYP_REQUEST' 'shellprops.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/s_vg_track.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/vg_jdm_props.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/patoche_shop_list.ytyp'

data_file 'TIMECYCLEMOD_FILE' 'nutt_timecycle_mods_1.xml'

data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

-- sheriff mlo --
data_file('DLC_ITYP_REQUEST')('stream/v2_sheriff_props.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/int_sheriff_main.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/int_sheriff_stairs2.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/int_sheriff_second.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/int_sheriff_stairs1.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/int_sheriff_first.ytyp')

client_script 'client.lua' -- casino