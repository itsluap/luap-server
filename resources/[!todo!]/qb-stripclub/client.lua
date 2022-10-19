Framework = exports["qb-core"]:GetCoreObject()
local PlayerData = nil
local ActiveParticles, UnicornProps = {}, {}
local ColorR, ColorG, ColorB = 15, 15, 15
RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(1250, function()
      Framework.Functions.GetPlayerData(function(PlayerData)
        PlayerJob, onDuty = PlayerData.job, PlayerData.job.onduty 
        isLoggedIn = true 
        SpawnUnicornProps()
         onDuty = PlayerData.job.onduty
     end)
    end) 
end)


RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    DeSpawnUnicornProps()
    isLoggedIn = false
end)

RegisterNetEvent("Framework:Client:OnJobUpdate")
AddEventHandler("Framework:Client:OnJobUpdate", function(JobInfo)
	PlayerData = Framework.Functions.GetPlayerData()
	PlayerData.job = JobInfo
end)


RegisterNetEvent("qb-vanillaunicorn:client:shop")
AddEventHandler("qb-vanillaunicorn:client:shop", function()
    TriggerServerEvent("lj-inventory:server:OpenInventory", "shop", "vanilla", Config.Items)
end)


RegisterNetEvent('qb-stripclub:client:open:tray')
AddEventHandler('qb-stripclub:client:open:tray', function(Numbers)
    TriggerServerEvent("lj-inventory:server:OpenInventory", "stash", "stripclub"..Numbers, {maxweight = 100000, slots = 8})
    TriggerEvent("lj-inventory:client:SetCurrentStash", "stripclub"..Numbers)
end)


RegisterNetEvent('qb-stripclub:client:open:cigarettes')
AddEventHandler('qb-stripclub:client:open:cigarettes', function(Numbers)

    TriggerServerEvent("lj-inventory:server:OpenInventory", "shop", "cigarettes", Config.ItemsCigarettes)
end)

RegisterNetEvent('qb-stripclub:client:open:payment')
AddEventHandler('qb-stripclub:client:open:payment', function()
  SetNuiFocus(true, true)
  SendNUIMessage({action = 'OpenPaymentStrip', payments = Config.ActivePaymentsStrip})
end)

RegisterNetEvent('qb-stripclub:client:open:register')
AddEventHandler('qb-stripclub:client:open:register', function()
	if isLoggedIn then
		if PlayerJob.name == "vanilla" then
            SetNuiFocus(true, true)
            SendNUIMessage({action = 'OpenRegisterStrip'})
        else
            Framework.Functions.Notify('You are not authorized to do this.', 'error')
        end
    end
end)

RegisterNetEvent('qb-stripclub:client:sync:register')
AddEventHandler('qb-stripclub:client:sync:register', function(RegisterConfig)
  Config.ActivePaymentsStrip = RegisterConfig
end)

