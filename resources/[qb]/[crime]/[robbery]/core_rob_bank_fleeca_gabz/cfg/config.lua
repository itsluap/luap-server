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
			title = "Fleeca Robbery",-- title of the embed message
			msg = "The robbery just got started.", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["giveitem"] = { -- This is the log that is used when a player gets a reward from the script.
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Fleeca Robbery", -- title of the embed message
			msg = "Received", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["removeitem"] = { -- This is the log that is used when a player removes an item .
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Fleeca Robbery", -- title of the embed message
			msg = "Removed", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["luaexecutors"] = { -- This is the log that is used when a player tries to trigger events to give items 100% Lua Executor.
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Fleeca Robbery", -- title of the embed message
			msg = "Cheater", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
	},
}

cfg.robbery = {
    { -- 1
        reset = false,
        doors = {
            { -- 1
                type = "vault", -- "vault","door","automatic"
                pos = {148.02661,-1044.36389,29.50693,250.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vauldr"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 150.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {150.29132,-1047.62902,29.66629,160.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {147.25608,-1046.25928,29.36929 + 0.4,0.0,0.0,250.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.3,0.5,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"robbery_card_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"robbery_laptop_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                        },
        
                        minigame = {
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 2
                type = "trolly01",
                pos = {150.44900,-1045.30000,29.36929 - 0.5,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {1,"done"}, -- {index,type}
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

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {148.46664,-1046.61755,29.36929 + 0.4,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {2},

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
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 4
                type = "trolly01",
                pos = {147.33642,-1047.75867,29.36929 - 0.5,0.0,0.0,250.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {3,"done"}, -- {index,type}
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
    },
    { -- 2
        reset = false,
        doors = {
            { -- 1
                type = "vault", -- "vault","door","automatic"
                pos = {312.35800,-282.73013,54.30364,250.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vauldr"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 150.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {314.62387,-285.99447,54.46300,160.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {311.58700,-284.62500,54.17426 + 0.4,0.0,0.0,250.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.3,0.5,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"robbery_card_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"robbery_laptop_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                        },
        
                        minigame = {
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 2
                type = "trolly01",
                pos = {314.72100,-283.62100,54.17426 - 0.5,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {1,"done"}, -- {index,type}
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

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {312.79700,-284.98400,54.17426 + 0.4,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {2},

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
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 4
                type = "trolly01",
                pos = {311.62377,-286.21322,54.17426 - 0.5,0.0,0.0,250.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {3,"done"}, -- {index,type}
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
    },
    { -- 3
        reset = false,
        doors = {
            { -- 1
                type = "vault", -- "vault","door","automatic"
                pos = {-352.73651,-53.57247,49.17543,250.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vauldr"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 150.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {-350.41436,-56.79705,49.33479,160.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {-353.47400,-55.48100,49.03647 + 0.4,0.0,0.0,250.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.3,0.5,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"robbery_card_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"robbery_laptop_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                        },
        
                        minigame = {
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 2
                type = "trolly01",
                pos = {-350.26700,-54.35000,49.03647 - 0.5,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {1,"done"}, -- {index,type}
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

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {-352.25800,-55.81800,49.03647 + 0.4,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {2},

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
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 4
                type = "trolly01",
                pos = {-353.42290,-57.06775,49.03647 - 0.5,0.0,0.0,250.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {3,"done"}, -- {index,type}
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
    },
    { -- 4
        reset = false,
        doors = {
            { -- 1
                type = "vault", -- "vault","door","automatic"
                pos = {-1211.26098,-334.55960,37.91989,296.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vauldr"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 196.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {-1207.32824,-335.12893,38.07925,206.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {-1210.39441,-336.40950,37.79077 + 0.4,0.0,0.0,297.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.3,0.5,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"robbery_card_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"robbery_laptop_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                        },
        
                        minigame = {
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 2
                type = "trolly01",
                pos = {-1209.01400,-333.50500,37.79077 - 0.5,0.0,0.0,207.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {1,"done"}, -- {index,type}
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

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {-1209.31400,-335.77633,37.79077 + 0.4,0.0,0.0,207.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {2},

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
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 4
                type = "trolly01",
                pos = {-1209.21484,-337.46731,37.79077 - 0.5,0.0,0.0,297.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {3,"done"}, -- {index,type}
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
    },
    { -- 5
        reset = false,
        doors = {
            { -- 1
                type = "vault", -- "vault","door","automatic"
                pos = {1175.54211,2710.96132,38.22689,90.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vauldr"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 350.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {1172.29113,2713.14624,38.38625,0.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {1175.61300,2712.90600,38.06623 + 0.4,0.0,0.0,90.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.3,0.5,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"robbery_card_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"robbery_laptop_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                        },
        
                        minigame = {
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 2
                type = "trolly01",
                pos = {1173.21600,2710.93500,38.06623 - 0.5,0.0,0.0,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {1,"done"}, -- {index,type}
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

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {1174.35681,2712.82275,38.06623 + 0.4,0.0,0.0,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {2},

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
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 4
                type = "trolly01",
                pos = {1175.03650,2714.37573,38.06623 - 0.5,0.0,0.0,90.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {3,"done"}, -- {index,type}
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
    },
    { -- 6
        reset = false,
        doors = {
            { -- 1
                type = "vault", -- "vault","door","automatic"
                pos = {-2958.53857,482.27056,15.83594,357.0}, -- {x,y,z,heading}
                hash = GetHashKey("hei_prop_heist_sec_door"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 257.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {-2956.11621,485.42059,15.99530,267.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
                resetstatus = false, -- When the robbery resets , the status of the door will be this
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {-2956.50171,482.10961,15.67530 + 0.4,0.0,0.0,357.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.3,0.5,0.0,0.0,0.0,0.0,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"robbery_card_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"robbery_laptop_01",1,100}, -- {item_name,item_amount,chance_to_remove}
                        },
        
                        minigame = {
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 2
                type = "trolly01",
                pos = {-2958.48300,484.70200,15.67530 - 0.5,0.0,0.0,268.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {1,"done"}, -- {index,type}
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

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {-2956.52148,483.37472,15.67530 + 0.4,0.0,0.0,267.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {2},

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
                            event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B",
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
            { -- 4
                type = "trolly01",
                pos = {-2954.99976,482.63134,15.67530 - 0.5,0.0,0.0,358.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.0,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
                hash = "", -- if "normal" put the GetHashKey here, if "rarity" leave "" if "nospawn" leave it ""
                hashs = { -- this is only used if hash_type is "rarity"
                    {"none",100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01a"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01b"),100}, -- {hash,rarity}
                    {GetHashKey("bank_cash_trolly_01c"),100}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_silver_trolly_01a"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01b"),50}, -- {hash,rarity}
                    {GetHashKey("bank_silver_trolly_01c"),50}, -- {hash,rarity}
                    ]]--
                    {GetHashKey("bank_gold_trolly_01a"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01b"),25}, -- {hash,rarity}
                    {GetHashKey("bank_gold_trolly_01c"),25}, -- {hash,rarity}
                    --[[
                    {GetHashKey("bank_diamond_trolly_01a"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01b"),10}, -- {hash,rarity}
                    {GetHashKey("bank_diamond_trolly_01c"),10}, -- {hash,rarity}
                    ]]--
                },
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                blocked_type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
                blocked = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
                    {3,"done"}, -- {index,type}
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
    },
}
--[[
cfg.robbery = {
    {
        reset = false,
        doors = {
            {
                pos = {148.02661,-1044.36389,29.50693,250.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vauldr"), -- hash of the entity model
                swaphash = nil,
                openheading = 150.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "vault", -- "vault","door"
                openvariable = -0.01,
            },
            {
                pos = {150.29132,-1047.62902,29.66629,160.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                swaphash = nil,
                openheading = 0.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "door", -- "vault","door"
            },
        },
        interactables = {
            {
                type = "hack_panel", -- type of loot
                pos = {147.25608,-1046.25928,29.7669,250.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {1}, -- {index,index,index,index,...}
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "hack_panel", -- type of loot
                pos = {148.46664,-1046.61755,29.76694,160.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {2}, -- {index,index,index,index,...}

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "trolly", -- type of loot
                pos = {149.8655,-1045.17346,28.8193684,160.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01a"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "trolly", -- type of loot
                pos = {147.336426,-1047.75867,28.8193684,250.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01c"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1,2}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
        },
    },
    {
        reset = false,
        doors = {
            {
                pos = {312.35800,-282.73013,54.30364,250.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vauldr"), -- hash of the entity model
                swaphash = nil,
                openheading = 150.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "vault", -- "vault","door"
                openvariable = -0.01,
            },
            {
                pos = {314.62387,-285.99447,54.46300,160.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                swaphash = nil,
                openheading = 0.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "door", -- "vault","door"
            },
        },
        interactables = {
            {
                type = "hack_panel", -- type of loot
                pos = {311.58700,-284.62500,54.56400,250.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {1}, -- {index,index,index,index,...}
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "hack_panel", -- type of loot
                pos = {312.79700,-284.98400,54.56400,160.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {2}, -- {index,index,index,index,...}

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "trolly", -- type of loot
                pos = {314.148346,-283.522,53.62192,160.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01a"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "trolly", -- type of loot
                pos = {311.623779,-286.213226,53.62192,250.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01c"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1,2}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
        },
    },
    {
        reset = false,
        doors = {
            {
                pos = {-352.73651,-53.57247,49.17543,250.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vauldr"), -- hash of the entity model
                swaphash = nil,
                openheading = 150.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "vault", -- "vault","door"
                openvariable = -0.01,
            },
            {
                pos = {-350.41436,-56.79705,49.33479,160.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                swaphash = nil,
                openheading = 0.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "door", -- "vault","door"
            },
        },
        interactables = {
            {
                type = "hack_panel", -- type of loot
                pos = {-353.47400,-55.48100,49.43600,250.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {1}, -- {index,index,index,index,...}
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "hack_panel", -- type of loot
                pos = {-352.25800,-55.81800,49.43600,160.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {2}, -- {index,index,index,index,...}

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "trolly", -- type of loot
                pos = {-350.991943,-54.30574,48.49106,160.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01a"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "trolly", -- type of loot
                pos = {-353.4229,-57.06775,48.49106,250.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01c"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1,2}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
        },
    },
    {
    
        reset = false,
        doors = {
            {
                pos = {-1211.26098,-334.55960,37.91989,296.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vauldr"), -- hash of the entity model
                swaphash = nil,
                openheading = 196.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "vault", -- "vault","door"
                openvariable = -0.01,
            },
            {
                pos = {-1207.32824,-335.12893,38.07925,206.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                swaphash = nil,
                openheading = 0.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "door", -- "vault","door"
            },
        },
        interactables = {
            {
                type = "hack_panel", -- type of loot
                pos = {-1210.39441,-336.40950,37.98177 + 0.2,297.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {1}, -- {index,index,index,index,...}
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "hack_panel", -- type of loot
                pos = {-1209.31400,-335.77633,37.98177 + 0.2,207.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {2}, -- {index,index,index,index,...}

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "trolly", -- type of loot
                pos = {-1209.51038,-333.781158,37.2355423,207.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01a"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "trolly", -- type of loot
                pos = {-1209.21484, -337.467316, 37.2353058,297.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01c"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1,2}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
        },
    },
    {
        reset = false,
        doors = {
            {
                pos = {1175.54211,2710.96132,38.22689,90.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vauldr"), -- hash of the entity model
                swaphash = nil,
                openheading = 350.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "vault", -- "vault","door"
                openvariable = -0.01,
            },
            {
                pos = {1172.29113,2713.14624,38.38625,0.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                swaphash = nil,
                openheading = 0.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "door", -- "vault","door"
            },
        },
        interactables = {
            {
                type = "hack_panel", -- type of loot
                pos = {1175.61300,2712.90600,38.48800,90.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {1}, -- {index,index,index,index,...}
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "hack_panel", -- type of loot
                pos = {1174.35681,2712.82275,38.48800,0.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {2}, -- {index,index,index,index,...}

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "trolly", -- type of loot
                pos = {1173.68628, 2710.96338, 37.54242,0.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01a"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "trolly", -- type of loot
                pos = {1175.0365,2714.37573,37.54242,90.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01c"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1,2}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
        },
    },
    {
        reset = false,
        doors = {
            {
                pos = {-2958.53857,482.27056,15.83594,357.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vauldr"), -- hash of the entity model
                swaphash = nil,
                openheading = 257.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "vault", -- "vault","door"
                openvariable = -0.01,
            },
            {
                pos = {-2956.11621,485.42059,15.99530,267.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                swaphash = nil,
                openheading = 0.0, -- the heading that the open will open
                status = false, -- false is closed true is open and "opening" is opening
                type = "door", -- "vault","door"
            },
        },
        interactables = {
            {
                type = "hack_panel", -- type of loot
                pos = {-2956.50171,482.10961,16.09997,357.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {1}, -- {index,index,index,index,...}
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "hack_panel", -- type of loot
                pos = {-2956.52148,483.37472,16.09997,267.0}, --{x,y,z,heading}
        
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                minigame = {
                    event = "CORE_ROB_BANK_PACIFIC:HACKMINIGAMECUSTOM_B", -- event
                    data = { -- data that will pass to the event
                        background = 4, -- 0 to 6 | MUST BE INTEGER
                        lives = 7.0, -- max is 7.0 | MUST BE FLOAT
                        difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
                        timer = 120, -- seconds
                    },
                },
        
                doors = {2}, -- {index,index,index,index,...}

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_needed = "robbery_green_laptop", -- item name
                item_amount_needed = 1, -- item amount
                item_needed_remove_chance = 100, -- 0 / 100 %
                
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Hack",51}, -- {text,key}
                polyzone = {"Hack","fa-solid fa-laptop",0.3,0.5,0.0,0.0}, -- {label,targeticon,length,width}
            },
            { 
                type = "trolly", -- type of loot
                pos = {-2958.36000,484.03570,15.14949,268.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01a"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
            {
                type = "trolly", -- type of loot
                pos = {-2954.99976,482.63134,15.14949,358.0}, --{x,y,z,heading}
        
                hash = GetHashKey("ch_prop_ch_cash_trolly_01a"), -- hash of the model that will spawn
                grab_hash = GetHashKey("hei_prop_heist_cash_pile"), -- grab hash of the model that will spawn when you collect the trolly
        
                net_id = 0, -- 0 will spawn if you put nil it will not spawn
                status = false, -- dont change
                done = false, -- dont change

                blocked_until = {1,2}, -- {index,index,...} this will only allow you to interact if those are done.
        
                item_to_give_type = "normal", -- "normal" or "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                item_to_give = {
                    {"money",1000,2500,100} -- {item_name,amount_min,amount_max,item_rarity}
                },
        
                checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                markermenu = {"[E] Collect",51}, -- {text,key}
                polyzone = {"Collect","fa-solid fa-money-bill",0.8,1.0,0.0,0.0}, -- {label,targeticon,length,width}
            },
        },
    },
}
]]