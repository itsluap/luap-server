local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = false

-- target

Citizen.CreateThread(function()
    print(onDuty)
	exports['qb-target']:AddBoxZone("BurgerShotDuty", vector3(-1191.28, -900.43, 13.98), 1, 1.2, {
		name = "BurgerShotDuty",
		heading = 32,
		debugPoly = false,
		minZ=14.0,
		maxZ=18.0,
	}, {
		options = {
		    {  
			event = "qb-burgershot:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "burgershot",
		    },
		},
		distance = 2.5
	})

    exports['qb-target']:AddBoxZone("burger_tray_1", vector3(-1194.93, -892.92, 15.39), 1.05, 1.0, {
        name = "burger_tray_1",
        heading = 35.0,
        debugPoly = false,
        minZ=13.8,
        maxZ=14.3,
    }, {
        options = {
            {
            event = "qb-burgershot:Tray1",
            icon = "far fa-clipboard",
            label = "Tray 1",
            },
        },
        distance = 2.5
    })
        --[[
	exports['qb-target']:AddBoxZone("burger_tray_2", vector3(-1194.44, -894.8, 13.98), 0.5, 0.7, {
		name="burger_tray_2",
		heading=318,
		debugPoly=false,
		minZ=14.0,
		maxZ=14.4,
	}, {
		options = {
		    {
			event = "qb-burgershot:Tray2",
			icon = "far fa-clipboard",
			label = "Tray 2",
		    },
		},
		distance = 2.5
	})
    ]]--
	exports['qb-target']:AddBoxZone("burger_tray_3", vector3(-1193.88, -906.98, 14.0), 1, 1, {
		name="burger_tray_3",
		heading=350,
		debugPoly=false,
		minZ=13.2,
		maxZ=14.2,
	}, {
		options = {
		    {
			event = "qb-burgershot:Tray3",
			icon = "far fa-clipboard",
			label = "Tray 3",
		    },
		},
		distance = 3.5
	})


	exports['qb-target']:AddBoxZone("burgershotcooker", vector3(-1202.94, -897.38, 14.0), 1.7, 1, {
		name="burgershotcooker",
		heading=34,
		debugPoly=false,
		minZ=13.0,
		maxZ=14.4,
	}, {
		options = {
			{
				event = "qb-burgershot:PattyFry",
				icon = "fas fa-hamburger",
				label = "Burger Cook Station",
				job = "burgershot",
			},
		},
		distance = 2.5
	})


    exports['qb-target']:AddBoxZone("burgershotfryer", vector3(-1202.01, -899.27, 14.0), 2.5, 1.5, {
        name="burgershotfryer",
        heading=35,
        debugPoly=false,
        minZ=13.0,
        maxZ=14.4,
    }, {
        options = {
            {
                event = "qb-burgershot:Fries",
                icon = "fas fa-box",
                label = "Make Fries",
                job = "burgershot",distance = 1.5
            },
        },
        distance = 2.5
    })


	exports['qb-target']:AddBoxZone("burgershotdrinks", vector3(-1199.54, -895.52, 14.0), 2.2, 0.6, {
	    name="burgershotdrinks",
	    heading=34,
	    debugPoly=false,
	    minZ=13.8,
	    maxZ=14.8,
	}, {
        options = {
            {
                event = "nh-context:DrinkMenu",
                icon = "fas fa-filter",
                label = "Make Some Drinks",
                job = "burgershot",
            },
        },
        distance = 2.5
    })

    exports['qb-target']:AddBoxZone("burgershotdrinks2", vector3(-1190.47, -904.65, 13.98), 2.2, 0.6, {
        name="burgershotdrinks2",
        heading=33,
        debugPoly=false,
        minZ=13.8,
        maxZ=14.8,
    }, {
        options = {
            {
                event = "nh-context:DrinkMenu",
                icon = "fas fa-filter",
                label = "Make Some Drinks",
                job = "burgershot",
            },
        },
        distance = 2.5
    })


    exports['qb-target']:AddBoxZone("burgerfridge", vector3(-1203.71, -895.86, 14.0), 1.6, 1, {
        name="burgerfridge",
        heading=35,
        debugPoly=false,
        minZ=13.0,
        maxZ=15.6,
    }, {
        options = {
            {
                event = "nh-context:OrderMenu",
                icon = "fas fa-laptop",
                label = "Order Ingredients!",
                job = "burgershot",
            },
        },
        distance = 2.5
    })

    exports['qb-target']:AddBoxZone("burgershotdisplay", vector3(-1197.78, -894.45, 14.0), 4.6, 1.2, {
        name="burgershotdisplay",
        heading=34,
        debugPoly=false,
        minZ=13.0,
        maxZ=14.8,
    }, {
        options = {
            {
                event = "qb-burgershot:Storage",
                icon = "fas fa-box",
                label = "Storage",
                job = "burgershot",
            },
        },
        distance = 2.5
    })


    exports['qb-target']:AddBoxZone("craftburger", vector3(-1198.19, -898.55, 14.96), 1.8, 0.7, {
        name="craftburger",
        heading=304,
        debugPoly=false,
        minZ=13.0,
        maxZ=14.4,
    }, {
        options = {
            {
                event = "nh-context:Burgers",
                icon = "fas fa-cheeseburger",
                label = "Burger Work Station",
                job = "burgershot",
            },
        },
        distance = 2.5
    })


    exports['qb-target']:AddBoxZone("BurgerShot_register_1", vector3(-1195.37, -892.39, 15.27), 0.5, 0.4, {
        name="BurgerShot_register_1",
        debugPoly=false,
        heading=125,
        minZ=14.0,
        maxZ=14.5,
    }, {
        options = {
            {
                event = "qb-burgershot:bill",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
                job = "burgershot",
            },
        },
        distance = 2.5
    })

    exports['qb-target']:AddBoxZone("BurgerShot_register_2", vector3(-1194.24, -893.87, 15.16), 0.6, 0.5, {
        name="BurgerShot_register_2",
        debugPoly=false,
        heading=302,
        minZ=14.1,
        maxZ=14.5,
    }, {
        options = {
            {
                event = "qb-burgershot:bill",
                parms = "2",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
                job = "burgershot",
            },
        },
        distance = 2.5
    })  



    exports['qb-target']:AddBoxZone("BurgerShot_register_4", vector3(-1192.52, -906.65, 14.0), 0.5, 0.5, {
        name="BurgerShot_register_4",
        heading=0,
        debugPoly=false,
        minZ=13.8,
        maxZ=14.2,
    }, {
        options = {
            {
                event = "qb-burgershot:bill",
                parms = "4",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
                job = "burgershot",
            },
        },
        distance = 2.5
    })

end)


