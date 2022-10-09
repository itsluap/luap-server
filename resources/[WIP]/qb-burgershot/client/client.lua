local CurrentWorkObject, InRange, ShowingInteraction, AddedProps = {}, false, false, false
local QBCore, PlayerJob, LoggedIn = exports['qb-core']:GetCoreObject(), {}, false
onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(1250, function()
        local player = QBCore.Functions.GetPlayerData()
        PlayerJob = QBCore.Functions.GetPlayerData().job
        onDuty = player.job.onduty
        Citizen.Wait(1200)
        LoggedIn = true
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
	RemoveWorkObjects()
    LoggedIn, AddedProps = false, false
    onDuty = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    if JobInfo.name == "burger" and PlayerJob.name ~= "burger" then
        if JobInfo.onduty then
            TriggerServerEvent("QBCore:ToggleDuty")
            onDuty = false
        end
    end
end)

-- RegisterNetEvent('QBCore:Client:SetDuty')
-- AddEventHandler('QBCore:Client:SetDuty', function()
--    PlayerJob = QBCore.Functions.GetPlayerData().job
-- end)

-- Citizen.CreateThread(function()
--     Citizen.SetTimeout(1, function()
--         TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
--         PlayerJob = QBCore.Functions.GetPlayerData().job
--         Citizen.Wait(1200)
--         LoggedIn = true
--     end)
-- end)

-- Code

-- // Loops \\ --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if LoggedIn then
            local NearAnything = false
            local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
            if PlayerJob.name == 'burger' and onDuty then
                local Distance = #(PlayerCoords - Config.Intercom['Worker'])
                if Distance < 3.5 then
                    NearAnything = true
                    if not ShowingInteraction then
                        ShowingInteraction = true
                        print("near drive thru")
                        exports['qb-core']:DrawText('Drive Thru', 'left') -- text was "Drive Intercom"
                        exports['pma-voice']:addPlayerToCall(878914, 'Phone')
                    end
                end
            end
            local Distance = #(PlayerCoords - Config.Intercom['Customer'])
            if Distance < 3.5 then
                NearAnything = true
                if not ShowingInteraction then
                    ShowingInteraction = true
                    TriggerServerEvent('qb-burgershot:server:alert:workers')
                    exports['qb-core']:DrawText('Drive Thru', 'left')
                    exports['pma-voice']:addPlayerToCall(878914, 'Phone')
                end
            end
            if not NearAnything then
                if ShowingInteraction then
                    ShowingInteraction = false
                    exports['qb-core']:HideText()
                    exports['pma-voice']:removePlayerFromCall(878914, 'Phone')
                end
                Citizen.Wait(1000)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if LoggedIn then
            local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
            local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, -1193.70, -892.50, 13.99, true)
            InRange = false
            if Distance < 35.0 then
                InRange = true
                if not AddedProps then
                    AddedProps = true
                    SpawnWorkObjects()
                end
            end
            if not InRange then
                CheckDuty()
                if AddedProps then
                    AddedProps = false
                    RemoveWorkObjects()
                end
                Citizen.Wait(1500)
            end
        end
    end
end)

-- // Events \\ --

RegisterNetEvent('qb-burgershot:client:give:payment')
AddEventHandler('qb-burgershot:client:give:payment', function()
    local PlayerContext = {['Title'] = 'Paypal ID?', ['Type'] = 'number', ['Logo'] = '<i class="fas fa-sort-numeric-up-alt"></i>'}
    QBCore.Functions.OpenInput(PlayerContext, function(PlayerId)
        if PlayerId ~= false then
            TriggerServerEvent('qb-burgershot:server:give:payment', tonumber(PlayerId))
        end
    end)
end)

