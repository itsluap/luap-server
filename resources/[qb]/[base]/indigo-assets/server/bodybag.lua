RegisterServerEvent('bodybag')
AddEventHandler('bodybag', function(target)
    TriggerClientEvent('bodybag:PutInBag', target)
    -- Trigger a notification if you wish to have one
end)