-- QB-MENU --

RegisterNetEvent('nh-context:Burgers', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Available Burgers |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Moneyshot Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:MoneyShot"
            }
        },
        {
            
            header = "• Meat Free Burger",
            txt = "Bun , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:MeatFree"
            }
        },
        {
            
            header = "• Bleeder Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:BleederBurger"
            }
        },
        {
            
            header = "• The Heart Stopper",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:HeartStopper"
            }
        },
        {
            
            header = "• Torpedo Roll",
            txt = "Bun , Cooked Meat",
            params = {
                event = "qb-burgershot:Torpedo"
            }
        },
        {
            
            header = "• Murder Meal",
            txt = "The Heart Stopper, Fries and SoftDrink",
            params = {
                event = "qb-burgershot:CreateMurderMeal"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


RegisterNetEvent('nh-context:OrderMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Fridge |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-burgershot:shop"
            }
        },
        {
           
            header = "• Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "qb-burgershot:Storage2"
            }
        },
        {
            
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)

RegisterNetEvent('nh-context:DrinkMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            id = 0,
            header = "| Drink Menu |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Soft Drink",
            txt = "Soda Syrup",
            params = {
                event = "qb-burgershot:SoftDrink"
            }
        },
        {
            
            header = "• Milkshake",
            txt = "Milkshake Formula",
            params = {
                event = "qb-burgershot:mShake"
            }
        },
        {
           
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-burgershot:bill")
AddEventHandler("qb-burgershot:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Bill",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Bill Price ($)", -- text you want to be displayed as a place holder
                name = "billprice", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = false -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("qb-burgershot:bill:player", bill.citizenid, bill.billprice)
    end
end)

