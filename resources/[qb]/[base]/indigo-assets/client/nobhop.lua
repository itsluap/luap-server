--[[
local NumberJump = 4

Citizen.CreateThread(function()
  local Jump = 0
  while true do

      Citizen.Wait(0)

      local ped = PlayerPedId()
      if IsControlPressed(0, 22) and IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
        print("jump")
        Jump = Jump + 1
        print(Jump)

          if Jump == NumberJump then

              SetPedToRagdoll(ped, 5000, 1400, 2)

              Jump = 0

          end

      else 

          Citizen.Wait(500)
          Jump = 0
          print('no jump')
          
      end
  end
end)
]]--