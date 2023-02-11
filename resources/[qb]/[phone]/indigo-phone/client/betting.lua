local QBCore = exports['qb-core']:GetCoreObject()

-- NUI Callback

RegisterNUICallback('CasinoAddBet', function(data, cb)
    TriggerServerEvent('indigo-phone:server:CasinoAddBet', data)
    cb("ok")
end)

RegisterNetEvent('indigo-phone:client:addbetForAll', function(data)
    SendNUIMessage({
        action = "BetAddToApp",
        datas = data,
    })
end)

RegisterNUICallback('BettingAddToTable', function(data, cb)
    TriggerServerEvent('indigo-phone:server:BettingAddToTable', data)
    cb("ok")
end)

RegisterNUICallback('CasinoDeleteTable', function(_, cb)
    TriggerServerEvent('indigo-phone:server:DeleteAndClearTable')
    cb("ok")
end)

RegisterNUICallback('CheckHasBetTable', function(_, cb)
    QBCore.Functions.TriggerCallback('indigo-phone:server:CheckHasBetTable', function(HasTable)
        cb(HasTable)
    end)
end)

RegisterNUICallback('casino_status', function(_, cb)
    TriggerServerEvent('indigo-phone:server:casino_status')
    cb("ok")
end)

RegisterNUICallback('CheckHasBetStatus', function(_, cb)
    QBCore.Functions.TriggerCallback('indigo-phone:server:CheckHasBetStatus', function(HasStatus)
        cb(HasStatus)
    end)
end)

RegisterNUICallback('WineridCasino', function(data, cb)
    TriggerServerEvent('indigo-phone:server:WineridCasino', data)
    cb("ok")
end)