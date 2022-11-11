Config = Config or {}

Config.Phone = 'qb' -- qb / gks phone that you use for the phone notifications

Config.JobNeeded = true -- if you need a specific job to do the deliveries true/false
Config.JobName = 'delivery' -- Job needed to do the deliveries if the config above is set to true
Config.JobPed = 's_m_m_ups_01' -- Model of the starting ped
Config.JobPedLocation = vector4(-429.53, -2786.3, 6.0, 53.77) -- Where the starting ped is
Config.JobPedAnimation = 'WORLD_HUMAN_CLIPBOARD'
Config.JobBlipName = 'Road Runner Deliveries' -- Blip of where the starting ped is

--- These should be self explanatory as its labeles as what it is
Config.JobPedBlipSprite = 304
Config.JobPedBlipSpriteColour = 32
Config.JobPedBlipSpriteScale = 0.75

Config.DestinationBlipSprite = 1
Config.DestinationBlipSpriteColour = 32
Config.DestinationBlipSpriteScale = 0.62
Config.DestinationBlipRoute = true
Config.DestinationBlipRouteColour = 32

Config.ReturnBlipSprite = 1
Config.ReturnBlipSpriteColour = 32
Config.ReturnBlipSpriteScale = 0.62
Config.ReturnBlipRoute = true
Config.ReturnBlipRouteColour = 32
--
Config.FuelScript = 'LegacyFuel' -- ps-fuel/lj-fuel/LegacyFuel Change to the fuel system you use here
Config.VehicleSpawn = vector4(-445.69, -2789.91, 5.39, 43.89) -- Spot the vehicle spawns

Config.VehicleReturnCoords = vector4(-454.36, -2799.81, 5.39, 44.51) -- area where to return vehicle
Config.PaymentMethod = 'cash' -- cash/bank

--- Different levels of Reputation best to not have it to low, unless you know how to balance it out with pay etc but can be whatever number you like
Config.DeliveryLowReputation = 500
Config.DeliveryMidReputation = 1500
Config.DeliveryHighReputation = 2500

Config.DisableSprintingWithPackages = true
Config.DisableJumpingWithPackages = true
Config.DisableVehicleEnteringWithPackages = true
Config.DisableCrouchWithPackages = true
Config.DisableAttackingWithPackages = true
Config.DisableAimingWithPackages = true

Config.ItemPlacement = 'trunk' -- trunk / target can be either of the 2, trunk spawns the item in the trunk with target you target the back doors to take packages
Config.TrunkItems = {
    [1] = {
        name = "delivery-box",-- Item name in the core shared
        info = {},
        type = "item",
        slot = 1,
    },
}

Config.Shops = {
    [1] = { -- Do not add a 4th table unless you know what you are doing, its not as simple as just copy and pasting in here
        Coords= { -- These coords are more to the lower part of the map add as many coords as you like 
            vector4(24.47, -1346.62, 29.5, 271.66),
            vector4(45.68, -1749.04, 29.61, 53.13),
            vector4(-661.96, -933.53, 21.83, 177.05),
            vector4(809.68, -2159.13, 29.62, 1.43),
            vector4(23.0, -1105.67, 29.8, 162.91),
        },
        Packages = 18, -- If you want a random amount of packages to deliver then replace the number with a math.random(10, 13) 
        Payment = 350, --If you want a random payments then replace the number with a math.random(350, 420)
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
        Packages = 12,
        Payment = 540,
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
        Packages = 6,
        Payment = 900,
        Reputation = 10,
    },
}

--- Job Ped Targeting Options
Config.CheckInTargetIcon = 'fas fa-circle'
Config.CheckInLabel = 'Check In'

Config.ApplyForJobTargetIcon = 'fas fa-circle'
Config.ApplyForJobLabel = 'Apply for Job'

Config.GroupManagementTargetIcon = 'fas fa-users'
Config.GroupManagementLabel = 'Group Management'

Config.CollectPaymentTargetIcon = 'fas fa-dollar-sign'
Config.CollectPaymentLabel = 'Collect Payment'

Config.ReturnVehicleTargetIcon = 'fas fa-circle'
Config.ReturnVehicleLabel = 'Return Vehicle'
--
--- Truck Targeting Options to take package
Config.TruckTargetIcon = 'fas fa-box'
Config.TruckTargetLabel = 'Take Package'
--
--- Deliver Targeting Options
Config.DeliverTargetIcon = 'fas fa-circle'
Config.DeliverTargetLabel = 'Deliver Package'

--- Alerts
Config.GotJobNotify = "You got a new job.."
Config.AlreadyWorkHereNotify = "You are already employed here"
Config.NotGroupLeaderNotify = 'You are not a group leader.'
Config.GroupBusyNotify = 'Your group is already doing something!'
Config.GroupNotOnJobNotify = 'Your group doesn"t have any deliveries'
Config.IfNotGroupLeaderCannotReturnVehicleNotify = 'Talk to your group leader.'
Config.NoPackageToDeliverNotify = 'No Package to deliver..'
Config.TruckNotCloseNotify  = 'Delivery vehicle is not in the parking spot'

Config.PhoneNotification1Title = 'CURRENT TASK'
Config.PhoneNotification1 = 'DELIVER PACKAGES TO STORES'
Config.PhoneNotification1TextColour = '#86F9A1'
Config.PhoneNotification1Icon = 'fas fa-bars'

Config.PhoneNotification2Title = 'DELIVERY NOTIFICATION'
Config.PhoneNotification2 = 'PACKAGES : '
Config.PhoneNotification2TextColour = '#86F9A1'
Config.PhoneNotification2Icon = 'fas fa-bars'

Config.PhoneNotification3Title = 'TASK COMPLETED'
Config.PhoneNotification3 = 'ALL PACKAGES DELIVERED'
Config.PhoneNotification3TextColour = '#86F9A1'
Config.PhoneNotification3Icon = 'fas fa-bars'

Config.PhoneNotification4Title = 'CURRENT TASK'
Config.PhoneNotification4 = 'RETURN TO THE PORT.'
Config.PhoneNotification4TextColour = '#86F9A1'
Config.PhoneNotification4Icon = 'fas fa-bars'

Config.PhoneNotification5Title = 'CURRENT TASK'
Config.PhoneNotification5 = 'PARK TRUCK IN PARKING SPOT'
Config.PhoneNotification5TextColour = '#86F9A1'
Config.PhoneNotification5Icon = 'fas fa-bars'

Config.PhoneNotification6Title = 'TASK NOTIFICATION'
Config.PhoneNotification6 = 'COLLECT PAYMENTS BEFORE VEHICLE RETURN'
Config.PhoneNotification6TextColour = '#86F9A1'
Config.PhoneNotification6Icon = 'fas fa-bars'