--[[
Vehicle Classes:
0: Compacts     1: Sedans       2: SUVs         3: Coupes       4: Muscle       5: Sports Classics
6: Sports       7: Super        8: Motorcycles  9: Off-road     10: Industrial  11: Utility
12: Vans        13: Cycles      14: Boats       15: Helicopters 16: Planes      17: Service
18: Emergency   19: Military    20: Commercial  21: Trains
--]]

Config = Config or {}

Config.Locations = {
    ['Tunershop'] = {
        settings = {
            label = 'Tunershop',
            welcomeLabel = "Welcome to the Tunershop!",
            enabled = true,
        },
        blip = {
            label = 'Tunershop',
            coords = vector3(140.6093, -3030.3933, 7.0409),
            sprite = 446,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Tunershop",
            icon = "material-icons",
            materialIcon = 'construction',
        },
        restrictions = { deniedClasses = { 18 } },
        zones = {
            { coords = vector3(144.96, -3030.46, 7.06), length = 6.0, width = 4.0, heading = 180.0, minZ = 6.0, maxZ = 10.0 },
            { coords = vector3(135.92, -3030.5, 7.04), length = 6.0, width = 4.0, heading = 180.0, minZ = 6.0, maxZ = 10.0 },
        }
    },
    ['LSC'] = {
        settings = {
            label = 'Los Santos Customs',
            welcomeLabel = "Welcome to the Los Santos Customs!",
            enabled = true,
        },
        blip = {
            label = 'Los Santos Customs',
            coords = vector3(-337.6, -136.7, 39.01),
            sprite = 446,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Los Santos Customs",
            icon = "material-icons",
            materialIcon = 'construction',
        },
        restrictions = { deniedClasses = { 18 } },
        zones = {
            { coords = vector3(-337.6, -136.7, 39.01), length = 6.0, width = 4.0, heading = 180.0, minZ = 6.0, maxZ = 10.0 },
            --{ coords = vector3(135.92, -3030.5, 7.04), length = 6.0, width = 4.0, heading = 180.0, minZ = 6.0, maxZ = 10.0 },
        }
    },
}