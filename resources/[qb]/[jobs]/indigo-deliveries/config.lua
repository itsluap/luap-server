Config = Config or {}

Config.JobNeeded = false -- if you need a specific job to do the deliveries true/false
Config.JobName = 'delivery' -- Job needed to do the deliveries if the config above is set to true
Config.JobPed = 's_m_m_ups_01' -- Model of the starting ped
Config.JobPedLocation = vector4(-429.53, -2786.3, 6.0, 53.77) -- Where the starting ped is
Config.JobPedAnimation = 'WORLD_HUMAN_CLIPBOARD'
Config.JobBlipName = 'Road Runner Deliveries' -- Blip of where the starting ped is

--- These should be self explanatory as its labeles as what it is
Config.JobPedBlipSprite = 304
Config.JobPedBlipSpriteColour = 32
Config.JobPedBlipSpriteScale = 0.75

--
Config.FuelScript = 'ps-fuel' -- ps-fuel/lj-fuel/ps-fuel Change to the fuel system you use here
Config.VehicleSpawn = vector4(-445.69, -2789.91, 5.39, 43.89) -- Spot the vehicle spawns

Config.PaymentMethod = 'cash' -- cash/bank how the groups gets paid out at the end
--- Different levels of Reputation best to not have it to low, unless you know how to balance it out with pay etc but can be whatever number you like
Config.DeliveryMidReputation = 1500
Config.DeliveryHighReputation = 2500

Config.DisableInventory = true -- blocks the player from going in the inventory while they have the package
Config.DisableSprintingWithPackages = true
Config.DisableJumpingWithPackages = true
Config.DisableVehicleEnteringWithPackages = true
Config.DisableCrouchWithPackages = true
Config.DisableAttackingWithPackages = true
Config.DisableAimingWithPackages = true

--- THESE LOCATIONS ARE SET TO WORK WITH DEFAULT STORE LOCATIONS
Config.Shops = {
    [1] = { -- Do not add a 4th table unless you know what you are doing, its not as simple as just copy and pasting in here
        Coords= { -- These coords are more to the lower part of the map add as many coords as you like 
            vector4(24.47, -1346.62, 29.5, 271.66),
            vector4(45.68, -1749.04, 29.61, 53.13),
            vector4(-661.96, -933.53, 21.83, 177.05),
            vector4(809.68, -2159.13, 29.62, 1.43),
            vector4(23.0, -1105.67, 29.8, 162.91),
        },
        Packages = {-- If you want a random amount of packages to deliver then replace the number with a math.random(10, 13) 
            minamount = 5,
            maxamount = 10,
        },
        Payment = {--If you want a random payments then replace the number with a math.random(350, 420)
            minamount = 250,
            maxamount = 420,
        },
        Reputation = 10, -- Reputation given after a delivery
    },
    [2] = {
        Coords= { -- These coords are more to the mid part of the map
            vector4(-3039.54, 584.38, 7.91, 17.27),
            vector4(-3242.97, 1000.01, 12.83, 357.57),
            vector4(2556.66, 380.84, 108.62, 356.67),
            vector4(372.66, 326.98, 103.57, 253.73),
            vector4(253.63, -51.02, 69.94, 72.91),
            vector4(2567.48, 292.59, 108.73, 349.68),
            vector4(-1118.59, 2700.05, 18.55, 221.89),
            vector4(841.92, -1035.32, 28.19, 1.56),
            vector4(-1304.19, -395.12, 36.7, 75.03),
        },
        Packages = {
            minamount = 12,
            maxamount = 15,
        },
        Payment = {
            minamount = 350,
            maxamount = 540,
        },
        Reputation = 10,
    },
    [3] = {
        Coords= { -- These coords are more to the top part of the map
            vector4(1728.07, 6415.63, 35.04, 242.95),
            vector4(1959.82, 3740.48, 32.34, 301.57),
            vector4(549.13, 2670.85, 42.16, 99.39),
            vector4(2677.47, 3279.76, 55.24, 335.08),
            vector4(2747.71, 3472.85, 55.67, 255.08),
            vector4(-421.83, 6136.13, 31.88, 228.2),
            vector4(1692.67, 3761.38, 34.71, 227.65),
            vector4(-331.23, 6085.37, 31.45, 228.02),
            vector4(-3173.31, 1088.85, 20.84, 244.18),
        },
        Packages = {
            minamount = 3,
            maxamount = 6,
        },
        Payment = {
            minamount = 620,
            maxamount = 840,
        },
        Reputation = 10,
    },
}



