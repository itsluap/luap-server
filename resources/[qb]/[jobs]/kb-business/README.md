# KB Scripts
## QBCore Business Creation Script


This script is designed to make it simple to setup business and give it functions that work off the bat.

An example business is in shared/businesses.lua (Using Yellowjack with [This MLO](https://www.gta5-mods.com/maps/mlo-yellow-jack-extension-interior-2nd-floor))

Easy to setup and configure QB-Target zones for mostly every feature
- Support for dispensers (Sell items to players)
- Support for stashes
- Setup custom actions for the business (Call external events)
- Setup teleporters
- Setup duty areas
- Setup tills that used jim-payments to charge players with ([Github - jim-payments](https://github.com/jimathy/jim-payments))
- Setup garages for a business

Script runs at 0.00ms at idle and around 0.03ms MAX.


**Installation**
- Place the "kb-business" folder into your resources folder
- Install jim-payments into your resources folder

- New businesses are created within kb-business/shared/business.lua now

- Adjusting and moving targets

To easily create target locations, use PolyZone
For example `/pzcreate box` 
This will then create a text file with all the info you need to put into the business.lua

[Github - Using PolyZone tool](https://github.com/mkafrin/PolyZone/wiki/Using-the-creation-script)


### Everything is optional
For example if you just wanted a business with a "till" you can just do 

```lua
	["burgershot"] = {
		label = "BurgerShot",
		tills = {
			["till1"] = {
				coords = vector3(1981.84, 3053.7, 47.22),
				length = 0.5,
				width = 0.5,
				heading = 330,
				minMaxZ = 0.2, --// for example 47.22 becomes 48.22 & 46.22				
			},
		},	
	},
```

### Adding a Teleporter

To add a teleporter, simply add this in and adjust as needed

```lua
		teleports = {
			["ttlupstairs"] = {
				bossOnly = false,
				employeeOnly = true,
				entrance = {
					label = "Enter Bar",
					coords = { x = -568.4, y = 291.13, z = 79.18 }
				},
				exit = {
					label = "Exit Bar",
					coords = { x = -565.26, y = 284.68, z = 85.38 }
				}
			}
		},

```

### Adding auto off duty in a zone

You will need to create a PolyZone around the business

And underneath `duty` in business.lua, add a new entry called `zone`

Which will be the vector2's from the PolyZone you have just created, example below.

If you don't want this, just don't add a zone.

```lua
		duty = {
			zone = {
				vector2(1980.3679199219, 3063.904296875),
				vector2(2006.1380615234, 3046.6357421875),
				vector2(1999.6154785156, 3037.3115234375),
				vector2(1973.4908447266, 3053.4348144531)
			},
			coords = vector3(1986.61, 3055.91, 47.92),
			minMaxZ = 1,
			heading = 145,
			length = 0.1,
			width = 0.90
		},
```

### Example event setup

You can see an example event in client/employeeActions-example.lua & server/employeeActions-exampleS.lua

**Required Resources**
- QBCore
- QB-Target
- [Github - jim-payments](https://github.com/jimathy/jim-payments)
