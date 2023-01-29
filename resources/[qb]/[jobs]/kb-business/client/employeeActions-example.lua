local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('kb-business:client:cookdog')
AddEventHandler('kb-business:client:cookdog', function(data)
    local cookingItem = 'sandwich'

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if not hasItem then 
            TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error') 
        else 
            FoodProgress(cookingItem) 
        end		
    end, cookingItem) -- CHANGE THIS, OBVIOUSLY ;)

end)

function FoodProgress(ItemMake)
    local cookedItem = 'tosti'

    bartext = "Grilling "..QBCore.Shared.Items[ItemMake].label
    bartime = 5000
    animDictNow = "amb@prop_human_bbq@male@base"
    animNow = "base"
    animflag = 8

    QBCore.Functions.Progressbar('making_food', bartext, bartime, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
    { animDict = animDictNow, anim = animNow, flags = animflag, }, {}, {}, function()  
        TriggerServerEvent('kb-business:server:getItem', cookedItem)
        StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('QBCore:Notify', "Cancelled!", 'error')
    end)
end