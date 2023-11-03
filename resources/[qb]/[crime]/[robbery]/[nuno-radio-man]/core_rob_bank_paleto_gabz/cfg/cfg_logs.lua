cfg.log = {
	active = true,
	logs = { -- Available Logs
		["start"] = { -- This is the log that is used when a player starts the robbery.
			webhook = "https://discord.com/api/webhooks/1169950084419551302/7O8nkmw3Cq2tW_YeBtOhPXRBLK092nc8Laobx1cxFaSEA43EFmXMU2AFDqDEq_n4SToK", -- This is the webhook that you have to set.
			title = "Paleto Robbery",-- title of the embed message
			msg = "The robbery just got started.", -- message , for more control check server/functions.lua
			avatar = "https://i.imgur.com/OC5LCCc.png", -- webhook avatar
			username = "Indigo Robberies", -- webhook username
			footer = "Indigo Robberies", -- embeded footer.
		},
		["giveitem"] = { -- This is the log that is used when a player gets a reward from the script.
			webhook = "https://discord.com/api/webhooks/1169950084419551302/7O8nkmw3Cq2tW_YeBtOhPXRBLK092nc8Laobx1cxFaSEA43EFmXMU2AFDqDEq_n4SToK", -- This is the webhook that you have to set.
			title = "Paleto Robbery", -- title of the embed message
			msg = "Received", -- message , for more control check server/functions.lua
			avatar = "https://i.imgur.com/OC5LCCc.png", -- webhook avatar
			username = "Indigo Robberies", -- webhook username
			footer = "Indigo Robberies", -- embeded footer.
		},
		["removeitem"] = { -- This is the log that is used when a player removes an item .
			webhook = "https://discord.com/api/webhooks/1169950084419551302/7O8nkmw3Cq2tW_YeBtOhPXRBLK092nc8Laobx1cxFaSEA43EFmXMU2AFDqDEq_n4SToK", -- This is the webhook that you have to set.
			title = "Paleto Robbery", -- title of the embed message
			msg = "Removed", -- message , for more control check server/functions.lua
			avatar = "https://i.imgur.com/OC5LCCc.png", -- webhook avatar
			username = "Indigo Robberies", -- webhook username
			footer = "Indigo Robberies", -- embeded footer.
		},
		["luaexecutors"] = { -- This is the log that is used when a player tries to trigger events to give items 100% Lua Executor.
			webhook = "https://discord.com/api/webhooks/1169950084419551302/7O8nkmw3Cq2tW_YeBtOhPXRBLK092nc8Laobx1cxFaSEA43EFmXMU2AFDqDEq_n4SToK", -- This is the webhook that you have to set.
			title = "Paleto Robbery", -- title of the embed message
			msg = "Cheater", -- message , for more control check server/functions.lua
			avatar = "https://i.imgur.com/OC5LCCc.png", -- webhook avatar
			username = "Indigo Robberies", -- webhook username
			footer = "Indigo Robberies", -- embeded footer.
		},
	},
}