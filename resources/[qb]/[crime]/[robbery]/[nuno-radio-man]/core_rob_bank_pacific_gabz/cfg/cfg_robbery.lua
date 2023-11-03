cfg.robbery = {
    status = true, -- this is the variable responsible if the robbery is disable or not. | TRUE = ENABLED | FALSE = DISABLED
    reset = false, -- this is the variable responsible for the robbery reset. | If this is true then the robbery is active and will be resetted when the time triggers
    doors = {
		{ -- 1
			type = "door", -- "vault","door","automatic"
			position = {272.64215,219.89871,97.31797,340.0}, -- {x,y,z,heading}
			model = GetHashKey("gabz_sm_pb_door_08"), -- model_hash
			status = false, -- false is closed true is open and "opening" is opening
	
			swapmodel = nil, -- model_hash
			openheading = nil, -- the heading that the open will open
			openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
		},
		{ -- 2
			type = "door", -- "vault","door","automatic"
			position = {270.10321,212.92292,97.31797,340.0}, -- {x,y,z,heading}
			model = GetHashKey("gabz_sm_pb_door_08"), -- model_hash
			status = false, -- false is closed true is open and "opening" is opening
	
			swapmodel = nil, -- model_hash
			openheading = nil, -- the heading that the open will open
			openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
		},
		{ -- 3
			type = "door", -- "vault","door","automatic"
			position = {244.55801,216.89727,97.31797,340.0}, -- {x,y,z,heading}
			model = GetHashKey("gabz_sm_pb_door_08"), -- model_hash
			status = false, -- false is closed true is open and "opening" is opening
	
			swapmodel = nil, -- model_hash
			openheading = nil, -- the heading that the open will open
			openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
		},
		{ -- 4
			type = "door", -- "vault","door","automatic"
			position = {250.56420,233.39938,97.31797,340.0}, -- {x,y,z,heading}
			model = GetHashKey("gabz_sm_pb_door_08"), -- model_hash
			status = false, -- false is closed true is open and "opening" is opening
	
			swapmodel = nil, -- model_hash
			openheading = nil, -- the heading that the open will open
			openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
		},
		{ -- 5
			type = "vault", -- "vault","door","automatic"
			position = {234.98573,228.06961,97.72184,70.0}, -- {x,y,z,heading}
			model = GetHashKey("v_ilev_bk_vaultdoor"), -- model_hash
			status = false, -- false is closed true is open and "opening" is opening
	
			swapmodel = nil, -- model_hash
			openheading = 310.0, -- the heading that the open will open
			openvariable = -0.02, -- the amount of rotation applied to the "vault" while "opening"
		},
		{ -- 6
			type = "door", -- "vault","door","automatic"
			position = {229.89053,227.34201,97.32397,340.0}, -- {x,y,z,heading}
			model = GetHashKey("gabz_sm_pb_door_09"), -- model_hash
			status = false, -- false is closed true is open and "opening" is opening
	
			swapmodel = nil, -- model_hash
			openheading = nil, -- the heading that the open will open
			openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
		},
		{ -- 7
			type = "door", -- "vault","door","automatic"
			position = {226.64628,228.88678,97.32397,160.0}, -- {x,y,z,heading}
			model = GetHashKey("gabz_sm_pb_door_09"), -- model_hash
			status = false, -- false is closed true is open and "opening" is opening
	
			swapmodel = nil, -- model_hash
			openheading = nil, -- the heading that the open will open
			openvariable = nil, -- the amount of rotation applied to the "vault" while "opening"
		},
    },
    interactables = {
		{ -- 1
			type = "interactable_securitypanel_01", -- type of loot
	
			spawn = {
				type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
				models = {},
				position = {270.73092,223.57919,97.11717,0.0,0.0,70.0,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},
	
				freeze = true,
				islocal = true,
			},

			doors = {1},-- {index,index,index,index,...}
	
			keycard_type = "pacific_01", -- type of keycard it will spawn for the animation
	
			target_zone = {0.45858,0.8,0.61042,0.0,0.05787,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
			options = {
				{
					type = "hack_securitypanel_01", -- dont change
	
					item_needed = {
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
						markermenu = {"[1] Hack",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,key}
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

		{ -- 2
			type = "interactable_securitypanel_01", -- type of loot
	
			spawn = {
				type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
				models = {},
				position = {266.28732,211.37063,97.11717,0.0,0.0,70.0,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},
	
				freeze = true,
				islocal = true,
			},

			doors = {2},-- {index,index,index,index,...}
	
			keycard_type = "pacific_01", -- type of keycard it will spawn for the animation
	
			target_zone = {0.45858,0.8,0.61042,0.0,0.05787,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
			options = {
				{
					type = "hack_securitypanel_01", -- dont change
	
					item_needed = {
						{"electronickit",1,100}, -- {item_name,item_amount,percentage_to_remove}
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
						markermenu = {"[1] Hack",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,key}
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
			type = "interactable_securitypanel_01", -- type of loot
	
			spawn = {
				type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
				models = {},
				position = {241.85566,218.67411,97.11698,0.0,0.0,160.0,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},
	
				freeze = true,
				islocal = true,
			},

			blocked = {
				type = "or", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
				interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
					{1,"done"}, -- {index,type}
					{2,"done"}, -- {index,type}
				},
			},

			doors = {3},-- {index,index,index,index,...}
	
			keycard_type = "pacific_01", -- type of keycard it will spawn for the animation
	
			target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
			options = {
				{
					type = "hack_securitypanel_01", -- dont change
	
					item_needed = {
						{"electronickit",1,100}, -- {item_name,item_amount,percentage_to_remove}
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
						markermenu = {"[1] Hack",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,key}
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
		{ -- 4
			type = "interactable_trolly_01", -- type of loot
	
			spawn = {
				type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = "", -- model_hash
				models = {
					{"none",50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01c"),50.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01a"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01b"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01c"),35.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01c"),50.0}, -- {model_hash,percentage}
				},
				position = {241.64663,210.94276,97.11051,0.0,0.0,340.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},
	
				freeze = true,
			},

			blocked = {
				type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
				interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
					{3,"done"}, -- {index,type}
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
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						]]--
						[GetHashKey("interactable_trolly_gold_01a")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						markermenu = {"[1] Collect",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
						target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
					},
	
					checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
					camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
					dispatch = nil,
				},
			},
		},

		{ -- 5
			type = "interactable_securitypanel_01", -- type of loot
	
			spawn = {
				type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
				models = {},
				position = {247.33099,233.71765,97.11698,0.0,0.0,340.0,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},
	
				freeze = true,
				islocal = true,
			},

			blocked = {
				type = "or", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
				interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
					{1,"done"}, -- {index,type}
					{2,"done"}, -- {index,type}
				},
			},

			doors = {4},-- {index,index,index,index,...}
	
			keycard_type = "pacific_01", -- type of keycard it will spawn for the animation
	
			target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
			options = {
				{
					type = "hack_securitypanel_01", -- dont change
	
					item_needed = {
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
						markermenu = {"[1] Hack",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,key}
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
		{ -- 6
			type = "interactable_trolly_01", -- type of loot

			spawn = {
				type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = "", -- model_hash
				models = {
					{"none",50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01c"),50.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01a"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01b"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01c"),35.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01c"),50.0}, -- {model_hash,percentage}
				},
				position = {252.19699,239.92962,97.11051,0.0,0.0,160.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},

				freeze = true,
			},

			blocked = {
				type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
				interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
					{5,"done"}, -- {index,type}
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
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						]]--
						[GetHashKey("interactable_trolly_gold_01a")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						markermenu = {"[1] Collect",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
						target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
					},

					checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
					camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
					dispatch = nil,
				},
			},
		},

		{ -- 7
			type = "interactable_securitypanel_01", -- type of loot

			spawn = {
				type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
				models = {},
				position = {236.36370,231.77516,97.11698,0.0,0.0,70.0,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},

				freeze = true,
				islocal = true,
			},

			blocked = {
				type = "or", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
				interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
					{1,"done"}, -- {index,type}
					{2,"done"}, -- {index,type}
				},
			},

			doors = {5},-- {index,index,index,index,...}

			keycard_type = "pacific_01", -- type of keycard it will spawn for the animation

			target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
			options = {
				{
					type = "hack_securitypanel_01", -- dont change

					item_needed = {
						{"security_card_02",1,100}, -- {item_name,item_amount,chance_to_remove}
                        {"pixellaptop",1,0}, -- {item_name,item_amount,chance_to_remove}
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
						markermenu = {"[1] Hack",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,key}
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
		{ -- 8
			type = "interactable_trolly_01", -- type of loot

			spawn = {
				type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = "", -- model_hash
				models = {
					{"none",50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01c"),50.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01a"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01b"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01c"),35.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01c"),50.0}, -- {model_hash,percentage}
				},
				position = {229.38514,234.68666,97.11051,0.0,0.0,160.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},

				freeze = true,
			},

			blocked = {
				type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
				interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
					{7,"done"}, -- {index,type}
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
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						]]--
						[GetHashKey("interactable_trolly_gold_01a")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						markermenu = {"[1] Collect",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
						target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
					},

					checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
					camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
					dispatch = nil,
				},
			},
		},
		{ -- 9
			type = "interactable_trolly_01", -- type of loot

			spawn = {
				type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = "", -- model_hash
				models = {
					{"none",50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01c"),50.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01a"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01b"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01c"),35.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01c"),50.0}, -- {model_hash,percentage}
				},
				position = {230.96690,234.11094,97.11051,0.0,0.0,160.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},

				freeze = true,
			},

			blocked = {
				type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
				interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
					{7,"done"}, -- {index,type}
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
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						]]--
						[GetHashKey("interactable_trolly_gold_01a")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						markermenu = {"[1] Collect",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
						target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
					},

					checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
					camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
					dispatch = nil,
				},
			},
		},

		{ -- 10
			type = "interactable_securitypanel_01", -- type of loot

			spawn = {
				type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
				models = {},
				position = {227.86909,228.38037,97.11698,0.0,0.0,160.0,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},

				freeze = true,
				islocal = true,
			},

			blocked = {
				type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
				interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
					{7,"done"}, -- {index,type}
				},
			},

			doors = {6,7},-- {index,index,index,index,...}

			keycard_type = "pacific_01", -- type of keycard it will spawn for the animation

			target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
			options = {
				{
					type = "hack_securitypanel_01", -- dont change

					item_needed = {
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
						markermenu = {"[1] Hack",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Hack",157}, -- {text,key}
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
		{ -- 11
			type = "interactable_trolly_01", -- type of loot

			spawn = {
				type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = "", -- model_hash
				models = {
					{"none",50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01c"),50.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01a"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01b"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01c"),35.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01c"),50.0}, -- {model_hash,percentage}
				},
				position = {228.64396,225.41377,97.11051,0.0,0.0,345.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},

				freeze = true,
			},

			blocked = {
				type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
				interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
					{10,"done"}, -- {index,type}
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
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						]]--
						[GetHashKey("interactable_trolly_gold_01a")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						markermenu = {"[1] Collect",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
						target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
					},

					checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
					camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
					dispatch = nil,
				},
			},
		},
		{ -- 12
			type = "interactable_trolly_01", -- type of loot

			spawn = {
				type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = "", -- model_hash
				models = {
					{"none",50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01c"),50.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01a"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01b"),35.0}, -- {model_hash,percentage}
					--{GetHashKey("interactable_trolly_silver_01c"),35.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01a"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01b"),50.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_gold_01c"),50.0}, -- {model_hash,percentage}
				},
				position = {225.58288,226.80377,97.11051,0.0,0.0,340.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},

				freeze = true,
			},

			blocked = {
				type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
				interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
					{10,"done"}, -- {index,type}
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
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_money_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"markedbills",1,1,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						]]--
						[GetHashKey("interactable_trolly_gold_01a")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01b")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							},
						},
						[GetHashKey("interactable_trolly_gold_01c")] = {
							type = "normal", -- "normal" "random" "server"
							items = {
								{"goldbar",4,6,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
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
						markermenu = {"[1] Collect",157}, -- {text,key}
						displayhelp = {"~INPUT_SELECT_WEAPON_UNARMED~ Collect",157}, -- {text,key}
						target = {"Collect","fa-solid fa-money-bill"},-- {label,targeticon}
					},

					checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
					camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
					dispatch = nil,
				},
			},
		},
    },
}