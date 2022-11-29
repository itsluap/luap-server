Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.15 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(-28.11, -1108.57, 27.27)-- Where the finance menu is located
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.PreventFinanceSelling = true -- allow/prevent players from using /transfervehicle if financed
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-56.727394104004, -1086.2325439453),
                vector2(-60.612808227539, -1096.7795410156),
                vector2(-58.26834487915, -1100.572265625),
                vector2(-35.927803039551, -1109.0034179688),
                vector2(-34.427627563477, -1108.5111083984),
                vector2(-32.02657699585, -1101.5877685547),
                vector2(-33.342102050781, -1101.0377197266),
                vector2(-31.292987823486, -1095.3717041016)
            },
            ['minZ'] = 25.0, -- min height of the shop zone
            ['maxZ'] = 28.0, -- max height of the shop zone
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['pimports'] = 'Imports',
            ['sportsclassics'] = 'Sports Classics',
            ['sedans'] = 'Sedans',
            ['coupes'] = 'Coupes',
            ['suvs'] = 'SUVs',
            ['offroad'] = 'Offroad',
            ['muscle'] = 'Muscle',
            ['compacts'] = 'Compacts',
            ['motorcycles'] = 'Motorcycles',
            ['vans'] = 'Vans',
            ['cycles'] = 'Bicycles'
        },
        ['TestDriveTimeLimit'] = 0.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector3(-9.57, -1095.69, 27.02), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-54.81, -1096.74, 27.3, 198.86),
                defaultVehicle = 'mgt',
                chosenVehicle = 'mgt'
            },
            [2] = {
                coords = vector4(-36.93, -1093.18, 27.3, 192.57),
                defaultVehicle = 'camry18',
                chosenVehicle = 'camry18'
            }
        },
    },
    ['luxury'] = {
        ['Type'] = 'managed', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(109.75644683838, -156.68780517578),
                vector2(117.62004852295, -159.63610839844),
                vector2(145.22314453125, -169.30331420898),
                vector2(158.52130126953, -133.08631896973),
                vector2(118.07675933838, -119.62038421631),
                vector2(109.02114105225, -144.88461303711)
            },
            ['minZ'] = 53.68,
            ['maxZ'] = 68.68,
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Luxury Vehicle Shop',
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {
            ['imports'] = 'Imports',
            ['super'] = 'Super',
            ['sports'] = 'Sports'
        },
        ['TestDriveTimeLimit'] = 0.5,
        ['Location'] = vector3(130.97, -147.62, 54.86),
        ['ReturnLocation'] = vector3(152.1, -126.46, 54.83),
        ['VehicleSpawn'] = vector4(152.64, -126.61, 54.83, 69.12),
        ['TestDriveSpawn'] = vector4(101.03, -145.42, 54.78, 157.09), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(126.54, -157.62, 53.79, 285.67),
                defaultVehicle = 'amgone',
                chosenVehicle = 'amgone'
            },
            [2] = {
                coords = vector4(134.38, -160.38, 53.79, 34.82),
                defaultVehicle = 'rmodlfa',
                chosenVehicle = 'rmodlfa'
            },
            [3] = {
                coords = vector4(141.78, -163.68, 53.79, 276.15),
                defaultVehicle = 'ghoulcharger',
                chosenVehicle = 'ghoulcharger'
            },
            [4] = {
                coords = vector4(113.54, -146.69, 59.76, 233.95),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati'
            },
            [5] = {
                coords = vector4(117.94, -153.7, 59.76, 0.66),
                defaultVehicle = 'carbonrs',
                chosenVehicle = 'carbonrs'
            },
        }
    }, -- Add your next table under this comma
    ['tuner'] = {
        ['Type'] = 'managed', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(155.59687805176, -3005.9916992188),
                vector2(153.72784423828, -3060.9196777344),
                vector2(119.30592346191, -3061.1154785156),
                vector2(118.74111175537, -3006.5832519531)
            },
            ['minZ'] = 7.0408926010132,
            ['maxZ'] = 25.392038345337,
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'tuner', -- Name of job or none
        ['ShopLabel'] = 'Tuner Shop',
        ['showBlip'] = false, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {
            ['tuner'] = 'Tuner',
            --['super'] = 'Super',
            --['sports'] = 'Sports'
        },
        ['TestDriveTimeLimit'] = 0.5,
        ['Location'] = vector3(135.64, -3029.98, 6.52),
        ['ReturnLocation'] = vector3(162.48, -3047.35, 5.43),
        ['VehicleSpawn'] = vector4(138.1, -3044.76, 6.52, 270.02),
        ['TestDriveSpawn'] = vector3(151.37, -2982.71, 5.44), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(124.22, -3023.0, 7.04, 266.47),
                defaultVehicle = 'devilz',
                chosenVehicle = 'devilz'
            },
        }
    }, -- Add your next table under this comma
    ['ottos'] = {
        ['Type'] = 'managed', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(811.25445556641, -803.59100341797),
                vector2(794.06103515625, -804.32342529297),
                vector2(794.92523193359, -832.53021240234),
                vector2(810.78930664062, -832.33093261719)
            },
            ['minZ'] = 26.185426712036,
            ['maxZ'] = 37.086387634277,
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'ottos', -- Name of job or none
        ['ShopLabel'] = 'Ottos Autos',
        ['showBlip'] = false, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {
            ['tuner'] = 'Tuner',
            ['imports'] = 'Imports',
            ['super'] = 'Super',
            ['sports'] = 'Sports'
        },
        ['TestDriveTimeLimit'] = 0.5,
        ['Location'] = vector3(801.33, -827.84, 27.43),
        ['ReturnLocation'] = vector3(809.37, -829.78, 26.15),
        ['VehicleSpawn'] = vector4(833.6, -788.31, 26.29, 117.9),
        ['TestDriveSpawn'] = vector3(789.6, -818.87, 26.12), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(808.23, -811.91, 26.18, 88.19),
                defaultVehicle = 'r33hr',
                chosenVehicle = 'r33hr'
            },
        }
    }, -- Add your next table under this comma
    ['boats'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-729.39, -1315.84),
                vector2(-766.81, -1360.11),
                vector2(-754.21, -1371.49),
                vector2(-716.94, -1326.88)
            },
            ['minZ'] = 0.0, -- min height of the shop zone
            ['maxZ'] = 5.0, -- max height of the shop zone
            ['size'] = 6.2 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Marina Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 410, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['boats'] = 'Boats'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-738.25, -1334.38, 1.6), -- Blip Location
        ['ReturnLocation'] = vector3(-714.34, -1343.31, 0.0), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-727.87, -1353.1, -0.17, 137.09), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-722.23, -1351.98, 0.14, 135.33), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-727.05, -1326.59, 0.00, 229.5), -- where the vehicle will spawn on display
                defaultVehicle = 'seashark', -- Default display vehicle
                chosenVehicle = 'seashark' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-732.84, -1333.5, -0.50, 229.5),
                defaultVehicle = 'dinghy',
                chosenVehicle = 'dinghy'
            },
            [3] = {
                coords = vector4(-737.84, -1340.83, -0.50, 229.5),
                defaultVehicle = 'speeder',
                chosenVehicle = 'speeder'
            },
            [4] = {
                coords = vector4(-741.53, -1349.7, -2.00, 229.5),
                defaultVehicle = 'marquis',
                chosenVehicle = 'marquis'
            },
        },
    },
    ['air'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-1607.58, -3141.7),
                vector2(-1672.54, -3103.87),
                vector2(-1703.49, -3158.02),
                vector2(-1646.03, -3190.84)
            },
            ['minZ'] = 12.99, -- min height of the shop zone
            ['maxZ'] = 16.99, -- max height of the shop zone
            ['size'] = 7.0, -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Air Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 251, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['helicopters'] = 'Helicopters',
            ['planes'] = 'Planes'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-1652.76, -3143.4, 13.99), -- Blip Location
        ['ReturnLocation'] = vector3(-1628.44, -3104.7, 13.94), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-1617.49, -3086.17, 13.94, 329.2), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-1625.19, -3103.47, 13.94, 330.28), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1651.36, -3162.66, 12.99, 346.89), -- where the vehicle will spawn on display
                defaultVehicle = 'maverick', -- Default display vehicle
                chosenVehicle = 'maverick' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-1668.53, -3152.56, 12.99, 303.22),
                defaultVehicle = 'vestra',
                chosenVehicle = 'vestra'
            },
            [3] = {
                coords = vector4(-1632.02, -3144.48, 12.99, 31.08),
                defaultVehicle = 'nimbus',
                chosenVehicle = 'nimbus'
            },
            [4] = {
                coords = vector4(-1663.74, -3126.32, 12.99, 275.03),
                defaultVehicle = 'frogger',
                chosenVehicle = 'frogger'
            },
        },
    },
}
