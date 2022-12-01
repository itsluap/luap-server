-- Discord Webhook
-- Sends a copy of the darkweb message to discord as a chat message using the a webhook.
local enableDiscordWebhook = true

-- Discord Webhook URL 
local discordWebhookURL = "https://discord.com/api/webhooks/CHANGEME"  

function discordMessage(data)
 if enableDiscordWebhook then 
  local embeds = {}
  if string.len(data.image) > 0 then 
   embeds = {{image = {url = data.image}}}
  end 
  PerformHttpRequest(discordWebhookURL, function(Error, Content, Head) end, 'POST', json.encode({username = data.username, embeds = embeds, content = data.message, avatar_url = data.picture}), {['Content-Type'] = 'application/json'})
 end 
end 


function moneyTakenForPost(source, costPerMessage)
 -- You can add your own code here to add money that is taken from the player to a management fund.
end 