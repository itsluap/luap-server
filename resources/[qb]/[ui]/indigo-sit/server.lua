local QBCore = exports['indigo-core']:GetCoreObject()
local seatsTaken = {}

RegisterNetEvent('indigo-sit:takePlace', function(objectCoords)
	seatsTaken[objectCoords] = true
end)

RegisterNetEvent('indigo-sit:leavePlace', function(objectCoords)
	if seatsTaken[objectCoords] then
		seatsTaken[objectCoords] = nil
	end
end)

QBCore.Functions.CreateCallback('indigo-sit:getPlace', function(source, cb, objectCoords)
	cb(seatsTaken[objectCoords])
end)
