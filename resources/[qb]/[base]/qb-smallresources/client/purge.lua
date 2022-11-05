local INPUT_CHARACTER_WHEEL = 19
local INPUT_VEH_ACCELERATE = 71
local INPUT_VEH_DUCK = 21

local function IsNitroControlPressed()
  if not IsInputDisabled(2) then
    DisableControlAction(2, INPUT_VEH_DUCK)
    return IsDisabledControlPressed(2, INPUT_VEH_DUCK)
  end

  return IsControlPressed(0, INPUT_CHARACTER_WHEEL)
end

local function IsDrivingControlPressed()
  return IsControlPressed(0, INPUT_VEH_ACCELERATE)
end

local function NitroLoop(lastVehicle)
  local player = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(player)
  local driver = GetPedInVehicleSeat(vehicle, -1)

  if lastVehicle ~= 0 and lastVehicle ~= vehicle then
    SetVehicleNitroPurgeEnabled(lastVehicle, false)
    TriggerServerEvent('nitro:__sync', false, true)
  end

  if vehicle == 0 or driver ~= player then
    return 0
  end

  local model = GetEntityModel(vehicle)

  if not IsThisModelACar(model) then
    return 0
  end

  local isEnabled = IsNitroControlPressed()
  local isDriving = IsDrivingControlPressed()
  local isRunning = GetIsVehicleEngineRunning(vehicle)
  local isPurging = IsVehicleNitroPurgeEnabled(vehicle)

  if isRunning and isEnabled and isFueled then
    if isDriving then
      if not isPurging then
        SetVehicleNitroPurgeEnabled(vehicle, false)
        TriggerServerEvent('nitro:__sync', false, false)
      end
    else
      if not isPurging then
        SetVehicleNitroPurgeEnabled(vehicle, true)
        TriggerServerEvent('nitro:__sync', true, false)
      end
    end
  elseif isPurging then
    SetVehicleNitroPurgeEnabled(vehicle, false)
    TriggerServerEvent('nitro:__sync', false, false)
  end

  return vehicle
end

Citizen.CreateThread(function ()
  local lastVehicle = 0

  while true do
    Citizen.Wait(0)
    lastVehicle = NitroLoop(lastVehicle)
  end
end)

-- local DEFAULT_PURGE_CONFIG = {
--   infernus = {
--     [1] = {
--       scale: 0.5,
--       density: 3,
--       color: { 255, 255, 255 },
--       position: { 0.0, 0.0, 0.0 },
--       rotation: { 0.0, 0.0, 0.0 }
--     }
--   }
-- }

--------------------------------------------------------------------------------

-- local modelConfig = {}
-- local entityConfig = {}
--
-- local function AddVehicleModelNitroPurgeNozzle() end
-- local function RemoveVehicleModelNitroPurgeNozzle() end
-- local function SetVehicleModelNitroPurgeNozzleScale() end
-- local function SetVehicleModelNitroPurgeNozzleDensity() end
-- local function SetVehicleModelNitroPurgeNozzleColor() end
-- local function SetVehicleModelNitroPurgeNozzlePosition() end
-- local function SetVehicleModelNitroPurgeNozzleRotation() end
--
-- local function AddVehicleNitroPurgeNozzle() end
-- local function RemoveVehicleNitroPurgeNozzle() end
-- local function SetVehicleNitroPurgeNozzleScale() end
-- local function SetVehicleNitroPurgeNozzleDensity() end
-- local function SetVehicleNitroPurgeNozzleColor() end
-- local function SetVehicleNitroPurgeNozzlePosition() end
-- local function SetVehicleNitroPurgeNozzleRotation() end

--------------------------------------------------------------------------------

local vehicles = {}
local particles = {}

function IsVehicleNitroPurgeEnabled(vehicle)
  return vehicles[vehicle] == true
end

function SetVehicleNitroPurgeEnabled(vehicle, enabled)
  if IsVehicleNitroPurgeEnabled(vehicle) == enabled then
    return
  end

  if enabled then
    local bone = GetEntityBoneIndexByName(vehicle, 'bonnet')
    local pos = GetWorldPositionOfEntityBone(vehicle, bone)
    local off = GetOffsetFromEntityGivenWorldCoords(vehicle, pos.x, pos.y, pos.z)
    local ptfxs = {}

    for i=0,3 do
      local leftPurge = CreateVehiclePurgeSpray(vehicle, off.x - 0.5, off.y + 0.05, off.z, 40.0, -20.0, 0.0, 0.5)
      local rightPurge = CreateVehiclePurgeSpray(vehicle, off.x + 0.5, off.y + 0.05, off.z, 40.0, 20.0, 0.0, 0.5)

      table.insert(ptfxs, leftPurge)
      table.insert(ptfxs, rightPurge)
    end

    vehicles[vehicle] = true
    particles[vehicle] = ptfxs
  else
    if particles[vehicle] and #particles[vehicle] > 0 then
      for _, particleId in ipairs(particles[vehicle]) do
        StopParticleFxLooped(particleId)
      end
    end

    vehicles[vehicle] = nil
    particles[vehicle] = nil
  end
end
