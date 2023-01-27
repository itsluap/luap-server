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
    
            swaphash = nil, -- swap hash when the door is swapped
            openheading = nil, -- the heading that the open will open
            openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
        },
        { -- 2
            type = "door", -- "vault","door","automatic"
            pos = {-631.95538,-236.33326,38.20645,306.0}, -- {x,y,z,heading}
            hash = GetHashKey("p_jewel_door_l"), -- hash of the entity model
            status = false, -- false is closed true is open and "opening" is opening
    
            swaphash = nil, -- swap hash when the door is swapped
            openheading = nil, -- the heading that the open will open
            openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
        },
    },
    interactables = {
        { -- 1
            type = "voltage01", -- type of loot
            pos = {-620.4964,-239.4023,55.65630,0.0,0.0,30.0}, --{x,y,z,heading}
            offset = {0.0,0.0,-1.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "normal", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("h4_prop_h4_elecbox_01a"), -- hash of the model that will spawn
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = true, -- dont change
            spawned = false, -- dont change

            doors = {1,2}, -- {index,index,index,index,...}
    
            polyzone = {0.55,0.95,0.0,0.0,0.0,-0.1,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
            options = {
                {
                    type = "hackvoltage_01",
    
                    minigame = {
                        event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_C", --event
                        data = { -- data that will pass to the event
                            timer = 25, -- seconds
                        },
                    },
    
                    markermenu = {"[1] Wire",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Wire",157}, -- {text,key}
                    polyzone = {"Wire","fa-solid fa-bolt"},-- {label,targeticon}
    
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change

            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },
    
            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
            
            weapons = { -- {weapon_hash}
                GetHashKey("WEAPON_DE"),
                GetHashKey("WEAPON_M70"),
                GetHashKey("WEAPON_AK47"),
                GetHashKey("WEAPON_M9"),
                GetHashKey("WEAPON_M1911"),
                GetHashKey("WEAPON_FNX45"),
                GetHashKey("WEAPON_UZI"),
                GetHashKey("WEAPON_MAC10"),
                GetHashKey("WEAPON_SLEDGEHAMMER"),
                GetHashKey("WEAPON_COMBATPISTOL"),
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
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
            pos = {-616.9976,-233.1599,38.05699,0.0,0.0,270.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.17,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "rarity", -- "normal" "rarity" "nospawn"
            hashs = { -- this is only used if hash_type is "rarity"
                {"none",100}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01a"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01b"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01c"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01d"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01e"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01f"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01g"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01h"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01i"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01j"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01a"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01b"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01c"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01d"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01e"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01f"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01g"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01h"),40}, -- {hash,rarity}
            },
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            weapons = {
                GetHashKey("WEAPON_SWITCHBLADE"), -- hash of the weapon you need equiped
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
    
            polyzone = {0.05,0.76,0.87,0.0,0.0,-0.015,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
            options = {
                {
                    type = "grabpainting_01",
    
                    minigame = {
                        exit_key = 177, -- key
                        down_key = 33, -- key
                        left_key = 34, -- key
                        right_key = 35, -- key
                        interactions = {
                            "Press ~INPUT_MOVE_RIGHT_ONLY~ to cut right.~n~Press ~INPUT_FRONTEND_PAUSE_ALTERNATE~ to exit.", -- text
                            "Press ~INPUT_MOVE_DOWN_ONLY~ to cut down.~n~Press ~INPUT_FRONTEND_PAUSE_ALTERNATE~ to exit.", -- text
                            "Press ~INPUT_MOVE_LEFT_ONLY~ to cut left.~n~Press ~INPUT_FRONTEND_PAUSE_ALTERNATE~ to exit.", -- text
                            "Press ~INPUT_MOVE_DOWN_ONLY~ to cut down.~n~Press ~INPUT_FRONTEND_PAUSE_ALTERNATE~ to exit.", -- text
                        },
                    },
    
                    item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"painting1",1,1,100} -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Cut",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Cut",157}, -- {text,key}
                    polyzone = {"Cut","fa-solid fa-frame"},-- {label,targeticon}
    
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    dispatch = nil,
                },
            },
        },
        { -- 23
            type = "painting01", -- type of loot
            pos = {-622.7872,-225.1407,38.05699,0.0,0.0,340.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.17,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "rarity", -- "normal" "rarity" "nospawn"
            hashs = { -- this is only used if hash_type is "rarity"
                {"none",100}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01a"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01b"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01c"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01d"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01e"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01f"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01g"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01h"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01i"),40}, -- {hash,rarity}
                {GetHashKey("ch_prop_vault_painting_01j"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01a"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01b"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01c"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01d"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01e"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01f"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01g"),40}, -- {hash,rarity}
                {GetHashKey("h4_prop_h4_painting_01h"),40}, -- {hash,rarity}
            },
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            weapons = {
                GetHashKey("WEAPON_SWITCHBLADE"), -- hash of the weapon you need equiped
            },

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
    
            polyzone = {0.05,0.76,0.87,0.0,0.0,-0.015,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
            options = {
                {
                    type = "grabpainting_01",
    
                    minigame = {
                        exit_key = 177, -- key
                        down_key = 33, -- key
                        left_key = 34, -- key
                        right_key = 35, -- key
                        interactions = {
                            "Press ~INPUT_MOVE_RIGHT_ONLY~ to cut right.~n~Press ~INPUT_FRONTEND_PAUSE_ALTERNATE~ to exit.", -- text
                            "Press ~INPUT_MOVE_DOWN_ONLY~ to cut down.~n~Press ~INPUT_FRONTEND_PAUSE_ALTERNATE~ to exit.", -- text
                            "Press ~INPUT_MOVE_LEFT_ONLY~ to cut left.~n~Press ~INPUT_FRONTEND_PAUSE_ALTERNATE~ to exit.", -- text
                            "Press ~INPUT_MOVE_DOWN_ONLY~ to cut down.~n~Press ~INPUT_FRONTEND_PAUSE_ALTERNATE~ to exit.", -- text
                        },
                    },
    
                    item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        {"painting1",1,1,100} -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Cut",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Cut",157}, -- {text,key}
                    polyzone = {"Cut","fa-solid fa-frame"},-- {label,targeticon}
    
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    dispatch = nil,
                },
            },
        },
        
        { -- 24
            type = "glassreward01", -- type of loot
            pos = {-617.30511,-227.40075,38.05698,0.0,0.0,305.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.02,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "rarity", -- "normal" "rarity" "nospawn"
            hashs = { -- this is only used if hash_type is "rarity"
                {"none",215}, -- {hash,rarity}
    
                {GetHashKey("h4_prop_h4_t_bottle_02b"),135}, -- {hash,rarity}
    
                {GetHashKey("h4_prop_h4_t_bottle_02a"),85}, -- {hash,rarity}
    
                {GetHashKey("h4_prop_h4_necklace_01a"),45}, -- {hash,rarity}
    
                {GetHashKey("h4_prop_h4_diamond_01a"),25}, -- {hash,rarity}
    
                {GetHashKey("h4_prop_h4_art_pant_01a"),10}, -- {hash,rarity}
            },
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
        },
        { -- 25
            type = "glassrewardsupport01", -- type of loot
            pos = {-617.30511,-227.40075,38.05698,0.0,0.0,305.0}, --{x,y,z,heading}
            offset = {0.0,0.0,0.02,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "glass", -- keep this as "glass"
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            glass_reward_index = 24, -- index
        },
        { -- 26
            type = "glass01", -- type of loot
            pos = {-617.30511,-227.40075,38.05698,0.0,0.0,305.0}, --{x,y,z,heading}
            offset = {0.0,0.0,-1.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "normal", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("glass_display_01a"), -- hash of the model that will spawn
            swaphash = GetHashKey("glass_display_01b"), -- hash of the model that will spawn
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            glass_reward_index = 24, -- index

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
    
            polyzone = {0.8,0.8,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
            options = {
                {
                    type = "cutglass_01",
    
                    minigame = {
                        time_needed = {20000,30000}, -- {min,max}
                        overheat_max = 10000, -- integer value of the overheat
    
                        cut_rate = 10.0, -- float cut rate of the plasma cutter
                        overheat_increase_rate = 100.0, -- float overheat increate rate of the plasma cutter
                        overheat_decrease_rate = 50.0,-- float overheat decrease rate of the plasma cutter
    
                        exit_key = 177, -- key
                        cut_key = 223, -- key
                        interactions = {
                            "Hold ~INPUT_SCRIPT_RDOWN~ to cut through the glass.Be careful or the cutter will overheat.~n~Press ~INPUT_FRONTEND_PAUSE_ALTERNATE~ to leave.", -- text
                        },
                    },
    
                    item_needed = {
                        {"robbery_glasscutter_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                    },
    
                    item_to_give_type = "glass", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        [GetHashKey("h4_prop_h4_art_pant_01a")] = {{"goldmask",1,1,100}}, -- {item_name,amount_min,amount_max,item_rarity}
                        [GetHashKey("h4_prop_h4_t_bottle_02a")] = {{"goldmask",1,1,100}}, -- {item_name,amount_min,amount_max,item_rarity}
                        [GetHashKey("h4_prop_h4_t_bottle_02b")] = {{"goldmask",1,1,100}}, -- {item_name,amount_min,amount_max,item_rarity}
                        [GetHashKey("h4_prop_h4_necklace_01a")] = {{"goldmask",1,1,100}}, -- {item_name,amount_min,amount_max,item_rarity}
                        [GetHashKey("h4_prop_h4_diamond_01a")] = {{"goldmask",1,1,100}}, -- {item_name,amount_min,amount_max,item_rarity}
                    },
    
                    markermenu = {"[1] Cut",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Cut",157}, -- {text,key}
                    polyzone = {"Cut","fa-solid fa-gem"},-- {label,targeticon}
    
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    dispatch = nil,
                },
            },
        },
    },
}