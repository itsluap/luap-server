cfg = {}

cfg.debug = false -- debug version to check some stuff [prints]
cfg.framework = "qbcore" --esx,qbcore,vrp,vrpex,nunoradioman,standalone
cfg.interaction = "qbtarget" --qbtarget,markermenu,gtav
cfg.dispatch = "ps_dispatch" --nunoradioman,ps_dispatch,cd_dispatch,core_dispatch

cfg.police = {
	groups = {"police","sheriff","trooper"}, -- police groups
	amount = 0, -- police amount
}
cfg.timers = {
	reset_timer = 60, -- This Timer is in Minutes
	npc_timer = 300 -- This Timer is in Seconds
}
cfg.notification = {
    selected = "qbcore", -- gtav,qbcore,esx
    notifications = {
        noitem = "You dont have the item needed for this action.", -- message
        nopolice = "Not enough cops online.", -- message
    },
}
cfg.log = {
	active = true,
	logs = { -- Available Logs
		["start"] = { -- This is the log that is used when a player starts the robbery.
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Jewelery Robbery",-- title of the embed message
			msg = "The robbery just got started.", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["giveitem"] = { -- This is the log that is used when a player gets a reward from the script.
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Jewelery Robbery", -- title of the embed message
			msg = "Received", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["removeitem"] = { -- This is the log that is used when a player removes an item .
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Jewelery Robbery", -- title of the embed message
			msg = "Removed", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["luaexecutors"] = { -- This is the log that is used when a player tries to trigger events to give items 100% Lua Executor.
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Jewelery Robbery", -- title of the embed message
			msg = "Cheater", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
	},
}

cfg.robbery = {
    reset = false,
    doors = {
        { -- 1
            type = "door", -- "vault","door","automatic"
            pos = {-630.42651,-238.43754,38.20653,306.0}, -- {x,y,z,heading}
            hash = GetHashKey("p_jewel_door_r1"), -- hash of the entity model
            status = false, -- false is closed true is open and "opening" is opening
            resetstatus = false, -- When the robbery resets , the status of the door will be this
    
            swaphash = nil, -- swap hash when the door is swapped
            openheading = nil, -- the heading that the open will open
            openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
        },
        { -- 2
            type = "door", -- "vault","door","automatic"
            pos = {-631.95538,-236.33326,38.20645,306.0}, -- {x,y,z,heading}
            hash = GetHashKey("p_jewel_door_l"), -- hash of the entity model
            status = false, -- false is closed true is open and "opening" is opening
            resetstatus = false, -- When the robbery resets , the status of the door will be this
    
            swaphash = nil, -- swap hash when the door is swapped
            openheading = nil, -- the heading that the open will open
            openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
        },
    },
    interactables = {
        { -- 1
            type = "voltage01", -- type of loot
            pos = {-620.4964,-239.4023,55.65630 - 1,0.0,0.0,30.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "normal", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("h4_prop_h4_elecbox_01a"), -- hash of the model that will spawn
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change

            doors = {1,2}, -- {index,index,index,index,...}
    
            polyzone = {0.7,0.9,0.0,0.0,0.0,0.0,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                {
                    type = "hackvoltage_01",
    
                    minigame = {
                        event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_A", --event
                        data = { -- data that will pass to the event
                            timer = 25, -- seconds
                        },
                    },
    
                    markermenu = {"[1] Wire",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Wire",157}, -- {text,key}
                    polyzone = {"Wire","fa-solid fa-network-wired"},-- {label,targeticon}
    
                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".
    
                        code = "10-99", -- Code Prefix to "title"
                        message = "A Spike of electricity was detected in a Electric Box.", -- Notification
                        sprite = 769, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 2
            type = "showcase01", -- type of loot
            pos = {-627.95556640625,-233.91781616211,38.057010650635,0.0,0.0,216.92}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
    
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 3
            type = "showcase01", -- type of loot
            pos = {-626.88732910156,-233.08279418945,38.057014465332,0.0,0.0,216.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },

            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 4
            type = "showcase01", -- type of loot
            pos = {-625.80487060547,-234.59962463379,38.057060241699,0.0,0.0,36.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab4_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab4_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 5
            type = "showcase01", -- type of loot
            pos = {-626.72955322266,-235.52699279785,38.05704498291,0.0,0.0,35.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab3_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab3_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 6
            type = "showcase01", -- type of loot
            pos = {-626.75329589844,-238.49397277832,38.056999206543,0.0,0.0,216.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab2_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab2_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 7
            type = "showcase01", -- type of loot
            pos = {-625.44073486328,-237.63932800293,38.05700302124,0.0,0.0,216.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab3_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab3_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 8
            type = "showcase01", -- type of loot
            pos = {-624.94305419922,-227.9143371582,38.057029724121,0.0,0.0,36.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab3_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab3_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 9
            type = "showcase01", -- type of loot
            pos = {-623.78021240234,-227.38829040527,38.057022094727,0.0,0.0,36.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab4_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab4_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 10
            type = "showcase01", -- type of loot
            pos = {-620.61584472656,-226.73329162598,38.057014465332,0.0,0.0,306.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 11
            type = "showcase01", -- type of loot
            pos = {-619.74975585938,-227.69932556152,38.056983947754,0.0,0.0,306.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab2_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab2_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 12
            type = "showcase01", -- type of loot
            pos = {-618.44091796875,-229.50956726074,38.057025909424,0.0,0.0,306.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab3_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab3_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 13
            type = "showcase01", -- type of loot
            pos = {-617.69293212891,-230.58952331543,38.057037353516,0.0,0.0,306.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab2_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab2_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 14
            type = "showcase01", -- type of loot
            pos = {-619.20239257813,-233.54431152344,38.057037353516,0.0,0.0,216.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab3_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab3_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 15
            type = "showcase01", -- type of loot
            pos = {-620.20245361328,-234.32179260254,38.057037353516,0.0,0.0,216.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 16
            type = "showcase01", -- type of loot
            pos = {-623.22448730469,-233.05267333984,38.057037353516,0.0,0.0,306.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 17
            type = "showcase01", -- type of loot
            pos = {-624.70782470703,-231.24598693848,38.057029724121,0.0,0.0,306.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab4_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab4_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 18
            type = "showcase01", -- type of loot
            pos = {-624.04479980469,-228.10316467285,38.057022094727,0.0,0.0,216.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab2_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab2_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 19
            type = "showcase01", -- type of loot
            pos = {-620.91998291016,-228.48007202148,38.057022094727,0.0,0.0,125.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab3_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab3_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 20
            type = "showcase01", -- type of loot
            pos = {-619.61297607422,-230.24876403809,38.057022094727,0.0,0.0,125.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 21
            type = "showcase01", -- type of loot
            pos = {-620.01391601563,-233.51449584961,38.057014465332,0.0,0.0,36.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "nospawn", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("des_jewel_cab4_start"), -- hash of the model that will spawn
            swaphash = GetHashKey("des_jewel_cab4_end"),  -- hash of the model that will swap
    
            net_id = nil, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_SMG"),
                GetHashKey("WEAPON_ASSAULTSMG"),
                GetHashKey("WEAPON_COMBATPDW"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MUSKET"),
                GetHashKey("WEAPON_ASSAULTRIFLE"),
                GetHashKey("WEAPON_CARBINERIFLE"),
                GetHashKey("WEAPON_ADVANCEDRIFLE"),
            },
    
            polyzone = {0.6,1.2,0.0,0.05,0.0,-0.05,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                { 
                    type = "breakshowcase_01",
    
                    item_to_give_type = "random", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"diamond_ring",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"goldchain",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        {"rolex",1,3,100}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Break",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Break",157}, -- {text,key}
                    polyzone = {"Break","fa-solid fa-gem"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

                        code = "10-99", -- Code Prefix to "title"
                        message = "A Silent Alarm in a showcase was triggered.", -- Notification
                        sprite = 617, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 22
            type = "painting01", -- type of loot 
            pos = {-616.9976,-233.1599,38.05699 + 0.17,0.0,0.0,270.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}

            hash_type = "rarity", -- "normal" "rarity" "nospawn"
            hash = "", -- hash of the model that will spawn
            hashs = { -- this is only used if hash_type is "rarity"
                {"none",100}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01a"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01b"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01c"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01d"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01e"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01f"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01g"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01h"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01i"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01j"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01a"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01b"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01c"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01d"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01e"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01f"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01g"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01h"),80}, -- {hash,rarity}
            },

            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },

            weapons = {
                GetHashKey("WEAPON_SWITCHBLADE"), -- hash of the weapon you need equiped
            },

            polyzone = {0.1,0.8,0.85,0.0,0.0,0.0,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                {
                    type = "grabpainting_01",

                    item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"robbery_rewards_painting_01",1,1,100} -- {item_name,amount_min,amount_max,item_rarity}
                    },

                    interaction = {
                        {
                            loop = false,
                            sound = true,
                            duration = -1,
                            label = "Press ~INPUT_CELLPHONE_RIGHT~ to cut right",
                        },
                        {
                            loop = false,
                            sound = true,
                            duration = -1,
                            label = "Press ~INPUT_CELLPHONE_DOWN~ to cut down",
                        },
                        {
                            loop = false,
                            sound = true,
                            duration = -1,
                            label = "Press ~INPUT_CELLPHONE_LEFT~ to cut left",
                        },
                        {
                            loop = false,
                            sound = true,
                            duration = -1,
                            label = "Press ~INPUT_CELLPHONE_DOWN~ to cut down",
                        },
                    },

                    markermenu = {"[1] Cut",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Cut",157}, -- {text,key}
                    polyzone = {"Cut","fa-solid fa-frame"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = nil,
                },
            },
        },
        { -- 23
            type = "painting01", -- type of loot 
            pos = {-622.7872,-225.1407,38.05699 + 0.17,0.0,0.0,340.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}

            hash_type = "rarity", -- "normal" "rarity" "nospawn"
            hash = "", -- hash of the model that will spawn
            hashs = { -- this is only used if hash_type is "rarity"
                {"none",100}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01a"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01b"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01c"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01d"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01e"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01f"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01g"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01h"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01i"),80}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01j"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01a"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01b"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01c"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01d"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01e"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01f"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01g"),80}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01h"),80}, -- {hash,rarity}
            },

            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },

            weapons = {
                GetHashKey("WEAPON_SWITCHBLADE"), -- hash of the weapon you need equiped
            },

            polyzone = {0.1,0.8,0.85,0.0,0.0,0.0,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                {
                    type = "grabpainting_01",

                    item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"robbery_rewards_painting_01",1,1,100} -- {item_name,amount_min,amount_max,item_rarity}
                    },

                    interaction = {
                        {
                            loop = false,
                            sound = true,
                            duration = -1,
                            label = "Press ~INPUT_CELLPHONE_RIGHT~ to cut right",
                        },
                        {
                            loop = false,
                            sound = true,
                            duration = -1,
                            label = "Press ~INPUT_CELLPHONE_DOWN~ to cut down",
                        },
                        {
                            loop = false,
                            sound = true,
                            duration = -1,
                            label = "Press ~INPUT_CELLPHONE_LEFT~ to cut left",
                        },
                        {
                            loop = false,
                            sound = true,
                            duration = -1,
                            label = "Press ~INPUT_CELLPHONE_DOWN~ to cut down",
                        },
                    },

                    markermenu = {"[1] Cut",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Cut",157}, -- {text,key}
                    polyzone = {"Cut","fa-solid fa-frame"},-- {label,targeticon}

                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = nil,
                },
            },
        },
        { -- 24
            type = "glassreward01", -- type of loot
            pos = {-617.30511,-227.40075,38.05698 + 0.02,0.0,0.0,305.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "rarity", -- "normal" "rarity" "nospawn"
            hash = "", -- hash of the model that will spawn
            hashs = { -- this is only used if hash_type is "rarity"
                {GetHashKey("h4_prop_h4_art_pant_01a"),100}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_t_bottle_02a"),100}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_t_bottle_02b"),100}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_necklace_01a"),100}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_diamond_01a"),100}, -- {hash,rarity}
            },
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
        },
        { -- 25 
            type = "glassrewardsupport01", -- type of loot
            pos = {-617.30511,-227.40075,38.05698 + 0.02,0.0,0.0,305.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "glass", -- "normal" "rarity" "nospawn" "glass"
            hash = "", -- hash of the model that will spawn
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            glassreward = 24, -- index
        },
        { -- 26
            type = "glass01", -- type of loot
            pos = {-617.30511,-227.40075,38.05698 - 1,0.0,0.0,305.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "normal", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("glass_display_01a"), -- hash of the model that will spawn
            swaphash = GetHashKey("glass_display_01b"), -- hash of the model that will spawn
    
            net_id = 0, -- 0 will spawn if you put nil it will not spawn
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
    
            polyzone = {0.7,0.7,0.0,0.0,0.0,0.0,0.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z}
            options = {
                {
                    type = "cutglass_01",
    
                    item_needed = {
                        {"drill",1,100}, -- {item_name,item_amount,chance_to_remove}
                    },

                    item_to_give_type = "glass", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        [GetHashKey("h4_prop_h4_art_pant_01a")] = {
                            {"robbery_rewards_panther_01",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("h4_prop_h4_t_bottle_02a")] = {
                            {"robbery_rewards_tequila_01",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("h4_prop_h4_t_bottle_02b")] = {
                            {"robbery_rewards_tequila_02",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("h4_prop_h4_necklace_01a")] = {
                            {"robbery_rewards_diamondnecklace_01",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("h4_prop_h4_diamond_01a")] = {
                            {"robbery_rewards_diamond_01",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                    },
    
                    interaction = {
                        {
                            loop = false,
                            sound = true,
                            duration = -1,
                            label = "Hold ~INPUT_SCRIPT_RDOWN~ to cut through the glass.Be careful or the cutter will overheat.~n~Press ~INPUT_CELLPHONE_CANCEL~ to leave.",
                        },
                    },
    
                    minigame = {
                        time_needed = math.floor(20000,30000),
                        overheat_max = 10000,
    
                        cut_rate = 10.0,
                        overheat_increase_rate = 100.0,
                        overheat_decrease_rate = 50.0,
                    },
    
                    cuttimer = 15, -- seconds
                    glassreward = 24, -- index
    
                    markermenu = {"[1] Cut",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Cut",157}, -- {text,key}
                    polyzone = {"Cut","fa-solid fa-gem"},-- {label,targeticon}
    
                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = nil,
                },
            },
        },
    },
}