-- Edit the below if you would like to change the notification type.
RegisterNetEvent('power_encryptedChat:newMessageNotfication')
AddEventHandler('power_encryptedChat:newMessageNotfication', function(username)
 --TriggerEvent('chat:addMessage', {color = {255, 255, 255}, args = {"^8DARKWEB", 'New Post from '..username}})
end)

RegisterNetEvent('power_encryptedChat:notification')
AddEventHandler('power_encryptedChat:notification', function(message)
 --TriggerEvent('chat:addMessage', {color = {255, 255, 255}, args = {"^8DARKWEB", message}})
end)