RegisterNetEvent('qb-stripclub:client:sync:config')
AddEventHandler('qb-stripclub:client:sync:config', function(ConfigData)
    Config = ConfigData
end)
function GetActiveRegister()
    return Config.ActivePaymentsStrip
  end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if isLoggedIn then
            local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
            ColorR, ColorG, ColorB = math.random(1,255), math.random(1,255), math.random(1,255)
            local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Location['StripClub']['X'], Config.Location['StripClub']['Y'], Config.Location['StripClub']['Z'], true)
            if Distance < 19.0 then
                Config.InsideUnicorn = true
                CheckEffect()
            else
                Config.InsideUnicorn = false
            end
            Citizen.Wait(750)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if isLoggedIn then
            if Config.InsideUnicorn then
                local NearPole = false
                local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
                for k, v in pairs(Config.Poles) do
                    local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, v['X'], v['Y'], v['Z'], true)
                    if Distance < 2.0 then
                        NearPole = true
                        if IsControlJustReleased(0, 38) then
                            CheckPoleDance(k)
                        end
                    end
                end
                if not NearPole then 
                    Citizen.Wait(1000)
                end
            else
                Citizen.Wait(1000)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if isLoggedIn then
            if Config.InsideUnicorn then
                DrawLightWithRange(116.03, -1286.81, 28.88, ColorR, ColorG, ColorB, 5.0, 10.0)
                DrawLightWithRange(112.79, -1283.11, 28.87, ColorG, ColorR, ColorB, 5.0, 10.0)
                DrawLightWithRange(117.53, -1283.07, 28.87, ColorR, ColorB, ColorG, 5.0, 10.0)
                DrawLightWithRange(116.49, -1291.44, 28.87, ColorB, ColorR, ColorB, 5.0, 10.0)
                DrawLightWithRange(122.83, -1288.07, 28.87, ColorR, ColorG, ColorB, 5.0, 10.0)
                DrawLightWithRange(121.03, -1285.22, 28.87, ColorR, ColorB, ColorG, 5.0, 10.0)
                DrawLightWithRange(123.40, -1294.87, 28.87, ColorG, ColorG, ColorB, 5.0, 10.0)
                DrawLightWithRange(119.93, -1296.88, 28.88, ColorR, ColorR, ColorB, 5.0, 10.0)
                DrawLightWithRange(110.30, -1293.08, 28.87, ColorR, ColorB, ColorG, 5.0, 10.0)
                DrawLightWithRange(105.66, -1294.61, 28.87, ColorR, ColorR, ColorG, 5.0, 10.0)
                DrawLightWithRange(102.77, -1290.45, 28.87, ColorB, ColorR, ColorB, 5.0, 10.0)
                DrawLightWithRange(107.16, -1285.62, 28.87, ColorB, ColorR, ColorB, 5.0, 10.0)
                DrawLightWithRange(108.81, -1289.28, 28.88, ColorR, ColorG, ColorB, 5.0, 10.0)
                DrawLightWithRange(128.89, -1292.46, 29.26, 255, 255, 255, 5.0, 0.2)
                DrawLightWithRange(127.70, -1296.76, 29.26, 255, 255, 255, 5.0, 0.2)
            else
                Citizen.Wait(1000)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)


function CheckEffect()
    if Config.CurrentEffect['Effect'] ~= nil then
        local Data = Config.Effects[Config.CurrentEffect['Effect']]
        for k, v in pairs(Data) do
            RequestNamedPtfxAsset(Config.CurrentEffect['Dict'])
            UseParticleFxAssetNextCall(Config.CurrentEffect['Dict'])
            while not HasNamedPtfxAssetLoaded(Config.CurrentEffect['Dict']) do
                Wait(100)
            end
            Particle = StartParticleFxLoopedAtCoord(Config.CurrentEffect['Effect'], v['Coords']['X'], v['Coords']['Y'], v['Coords']['Z'], 0.0, 0.0, 0.0, 0.5, 0, 0, 0)
            table.insert(ActiveParticles, Particle)
        end
    end
