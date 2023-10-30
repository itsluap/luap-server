# If you use any custom maps for the shops For example Gabz Ammunation and you had to change the location from default qb-shops location be sure to change the vectors/coords to match as be default the script uses default qb-shops locations.

# DEPENDENCIES (MUST HAVE IN YOUR SERVER FOR EVERYTHING TO WORK PROPERLY)

* qbcore 
* qb-target
* qb-phone https://github.com/Renewed-Scripts/qb-phone
* polyzone
* ps-zones https://github.com/Project-Sloth/ps-zones

# INSTALLING

* Drop the indigo-deliveries folder into your resource be sure that the resource name is "indigo-deliveries" and nothing else
* Copy the image inside the images folder and paste it into you inventory> html> images folder
* Paste the snippet below in you qb-core>shared>items.lua
```lua
	["small-box"] 			     = {["name"] = "small-box",				    ["label"] = "Delivery Package",			   	["weight"] = 40000,    	["type"] = "item",		["image"] = "small-box.png",         			["unique"] = true,		["useable"] = false,	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "",				["created"] = nil, 		["decay"] = 1.0 },
	["medium-box"] 			     = {["name"] = "medium-box",				    ["label"] = "Delivery Package",			   	["weight"] = 40000,    	["type"] = "item",		["image"] = "medium-box.png",         			["unique"] = true,		["useable"] = false,	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "",				["created"] = nil, 		["decay"] = 1.0 },
	["large-box"] 			     = {["name"] = "large-box",				    ["label"] = "Delivery Package",			   	["weight"] = 40000,    	["type"] = "item",		["image"] = "large-box.png",         			["unique"] = true,		["useable"] = false,	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "",				["created"] = nil, 		["decay"] = 1.0 },
	["large-box2"] 			     = {["name"] = "large-box2",				    ["label"] = "Delivery Package",			   	["weight"] = 40000,    	["type"] = "item",		["image"] = "large-box2.png",         			["unique"] = true,		["useable"] = false,	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "",				["created"] = nil, 		["decay"] = 1.0 },

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