RegisterNetEvent('qb-burgershot:client:call:intercom')
AddEventHandler('qb-burgershot:client:call:intercom', function()
    if QBCore.Functions.GetPlayerData().job.name =='burger' and onDuty then
        QBCore.Functions.Notify('Someone is at the drive thru', 'info', 10000)
        PlaySoundFrontend( -1, "Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
    end
end)

RegisterNetEvent('qb-burgershot:client:open:payment')
AddEventHandler('qb-burgershot:client:open:payment', function()
    local MenuItems = {}
    for k, v in pairs(Config.ActivePayments) do
        if Config.ActivePayments[k] ~= nil then
          local NewData = {}
          NewData['Title'] = 'Order: #'..k
          NewData['Desc'] = 'Cost: $'..v['Price']..' <br>Note: '..v['Note']
          NewData['Data'] = {['Event'] = 'qb-burgershot:server:pay:receipt', ['Type'] = 'Server', ['BillId'] = k, ['Price'] = v['Price'], ['Note'] = v['Note']}
          table.insert(MenuItems, NewData)
        end
    end
    if #MenuItems > 0 then
        local Data = {['Title'] = 'Open Orders', ['MainMenuItems'] = MenuItems}
        QBCore.Functions.OpenMenu(Data)
    else
        QBCore.Functions.Notify("There are no active orders..", "error")
    end
end)

RegisterNetEvent('qb-burgershot:client:open:register')
AddEventHandler('qb-burgershot:client:open:register', function()
  local PrData = {['Title'] = 'Cost?', ['Type'] = 'number', ['Logo'] = '<i class="fas fa-coins"></i>'}
  local TxData = {['Title'] = 'Order?', ['Type'] = 'text', ['Logo'] = '<i class="fas fa-hamburger"></i>'}
  QBCore.Functions.OpenInput(PrData, function(PriceData)
      if PriceData ~= false then
        Citizen.Wait(250)
        QBCore.Functions.OpenInput(TxData, function(NoteData)
          if NoteData ~= false then
            TriggerServerEvent('qb-burgershot:server:add:to:register', PriceData, NoteData)
          end
        end)
      end
  end)
end)

RegisterNetEvent('qb-burgershot:client:sync:register')
AddEventHandler('qb-burgershot:client:sync:register', function(RegisterConfig)
    Config.ActivePayments = RegisterConfig
end)

RegisterNetEvent('qb-burgershot:client:open:box')
AddEventHandler('qb-burgershot:client:open:box', function(BoxId)
    TriggerServerEvent("qb-inventory:server:OpenInventory", "stash", 'burgerbox_'..BoxId, {maxweight = 5000, slots = 6})
    TriggerEvent("qb-inventory:client:SetCurrentStash", 'burgerbox_'..BoxId)
end)

RegisterNetEvent('qb-burgershot:client:open:cold:storage')
AddEventHandler('qb-burgershot:client:open:cold:storage', function()
    TriggerServerEvent("qb-inventory:server:OpenInventory", "stash", "burger_storage", {maxweight = 1000000, slots = 10})
    TriggerEvent("qb-inventory:client:SetCurrentStash", "burger_storage")
end)

RegisterNetEvent('qb-burgershot:client:open:hot:storage')
AddEventHandler('qb-burgershot:client:open:hot:storage', function()
    TriggerServerEvent("qb-inventory:server:OpenInventory", "stash", "heattray", {maxweight = 1000000, slots = 10})
    TriggerEvent("qb-inventory:client:SetCurrentStash", "warmtebak")
end)

RegisterNetEvent('qb-burgershot:client:open:tray')
AddEventHandler('qb-burgershot:client:open:tray', function(Number)
    TriggerServerEvent("qb-inventory:server:OpenInventory", "stash", "foodtray"..Number, {maxweight = 100000, slots = 3})
    TriggerEvent("qb-inventory:client:SetCurrentStash", "foodtray"..Number)
end)

RegisterNetEvent('qb-burgershot:client:create:burger')
AddEventHandler('qb-burgershot:client:create:burger', function(BurgerType)
    QBCore.Functions.TriggerCallback('qb-burgershot:server:has:burger:items', function(HasBurgerItems)
        if HasBurgerItems then
           MakeBurger(BurgerType)
        else
          QBCore.Functions.Notify("You are missing ingredients to make this sandwich..", "error")
        end
    end)
end)

RegisterNetEvent('qb-burgershot:client:create:drink')
AddEventHandler('qb-burgershot:client:create:drink', function(DrinkType)
    MakeDrink(DrinkType)
end)

RegisterNetEvent('qb-burgershot:client:bake:fries')
AddEventHandler('qb-burgershot:client:bake:fries', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeFries()
        else
          QBCore.Functions.Notify("You dont have potatos..", "error")
        end
    end, 'burger-potato')
end)

RegisterNetEvent('qb-burgershot:client:bake:meat')
AddEventHandler('qb-burgershot:client:bake:meat', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakePatty()
        else
          QBCore.Functions.Notify("You dont have meat..", "error")
        end
    end, 'burger-raw')
end)

-- // Functions \\ --

