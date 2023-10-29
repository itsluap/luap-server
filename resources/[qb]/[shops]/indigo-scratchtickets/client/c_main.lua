local cooldown = 0

RegisterNetEvent("indigo-scratchtickets:isActiveCooldown", function()
	TriggerServerEvent("indigo-scratchtickets:handler", cooldown > 0 and true or false, cooldown)
end)

RegisterNetEvent("indigo-scratchtickets:setCooldown", function()
  cooldown = Config.ScratchCooldownInSeconds
	CreateThread(function()
		while (cooldown ~= 0) do
			Wait(1000)
			cooldown = cooldown - 1
		end
	end)
end)

RegisterNetEvent("indigo-scratchtickets:startScratchingEmote", function()
  if not IsPedInAnyVehicle(PlayerPedId()) then
	  TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, true)
  end
end)

RegisterNetEvent("indigo-scratchtickets:stopScratchingEmote", function()
  if not IsPedInAnyVehicle(PlayerPedId()) then
	  ClearPedTasksImmediately(PlayerPedId())
  end
end)

RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('indigo-scratchtickets:deposit', data.key, data.price, data.amount, data.type)
end)