--THIS IS SET FOR IF YOU USE GABZ STORES ( BE SURE IF YOU ARE USING THIS YOU COMMENT OR DELETE THE CONFIG.SHOPS above) 

-- Config.Shops = {
--     [1] = { -- Do not add a 4th table unless you know what you are doing, its not as simple as just copy and pasting in here
--         Coords= { -- These coords are more to the lower part of the map add as many coords as you like 
--             vector4(24.47, -1346.62, 29.5, 271.66),
--             vector4(45.68, -1749.04, 29.61, 53.13),
--             vector4(-660.9, -939.88, 21.83, 274.54),
--             vector4(813.14, -2153.58, 29.62, 176.02),
--             vector4(18.19, -1109.8, 29.8, 346.24),
--         },
--         Packages = {-- If you want a random amount of packages to deliver then replace the number with a math.random(10, 13) 
--             minamount = 5,
--             maxamount = 10,
--         },
--         Payment = {--If you want a random payments then replace the number with a math.random(350, 420)
--             minamount = 250,
--             maxamount = 420,
--         },
--         Reputation = 10, -- Reputation given after a delivery
--     },
--     [2] = {
--         Coords= { -- These coords are more to the mid part of the map
--             vector4(-3039.54, 584.38, 7.91, 17.27),
--             vector4(-3242.97, 1000.01, 12.83, 357.57),
--             vector4(2556.66, 380.84, 108.62, 356.67),
--             vector4(372.66, 326.98, 103.57, 253.73),
--             vector4(247.1, -49.56, 69.94, 162.91),
--             vector4(2566.56, 299.27, 108.74, 94.81),
--             vector4(-1113.49, 2695.71, 18.55, 314.62),
--             vector4(842.86, -1028.3, 28.19, 95.83),
--             vector4(-1310.78, -392.54, 36.7, 169.5),
--         },
--         Packages = {
--             minamount = 12,
--             maxamount = 15,
--         },
--         Payment = {
--             minamount = 350,
--             maxamount = 540,
--         },
--         Reputation = 10,
--     },
--     [3] = {
--         Coords= { -- These coords are more to the top part of the map
--             vector4(1728.07, 6415.63, 35.04, 242.95),
--             vector4(1959.82, 3740.48, 32.34, 301.57),
--             vector4(549.13, 2670.85, 42.16, 99.39),
--             vector4(2677.47, 3279.76, 55.24, 335.08),
--             vector4(2747.71, 3472.85, 55.67, 255.08),
--             vector4(-421.83, 6136.13, 31.88, 228.2),
--             vector4(1697.05, 3755.89, 34.71, 324.73),
--             vector4(-327.05, 6079.69, 31.45, 313.44),
--             vector4(-3167.34, 1085.16, 20.84, 336.93),
--         },
--         Packages = {
--             minamount = 3,
--             maxamount = 6,
--         },
--         Payment = {
--             minamount = 620,
--             maxamount = 840,
--         },
--         Reputation = 10,
--     },
-- }

Config.BoxesData = {
    ['small_box'] = { -- name of the items for the inventory 
        name = `smalldelivery_box`, -- prop names for the delivery boxes
        placement = {
            x = 0.01,
            y =-0.02,
            z =-0.14,
            xrot = 0.0,
            yrot = 0.0,
            zrot = 0.0,
        }
    },
    ['medium_box'] = {
        name = `mediumdelivery_box`,
        placement = {
            x = 0.01,
            y =-0.02,
            z =-0.12,
            xrot = 0.0,
            yrot = 0.0,
            zrot = 0.0,
        }
    },
    ['large_box'] = {
        name = `largedelivery_box`,
        placement = {
            x = 0.01,
            y =-0.02,
            z =-0.12,
            xrot = 0.0,
            yrot = 0.0,
            zrot = 0.0,
        }
    },
    ['large_box2'] = {
        name = `largedelivery_box2`,
        placement = {
            x = 5,
            y =-0.02,
            z = -0.17,
            xrot = 0.0,
            yrot = 0.0,
            zrot = -90.0,
        }
    },
}