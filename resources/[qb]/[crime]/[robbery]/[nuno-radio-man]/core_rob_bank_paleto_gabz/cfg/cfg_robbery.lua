cfg.robbery = {
    status = true, -- this is the variable responsible if the robbery is disable or not. | TRUE = ENABLED | FALSE = DISABLED
    reset = false, -- this is the variable responsible for the robbery reset. | If this is true then the robbery is active and will be resetted when the time triggers
    doors = {
		{ -- 1
			type = "vault", -- "vault","door","automatic"
			position = {-100.241867,6464.549316,31.884604,225.0}, -- {x,y,z,heading}
			model = GetHashKey("ch_prop_ch_vault_d_door_01a"), -- model_hash
			status = false, -- false is closed true is open and "opening" is opening
	
			swapmodel = nil, -- model_hash
			openheading = 95.0, -- the heading that the open will open
			openvariable = -0.02, -- the amount of rotation applied to the "vault" while "opening"
		},
    },
    interactables = {
		{ -- 1
			type = "interactable_securitypanel_01", -- type of loot
	
			spawn = {
				type = "normal", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
				models = {},
				position = {-100.06060,6465.93798,31.63413,0.0,0.0,315.0,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
				positions = {},
	
				freeze = true,
				islocal = true,
			},

			doors = {1}, -- {index,index,...}
	
			keycard_type = "paleto_01", -- type of keycard it will spawn for the animation
	
			target_zone = {0.458496,0.155274,0.6099,0.0,-0.077637,0.0,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
			options = {
				{
					type = "hack_securitypanel_01", -- dont change
	
					item_needed = {
						{"security_card_01",1,100}, -- {item_name,item_amount,percentage_to_remove}
						{"pixellaptop",1,0}, -- {item_name,item_amount,percentage_to_remove}
					},
	
					minigame = {
						{ -- 1
							event = "luap:ShapeGame",
							data = {
								--background = 4, -- 0 to 6 | MUST BE INTEGER
								--lives = 5.0, -- max is 7.0 | MUST BE FLOAT
								--difficulty = "easy", -- "easy" "medium" "hard" "veryhard"
								--timer = 120, -- seconds , max is 3600 which is 1 hour.
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
		{ -- 2
			type = "interactable_trolly_01", -- type of loot
	
			spawn = {
				type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = "", -- model_hash
				models = {
					{"none",70.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01a"),30.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01b"),30.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01c"),30.0}, -- {model_hash,percentage}
				},
				position = {-100.94145,6461.49511,31.63413,0.0,0.0,315.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
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
		{ -- 3
			type = "interactable_trolly_01", -- type of loot
	
			spawn = {
				type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = "", -- model_hash
				models = {
					{"none",70.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01a"),30.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01b"),30.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01c"),30.0}, -- {model_hash,percentage}
				},
				position = {-98.01368,6463.07568,31.63413,0.0,0.0,105.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
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
		{ -- 4
			type = "interactable_trolly_01", -- type of loot
	
			spawn = {
				type = "rarity", -- "nospawn" "normal" "rarity" "glassdisplaysupport"
				model = "", -- model_hash
				models = {
					{"none",70.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01a"),30.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01b"),30.0}, -- {model_hash,percentage}
					{GetHashKey("interactable_trolly_money_01c"),30.0}, -- {model_hash,percentage}
				},
				position = {-96.93521,6460.17529,31.63413,0.0,0.0,45.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
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
    },
}