Config = {}

Config.NPC = vector4(185.29, -916.61, 30.69, 148.52) -- Location for the NPC to spawn.
Config.Model = "cs_fbisuit_01" -- NPC Model.
Config.VehicleSpawn = vector4(180.45, -923.15, 30.69, 230.33) -- Location for car to spawn.
Config.Garage = "pillboxlowergarage" -- Default garage for the car to be tagged too.

Config.CoinShop = {
    [1] = {
        type = "item", -- Item/Car
        name = "weapon_pistol", -- Name of Item.
        amount = 1, -- amount of items to give.
        cost = 1, -- Coin Cost to purchase item.
        header = "Buy Pistol", -- Header Text.
        text = "Buy pistol for 1 coin.", -- Sub Text.
    },
    [2] = {
        type = "car", -- Item/Car
        name = "sultan", -- Model of the vehicle to spawn.
        cost = 1, -- Coin Cost to purchase item.
        header = "Buy Sultan", -- Header Text.
        text = "Buy a Sultan for 1 coin.", -- Sub Text.
    },
}

Config.Packages = {
    ["Coin Pack (5)"] = 5, -- Number of coins given on redemption.
    ["Coin Pack (10)"] = 10, -- Number of coins given on redemption.
    ["Coin Pack (15)"] = 15, -- Number of coins given on redemption.
    ["Coin Pack (20)"] = 20, -- Number of coins given on redemption.
    ["Coin Pack (25)"] = 25, -- Number of coins given on redemption.
    ["Coin Pack (50)"] = 50, -- Number of coins given on redemption.
    ["Coin Pack (100)"] = 100, -- Number of coins given on redemption.
}