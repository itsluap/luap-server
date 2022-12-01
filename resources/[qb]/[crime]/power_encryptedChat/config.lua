-- Standalone? if true then you data will be stored based on rockstar license id not very useful for servers with multiple characters.
useStandalone = false  
-- if you are using standalone mode and want to have your own item, then you can trigger the client event: "power_encryptedChat:open" to open the chat.

-- Use QBCore? this will provide a seperate account per character instead of using rockstar license ids
useQBCore = true 

-- Incase you have changed your qbcore resource name
resourceName = 'qb-core'

-- Registers a usable item for QBCore
useItem = true 
itemName = 'burner_phone'

-- Use Realtime - if false then it will use the ingame time on the phone ui.
usingRealtime = false 
-- set a timezone, 
usingTimezone = 'Europe/London' -- you can view the names timezones here. https://momentjs.com/timezone/

-- Enable command to view encrypted chat
enableCommand = false 
-- Command to use to open the chat (/darkweb)
commandName = 'darkweb'

-- Restrict from Specific Jobs 
-- Restrict for example police from using the dark web.
restrictFromJobs = true 

restrictedJobs = {
 ['police'] = true, -- This will disable the police from using the darkweb.
 ['sheriff'] = true,
 ['trooper'] = true,
}

-- Enables a cost per message sent in the dark web chat.
costPerMessage = 0 -- Change from 0 to enable.