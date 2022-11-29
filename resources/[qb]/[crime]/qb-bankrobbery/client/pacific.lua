local inBankCardBZone = false
local inElectronickitZone = false
local currentLocker = 0
local copsCalled = false

-- grabbing cash -- 

function HackingCompleted(status)
    -- hackFinished = true
    hackStatus = status
end

function Grab(index)
    busy = true
    robber = true
    local ped = PlayerPedId()
    local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
    local animDict
    local stackModel
    
    if not index then
        stackModel = GetHashKey('h4_prop_h4_cash_stack_01a')
        animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@'
        loadAnimDict(animDict)
        TriggerServerEvent('pacificheist:server:vaultSync', 'stacks', nil)
    else
        TriggerServerEvent('pacificheist:server:extendedSync', 'stacks', index)
        stackModel = GetHashKey(Config['PacificSetup']['stacks'][index]['model'])
        if stackModel == -180074230 then
            animDict = 'anim@scripted@heist@ig1_table_grab@gold@male@'
            loadAnimDict(animDict)
        else
            animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@'
            loadAnimDict(animDict)
        end
    end

    loadModel('hei_p_m_bag_var22_arm_s')
    bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, 1, 1, 0)
    sceneObject = GetClosestObjectOfType(pedCo, 3.0, stackModel, 0, 0, 0)

    scenePos = GetEntityCoords(sceneObject)
    sceneRot = GetEntityRotation(sceneObject)

    for i = 1, #GrabCash['animations'] do
        GrabCash['scenes'][i] = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][1], 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(bag, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][2], 1.0, -1.0, 1148846080)
        if i == 2 then
            if stackModel == -180074230 then
                NetworkAddEntityToSynchronisedScene(sceneObject, GrabCash['scenes'][i], animDict, 'grab_gold', 1.0, -1.0, 1148846080)
            else
                NetworkAddEntityToSynchronisedScene(sceneObject, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][3], 1.0, -1.0, 1148846080)
            end
        end
    end

    NetworkStartSynchronisedScene(GrabCash['scenes'][1])
    Wait(GetAnimDuration(animDict, 'enter') * 1000)
    NetworkStartSynchronisedScene(GrabCash['scenes'][2])
    Wait(GetAnimDuration(animDict, 'grab') * 1000 - 3000)
    DeleteObjectSync(sceneObject)
    if stackModel == -180074230 then
        TriggerServerEvent('pacificheist:server:rewardItem', Config['PacificHeist']['rewardItems'][1]['itemName'], Config['PacificHeist']['stackRewards']['gold'], 'item')
    else
        TriggerServerEvent('pacificheist:server:rewardItem', 'nil', Config['PacificHeist']['stackRewards']['money'], 'money')
    end
    NetworkStartSynchronisedScene(GrabCash['scenes'][4])
    Wait(GetAnimDuration(animDict, 'exit') * 1000)
    
    DeleteObject(bag)
    ClearPedTasks(ped)
    busy = false
end

RegisterNetEvent('pacificheist:client:objectSync')
AddEventHandler('pacificheist:client:objectSync', function(e)
    local entity = NetworkGetEntityFromNetworkId(e)
    DeleteEntity(entity)
end)

RegisterNetEvent('pacificheist:client:vaultSync')
AddEventHandler('pacificheist:client:vaultSync', function(action, index)
    if action == 'stacks' then
        Config['PacificSetup']['mainStack']['taken'] = true
    end
end)

RegisterNetEvent('pacificheist:client:extendedSync')
AddEventHandler('pacificheist:client:extendedSync', function(action, index)
    if action == 'stacks' then
        Config['PacificSetup']['stacks'][index]['taken'] = true
    end
end)

RegisterNetEvent('pacificheist:client:vaultLoop')
AddEventHandler('pacificheist:client:vaultLoop', function()
    vaultLoop = true
    Citizen.CreateThread(function()
        while vaultLoop do
            local ped = PlayerPedId()
            local pedCo = GetEntityCoords(ped)
            local stackDist = #(pedCo - Config['PacificSetup']['mainStack']['pos'])

            if stackDist >= 150.0 then
                break
            end

            if stackDist <= 1.5 and not Config['PacificSetup']['mainStack']['taken'] then
                ShowHelpNotification(Strings['grab'])
                if IsControlJustPressed(0, 38) then
                    Grab(false)
                end
            end

        end
    end)
end)

