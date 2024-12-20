local AllProps = {}
local HasProp = false

function AddProp(Name)
    if Config.PropList[Name] ~= nil then
      if not HasProp then
        HasProp = true
        RequestModelHash(Config.PropList[Name]['prop'])
        local CurrentProp = CreateObject(Config.PropList[Name]['hash'], 0, 0, 0, true, true, true)
        AttachEntityToEntity(CurrentProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), Config.PropList[Name]['bone-index']['bone']), Config.PropList[Name]['bone-index']['X'], Config.PropList[Name]['bone-index']['Y'], Config.PropList[Name]['bone-index']['Z'], Config.PropList[Name]['bone-index']['XR'], Config.PropList[Name]['bone-index']['YR'], Config.PropList[Name]['bone-index']['ZR'], true, true, false, true, 1, true)
        table.insert(AllProps, CurrentProp)
      end
    end 
end

function RemoveProp()
  for k, v in pairs(AllProps) do
     NetworkRequestControlOfEntity(v)
     SetEntityAsMissionEntity(v, true, true)
     DeleteEntity(v)
     DeleteObject(v)
     DetachEntity(v, 1, 1)
  end
    AllProps = {}
    HasProp = false
end

function GetPropStatus()
  return HasProp
end

function RequestModelHash(Model)
  RequestModel(Model)
	while not HasModelLoaded(Model) do
	    Wait(1)
    end
end

AddEventHandler('onResourceStop', function(resource)
	RemoveProp()
end)