function MakeBurger(BurgerName)
    Citizen.SetTimeout(750, function()
        
    TriggerEvent('qb-inventory:client:set:busy', true)
        exports['qb-assets']:RequestAnimationDict("mini@repair")
        TaskPlayAnim(GetPlayerPed(-1), "mini@repair", "fixing_a_ped" ,3.0, 3.0, -1, 8, 0, false, false, false)
        QBCore.Functions.Progressbar("open-brick", "Making Burger..", 7500, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-burgershot:server:finish:burger', BurgerName)
            TriggerEvent('qb-inventory:client:set:busy', false)
            StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_ped", 1.0)
        end, function()
            TriggerEvent('qb-inventory:client:set:busy', false)
            QBCore.Functions.Notify("Cancelled..", "error")
            StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_ped", 1.0)
        end)
    end)
end

function MakeFries()
    TriggerEvent('qb-inventory:client:set:busy', true)
    TriggerEvent("qb-sound:client:play", "baking", 0.7)
    exports['qb-assets']:RequestAnimationDict("amb@prop_human_bbq@male@base")
    TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bbq@male@base", "base" ,3.0, 3.0, -1, 8, 0, false, false, false)
    QBCore.Functions.Progressbar("open-brick", "Cooking Fries..", 6500, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {
        model = "prop_cs_fork",
        bone = 28422,
        coords = { x = -0.005, y = 0.00, z = 0.00 },
        rotation = { x = 175.0, y = 160.0, z = 0.0 },
    }, {}, function() -- Done
        TriggerServerEvent('qb-burgershot:server:finish:fries')
        TriggerEvent('qb-inventory:client:set:busy', false)
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bbq@male@base", "base", 1.0)
    end, function()
        TriggerEvent('qb-inventory:client:set:busy', false)
        QBCore.Functions.Notify("Cancelled..", "error")
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bbq@male@base", "base", 1.0)
    end)
end

function MakePatty()
    TriggerEvent('qb-inventory:client:set:busy', true)
    TriggerEvent("qb-sound:client:play", "baking", 0.7)
    exports['qb-assets']:RequestAnimationDict("amb@prop_human_bbq@male@base")
    TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bbq@male@base", "base" ,3.0, 3.0, -1, 8, 0, false, false, false)
    QBCore.Functions.Progressbar("open-brick", "Cooking Burger..", 6500, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {
        model = "prop_cs_fork",
        bone = 28422,
        coords = { x = -0.005, y = 0.00, z = 0.00},
        rotation = { x = 175.0, y = 160.0, z = 0.0},
    }, {}, function() -- Done
        TriggerServerEvent('qb-burgershot:server:finish:patty')
        TriggerEvent('qb-inventory:client:set:busy', false)
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bbq@male@base", "base", 1.0)
    end, function()
        TriggerEvent('qb-inventory:client:set:busy', false)
        QBCore.Functions.Notify("Cancelled..", "error")
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bbq@male@base", "base", 1.0)
    end)
end

function MakeDrink(DrinkName)
    TriggerEvent('qb-inventory:client:set:busy', false)
    TriggerEvent("qb-sound:client:play", "pour-drink", 0.4)
    exports['qb-assets']:RequestAnimationDict("amb@world_human_hang_out_street@female_hold_arm@idle_a")
    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a" ,3.0, 3.0, -1, 8, 0, false, false, false)
    QBCore.Functions.Progressbar("open-brick", "Pouring Drink..", 6500, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('qb-burgershot:server:finish:drink', DrinkName)
        TriggerEvent('qb-inventory:client:set:busy', false)
        StopAnimTask(GetPlayerPed(-1), "amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", 1.0)
    end, function()
        TriggerEvent('qb-inventory:client:set:busy', false)
        QBCore.Functions.Notify("Cancelled..", "error")
        StopAnimTask(GetPlayerPed(-1), "amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", 1.0)
    end)
end

function CheckDuty()
    if QBCore.Functions.GetPlayerData().job.name =='burger' and onDuty then
       TriggerServerEvent('QBCore:ToggleDuty')
       QBCore.Functions.Notify("You left work!", "error")
    end
end

function SpawnWorkObjects()
    for k, v in pairs(Config.WorkProps) do
        exports['qb-assets']:RequestModelHash(v['Prop'])
        WorkObject = CreateObject(GetHashKey(v['Prop']), v["Coords"]["X"], v["Coords"]["Y"], v["Coords"]["Z"], false, true, false)
        SetEntityHeading(WorkObject, v['Coords']['H'])
        if v['PlaceOnGround'] then
        	PlaceObjectOnGroundProperly(WorkObject)
        end
        if not v['ShowItem'] then
        	SetEntityVisible(WorkObject, false)
        end
        FreezeEntityPosition(WorkObject, true)
        SetEntityInvincible(WorkObject, true)
        table.insert(CurrentWorkObject, WorkObject)
    end
