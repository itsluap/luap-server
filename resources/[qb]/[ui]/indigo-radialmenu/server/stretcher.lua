RegisterNetEvent('indigo-radialmenu:server:RemoveStretcher', function(pos, stretcherObject)
    TriggerClientEvent('indigo-radialmenu:client:RemoveStretcherFromArea', -1, pos, stretcherObject)
end)

RegisterNetEvent('indigo-radialmenu:Stretcher:BusyCheck', function(id, type)
    TriggerClientEvent('indigo-radialmenu:Stretcher:client:BusyCheck', id, source, type)
end)

RegisterNetEvent('indigo-radialmenu:server:BusyResult', function(isBusy, otherId, type)
    TriggerClientEvent('indigo-radialmenu:client:Result', otherId, isBusy, type)
end)