end
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function CheckPoleDance(CurrentPole)
    if not DoingDance then
        DoingDance = true
        local RandomDance = Config.Dances[math.random(1,#Config.Dances)]
        exports['qb-assets']:RequestAnimationDict(RandomDance['Dict'])
        local DanceScene = NetworkCreateSynchronisedScene(Config.Poles[CurrentPole]['X'], Config.Poles[CurrentPole]['Y'], Config.Poles[CurrentPole]['Z'], 0.0, 0.0, 0.0, 2, false, true, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(PlayerPedId(), DanceScene, RandomDance['Dict'], RandomDance['Anim'], 1.5, -4.0, 1, 1, 1148846080, 0)
        NetworkStartSynchronisedScene(DanceScene)
    else
        DoingDance = false
        ClearPedTasksImmediately(PlayerPedId())
    end
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('qb-stripclub:client:open:storage')
AddEventHandler('qb-stripclub:client:open:storage', function()
    TriggerServerEvent("lj-inventory:server:OpenInventory", "stash", "strip_storage", {maxweight = 90000, slots = 10})
    TriggerEvent("lj-inventory:client:SetCurrentStash", "strip_storage")
end)


RegisterNetEvent('qb-stripclub:client:makecocktail')
AddEventHandler('qb-stripclub:client:makecocktail', function(Drinkz)
  Framework.Functions.TriggerCallback('qb-stripclub:server:has:drank:items', function(Drink)
    if Drink then
       MaakDrink(Drinkz)
    else
      Framework.Functions.Notify("You are missing ingredients to make this drink..", "error")
    end
  end)
end)


function MaakDrink(Drinkx)
    Citizen.SetTimeout(750, function()
      TriggerEvent('lj-inventory:client:set:busy', true)
      exports['qb-assets']:RequestAnimationDict("mini@repair")
      TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_ped" ,3.0, 3.0, -1, 8, 0, false, false, false)
      Framework.Functions.Progressbar("open-brick", "Making Drink.. ", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
      }, {}, {}, {}, function() -- Done
          TriggerServerEvent('qb-stripclub:server:finish:create', Drinkx)
          TriggerEvent('lj-inventory:client:set:busy', false)
          StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
      end, function()
          TriggerEvent('lj-inventory:client:set:busy', false)
          Framework.Functions.Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
      end)
    end)
end

RegisterNetEvent("qb-stripclub:client:maken")
AddEventHandler("qb-stripclub:client:maken", function()
    TriggerEvent('lj-inventory:client:set:busy', true)
    TriggerEvent("qb-sound:client:play", "pour-drink", 0.4)
    exports['qb-assets']:RequestAnimationDict("amb@world_human_hang_out_street@female_hold_arm@idle_a")
    TaskPlayAnim(PlayerPedId(), "amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a" ,3.0, 3.0, -1, 8, 0, false, false, false)
    Framework.Functions.Progressbar("open-brick", "Making Slushy..", 6500, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('qb-prison:server:find:reward', 'slushy')
        TriggerEvent('lj-inventory:client:set:busy', false)
        StopAnimTask(PlayerPedId(), "amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", 1.0)
    end, function()
        TriggerEvent('lj-inventory:client:set:busy', false)
        Framework.Functions.Notify("Cancelled..", "error")
        StopAnimTask(PlayerPedId(), "amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", 1.0)
    end)
end)

RegisterNetEvent('qb-stripclub:client:open:effect:panel')
AddEventHandler('qb-stripclub:client:open:effect:panel', function()
    local MenuItems = {}
    for k, v in pairs(Config.EffectsMenu) do
      local NewData = {}
      NewData['Title'] = v['Name']
      NewData['Desc'] = v['Desc']
      NewData['Data'] = {['Event'] = v['Event'], ['Type'] = 'Server', ['Dict'] = v['Dict'], ['Effect'] = v['Effect']}
      table.insert(MenuItems, NewData)
    end
    local ExtraData = {['Title'] = 'Stop Effects', ['Desc'] = 'Turn off all effects.', ['Data'] = {['Event'] = 'qb-stripclub:server:close:effect', ['Type'] = 'Server'}}
    table.insert(MenuItems, ExtraData)
    Citizen.SetTimeout(100, function()
        local Data = {['Title'] = 'Stripclub Effects', ['MainMenuItems'] = MenuItems}
        Framework.Functions.OpenMenu(Data)
    end)
end)

RegisterNetEvent('qb-stripclub:client:stop:effects')
AddEventHandler('qb-stripclub:client:stop:effects', function()
    for k, v in pairs(ActiveParticles) do
        StopParticleFxLooped(v, 0)
        RemoveParticleFx(v, 0)
    end
    ActiveParticles = {}
end)

RegisterNUICallback('Click', function()
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
  end)
  
  RegisterNUICallback('ErrorClick', function()
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
  end)
  
  RegisterNUICallback('AddPrice', function(data)
    TriggerServerEvent('qb-stripclub:server:add:to:register', data.Price, data.Note)
  end)
  
  RegisterNUICallback('PayReceipt', function(data)
    TriggerServerEvent('qb-stripclub:server:pay:receipt', data.Price, data.Note, data.Id)
  end)
  
  RegisterNUICallback('CloseNui', function()
    SetNuiFocus(false, false)
  end)

  
function SpawnUnicornProps()
    for k, v in pairs(Config.UnicornProps) do
        local Prop = GetHashKey(v['Prop'])
        exports['qb-assets']:RequestModelHash(Prop)
        local Object = CreateObject(Prop, v['Coords']['X'], v['Coords']['Y'], v['Coords']['Z'], false, false, false)
        SetEntityHeading(Object, 123.46)
        FreezeEntityPosition(Object, true)
        SetEntityInvincible(Object, true)
        if not v['Visible'] then
            SetEntityVisible(Object, false)
        end
        table.insert(UnicornProps, Object)
    end
end

function DeSpawnUnicornProps()
    for k, v in pairs(UnicornProps) do
        DeleteEntity(v)
        DeleteObject(v)
    end
    UnicornProps = {}
end