end

function RemoveWorkObjects()
    for k, v in pairs(CurrentWorkObject) do
       NetworkRequestControlOfEntity(v)
    	 DeleteEntity(v)
    end
end

function IsInsideBurgershot()
    return InRange
end

-- qb-target exports --
exports['qb-target']:AddTargetModel(`v_ind_cs_toolboard`, {
    options = {
        {
            type = "server",
            event = "QBCore:ToggleDuty",
            icon = "fas fa-user-clock",
            label = "Clock In / Out",
            job = "burger",
            canInteract = function()
                if exports['qb-burgershot']:IsInsideBurgershot() then
                    return true
                end
            end,
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`v_ind_bin_01`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:open:register",
            icon = "fas fa-cash-register",
            label = "Take an order",
            job = "burger",
            canInteract = onDuty
        },
        {
            type = "client",
            event = "qb-burgershot:client:open:payment",
            icon = "fas fa-receipt",
            label = "Pay",
            canInteract = function()
                if exports['qb-burgershot']:IsInsideBurgershot() then
                    return true
                end
            end,
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`v_ind_cfbin`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:open:register",
            icon = "fas fa-cash-register",
            label = "Burgershot Checkout",
            job = "burger",
            canInteract = onDuty
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`v_ind_cm_paintbckt01`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:open:tray",
            icon = "fas fa-cash-utensils",
            label = "Tray",
            canInteract = function()
                if exports['qb-burgershot']:IsInsideBurgershot() then
                    return true
                end
            end,
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`v_ind_cm_paintbckt02`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:open:tray",
            icon = "fas fa-cash-utensils",
            label = "Tray",
            canInteract = function()
                if exports['qb-burgershot']:IsInsideBurgershot() then
                    return true
                end
            end,
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`prop_food_bs_tray_03`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:open:tray",
            icon = "fas fa-cash-utensils",
            label = "Tray",
            canInteract = function()
                if exports['qb-burgershot']:IsInsideBurgershot() then
                    return true
                end
            end,
        },
    },
    distance = 2.5
})


exports['qb-target']:AddTargetModel(`prop_food_bs_bag_01`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:server:get:bag",
            icon = "fas fa-shopping-bag",
            label = "Get Box",
            job = "burger",
            canInteract = onDuty
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`prop_food_bs_bag_02`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:server:get:bag",
            icon = "fas fa-shopping-bag",
            label = "Get Box",
            job = "burger",
            canInteract = onDuty
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`prop_food_bs_bag_02`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:server:get:bag",
            icon = "fas fa-shopping-bag",
            label = "Get Box",
            job = "burger",
            canInteract = function()
                if exports['qb-burgershot']:IsInsideBurgershot() then
                    return true
                end
            end,
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`ch_prop_whiteboard`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:open:hot:storage",
            icon = "fas fa-hamburger",
            label = "Hot Tray",
            job = "burger",
            canInteract = onDuty
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`v_ret_gc_bag01`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:bake:meat",
            icon = "fas fa-drumstick-bite",
            label = "Grill Meat",
            job = "burger",
            canInteract = onDuty
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`v_ret_gc_bag02`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:bake:fries",
            icon = "fas fa-drumstick-bite",
            label = "Cook Fries",
            job = "burger",
            canInteract = onDuty
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`v_m_props_ff_fridge_01_door`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:open:cold:storage",
            icon = "fas fa-boxes",
            label = "Refrigerated Storage",
            job = "burger",
            canInteract = onDuty
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`v_ret_fh_pot01`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:create:burger",
            icon = "fas fa-hamburger",
            label = "Make Burger",
            job = "burger",
            canInteract = onDuty
        },
    },
    distance = 2.5
})

exports['qb-target']:AddTargetModel(`v_ilev_fib_frame02`, {
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:create:drink",
            icon = "fas fa-wine-bottle",
            label = "Make Soda",
            job = "burger",
            canInteract = onDuty
        },
    },
    options = {
        {
            type = "client",
            event = "qb-burgershot:client:create:drink",
            icon = "fas fa-wine-bottle",
            label = "Make Coffee",
            job = "burger",
            canInteract = onDuty
        },
    },
    distance = 2.5
})