resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"
description "Car Add-on"

data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'
-- specfiy the names of the items being added within this (same as in the lang file in a dlc pack(kinda, the formatting is different))
client_script 'names.lua'

files {
    'carcols.meta',
    'data/**/handling.meta',
    'data/**/vehiclelayouts.meta',
    'data/**/vehicles.meta',
    'data/**/carcols.meta',
    'data/**/carvariations.meta',
    'data/**/vehicle_names.meta',
    'audioconfig/*.dat151.rel',
    'audioconfig/*.dat54.rel',
    "audioconfig/*.dat10.rel",
    'sfx/**/*.awc',
}