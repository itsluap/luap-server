

-- 1 created by luap
Config.DoorList['mrpd-1'] = {
    doorLabel = 'side doors',
    distance = 1,
    authorizedJobs = { ['police'] = 0 },
    locked = true,
    doorRate = 1.0,
    doorType = 'double',
    doors = {
        {objName = -1547307588, objYaw = 180.00001525879, objCoords = vec3(458.208740, -972.254272, 30.815308)},
        {objName = -1547307588, objYaw = 0.0, objCoords = vec3(455.886169, -972.254272, 30.815308)}
    },
}

-- 2 created by luap
Config.DoorList['mrpd-2'] = {
    distance = 5,
    doorRate = 1.0,
    objYaw = 0.0,
    doorLabel = 'left garage door',
    objName = 2130672747,
    authorizedJobs = { ['police'] = 0 },
    locked = false,
    objCoords = vec3(431.411926, -1000.771667, 26.696609),
    fixText = false,
    doorType = 'garage',
}

-- 3 created by luap
Config.DoorList['mrpd-3'] = {
    authorizedJobs = { ['police'] = 0 },
    distance = 5,
    doorLabel = 'right garage door',
    objName = 2130672747,
    objCoords = vec3(452.300507, -1000.771667, 26.696609),
    fixText = false,
    objYaw = 0.0,
    doorRate = 1.0,
    locked = false,
    doorType = 'garage',
}