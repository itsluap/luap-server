Config = {}

Config.UseBlip = true                      -- [true to enable the blip | false disables the blip]

Config.Location = {
    Coords = vector4(5220.28, -5394.15, 66.48, 277.48),
    ModelName = "g_m_y_mexgoon_03",
    ModelHash = 0x964D12DC,
    --SetBlipSprite = 303,
    --SetBlipDisplay = 6,
    --SetBlipScale = 0.85,
    --SetBlipColour = 40,
    --BlipName = "BlackMarket Dealer"
}

Config.Icons = {
    EyeIcon = "fa-solid fa-face-smile-horns",
    Header = "fa-solid fa-person-rifle",
    Pistol = "fa-solid fa-gun",
    SubMachineGuns = "fa-solid fa-gun",
    Shotguns = "fa-solid fa-gun",
    AssaultWeapons = "fa-solid fa-gun",
    Miscellanceous = "fa-solid fa-icons"
}

Config.Text = {
    TargetLabel = "Blackmarket Dealer",
    PedHeader = "Blackmarket Dealer",
    Pistols = "Pistols",
    SubMachineGuns = "Submachine Guns",
    Shotguns = "Shotguns",
    AssaultWeapons = "Assault Rifles",
    Miscellanceous = "Miscellanceous",

}

Config.PistolShop = {
    label = "Blackmarket Pistols",
    slots = 10,
    items = {
        [1] = {
            name = "weapon_pistol",
            price = 900,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_heavypistol",
            price = 1300,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_pistol50",
            price = 1700,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 3,
        },
        [3] = {
            name = "weapon_appistol",
            price = 2200,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 4,
        },
}
}

Config.SubMachineGunShop = {
    label = "Blackmarket Submachine Guns",
    slots = 10,
    items = {
        [1] = {
            name = "weapon_microsmg",
            price = 2600,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 3,
        },
        [2] = {
            name = "weapon_assaultsmg",
            price = 3200,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 4,
        },
        [3] = {
            name = "weapon_machinepistol",
            price = 2000,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 1,
        },
        [4] = {
            name = "weapon_minismg",
            price = 2300,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 2,
        }
    }
}

Config.ShotGunShop = {
    label = "Blackmarket Shotguns",
    slots = 10,
    items = {
        [1] = {
            name = "weapon_pumpshotgun",
            price = 2500,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 3,
        },
        [2] = {
            name = "weapon_sawnoffshotgun",
            price = 1200,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 1,
        },
        [3] = {
            name = "weapon_bullpupshotgun",
            price = 3600,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 4,
        },
        [4] = {
            name = "weapon_dbshotgun",
            price = 1600,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 2,
        },
    }
}

Config.AssaultWeaponsShop = {
    label = "Blackmarket Assault Rifles",
    slots = 10,
    items = {
        [1] = {
            name = "weapon_carbinerifle",
            price = 5500,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 3,
        },
        [1] = {
            name = "weapon_assaultrifle",
            price = 4800,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 2,
        },
        [4] = {
            name = "weapon_compactrifle",
            price = 3700,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 1,
        },
        [5] = {
            name = "weapon_bulluprifle",
            price = 6200,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 4,
        },
    }
}

Config.MiscellanceousShop = {
    label = "Blackmarket Miscellanceous",
    slots = 10,
    items = {
        [1] = {
            name = "armor",
            price = 2500,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "heavyarmor",
            price = 5000,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "labkey",
            price = 20000,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "trojan_usb",
            price = 15000,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "thermite",
            price = 15000,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "drill",
            price = 7500,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "advancedlockpick",
            price = 3500,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "gatecrack",
            price = 15000,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "pistol_ammo",
            price = 70,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "rifle_ammo",
            price = 1500,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "smg_ammo",
            price = 70,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "shotgun_ammo",
            price = 150,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 12,
        },
    }
}


