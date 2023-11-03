-- Server event to handle players who have marked bills
RegisterServerEvent("playerHasMarkedBills")
AddEventHandler("playerHasMarkedBills", function()
    local playerId = source

    local clothingOptions = {
        clothes = {
            bags_1 = 114,
            bags_2 = 0,
        },
    }   
    
    TriggerClientEvent("luap:playPutOnBagAnimation", playerId)
    Citizen.Wait(1600)
    TriggerClientEvent("indigo-clothing:client:loadPlayerClothing", playerId, clothingOptions)
end)