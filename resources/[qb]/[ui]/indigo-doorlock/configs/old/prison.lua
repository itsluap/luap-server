

-- 1 created by luap
Config.DoorList['prison-1'] = {
    objCoords = vec3(1844.998413, 2604.812500, 44.639778),
    objYaw = 90.0,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorLabel = 'Gate 1',
    doorRate = 1.0,
    locked = true,
    fixText = true,
    objName = 741314661,
    distance = 4,
    doorType = 'sliding',
}

-- 2 created by luap
Config.DoorList['prison-2'] = {
    objYaw = 90.0,
    doorLabel = 'Gate 2',
    objName = 741314661,
    fixText = true,
    doorRate = 1.0,
    objCoords = vec3(1818.542847, 2604.812500, 44.611004),
    distance = 4,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'sliding',
    locked = true,
}

-- 3 created by luap
Config.DoorList['prison-3'] = {
    pickable = true,
    fixText = false,
    doorLabel = 'Entrance to Lobby',
    objName = -1033001619,
    objYaw = 89.890563964844,
    doorRate = 1.0,
    objCoords = vec3(1845.197998, 2585.239990, 46.099289),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    locked = true,
}

-- 4 created by luap
Config.DoorList['prison-4'] = {
    pickable = true,
    fixText = false,
    doorLabel = 'Reception Desk',
    objName = -1033001619,
    objYaw = 270.48828125,
    doorRate = 1.0,
    objCoords = vec3(1837.713989, 2595.185059, 46.099289),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    locked = true,
}

-- 5 created by luap
Config.DoorList['prison-5'] = {
    pickable = true,
    fixText = false,
    doorLabel = 'Behind Reception',
    objName = -1033001619,
    objYaw = 89.890563964844,
    doorRate = 1.0,
    objCoords = vec3(1834.002075, 2591.110840, 46.099289),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    locked = true,
}

-- 6 created by luap
Config.DoorList['prison-6'] = {
    pickable = true,
    fixText = false,
    doorLabel = 'To Processing',
    objName = -1033001619,
    objYaw = 89.890563964844,
    doorRate = 1.0,
    objCoords = vec3(1837.697021, 2585.239990, 46.099289),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    locked = true,
}

-- 7 created by luap
Config.DoorList['prison-7'] = {
    pickable = true,
    fixText = false,
    doorLabel = 'Rear Door (proceesing)',
    objName = -1033001619,
    objYaw = 89.890563964844,
    doorRate = 1.0,
    objCoords = vec3(1826.466064, 2585.270996, 46.099289),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    locked = true,
}

-- 8 created by luap
Config.DoorList['prison-8'] = {
    pickable = true,
    fixText = false,
    doorLabel = 'To Hallway',
    objName = -1033001619,
    objYaw = 359.62673950195,
    doorRate = 1.0,
    objCoords = vec3(1827.364990, 2587.546875, 46.099289),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    locked = true,
}

-- 9 created by luap
Config.DoorList['prison-9'] = {
    pickable = true,
    fixText = false,
    doorLabel = 'To outside hallway',
    objName = -1033001619,
    objYaw = 89.890563964844,
    doorRate = 1.0,
    objCoords = vec3(1819.129028, 2593.639893, 46.099289),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    locked = true,
}

-- 10 created by luap
Config.DoorList['prison-10'] = {
    doors = {
        {objName = 1645000677, objYaw = 89.926338195801, objCoords = vec3(1791.062988, 2595.103027, 46.311764)},
        {objName = 262839150, objYaw = 270.07366943359, objCoords = vec3(1791.114014, 2592.503906, 46.312473)}
    },
    pickable = true,
    doorRate = 1.0,
    doorLabel = 'Cell Lobby Entrance',
    distance = 2,
    locked = true,
    doorType = 'double',
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
}


-- 11 created by luap
Config.DoorList['prison-11'] = {
    locked = true,
    objName = 430324891,
    fixText = false,
    objYaw = 159.91355895996,
    pickable = true,
    objCoords = vec3(1785.808472, 2590.019531, 44.797031),
    doorRate = 1.0,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    doorLabel = 'To Cells',
    distance = 2,
}

-- 12 created by luap
Config.DoorList['prison-12'] = {
    locked = true,
    objName = 262839150,
    fixText = false,
    objYaw = 359.88809204102,
    pickable = true,
    objCoords = vec3(1786.383545, 2600.229004, 46.089169),
    doorRate = 1.0,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    doorLabel = 'Rear Exit (Cell Lobby)',
    distance = 2,
}

