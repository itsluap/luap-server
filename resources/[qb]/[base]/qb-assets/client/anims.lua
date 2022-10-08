function RequestAnimationDict(AnimDict)
    RequestAnimDict(AnimDict)
    while not HasAnimDictLoaded(AnimDict) do
        Citizen.Wait(1)
    end
end

function RequestModelHash(Model)
    RequestModel(Model)
      while not HasModelLoaded(Model) do
          Wait(1)
      end
end