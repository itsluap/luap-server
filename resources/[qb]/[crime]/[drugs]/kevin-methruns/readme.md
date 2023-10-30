# Dependencies
- QBCore (latest)
- qb-target https://github.com/qbcore-framework/qb-target
- polyzone
- ps-zones https://github.com/Project-Sloth/ps-zones
- qb-inventory/lj-inventory

------------------------------------------------------------------------------------

# Go to [qb] > qb-smallresources > server > logs.lua and  the following snippet in the local Webhooks

```lua
['methruns'] = 'put your discord channel webhook here',
```

* If you are unsure how to get a webhook this link can help you https://docs.gitlab.com/ee/user/project/integrations/discord_notifications.html

* Add the images from the images file into your inventory html images
* Add the below lines into your qb-core>shared>item.lua at the bottom
```lua
	["methcontainer"] 			     = {["name"] = "methcontainer",				    ["label"] = "Meth Container",			   	["weight"] = 9500,    	["type"] = "item",		["image"] = "methcontainer.png",         ["unique"] = false,		["useable"] = false,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Container full of white powder"},
	["methcase"] 			     = {["name"] = "methcase",				    ["label"] = "Shiny Case",			   	["weight"] = 4500,    	["type"] = "item",		["image"] = "securitycase.png",         ["unique"] = true,		["useable"] = true,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Briefcase full of money"},
    	["floor-cleaner"] 			     = {["name"] = "floor-cleaner",				    ["label"] = "Floor Cleaner",			["weight"] = 1000,    	["type"] = "item",		["image"] = "floorcleaner.png",         	["unique"] = false,		["useable"] = false,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "",								["created"] = nil, 		["decay"] = 0.0	},

```

* Add the following line to qb-core > server > player.lua any where around 87-140 area under metadata
```lua
    PlayerData.metadata['methruns'] = PlayerData.metadata['methruns'] or 0
```


# Ps-Dispatch

* Add the following to cl_extraalerts.lua
```lua
local function MethRuns()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "methruns", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-31",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = ('Suspicious Drug Activity'), -- message
        job = {"police"} -- jobs that will get the alerts
    })
end exports('MethRuns', MethRuns)
```

* Add the following to sv_dispatchcodes.lua
```lua
	["methruns"] =  {displayCode = '10-31', description = "Suspicious Drug Activity", radius = 0, recipientList = {'police'}, blipSprite = 514, blipColour = 43, blipScale = 1.5, blipLength = 2, sound = "robberysound", offset = "false"},
```

# For the item detection to work properly ensure that the snippet below is in your qb-core > client >functions.lua

```lua
function QBCore.Functions.HasItem(items, amount)
    local isTable = type(items) == 'table'
	local isArray = isTable and table.type(items) == 'array' or false
	local totalItems = #items
    local count = 0
    local kvIndex = 2
	if isTable and not isArray then
        totalItems = 0
        for _ in pairs(items) do totalItems += 1 end
        kvIndex = 1
    end
    for _, itemData in pairs(QBCore.PlayerData.items) do
        if isTable then
            for k, v in pairs(items) do
                local itemKV = {k, v}
                if itemData and itemData.name == itemKV[kvIndex] and ((not amount and not isArray and itemData.amount >= v) or (isArray and amount and itemData.amount >= amount) or (not amount and isArray)) then
                    count += 1
                end
            end
            if count == totalItems then
                return true
            end
        else -- Single item as string
            if itemData and itemData.name == items and (not amount or (amount and itemData.amount >= amount)) then
                return true
            end
        end
    end
    return false
end
```
