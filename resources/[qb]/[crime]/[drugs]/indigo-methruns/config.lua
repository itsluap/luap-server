Config = Config or {}

Config.Inventory = 'qb' -- qb/lj , ox = ox_inventory
Config.UseMethCooldown = false -- true/false
Config.CoolDown = 10 --- Cooldown until can start next run default is 10 minutes
Config.CopNeeded = 0 -- Cops needed to do the runs
Config.PoliceJobName = 'police'
Config.Dispatch = 'ps-dispatch'  -- ps-dispatch / cd-dispatch  (type of dispatch you use)
Config.PedHash = `g_m_y_lost_02` -- Ped model of the starting ped
Config.PedPos = vector4(923.02, -1304.02, 26.07, 215.21) -- Starting ped location
Config.PhoneItemName = 'phone'
Config.Phone = 'qb' -- qb / gks / qs
Config.MinRep = 3 -- Rep given at the end ( this is a random between Config.MinRep and Config.MaxRep)
Config.MaxRep = 5
Config.LevelRep = 100-- Amount of reputation needed to get higher rewards etc
Config.StartItem = 'meth'-- Item needed to start the runs
Config.UseItemsStacked = true -- have the items you put in the start ped inventory stackeds
Config.Caseitem = 'methcase'
Config.RequiredAmount = 20 -- Amount of the starting item you need
----Low Rep Settings----
Config.LowRepItem = 'floor-cleaner'
Config.MinMethPayoutLowRep = 25000
Config.MaxMethPayoutLowRep = 50000
Config.LowRepPedHealth = 200
Config.LowRepPedArmor = 100
Config.LowRepPedAccuracy = 45
Config.LowRepPedWeapon = `WEAPON_PISTOL`
----End of Low Rep Settings----

----High Rep Settings----
Config.HighRepItem = 'methcontainer'
Config.MinMethPayoutHighRep = 250000
Config.MaxMethPayoutHighRep = 500000
Config.HighRepPedHealth = 200
Config.HighRepPedArmor = 350
Config.HighRepPedAccuracy = 80
Config.HighRepPedWeapon = `WEAPON_SMG`
----End of Hugh Rep Settings----
Config.ItemAmount = math.random(4, 6) -- Amount of items given when you pickup from the ped
Config.LocationTimer = 3 -- Timer till you get a drop off location default is 3 minutes

----Meth Vehicle Settings----
Config.CarSpawns = {
    vector4(-2036.63, -264.71, 23.39, 101.61),
    vector4(-602.36, -2340.84, 13.83, 322.93),
    vector4(-571.49, -1781.71, 22.46, 148.95),
    vector4(-374.32, -2282.17, 7.61, 183.6),
    vector4(-973.4, -2693.37, 13.83, 330.36),
    vector4(-1241.51, -1413.37, 4.32, 126.4),
    vector4(-1574.22, -1024.22, 7.68, 227.38)
}
Config.VehicleNames = {
    `baller6`,
    `kuruma2`,
    `cog552`,
    `paragon2`,
    `schafter6`,
    `xls2`
}
----End of Meth Vehicle Settings----

Config.AmbushPed = `csb_ramp_mex` -- Peds that spawn to ambush after pickup

----Pickup Settings----
Config.PickupLocations = {
    [1] = {
        PedSpawn = vector4(2675.72, 3499.55, 53.3, 341.41),-- Location where the ped is to pick up products
        AmbushSpawn = {
            vector4(2692.77, 3538.69, 52.01, 52.05),-- Locations the ambush peds spawn
            vector4(2690.33, 3539.04, 52.07, 47.1),
            vector4(2653.05, 3497.87, 54.04, 336.58),
            vector4(2628.64, 3562.32, 51.48, 219.01)
        },
    },
    [2] = {
        PedSpawn = vector4(904.42, 3655.37, 32.57, 305.82),
        AmbushSpawn = {
            vector4(922.41, 3680.38, 31.97, 113.29),
            vector4(948.72, 3664.56, 31.89, 98.97),
            vector4(918.85, 3643.14, 32.62, 232.59),
            vector4(911.92, 3649.78, 36.13, 288.17)
        },
    },
    [3] = {
        PedSpawn = vector4(217.98, 2581.57, 45.95, 236.88),
        AmbushSpawn = {
            vector4(217.68, 2559.36, 48.9, 55.8),
            vector4(246.95, 2554.6, 47.28, 324.24),
            vector4(253.42, 2590.36, 45.34, 120.16),
            vector4(259.57, 2593.89, 50.63, 153.58)
        },
    },
    [4] = {
        PedSpawn = vector4(-106.12, -2230.33, 7.81, 94.02),
        AmbushSpawn = {
            vector4(-111.88, -2212.83, 7.81, 217.8),
            vector4(-83.84, -2209.27, 7.81, 157.86),
            vector4(-84.12, -2241.95, 8.08, 87.31),
            vector4(-124.7, -2240.25, 7.81, 192.27)
        },
    }
}
----End of Pickup Settings----

----DropLocation Settings----
Config.DropLocations = {
    vector4(2007.69, 4986.01, 41.38, 33.12),
    vector4(-1131.57, 2694.76, 18.8, 324.08),
    vector4(-1168.62, -2021.93, 13.16, 322.51),
    vector4(-907.65, -1514.36, 5.02, 19.19),
    vector4(703.53, -1143.09, 23.61, 270.95),
    vector4(1597.51, -1709.84, 88.13, 298.06),
    vector4(1132.67, -2339.57, 30.68, 261.66),
    vector4(471.76, -1873.69, 26.87, 119.23),
    vector4(-563.09, 311.26, 84.42, 177.92),
    vector4(250.1, 379.32, 105.53, 250.64),
    vector4(1129.49, -443.92, 66.49, 341.04),
    vector4(962.36, -1155.93, 25.59, 92.14)
}
----End of Drop Location Settings----