RegisterNetEvent('pacificheist:client:resetHeist')
AddEventHandler('pacificheist:client:resetHeist', function()
    vaultLoop = false
    extendedLoop = false
    for k, v in pairs(Config['PacificSetup']['stacks']) do
        v['taken'] = false
    end
    Config['PacificSetup']['mainStack']['taken'] = false
    ClearArea(253.154, 228.344, 101.683, 100.0)
end)

-- Functions

--- This will be triggered once the hack in the pacific bank is done
--- @param success boolean
--- @return nil
local function OnHackPacificDone(success)
    Config.OnHackDone(success, "pacific")
    HackingCompleted(true) -- heist update -- 
end

--- This will load an animation dictionary so you can play an animation in that dictionary
--- @param dict string
--- @return nil
local function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

-- Events

RegisterNetEvent('qb-bankrobbery:UseBankcardB', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    Config.OnEvidence(pos, 85)
    if not inBankCardBZone then return end
    QBCore.Functions.TriggerCallback('qb-bankrobbery:server:isRobberyActive', function(isBusy)
        if not isBusy then
            if CurrentCops >= Config.MinimumPacificPolice then
                if not Config.BigBanks["pacific"]["isOpened"] then
                    Config.ShowRequiredItems({
                        [1] = {name = QBCore.Shared.Items["security_card_02"]["name"], image = QBCore.Shared.Items["security_card_02"]["image"]}
                    }, false)
                    loadAnimDict("anim@gangops@facility@servers@")
                    TaskPlayAnim(ped, 'anim@gangops@facility@servers@', 'hotwire', 3.0, 3.0, -1, 1, 0, false, false, false)
                    QBCore.Functions.Progressbar("security_pass", Lang:t("general.validating_bankcard"), math.random(5000, 10000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Done
                        StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                        Config.DoorlockAction(1, false)
                        TriggerServerEvent('qb-bankrobbery:server:removeBankCard', '02')
                        if copsCalled or not Config.BigBanks["pacific"]["alarm"] then return end
                        TriggerServerEvent("qb-bankrobbery:server:callCops", "pacific", 0, pos)
                        copsCalled = true
                    end, function() -- Cancel
                        StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                        QBCore.Functions.Notify(Lang:t("error.cancel_message"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("error.bank_already_open"), "error")
                end
            else
                QBCore.Functions.Notify(Lang:t("error.minimum_police_required", {police = Config.MinimumPacificPolice}), "error")
            end
        else
            QBCore.Functions.Notify(Lang:t("error.security_lock_active"), "error", 5500)
        end
    end)
end)

RegisterNetEvent('electronickit:UseElectronickit', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if not inElectronickitZone then return end
    QBCore.Functions.TriggerCallback('qb-bankrobbery:server:isRobberyActive', function(isBusy)
        if not isBusy then
            if CurrentCops >= Config.MinimumPacificPolice then
                if not Config.BigBanks["pacific"]["isOpened"] then
                    local hasItem = Config.HasItem({"trojan_usb", "electronickit"})
                    if hasItem then
                        Config.ShowRequiredItems(nil, false)
                        loadAnimDict("anim@gangops@facility@servers@")
                        TaskPlayAnim(ped, 'anim@gangops@facility@servers@', 'hotwire', 3.0, 3.0, -1, 1, 0, false, false, false)
                        QBCore.Functions.Progressbar("hack_gate", Lang:t("general.connecting_hacking_device"), math.random(5000, 10000), false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            TriggerServerEvent('qb-bankrobbery:server:removeElectronicKit')
                            StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                            exports['minigame-shape']:StartShapeGame(function(Outcome)
                                if Outcome then
                                    success = true
                                    OnHackPacificDone(success)
                                    HackingCompleted(true)
                                end
                            end)
                            if hackStatus then
                                print(hackStatus)
                                TriggerServerEvent('pacificheist:server:vaultLoop')
                            end
                            if copsCalled or not Config.BigBanks["pacific"]["alarm"] then return end
                            TriggerServerEvent("qb-bankrobbery:server:callCops", "pacific", 0, pos)
                            copsCalled = true
                        end, function() -- Cancel
                            StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                            QBCore.Functions.Notify(Lang:t("error.cancel_message"), "error")
                        end)
                    else
                        QBCore.Functions.Notify(Lang:t("error.missing_item"), "error")
                    end
                else
                    QBCore.Functions.Notify(Lang:t("error.bank_already_open"), "error")
                end
            else
                QBCore.Functions.Notify(Lang:t("error.minimum_police_required", {police = Config.MinimumPacificPolice}), "error")
            end
        else
            QBCore.Functions.Notify(Lang:t("error.security_lock_active"), "error", 5500)
        end
    end)
end)

-- Threads

CreateThread(function()
    local bankCardBZone = BoxZone:Create(Config.BigBanks["pacific"]["coords"][1], 1.0, 1.0, {
        name = 'pacific_coords_bankcardb',
        heading = Config.BigBanks["pacific"]["heading"].closed,
        minZ = Config.BigBanks["pacific"]["coords"][1].z - 1,
        maxZ = Config.BigBanks["pacific"]["coords"][1].z + 1,
        debugPoly = false
    })
    bankCardBZone:onPlayerInOut(function(inside)
        inBankCardBZone = inside
        if inside and not Config.BigBanks["pacific"]["isOpened"] then
            Config.ShowRequiredItems({
                [1] = {name = QBCore.Shared.Items["security_card_02"]["name"], image = QBCore.Shared.Items["security_card_02"]["image"]}
            }, true)
        else
            Config.ShowRequiredItems({
                [1] = {name = QBCore.Shared.Items["security_card_02"]["name"], image = QBCore.Shared.Items["security_card_02"]["image"]}
            }, false)
        end
    end)
    local electronickitZone = BoxZone:Create(Config.BigBanks["pacific"]["coords"][2], 1.0, 1.0, {
        name = 'pacific_coords_electronickit',
        heading = Config.BigBanks["pacific"]["heading"].closed,
        minZ = Config.BigBanks["pacific"]["coords"][2].z - 1,
        maxZ = Config.BigBanks["pacific"]["coords"][2].z + 1,
        debugPoly = false
    })
    electronickitZone:onPlayerInOut(function(inside)
        inElectronickitZone = inside
        if inside and not Config.BigBanks["pacific"]["isOpened"] then
            Config.ShowRequiredItems({
                [1] = {name = QBCore.Shared.Items["electronickit"]["name"], image = QBCore.Shared.Items["electronickit"]["image"]},
                [2] = {name = QBCore.Shared.Items["trojan_usb"]["name"], image = QBCore.Shared.Items["trojan_usb"]["image"]},
            }, true)
        else
            Config.ShowRequiredItems({
                [1] = {name = QBCore.Shared.Items["electronickit"]["name"], image = QBCore.Shared.Items["electronickit"]["image"]},
                [2] = {name = QBCore.Shared.Items["trojan_usb"]["name"], image = QBCore.Shared.Items["trojan_usb"]["image"]},
            }, false)
        end
    end)
    local thermite1Zone = BoxZone:Create(Config.BigBanks["pacific"]["thermite"][1]["coords"], 1.0, 1.0, {
        name = 'pacific_coords_thermite_1',
        heading = Config.BigBanks["pacific"]["heading"].closed,
        minZ = Config.BigBanks["pacific"]["thermite"][1]["coords"].z - 1,
        maxZ = Config.BigBanks["pacific"]["thermite"][1]["coords"].z + 1,
        debugPoly = false
    })
    thermite1Zone:onPlayerInOut(function(inside)
        if inside and not Config.BigBanks["pacific"]["thermite"][1]["isOpened"] then
            currentThermiteGate = Config.BigBanks["pacific"]["thermite"][1]["doorId"]
            Config.ShowRequiredItems({
                [1] = {name = QBCore.Shared.Items["thermite"]["name"], image = QBCore.Shared.Items["thermite"]["image"]},
            }, true)
        else
            if currentThermiteGate == Config.BigBanks["pacific"]["thermite"][1]["doorId"] then
                currentThermiteGate = 0
                Config.ShowRequiredItems({
                    [1] = {name = QBCore.Shared.Items["thermite"]["name"], image = QBCore.Shared.Items["thermite"]["image"]},
                }, false)
            end
        end
    end)
    local thermite2Zone = BoxZone:Create(Config.BigBanks["pacific"]["thermite"][2]["coords"], 1.0, 1.0, {
        name = 'pacific_coords_thermite_2',
        heading = Config.BigBanks["pacific"]["heading"].closed,
        minZ = Config.BigBanks["pacific"]["thermite"][2]["coords"].z - 1,
        maxZ = Config.BigBanks["pacific"]["thermite"][2]["coords"].z + 1,
        debugPoly = false
    })
    thermite2Zone:onPlayerInOut(function(inside)
        if inside and not Config.BigBanks["pacific"]["thermite"][2]["isOpened"] then
            currentThermiteGate = Config.BigBanks["pacific"]["thermite"][2]["doorId"]
            Config.ShowRequiredItems({
                [1] = {name = QBCore.Shared.Items["thermite"]["name"], image = QBCore.Shared.Items["thermite"]["image"]},
            }, true)
        else
            if currentThermiteGate == Config.BigBanks["pacific"]["thermite"][2]["doorId"] then
                currentThermiteGate = 0
                Config.ShowRequiredItems({
                    [1] = {name = QBCore.Shared.Items["thermite"]["name"], image = QBCore.Shared.Items["thermite"]["image"]},
                }, false)
            end
        end
    end)
    for k in pairs(Config.BigBanks["pacific"]["lockers"]) do
        if Config.UseTarget then
            exports['qb-target']:AddBoxZone('pacific_coords_locker_'..k, Config.BigBanks["pacific"]["lockers"][k]["coords"], 1.0, 1.0, {
                name = 'pacific_coords_locker_'..k,
                heading = Config.BigBanks["pacific"]["heading"].closed,
                minZ = Config.BigBanks["pacific"]["lockers"][k]["coords"].z - 1,
                maxZ = Config.BigBanks["pacific"]["lockers"][k]["coords"].z + 1,
                debugPoly = false
            }, {
                options = {
                    {
                        action = function()
                            openLocker("pacific", k)
                        end,
                        canInteract = function()
                            return not IsDrilling and Config.BigBanks["pacific"]["isOpened"] and not Config.BigBanks["pacific"]["lockers"][k]["isBusy"] and not Config.BigBanks["pacific"]["lockers"][k]["isOpened"]
                        end,
                        icon = 'fa-solid fa-vault',
                        label = Lang:t("general.break_safe_open_option_target"),
                    },
                },
                distance = 1.5
            })
        else
            local lockerZone = BoxZone:Create(Config.BigBanks["pacific"]["lockers"][k]["coords"], 1.0, 1.0, {
                name = 'pacific_coords_locker_'..k,
                heading = Config.BigBanks["pacific"]["heading"].closed,
                minZ = Config.BigBanks["pacific"]["lockers"][k]["coords"].z - 1,
                maxZ = Config.BigBanks["pacific"]["lockers"][k]["coords"].z + 1,
                debugPoly = false
            })
            lockerZone:onPlayerInOut(function(inside)
                if inside and not IsDrilling and Config.BigBanks["pacific"]["isOpened"] and not Config.BigBanks["pacific"]["lockers"][k]["isBusy"] and not Config.BigBanks["pacific"]["lockers"][k]["isOpened"] then
                    exports['qb-core']:DrawText(Lang:t("general.break_safe_open_option_drawtext"), 'right')
                    currentLocker = k
                else
                    if currentLocker == k then
                        currentLocker = 0
                        exports['qb-core']:HideText()
                    end
                end
            end)
        end
    end
    if not Config.UseTarget then
        while true do
            local sleep = 1000
            if isLoggedIn then
                if currentLocker ~= 0 and not IsDrilling and Config.BigBanks["pacific"]["isOpened"] and not Config.BigBanks["pacific"]["lockers"][currentLocker]["isBusy"] and not Config.BigBanks["pacific"]["lockers"][currentLocker]["isOpened"] then
                    sleep = 0
                    if IsControlJustPressed(0, 38) then
                        exports['qb-core']:KeyPressed()
                        Wait(500)
                        exports['qb-core']:HideText()
                        if CurrentCops >= Config.MinimumPacificPolice then
                            openLocker("pacific", currentLocker)
                        else
                            QBCore.Functions.Notify(Lang:t("error.minimum_police_required", {police = Config.MinimumPacificPolice}), "error")
                        end
                        sleep = 1000
                    end
                end
            end
            Wait(sleep)
        end
    end
end)