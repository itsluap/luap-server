Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

-- This is the handler for the cop count, you can change this to anything you want as this is by default the qb-policejob event
RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

--- This function will be executed once a doorlock action is happening, so locking or unlocking a door
--- @param doorId number | string
--- @param setLocked boolean
--- @return nil
function Config.DoorlockAction(doorId, setLocked)
    TriggerServerEvent('qb-doorlock:server:updateState', doorId, setLocked, false, false, true, false, false)
end

--- This function will be triggered once the hack is done
--- @param success boolean
--- @param bank number | string
--- @return nil
function Config.OnHackDone(success, bank)
    TriggerEvent('mhacking:hide')
    TriggerEvent('Framework:Client:CloseNui')
    if not success then return end
    TriggerServerEvent('qb-bankrobbery:server:setBankState', bank)
end

--- This will be triggered once an action happens that can drop evidence
--- @param pos vector3
--- @param chance number
--- @return nil
function Config.OnEvidence(pos, chance)
    if math.random(1, 100) > chance or QBCore.Functions.IsWearingGloves() then return end
    TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
end

--- This will be called each 10 seconds whilst drilling a safety deposit box
--- @return nil
function Config.OnDrillingAction()
    TriggerServerEvent('hud:server:GainStress', math.random(4, 8))
end

--- This is called when the user is nearby an interaction that requires said items, this will trigger the box that shows what items you need
---
--- Format for `items`:
--- ```lua
--- {
---     [itemIndexNumber] = { name = 'itemName', image = 'itemImage' }
--- }
--- ```
--- @param items table | nil
--- @param show boolean
--- @return nil
function Config.ShowRequiredItems(items, show)
    TriggerEvent('inventory:client:requiredItems', items, show)
end

Config.MinimumPaletoPolice = 0
Config.MinimumPacificPolice = 0
Config.MinimumFleecaPolice = 0
Config.MinimumThermitePolice = 0
Config.OutlawCooldown = 5 -- The amount of minutes it takes for the cops to be able to be called again after they were called

Config['PacificSetup'] = {
    ['mainStack'] = {model = 'h4_prop_h4_cash_stack_01a', pos = vector3(228.26, 234.64, 97.12), heading = 44.0},
    ['stacks'] = {
        {model = 'h4_prop_h4_cash_stack_01a', pos = vector3(231.79, 233.53, 97.12), heading = 257.0},

        {model = 'h4_prop_h4_gold_stack_01a', pos = vector3(229.21, 225.53, 97.12), heading = 171.0},
        {model = 'h4_prop_h4_gold_stack_01a', pos = vector3(228.08, 225.93, 97.12), heading = 155.0},

        {model = 'h4_prop_h4_gold_stack_01a', pos = vector3(226.06, 226.66, 97.12), heading = 158.0},
        {model = 'h4_prop_h4_gold_stack_01a', pos = vector3(224.92, 227.11, 97.12), heading = 149.0},
    },
}

Strings = {
    ['e_start'] = 'Press ~INPUT_CONTEXT~ to Start Pacific Heist',
    ['start_heist'] = 'Go to Pacific Bank',
    ['start_heist2'] = 'Required things for robbery: Laptop, Trojan USB, Cutter, C4 & Thermite, Bag, Drill',
    ['plant'] = 'Press ~INPUT_CONTEXT~ to plant thermite',
    ['plant_bomb'] = 'Press ~INPUT_CONTEXT~ to plant C4',
    ['detonate_bombs'] = 'Press ~INPUT_CONTEXT~ to detonate bombs',
    ['grab'] = 'Press ~INPUT_CONTEXT~ to grab',
    ['hacking'] = 'Press ~INPUT_CONTEXT~ to use trojan usb',
    ['vault'] = 'Press ~INPUT_CONTEXT~ to open vault',
    ['drill'] = 'Press ~INPUT_CONTEXT~ to use drill',
    ['wait_nextrob'] = 'You have to wait this long to undress again',
    ['minute'] = 'minute.',
    ['start_stealing'] = 'Press ~INPUT_CONTEXT~ to stealing',
    ['cute_right'] = 'Press ~INPUT_CONTEXT~ to cut right',
    ['cute_left'] = 'Press ~INPUT_CONTEXT~ to cut left',
    ['cute_down'] = 'Press ~INPUT_CONTEXT~ to cut down',
    ['glass_cut'] = 'Press ~INPUT_CONTEXT~ to cut the glass',
    ['need_switchblade'] = 'You need the switchblade.',
    ['need_this'] = 'You need this: ',
    ['deliver_to_buyer'] = 'Deliver the loot to the buyer. Check gps.',
    ['buyer_blip'] = 'Buyer',
    ['need_police'] = 'Not enough police in the city.',
    ['total_money'] = 'You got this: ',
    ['police_alert'] = 'Pacific Bank robbery alert! Check your gps.',
}