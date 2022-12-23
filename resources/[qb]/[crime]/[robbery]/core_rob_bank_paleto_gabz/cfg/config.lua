cfg = {}

cfg.debug = false -- debug version to check some stuff [prints]
cfg.framework = "qbcore" --esx,qbcore,vrp,vrpex,nunoradioman,standalone
cfg.interaction = "qbtarget" --qbtarget,markermenu,gtav
cfg.dispatch = "ps_dispatch" --nunoradioman,ps_dispatch,cd_dispatch,core_dispatch

cfg.police = {
	groups = {"police","sheriff", "trooper"}, -- police groups
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
			title = "Paleto Robbery",-- title of the embed message
			msg = "The robbery just got started.", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["giveitem"] = { -- This is the log that is used when a player gets a reward from the script.
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Paleto Robbery", -- title of the embed message
			msg = "Received", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["removeitem"] = { -- This is the log that is used when a player removes an item .
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Paleto Robbery", -- title of the embed message
			msg = "Removed", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["luaexecutors"] = { -- This is the log that is used when a player tries to trigger events to give items 100% Lua Executor.
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Paleto Robbery", -- title of the embed message
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
        {
            type = "vault", -- "vault","door","automatic"
            pos = {-100.241867,6464.549316,31.884604,225.0}, -- {x,y,z,heading}
            hash = GetHashKey("ch_prop_ch_vault_d_door_01a"), -- hash of the entity model
            status = false, -- false is closed true is open and "opening" is opening
            resetstatus = false, -- When the robbery resets , the status of the door will be this
    
            swaphash = nil, -- swap hash when the door is swapped
            openheading = 95.0, -- the heading that the open will open
            openvariable = -0.02, -- the amount of rotation applied to the "vault" while "opening"
        },
    },
    interactables = {
        { -- 1
            type = "voltage01", -- type of loot
            pos = {-108.57300,6484.13965,31.46128 - 1.0,0.0,0.0,225.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "normal", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("h4_prop_h4_elecbox_01a"), -- hash of the model that will spawn
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change
    
            polyzone = {0.7,0.9,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
            options = {
                {
                    type = "hackvoltage_01",
    
                    minigame = {
                        event = "CORE_ROB_MINIGAMES:VoltLab_c", --event
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
            type = "securitypanel01", -- type of loot
            pos = {-101.95140,6462.89404,31.63413 + 0.4,0.0,0.0,225.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "normal", -- "normal" "rarity" "nospawn"
            hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {1,"done"}, -- {index,type}
            },
    
            polyzone = {0.3,0.5,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
            options = {
                {
                    type = "hacksecuritypanel_01",
    
                    item_needed = {
                        {"robbery_card_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                        {"robbery_laptop_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                    },
    
                    minigame = {
                        event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
                        data = {
                            background = 4, -- 0 to 6 | MUST BE INTEGER
                            lives = 5.0, -- max is 7.0 | MUST BE FLOAT
                            difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                            timer = 120, -- seconds , max is 3600 which is 1 hour.
                        },
                    },
    
                    markermenu = {"[1] Hack",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,key}
                    polyzone = {"Hack","fa-solid fa-laptop"},-- {label,targeticon}
    
                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = {
                        call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
                        delay = 5, -- Delay to call the police when you start the action, it is in "seconds".
    
                        code = "10-99", -- Code Prefix to "title"
                        message = "A Security Panel is being hacked.", -- Notification
                        sprite = 772, -- Blip Sprite
                        color = 1, -- Blip Color
                        scale = 1.0, -- Blip Scale
                        time = 300, -- Seconds
                    },
                },
            },
        },
        { -- 3
            type = "trolly01",
            pos = {-100.94145,6461.49511,31.63413 - 0.5,0.0,0.0,315.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "rarity", -- "normal" "rarity" "nospawn"
            hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
            hashs = { -- this is only used if hash_type is "rarity"
                {"none",100}, -- {hash,rarity}
                {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
            },
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {2,"done"}, -- {index,type}
            },
    
            polyzone = {0.6,1.0,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
            options = {
                { 
                    type = "grabtrolly_01",
    
                    item_to_give_type = "hash_normal", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        [GetHashKey("bank_cash_trolly_01a")] = {
                            {"money",1000,2500,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_cash_trolly_01b")] = {
                            {"money",1000,2500,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_cash_trolly_01c")] = {
                            {"money",1000,2500,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_silver_trolly_01a")] = {
                            {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_silver_trolly_01b")] = {
                            {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_silver_trolly_01c")] = {
                            {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_gold_trolly_01a")] = {
                            {"robbery_rewards_goldbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_gold_trolly_01b")] = {
                            {"robbery_rewards_goldbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_gold_trolly_01c")] = {
                            {"robbery_rewards_goldbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_diamond_trolly_01a")] = {
                            {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_diamond_trolly_01b")] = {
                            {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_diamond_trolly_01c")] = {
                            {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                    },
    
                    markermenu = {"[1] Collect",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                    polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
    
                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = nil,
                },
            },
        },
        { -- 4
            type = "trolly01",
            pos = {-98.01368,6463.07568,31.63413 - 0.5,0.0,0.0,105.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "rarity", -- "normal" "rarity" "nospawn"
            hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
            hashs = { -- this is only used if hash_type is "rarity"
                {"none",100}, -- {hash,rarity}
                {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
            },
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {2,"done"}, -- {index,type}
            },
    
            polyzone = {0.6,1.0,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
            options = {
                { 
                    type = "grabtrolly_01",
    
                    item_to_give_type = "hash_normal", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        [GetHashKey("bank_cash_trolly_01a")] = {
                            {"money",1000,2500,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_cash_trolly_01b")] = {
                            {"money",1000,2500,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_cash_trolly_01c")] = {
                            {"money",1000,2500,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_silver_trolly_01a")] = {
                            {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_silver_trolly_01b")] = {
                            {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_silver_trolly_01c")] = {
                            {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_gold_trolly_01a")] = {
                            {"robbery_rewards_goldbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_gold_trolly_01b")] = {
                            {"robbery_rewards_goldbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_gold_trolly_01c")] = {
                            {"robbery_rewards_goldbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_diamond_trolly_01a")] = {
                            {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_diamond_trolly_01b")] = {
                            {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_diamond_trolly_01c")] = {
                            {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                    },
    
                    markermenu = {"[1] Collect",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                    polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
    
                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = nil,
                },
            },
        },
        { -- 5
            type = "trolly01",
            pos = {-96.93521,6460.17529,31.63413 - 0.5,0.0,0.0,45.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
            offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
    
            hash_type = "rarity", -- "normal" "rarity" "nospawn"
            hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
            hashs = { -- this is only used if hash_type is "rarity"
                {"none",100}, -- {hash,rarity}
                {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
            },
    
            net_id = 0, -- dont change
            status = false, -- dont change
            done = false, -- dont change
            spawned = false, -- dont change

            blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
            blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                {2,"done"}, -- {index,type}
            },
    
            polyzone = {0.6,1.0,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
            options = {
                { 
                    type = "grabtrolly_01",
    
                    item_to_give_type = "hash_normal", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                    item_to_give = {
                        [GetHashKey("bank_cash_trolly_01a")] = {
                            {"money",1000,2500,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_cash_trolly_01b")] = {
                            {"money",1000,2500,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_cash_trolly_01c")] = {
                            {"money",1000,2500,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_silver_trolly_01a")] = {
                            {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_silver_trolly_01b")] = {
                            {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_silver_trolly_01c")] = {
                            {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_gold_trolly_01a")] = {
                            {"robbery_rewards_goldbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_gold_trolly_01b")] = {
                            {"robbery_rewards_goldbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_gold_trolly_01c")] = {
                            {"robbery_rewards_goldbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_diamond_trolly_01a")] = {
                            {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_diamond_trolly_01b")] = {
                            {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                        [GetHashKey("bank_diamond_trolly_01c")] = {
                            {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                        },
                    },
    
                    markermenu = {"[1] Collect",157}, -- {text,key}
                    displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                    polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
    
                    camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                    checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                    dispatch = nil,
                },
            },
        },
    },
}