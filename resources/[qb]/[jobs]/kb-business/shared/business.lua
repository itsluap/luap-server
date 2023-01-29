local QBCore = exports['qb-core']:GetCoreObject()

KB = KB or {}

KB.Businesses = {
	["puffpuffpass"] = {
		label = "Puff Puff Pass",
		colours = {
			primary = 4,
			secondary = 3
		},
		blip = {
			title = "Puff Puff Pass",
			colour = 66,
			id = 93,
			coords = vector4(-1555.1, -435.99, 35.89, 51.43)
		},
		duty = {
			coords = vector3(-1546.61, -430.92, 35.89),
			minMaxZ = 0.6,
			heading = 230,
			length = 0.6,
			width = 0.2
		},
		trays = {
			["ppptray1"] = {
				label = "Tray",
				coords = vector3(-1553.6, -430.29, 35.89),
				minMaxZ = 0.3,
				heading = 50,
				length = 0.45,
				width = 0.6
			},
			["ppptray2"] = {
				label = "Tray",
				coords = vector3(-1547.64, -429.67, 35.89),
				minMaxZ = 0.3,
				heading = 50,
				length = 0.6,
				width = 0.45				
			}			
		},
		stashes = {
			["pppstorage1"] = {
				label = "Puff Puff Pass Store",
				employeeOnly = true,
				coords = vector3(-1550.64, -430.05, 35.89),
				minMaxZ = 0.3,
				heading = 5,
				length = 0.4,
				width = 0.6
			},
			["pppstorage2"] = {
				label = "Cabinet",
				employeeOnly = true,
				coords = vector3(-1557.83, -432.78, 35.89),
				minMaxZ = 1.0,
				heading = 50,
				length = 0.35,
				width = 1.8	
			}
		},
		tills = {
			["till1"] = {
				coords = vector3(-1548.77, -428.95, 35.89),
				length = 0.5,
				width = 0.25,
				heading = 50,
				minMaxZ = 0.3, --// for example 47.22 becomes 48.22 & 46.22				
			},
			["till2"] = {
				coords = vector3(-1552.5, -429.23, 35.89),
				length = 0.25,
				width = 0.5,
				heading = 50,
				minMaxZ = 0.3, --// for example 47.22 becomes 48.22 & 46.22				
			},
		},
		employeeActions = {
			["crafting"] = {
				label = "Joint Crafting",
				action = "Joint Craft",
				type = "client",
				icon = "fas fa-hand",
				event = "kb-business:client:weedcraftjoint",
				coords = vector3(-1551.19, -455.54, 35.89),
				length = 0.6,
				width = 1.0,
				heading = 50,
				minMaxZ = 0.2, --// for example 47.22 becomes 48.22 & 46.22				
			},
		},
	},

	-- USE AS EXAMPLE --
	--[[
	["yellowjack"] = {
		label = "Yellowjack",
		colours = {
			primary = 4,
			secondary = 3
		},
		blip = {
			title = "Yellowjack (For Sale)",
			colour = 66,
			id = 93,
			coords = vector4(1987.0, 3049.9070, 47.2151, 192.6309)
		},
		duty = {
			coords = vector3(1986.61, 3055.91, 47.92),
			minMaxZ = 1,
			heading = 145,
			length = 0.1,
			width = 0.90
		},
		trays = {
			["yjtray1"] = {
				label = "Drinks",
				coords = vector3(1984.82, 3054.43, 47.22),
				minMaxZ = 0.1,
				heading = 330,
				length = 0.6,
				width = 0.8
			},
			["yjtray2"] = {
				label = "Veg",
				coords = vector3(1983.62, 3052.2, 47.22),
				minMaxZ = 0.1,
				heading = 330,
				length = 0.6,
				width = 0.8				
			}			
		},
		stashes = {
			["yjstash"] = {
				label = "Boss Stash",
				bossOnly = true,
				coords = vector3(1986.92, 3046.83, 50.5),
				minMaxZ = 0.4,
				heading = 240,
				length = 0.8,
				width = 1				
			},
			["yjstorage1"] = {
				label = "Bar Store",
				employeeOnly = true,
				coords = vector3(1980.48, 3051.62, 47.21),
				minMaxZ = 0.8,
				heading = 235,
				length = 0.8,
				width = 1.2
			},
			["yjstorage2"] = {
				label = "Stock Room",
				employeeOnly = true,
				coords = vector3(1993.97, 3042.56, 47.21),
				minMaxZ = 0.8,
				heading = 325,
				length = 0.8,
				width = 1	
			}
		},
		tills = {
			["till1"] = {
				coords = vector3(1981.84, 3053.7, 47.22),
				length = 0.5,
				width = 0.5,
				heading = 330,
				minMaxZ = 0.2, --// for example 47.22 becomes 48.22 & 46.22				
			},
		},		
		dispensers = {
			["yjfridge"] = {
				label = "Fridge",
				employeeOnly = false, --// This is available to be used by anyone
				job = "yellowjack",
				slots = 1,
				coords = vector3(1984.93, 3048.26, 47.22),
				length = 0.7,
				width = 1,
				heading = 140,
				minMaxZ = 1, --// for example 47.22 becomes 48.22 & 46.22
				items = {
					[1] = {
						name = "beer",
						price = 35,
						amount = 10,
						info = {},
						type = "item",
						slot = 1,
					},
				}
			},
			["yjdispenser1"] = {
				label = "Bar Fridge",
				bossOnly = false,
				employeeOnly = true,
				job = "yellowjack",
				slots = 15,
				coords = vector3(1981.97, 3053.85, 46.85),
				length = 0.7,
				width = 1,
				heading = 330,
				minMaxZ = 0.3, --// for example 47.22 becomes 48.22 & 46.22
				items = {
					[1] = {
						name = "beer",
						price = 0,
						amount = 10,
						info = {},
						type = "item",
						slot = 1,
					},
					[2] = {
						name = "whiskey",
						price = 0,
						amount = 10,
						type = "item",
						slot = 2,
					},
					[3] = {
						name = "vodka",
						price = 0,
						amount = 10,
						type = "item",
						slot = 3,
					},
					[4] = {
						name = "rum",
						price = 0,
						amount = 10,
						type = "item",
						slot = 4,
					},
					[5] = {
						name = "tequila",
						price = 0,
						amount = 10,
						type = "item",
						slot = 5,
					},
					[6] = {
						name = "water_bottle",
						price = 0,
						amount = 10,
						type = "item",
						slot = 6,
					},
					[7] = {
						name = "crisps",
						price = 0,
						amount = 10,
						type = "item",
						slot = 7,
					},
					[8] = {
						name = "ecola",
						price = 0,
						amount = 10,
						type = "item",
						slot = 8,
					},
					[9] = {
						name = "ecolalight",
						price = 0,
						amount = 10,
						type = "item",
						slot = 9,
					},
					[10] = {
						name = "sprunk",
						price = 0,
						amount = 10,
						type = "item",
						slot = 10,
					},
					[11] = {
						name = "sprunklight",
						price = 0,
						amount = 10,
						type = "item",
						slot = 11,
					},
					[12] = {
						name = "saltysids",
						price = 0,
						amount = 10,
						type = "item",
						slot = 12,
					},
					[13] = {
						name = "pieandbeans",
						price = 0,
						amount = 10,
						type = "item",
						slot = 13,
					},
					[14] = {
						name = "lime",
						price = 0,
						amount = 10,
						type = "item",
						slot = 14,
					},
					[15] = {
						name = "dart",
						price = 0,
						amount = 10,
						type = "item",
						slot = 15,
					},
				}
			},
			["yjdispenser2"] = {
				label = "Bar Fridge",
				bossOnly = false,
				employeeOnly = true,
				job = "yellowjack",
				slots = 15,
				coords = vector3(1986.45, 3048.63, 50.5),
				length = 0.7,
				width = 1,
				heading = 330,
				minMaxZ = 0.3, --// for example 47.22 becomes 48.22 & 46.22
				items = {
					[1] = {
						name = "beer",
						price = 0,
						amount = 10,
						info = {},
						type = "item",
						slot = 1,
					},
					[2] = {
						name = "whiskey",
						price = 0,
						amount = 10,
						type = "item",
						slot = 2,
					},
					[3] = {
						name = "vodka",
						price = 0,
						amount = 10,
						type = "item",
						slot = 3,
					},
					[4] = {
						name = "rum",
						price = 0,
						amount = 10,
						type = "item",
						slot = 4,
					},
					[5] = {
						name = "tequila",
						price = 0,
						amount = 10,
						type = "item",
						slot = 5,
					},
					[6] = {
						name = "water_bottle",
						price = 0,
						amount = 10,
						type = "item",
						slot = 6,
					},
					[7] = {
						name = "crisps",
						price = 0,
						amount = 10,
						type = "item",
						slot = 7,
					},
					[8] = {
						name = "ecola",
						price = 0,
						amount = 10,
						type = "item",
						slot = 8,
					},
					[9] = {
						name = "ecolalight",
						price = 0,
						amount = 10,
						type = "item",
						slot = 9,
					},
					[10] = {
						name = "sprunk",
						price = 0,
						amount = 10,
						type = "item",
						slot = 10,
					},
					[11] = {
						name = "sprunklight",
						price = 0,
						amount = 10,
						type = "item",
						slot = 11,
					},
					[12] = {
						name = "saltysids",
						price = 0,
						amount = 10,
						type = "item",
						slot = 12,
					},
					[13] = {
						name = "pieandbeans",
						price = 0,
						amount = 10,
						type = "item",
						slot = 13,
					},
					[14] = {
						name = "lime",
						price = 0,
						amount = 10,
						type = "item",
						slot = 14,
					},
					[15] = {
						name = "dart",
						price = 0,
						amount = 10,
						type = "item",
						slot = 15,
					},
				}
			},
		},
		garages = {
			["garage1"] = {
				label = "Company garage",
				coords = vector4(1994.5527, 3030.0146, 47.4790, 60.7495),
				vehicles = {
					youga = "Youga"
				}
			}
		},
		employeeActions = {
			["cookdog"] = {
				label = "Cook",
				action = "Cook Dog",
				type = "client",
				icon = "fas fa-hand",
				event = "kb-business:client:cookdog",
				coords = vector3(1984.43, 3050.3, 47.21),
				length = 0.4,
				width = 0.8,
				heading = 235,
				minMaxZ = 0.2, --// for example 47.22 becomes 48.22 & 46.22				
			},
			["takeglass"] = {
				label = "Glass",
				action = "Take Glass",
				type = "server",
				icon = "fas fa-hand",
				event = "sf-yellowjack:server:takeglass",
				coords = vector3(1982.65, 3054.84, 47.22),
				length = 1,
				width = 0.8,
				heading = 330,
				minMaxZ = 0.8, --// for example 47.22 becomes 48.22 & 46.22				
			},
		},
	},
	]]--	
}

function HasItem(items, amount)
    local isTable = type(items) == 'table'
    local isArray = isTable and table.type(items) == 'array' or false
    local totalItems = #items
    local count = 0
    local kvIndex = 2
	if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Checking if player has required item^7 '^3"..tostring(items).."^7'") end
    if isTable and not isArray then totalItems = 0
        for _ in pairs(items) do totalItems += 1 end
        kvIndex = 1
    end
    for _, itemData in pairs(QBCore.Functions.GetPlayerData().items) do
        if isTable then
			for k, v in pairs(items) do
                local itemKV = {k, v}
                if itemData and itemData.name == itemKV[kvIndex] and ((amount and itemData.amount >= amount) or (not isArray and itemData.amount >= v) or (not amount and isArray)) then
                    count += 1
                end
            end
            if count == totalItems then
				if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items ^2FOUND^7") end
				return true
            end
        else -- Single item as string
            if itemData and itemData.name == items and (not amount or (itemData and amount and itemData.amount >= amount)) then
				if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Item^7: '^3"..tostring(items).." ^7x(^3"..tostring(amount).."^7)' ^2FOUND^7") end
                return true
            end
        end
    end
	if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items ^1NOT FOUND^7") end
    return false
end