-- 13 created by luap
Config.DoorList['prison-13'] = {
    locked = true,
    objName = 1028191914,
    fixText = false,
    objYaw = 0.12177976965904,
    pickable = true,
    objCoords = vec3(1782.371460, 2595.814453, 45.972954),
    doorRate = 1.0,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    doorLabel = 'Rear Kitchen Exit',
    distance = 2,
}

-- 14 created by luap
Config.DoorList['prison-14'] = {
    locked = true,
    objName = 1028191914,
    fixText = false,
    objYaw = 1.4478982686996,
    pickable = true,
    objCoords = vec3(1780.351562, 2596.023438, 50.838913),
    doorRate = 1.0,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    doorLabel = 'Watch Tower',
    distance = 2,
}

-- 15 created by luap
Config.DoorList['prison-15'] = {
    locked = true,
    objName = 1028191914,
    fixText = false,
    objYaw = 270.10833740234,
    pickable = true,
    objCoords = vec3(1787.710571, 2606.000488, 50.732082),
    doorRate = 1.0,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    doorLabel = 'Upstairs Door to Visitation',
    distance = 2,
}

-- 16 created by luap
Config.DoorList['prison-16'] = {
    locked = true,
    objName = 1028191914,
    fixText = false,
    objYaw = 269.76599121094,
    pickable = true,
    objCoords = vec3(1781.949951, 2613.575928, 46.150200),
    doorRate = 1.0,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    doorLabel = 'Civilian Visitation',
    distance = 2,
}

-- Outside to Visitation created by luap
Config.DoorList['prison-17'] = {
    doors = {
        {objName = 262839150, objYaw = 180.0584564209, objCoords = vec3(1784.525024, 2609.673096, 46.301571)},
        {objName = 1645000677, objYaw = 359.88809204102, objCoords = vec3(1787.121704, 2609.730957, 46.301567)}
    },
    pickable = true,
    doorLabel = 'Prison Outside to Visitation',
    doorRate = 1.0,
    doorType = 'double',
    locked = true,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    distance = 2,
}


-- 18 created by luap
Config.DoorList['prison-18'] = {
    locked = true,
    objName = 1028191914,
    fixText = false,
    objYaw = 89.728782653809,
    pickable = true,
    objCoords = vec3(1764.964478, 2608.424561, 50.732082),
    doorRate = 1.0,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    doorType = 'door',
    doorLabel = 'The Hole Reception',
    distance = 2,
}




-- 19 created by luap
Config.DoorList['prison-19'] = {
    doorType = 'door',
    objName = 430324891,
    locked = true,
    doorLabel = 'The Hole',
    distance = 2,
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    fixText = false,
    objYaw = 180.33160400391,
    objCoords = vec3(1763.168457, 2600.225586, 49.553181),
}

-- 20 created by luap
Config.DoorList['prison-20'] = {
    doorType = 'door',
    objName = 871712474,
    locked = true,
    doorLabel = 'The Hole Cell 1',
    distance = 1,
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    fixText = false,
    objYaw = 270.4482421875,
    objCoords = vec3(1762.773560, 2596.512451, 50.670692),
}

-- 21 created by luap
Config.DoorList['prison-21'] = {
    doorType = 'door',
    objName = 871712474,
    locked = true,
    doorLabel = 'The Hole Cell 2',
    distance = 1,
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    fixText = false,
    objYaw = 89.728782653809,
    objCoords = vec3(1765.196533, 2597.699463, 50.670692),
}

-- 22 created by luap
Config.DoorList['prison-22'] = {
    doorType = 'door',
    objName = 871712474,
    locked = true,
    doorLabel = 'The Hole Cell 3',
    distance = 1,
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    fixText = false,
    objYaw = 270.4482421875,
    objCoords = vec3(1762.779541, 2593.567627, 50.670692),
}

-- 23 created by luap
Config.DoorList['prison-23'] = {
    doorType = 'door',
    objName = 871712474,
    locked = true,
    doorLabel = 'The Hole Cell 4',
    distance = 1,
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    fixText = false,
    objYaw = 89.728782653809,
    objCoords = vec3(1765.189575, 2594.758545, 50.670692),
}

-- 24 created by luap
Config.DoorList['prison-24'] = {
    doorType = 'door',
    objName = 871712474,
    locked = true,
    doorLabel = 'The Hole Cell 5',
    distance = 1,
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    fixText = false,
    objYaw = 270.4482421875,
    objCoords = vec3(1762.778564, 2590.628662, 50.670692),
}

