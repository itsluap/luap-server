Config = {}

Config.BoxZones = {
    ["stripEffects"] = {
        name = "StripclubEffects",
        coords = vector3(121.55, -1282.97, 29.48),
        length = 0.2,
        width = 0.2,
        heading = 30.0,
        debugPoly = false,
        minZ = 29.58,
        maxZ = 29.78,
        options = {
            {
                type = "client",
                event = "qb-stripclub:client:open:effect:panel",
                icon = "fas fa-hand-paper",
                label = "Effects Dimmer",
                job = "vanilla",
            },
        },
        distance = 2.5
    },
}