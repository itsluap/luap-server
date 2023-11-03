cfg.robbery = {
    { -- 1
        status = true, -- this is the variable responsible if the robbery is disable or not. | TRUE = ENABLED | FALSE = DISABLED
        reset = false, -- this is the variable responsible for the robbery reset. | If this is true then the robbery is active and will be resetted when the time triggers
        doors = {
			{ -- 1
				type = "vault", -- "vault","door","automatic"
				position = {148.02661,-1044.36389,29.50693,250.0}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_gb_vauldr"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = nil, -- model_hash
				openheading = 150.0, -- the heading that the open will open
				openvariable = -0.02, -- the amount of rotation applied to the "vault" while "opening"
			},
			{ -- 2
				type = "door", -- "vault","door","automatic"
				position = {150.31129,-1047.57458,29.67818,160.0}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_gb_vaubar"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = GetHashKey("tr_prop_tr_ilev_gb_vaubar_01a"), -- model_hash
				openheading = nil, -- the heading that the open will open
				openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
			},
        },
        interactables = {
			--Vault Door
			{ -- 1
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {147.29722,-1046.21496,29.36820,0.0,0.0,249.85,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				doors = {1},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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

			--Room 01
			{ -- 2
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {148.48196,-1046.64172,29.34629,0.0,0.0,159.85,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},

				doors = {2},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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
			{ -- 3
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						{"none",60.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),40.0}, -- {model_hash,percentage}
					},
					position = {150.42740,-1045.36560,29.36794,0.0,0.0,160.0,0.1,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},

			--Room 02
			{ -- 4
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {
						{148.02230,-1047.45700,29.34629,0.0,0.0,159.85,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
						{147.28710,-1047.83900,29.34629,0.0,0.0,249.85,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
			{ -- 5
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {148.82348,-1049.26648,29.36794,0.0,0.0,340.0,0.0,-1.5,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
        },
    },
    { -- 2
        status = true, -- this is the variable responsible if the robbery is disable or not. | TRUE = ENABLED | FALSE = DISABLED
        reset = false, -- this is the variable responsible for the robbery reset. | If this is true then the robbery is active and will be resetted when the time triggers
        doors = {
			{ -- 1
				type = "vault", -- "vault","door","automatic"
				position = {312.35800,-282.73013,54.30364,250.0}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_gb_vauldr"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = nil, -- model_hash
				openheading = 150.0, -- the heading that the open will open
				openvariable = -0.02, -- the amount of rotation applied to the "vault" while "opening"
			},
			{ -- 2
				type = "door", -- "vault","door","automatic"
				position = {314.64379,-285.94006,54.47490,160.0}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_gb_vaubar"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = GetHashKey("tr_prop_tr_ilev_gb_vaubar_01a"), -- model_hash
				openheading = nil, -- the heading that the open will open
				openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
			},
        },
        interactables = {
			--Vault Door
			{ -- 1
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {311.63015,-284.58154,54.16491,0.0,0.0,249.87,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				doors = {1},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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

			--Room 01
			{ -- 2
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {312.81451,-285.00723,54.14299,0.0,0.0,159.87,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},

				doors = {2},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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
			{ -- 3
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						{"none",60.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),40.0}, -- {model_hash,percentage}
					},
					position = {314.75647,-283.73140,54.16458,0.0,0.0,160.0,0.1,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},

			--Room 02
			{ -- 4
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {
						{312.35480,-285.82300,54.14299,0.0,0.0,159.87,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
						{311.61970,-286.20530,54.14299,0.0,0.0,249.87,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
						
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
			{ -- 5
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {313.16024,-287.63450,54.16458,0.0,0.0,340.0,0.0,-1.5,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
        },
    },
    { -- 3
        status = true, -- this is the variable responsible if the robbery is disable or not. | TRUE = ENABLED | FALSE = DISABLED
        reset = false, -- this is the variable responsible for the robbery reset. | If this is true then the robbery is active and will be resetted when the time triggers
        doors = {
			{ -- 1
				type = "vault", -- "vault","door","automatic"
				position = {-352.73651,-53.57247,49.17543,250.0}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_gb_vauldr"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = nil, -- model_hash
				openheading = 150.0, -- the heading that the open will open
				openvariable = -0.02, -- the amount of rotation applied to the "vault" while "opening"
			},
			{ -- 2
				type = "door", -- "vault","door","automatic"
				position = {-350.39535,-56.74229,49.34669,161.0}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_gb_vaubar"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = GetHashKey("tr_prop_tr_ilev_gb_vaubar_01a"), -- model_hash
				openheading = nil, -- the heading that the open will open
				openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
			},
        },
        interactables = {
			--Vault Door
			{ -- 1
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {-353.43209,-55.43621,49.03653,0.0,0.0,250.86,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				doors = {1},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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

			--Room 01
			{ -- 2
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {-352.24093,-55.84221,49.01478,0.0,0.0,160.86,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},

				doors = {2},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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
			{ -- 3
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						{"none",60.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),40.0}, -- {model_hash,percentage}
					},
					position = {-350.32150,-54.52216,49.03646,0.0,0.0,160.0,0.1,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},

			--Room 02
			{ -- 4
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {
						{-352.68610,-56.66498,49.01479,0.0,0.0,160.86,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
						{-353.41440,-57.05992,49.01479,0.0,0.0,250.86,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
			{ -- 5
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {-351.84440,-58.44970,49.03646,0.0,0.0,340.0,0.0,-1.5,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
        },
    },
    { -- 4
        status = true, -- this is the variable responsible if the robbery is disable or not. | TRUE = ENABLED | FALSE = DISABLED
        reset = false, -- this is the variable responsible for the robbery reset. | If this is true then the robbery is active and will be resetted when the time triggers
        doors = {
			{ -- 1
				type = "vault", -- "vault","door","automatic"
				position = {-1211.26098,-334.55960,37.91989,296.0}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_gb_vauldr"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = nil, -- model_hash
				openheading = 196.0, -- the heading that the open will open
				openvariable = -0.02, -- the amount of rotation applied to the "vault" while "opening"
			},
			{ -- 2
				type = "door", -- "vault","door","automatic"
				position = {-1207.35449,-335.07724,38.09114,207.0}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_gb_vaubar"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = GetHashKey("tr_prop_tr_ilev_gb_vaubar_01a"), -- model_hash
				openheading = nil, -- the heading that the open will open
				openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
			},
        },
        interactables = {
			--Vault Door
			{ -- 1
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {-1210.40344,-336.35461,37.78099,0.0,0.0,296.86,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				doors = {1},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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

			--Room 01
			{ -- 2
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {-1209.28405,-335.77966,37.75924,0.0,0.0,206.86,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},

				doors = {2},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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
			{ -- 3
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						{"none",60.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),40.0}, -- {model_hash,percentage}
					},
					position = {-1208.89990,-333.47888,37.78091,0.0,0.0,207.0,0.1,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},

			--Room 02
			{ -- 4
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {
						{-1209.00100,-336.67140,37.75924,0.0,0.0,206.86,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
						{-1209.22300,-337.46970,37.75924,0.0,0.0,296.86,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
			{ -- 5
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {-1207.1283,-337.31234,37.78091,0.0,0.0,25.0,0.0,-1.5,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
        },
    },
    { -- 5
        status = true, -- this is the variable responsible if the robbery is disable or not. | TRUE = ENABLED | FALSE = DISABLED
        reset = false, -- this is the variable responsible for the robbery reset. | If this is true then the robbery is active and will be resetted when the time triggers
        doors = {
			{ -- 1
				type = "vault", -- "vault","door","automatic"
				position = {1175.54211,2710.96132,38.22689,90.0}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_gb_vauldr"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = nil, -- model_hash
				openheading = 350.0, -- the heading that the open will open
				openvariable = -0.02, -- the amount of rotation applied to the "vault" while "opening"
			},
			{ -- 2
				type = "door", -- "vault","door","automatic"
				position = {1172.29113,2713.08837,38.39814,0.0}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_gb_vaubar"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = GetHashKey("tr_prop_tr_ilev_gb_vaubar_01a"), -- model_hash
				openheading = nil, -- the heading that the open will open
				openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
			},
        },
        interactables = {
			--Vault Door
			{ -- 1
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {1175.58898,2712.85009,38.08793,0.0,0.0,90.0,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				doors = {1},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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

			--Room 01
			{ -- 2
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {1174.32995,2712.84301,38.06625,0.0,0.0,0.0,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},

				doors = {2},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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
			{ -- 3
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						{"none",60.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),40.0}, -- {model_hash,percentage}
					},
					position = {1172.94739,2710.96387,38.08793,0.0,0.0,0.0,0.1,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},

			--Room 02
			{ -- 4
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {
						{1174.48000,2713.76600,38.06621,0.0,0.0,0.0,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
						{1175.03900,2714.37800,38.06621,0.0,0.0,90.0,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
			{ -- 5
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {1173.09729,2715.18900,38.08793,0.0,0.0,180.0,0.0,-1.5,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
        },
    },
    { -- 6
        status = true, -- this is the variable responsible if the robbery is disable or not. | TRUE = ENABLED | FALSE = DISABLED
        reset = false, -- this is the variable responsible for the robbery reset. | If this is true then the robbery is active and will be resetted when the time triggers
        doors = {
			{ -- 1
				type = "vault", -- "vault","door","automatic"
				position = {-2958.53857,482.27056,15.83594,357.0}, -- {x,y,z,heading}
				model = GetHashKey("hei_prop_heist_sec_door"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = nil, -- model_hash
				openheading = 257.0, -- the heading that the open will open
				openvariable = -0.02, -- the amount of rotation applied to the "vault" while "opening"
			},
			{ -- 2
				type = "door", -- "vault","door","automatic"
				position = {-2956.17407,485.42306,16.00720,267.0}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_gb_vaubar"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening
		
				swapmodel = GetHashKey("tr_prop_tr_ilev_gb_vaubar_01a"), -- model_hash
				openheading = nil, -- the heading that the open will open
				openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
			},
        },
        interactables = {
			--Vault Door
			{ -- 1
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {-2956.55371,482.13922,15.69696,0.0,0.0,357.54,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				doors = {1},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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

			--Room 01
			{ -- 2
				type = "interactable_securitypanel_01", -- type of loot
		
				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {-2956.50683,483.39688,15.67529,0.0,0.0,267.54,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
					islocal = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},

				doors = {2},
		
				keycard_type = "fleeca_01", -- type of keycard it will spawn for the animation
		
				target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{
						type = "hack_securitypanel_01", -- dont change
		
						item_needed = {
							{"trojan_usb",1,100}, -- {item_name,item_amount,chance_to_remove}
                            {"electronickit",1,100}, -- {item_name,item_amount,chance_to_remove}
						},
		
						minigame = {
							{ -- 1
								event = "CORE_ROB_MINIGAMES:TerminalMinigame_c",
								data = {
									background = 4, -- 0 to 6 | MUST BE INTEGER
									lives = 5.0, -- max is 7.0 | MUST BE FLOAT
									difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
									timer = 120, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},
		
						interactions = {
							markermenu = {"[1] Hack",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"},
						},
		
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
			{ -- 3
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						{"none",60.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),40.0}, -- {model_hash,percentage}
					},
					position = {-2958.32251,484.85968,15.69699,0.0,0.0,268.0,0.1,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},

			--Room 02
			{ -- 4
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {
						{-2955.59100,483.20660,15.67529,0.0,0.0,267.54,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
						{-2955.00300,482.62230,15.67529,0.0,0.0,357.54,0.0,-0.05,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
			{ -- 5
				type = "interactable_trolly_01", -- type of loot
		
				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
					model = "", -- model_hash
					models = {
						--{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),55.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),55.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_silver_01c"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01b"),20.0}, -- {model_hash,percentage}
						--{GetHashKey("interactable_trolly_bronze_01c"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01b"),45.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01c"),45.0}, -- {model_hash,percentage}
					},
					position = {-2954.09546,484.52980,15.69699,0.0,0.0,87.0,0.0,-1.5,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},
		
					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},
		
				target_zone = {1.019589,0.579761,1.021484,0.0053425,-0.0133905,0.036133,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ 
						type = "grab_trolly_01",
		
						item_to_give = {
							[GetHashKey("interactable_trolly_money_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_money_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",1000,2500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							--[[
							[GetHashKey("interactable_trolly_silver_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_silver_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_bronze_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							]]--
							[GetHashKey("interactable_trolly_gold_01a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01b")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							[GetHashKey("interactable_trolly_gold_01c")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},
		
						interactions = {
							markermenu = {"[1] Collect",157}, -- {text,control_key}
							displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,control_key}
							target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
						},
		
						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
        },
    },
}