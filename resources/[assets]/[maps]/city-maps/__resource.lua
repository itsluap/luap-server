resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

this_is_a_map 'yes'

data_file 'TIMECYCLEMOD_FILE' 'nutt_timecycle_mods_1.xml'

files {
         "nutt_timecycle_mods_1.xml",
}

files {
    'shellprops.ytyp',
    'stream/bossroom/gta5.meta',
    'stream/bossroom/water.xml',
}

data_file 'DLC_ITYP_REQUEST' 'shellprops.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/s_vg_track.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/vg_jdm_props.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/patoche_shop_list.ytyp'

-- sheriff mlo --
data_file('DLC_ITYP_REQUEST')('stream/v2_sheriff_props.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/int_sheriff_main.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/int_sheriff_stairs2.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/int_sheriff_second.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/int_sheriff_stairs1.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/int_sheriff_first.ytyp')

client_script 'client.lua' -- casino