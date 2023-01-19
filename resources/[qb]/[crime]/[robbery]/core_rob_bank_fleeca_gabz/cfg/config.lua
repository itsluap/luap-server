cfg = {}

cfg.debug = false -- debug version to check some stuff [prints]
cfg.framework = "qbcore" --esx,qbcore,vrp,vrpex,nunoradioman,standalone
cfg.interaction = "qbtarget" --qbtarget,markermenu,gtav
cfg.dispatch = "ps_dispatch" --nunoradioman,ps_dispatch,cd_dispatch,core_dispatch

cfg.police = {
	groups = {"police","trooper","sheriff"}, -- police groups
	amount = 0, -- police amount
}
cfg.timers = {
	reset_timer = 30, -- This Timer is in Minutes
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
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 150.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {150.29132,-1047.62902,29.66629,160.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {147.22959,-1046.18579,29.36929,0.0,0.0,250.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {150.42740,-1045.36560,29.36929,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.1,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                        dispatch = nil,
                    },
                },
            },

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {148.48716,-1046.56115,29.36929,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
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
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {148.82348,-1049.26648,29.36929,0.0,0.0,160.0 + 180.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 150.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {314.62387,-285.99447,54.46300,160.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {311.54772,-284.55749,54.17426,0.0,0.0,250.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {314.75647,-283.73140,54.17426,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.1,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                        dispatch = nil,
                    },
                },
            },

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {312.81750,-284.92764,54.17426,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
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
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {313.16024,-287.63450,54.17426,0.0,0.0,160.0 + 180.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 150.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {-350.41436,-56.79705,49.33479,160.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {-353.51327,-55.41349,49.03647,0.0,0.0,250.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {-350.32150,-54.52216,49.03647,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.1,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                        dispatch = nil,
                    },
                },
            },

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {-352.23748,-55.76162,49.03647,0.0,0.0,160.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
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
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {-351.84440,-58.44970,49.03647,0.0,0.0,160.0 + 180.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 196.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {-1207.32824,-335.12893,38.07925,206.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {-1210.47058,-336.39218,37.79077,0.0,0.0,297.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {-1208.89990,-333.47888,37.79077,0.0,0.0,207.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.1,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                        dispatch = nil,
                    },
                },
            },

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {-1209.34118,-335.72290,37.79077,0.0,0.0,207.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
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
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {-1207.1283,-337.31234,37.79077,0.0,0.0,205.0 - 180.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 350.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {1172.29113,2713.14624,38.38625,0.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {1175.67297,2712.85595,38.06623,0.0,0.0,90.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {1172.94739,2710.96387,38.06623,0.0,0.0,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.1,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                        dispatch = nil,
                    },
                },
            },

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {1174.35681,2712.76269,38.06623,0.0,0.0,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
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
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {1173.09729,2715.18900,38.06628,0.0,0.0,0.0 + 180.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = 257.0, -- the heading that the open will open
                openvariable = -0.04, -- the amount of rotation applied to the "vault" while "opening"
            },
            { -- 2
                type = "door", -- "vault","door","automatic"
                pos = {-2956.11621,485.42059,15.99530,267.0}, -- {x,y,z,heading}
                hash = GetHashKey("v_ilev_gb_vaubar"), -- hash of the entity model
                status = false, -- false is closed true is open and "opening" is opening
        
                swaphash = nil, -- swap hash when the door is swapped
                openheading = nil, -- the heading that the open will open
                openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
            },
        },
        interactables = {
            { -- 1
                type = "securitypanel01", -- type of loot
                pos = {-2956.55468,482.05227,15.67530,0.0,0.0,357.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "normal", -- "normal" "rarity" "nospawn"
                hash = GetHashKey("hei_prop_hei_securitypanel"), -- hash of the model that will spawn
        
                net_id = 0, -- dont change
                status = false, -- dont change
                done = false, -- dont change
                spawned = false, -- dont change

                doors = {1},
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {-2958.32251,484.85968,15.67530,0.0,0.0,268.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.1,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                        dispatch = nil,
                    },
                },
            },

            { -- 3
                type = "securitypanel01", -- type of loot
                pos = {-2956.58129,483.37786,15.67530,0.0,0.0,267.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,0.4,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
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
        
                polyzone = {0.2,0.48,0.0,0.0,0.0,0.05,0.0,2.0},-- {length,width,minZextra,maxZextra,offset_x,offset_y,offset_z,distance}
                options = {
                    {
                        type = "hacksecuritypanel_01",
        
                        item_needed = {
                            {"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
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
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
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
                pos = {-2954.09546,484.52980,15.67530,0.0,0.0,267.0 - 180.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z}
                offset = {0.0,0.0,-0.51,0.0}, -- {offset_x,offset_y,offset_z,offset_heading}
        
                hash_type = "rarity", -- "normal" "rarity" "nospawn"
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
        
                        item_to_give_type = "normal_model", -- "rarity" "normal" "random" | "normal" trys to spawn every item, "random" gets an random item, not by rarity.
                        item_to_give = {
                            [GetHashKey("bank_cash_trolly_01a")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01b")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_cash_trolly_01c")] = {
                                {"markedbills",1,1,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_silver_trolly_01a")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01b")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_silver_trolly_01c")] = {
                                {"robbery_rewards_silverbar_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                            [GetHashKey("bank_gold_trolly_01a")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,20}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01b")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_01",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_gold_trolly_01c")] = {
                                {"goldchain",2,4,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"rolex",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"goldbar",1,2,100}, -- {item_name,amount_min,amount_max,item_rarity}
                                {"security_card_02",1,2,15}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            --[[
                            [GetHashKey("bank_diamond_trolly_01a")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01b")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            [GetHashKey("bank_diamond_trolly_01c")] = {
                                {"robbery_rewards_diamondbox_01",44,44,100}, -- {item_name,amount_min,amount_max,item_rarity}
                            },
                            ]]--
                        },
        
                        markermenu = {"[1] Collect",157}, -- {text,key}
                        displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
                        polyzone = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
        
                        checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
                        camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
                        dispatch = nil,
                    },
                },
            },
        },
    },
}