cfg.log = {
	active = true,
	logs = { -- Available Logs
		["start"] = { -- This is the log that is used when a player starts the robbery.
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Pacific Robbery",-- title of the embed message
			msg = "The robbery just got started.", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["giveitem"] = { -- This is the log that is used when a player gets a reward from the script.
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Pacific Robbery", -- title of the embed message
			msg = "Received", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["removeitem"] = { -- This is the log that is used when a player removes an item .
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Pacific Robbery", -- title of the embed message
			msg = "Removed", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
		["luaexecutors"] = { -- This is the log that is used when a player tries to trigger events to give items 100% Lua Executor.
			webhook = "https://discord.com/api/webhooks/959689275304181800/QrXshaZ8nxUlZ5QvG7rvoHWvnE7vyqasiGPsUcQ8v7UrJzQy2Wn6BHukz6saF0HXwJ-O", -- This is the webhook that you have to set.
			title = "Pacific Robbery", -- title of the embed message
			msg = "Cheater", -- message , for more control check server/functions.lua
			avatar = "https://imgur.com/jOcxS1Q.png", -- webhook avatar
			username = "Nuno Radio Man Robberies", -- webhook username
			footer = "Nuno Radio Man Robberies", -- embeded footer.
		},
	},
}