-- 25 created by luap
Config.DoorList['prison-25'] = {
    doorType = 'door',
    objName = 871712474,
    locked = true,
    doorLabel = 'The Hole Cell 6',
    distance = 1,
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    fixText = false,
    objYaw = 89.728782653809,
    objCoords = vec3(1765.189575, 2591.818604, 50.670692),
}

-- 26 created by luap
Config.DoorList['prison-26'] = {
    doorType = 'door',
    objName = 871712474,
    locked = true,
    doorLabel = 'The Hole Cell 7',
    distance = 1,
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    fixText = false,
    objYaw = 270.4482421875,
    objCoords = vec3(1762.766479, 2587.677490, 50.670692),
}

-- 27 created by luap
Config.DoorList['prison-27'] = {
    doorType = 'door',
    objName = 871712474,
    locked = true,
    doorLabel = 'The Hole Cell 8',
    distance = 1,
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    fixText = false,
    objYaw = 89.728782653809,
    objCoords = vec3(1765.191528, 2588.867432, 50.670692),
}

-- 28 created by luap
Config.DoorList['prison-28'] = {
    doorRate = 1.0,
    locked = true,
    fixText = false,
    doorType = 'door',
    objYaw = 90.068550109863,
    objCoords = vec3(1769.166992, 2619.261963, 46.150200),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    objName = 1028191914,
    doorLabel = 'Prisoner Visitation Exit',
    pickable = true,
}

-- 29 created by luap
Config.DoorList['prison-29'] = {
    doorRate = 1.0,
    locked = true,
    fixText = false,
    doorType = 'door',
    objYaw = 359.74740600586,
    objCoords = vec3(1766.896973, 2615.484131, 46.154190),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    objName = 1028191914,
    doorLabel = 'Conjugal Visits',
    pickable = true,
}

-- 30 created by luap
Config.DoorList['prison-30'] = {
    objYaw = 269.76599121094,
    locked = true,
    doorType = 'door',
    fixText = false,
    objCoords = vec3(1769.170044, 2613.575928, 46.150200),
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    distance = 2,
    pickable = true,
    objName = 1028191914,
    doorLabel = 'Conjugal Visits Civilian',
    doorRate = 1.0,
}

-- 31 created by luap
Config.DoorList['prison-31'] = {
    doorRate = 1.0,
    locked = true,
    fixText = false,
    doorType = 'door',
    objYaw = 269.85900878906,
    objCoords = vec3(1759.910034, 2614.645020, 45.934784),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    objName = 1645000677,
    doorLabel = 'Conjugal Visits Exit',
    pickable = true,
}

-- 32 created by luap
Config.DoorList['prison-32'] = {
    doorRate = 1.0,
    locked = true,
    fixText = false,
    doorType = 'door',
    objYaw = 90.163139343262,
    objCoords = vec3(1783.136963, 2548.623047, 45.978088),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    objName = 1028191914,
    doorLabel = 'Armory',
    pickable = true,
}

-- 33 created by luap
Config.DoorList['prison-33'] = {
    doorRate = 1.0,
    locked = true,
    fixText = false,
    doorType = 'door',
    objYaw = 269.73611450195,
    objCoords = vec3(1791.682251, 2551.343262, 46.092167),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    objName = 262839150,
    doorLabel = 'Hospital Exit',
    pickable = true,
}

-- 34 created by luap
Config.DoorList['prison-34'] = {
    doorRate = 1.0,
    locked = true,
    fixText = false,
    doorType = 'door',
    objYaw = 90.163139343262,
    objCoords = vec3(1786.276001, 2551.772949, 49.754578),
    distance = 2,
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    objName = 1028191914,
    doorLabel = 'Office 1',
    pickable = true,
}

-- 35 created by luap
Config.DoorList['prison-35'] = {
    authorizedJobs = { 'police', 'sheriff', 'trooper' },
    distance = 2,
    doors = {
        {objName = 1028191914, objYaw = 90.163139343262, objCoords = vec3(1781.755981, 2553.373047, 49.754578)},
        {objName = 1028191914, objYaw = 269.45782470703, objCoords = vec3(1781.805054, 2550.772949, 49.754578)}
    },
    doorLabel = 'Office 2',
    pickable = true,
    locked = true,
    doorRate = 1.0,
    doorType = 'double',
}