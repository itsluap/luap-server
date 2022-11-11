# If you use any custom maps for the shops For example Gabz Ammunation and you had to change the location from default qb-shops location be sure to change the vectors/coords to match as be default the script uses default qb-shops locations.

# DEPENDENCIES (MUST HAVE IN YOUR SERVER FOR EVERYTHING TO WORK PROPERLY)

* qbcore (New qbcore not the latest one with all the inventory changes or any of the newer version once its not on old core)
* qb-target
* qb-phone (the edited version i have on the video can be found in my discord FOR FREE if you want the one i used)
* polyzone
* ps-zones https://github.com/Project-Sloth/ps-zones

# INSTALLING

* Drop the kevin-deliveries folder into your resource be sure that the resource name is "kevin-deliveries" and nothing else
* Copy the image inside the images folder and paste it into you inventory> html> images folder
* Paste the snippet below in you qb-core>shared>items.lua
```lua
	["delivery-box"] 			     		 = {["name"] = "delivery-box",				    		["label"] = "Delivery Package",			   			["weight"] = 50000,    	["type"] = "item",		["image"] = "delivery-box.png",         			["unique"] = true,		["useable"] = false,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "",								["created"] = nil, 		["decay"] = 1.0 },
```

# If you want it to be using a specifc job if the config is set to true then add the snip below to qb-core > shared > job.lua
```lua
   ['delivery'] = {
		label = 'Road Runner Deliveries', --- change if you like
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Delivery Driver',
                payment = 50
            },
        },
	},
```
* Add the following line to qb-core > server > player.lua any where around 87-140 area under metadata
```lua
    PlayerData.metadata['deliveries'] = PlayerData.metadata['deliveries'] or 0
```

# By default you might have to get into the vehicle trunk at the side so to fix that issue please refer to the link below
* https://github.com/qbcore-framework/qb-inventory/pull/292/commits/0e4996fc3071a6757fa668186defaa236d214c7a

# Any problems please join my discord
Discord: https://discord.gg/SCnKXKN7cA



