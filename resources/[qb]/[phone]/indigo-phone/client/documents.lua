local QBCore = exports['indigo-core']:GetCoreObject()

-- NUI Callback


RegisterNUICallback('documents_Save_Note_As', function(data, cb)
    TriggerServerEvent('indigo-phone:server:documents_Save_Note_As', data)
    cb("ok")
end)

RegisterNUICallback('document_Send_Note', function(data, cb)
    if data.Type == 'LocalSend' then
        local player, distance = QBCore.Functions.GetClosestPlayer()
        if player ~= -1 and distance < 2.5 then
            local playerId = GetPlayerServerId(player)
            TriggerServerEvent("indigo-phone:server:sendDocumentLocal", data, playerId)
        else
            TriggerEvent("DoShortHudText", "No one around!", 2)
        end
    elseif data.Type == 'PermSend' then
        TriggerServerEvent('indigo-phone:server:sendDocument', data)
    end
    cb("ok")
end)

RegisterNetEvent("indigo-phone:client:sendingDocumentRequest", function(data, Receiver, Ply, SenderName)
    local success = exports['indigo-phone']:PhoneNotification("DOCUMENTS", SenderName..' Incoming Document', 'fas fa-folder', '#b3e0f2', "NONE", 'fas fa-check-circle', 'fas fa-times-circle')
    if success then
        if data.Type == 'PermSend' then
            TriggerServerEvent("indigo-phone:server:documents_Save_Note_As", data, Receiver, Ply, SenderName)
        elseif data.Type == 'LocalSend' then
            TriggerEvent('indigo-phone:client:CustomNotification',
                'DOCUMENTS',
                'New Document',
                'fas fa-folder',
                '#d9d9d9',
                5000
            )

            SendNUIMessage({
                action = "DocumentSent",
                DocumentSend = {
                    title = data.Title,
                    text = data.Text,
                },
            })
        end
    end
end)

RegisterNUICallback('GetNote_for_Documents_app', function(_, cb)
    cb(PhoneData.Documents)
end)

RegisterNetEvent('indigo-phone:RefReshNotes_Free_Documents', function(notes)
    PhoneData.Documents = notes
    SendNUIMessage({
        action = "DocumentRefresh",
    })
end)