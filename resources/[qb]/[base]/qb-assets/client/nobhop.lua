local NumberJump = 8

Citizen.CreateThread(function()
  local Jump = 0
  while true do

      Citizen.Wait(1)

      local ped = PlayerPedId()

      if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then

        Jump = Jump + 1
        print(Jump)
        print(before ragdoll)

          if Jump == NumberJump then

              SetPedToRagdoll(ped, 5000, 1400, 2)
              print (Jump)

              Jump = 0

          end

      else 

          Citizen.Wait(500)
          Jump = 0
          
      end
  end
end)