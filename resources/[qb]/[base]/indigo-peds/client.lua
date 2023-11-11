function SpawnPeds()
	if pedsReady or not next(Config.Peds) then return end
	for k, v in pairs(Config.Peds) do
		if not v.currentpednumber or v.currentpednumber == 0 then
			local spawnedped
			RequestModel(v.model)
			while not HasModelLoaded(v.model) do
				Wait(0)
			end

			if type(v.model) == 'string' then v.model = joaat(v.model) end

			if v.minusOne then
				spawnedped = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z - 1.0, v.coords.w, v.networked or false, false)
			else
				spawnedped = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z, v.coords.w, v.networked or false, false)
			end

			if v.freeze then
				FreezeEntityPosition(spawnedped, true)
			end

			if v.invincible then
				SetEntityInvincible(spawnedped, true)
			end

			if v.blockevents then
				SetBlockingOfNonTemporaryEvents(spawnedped, true)
			end

			if v.animDict and v.anim then
				RequestAnimDict(v.animDict)
				while not HasAnimDictLoaded(v.animDict) do
					Wait(0)
				end

				TaskPlayAnim(spawnedped, v.animDict, v.anim, 8.0, 0, -1, v.flag or 1, 0, false, false, false)
			end

			if v.scenario then
				SetPedCanPlayAmbientAnims(spawnedped, true)
				TaskStartScenarioInPlace(spawnedped, v.scenario, 0, true)
			end

			if v.pedrelations then
				if type(v.pedrelations.groupname) ~= 'string' then error(v.pedrelations.groupname .. ' is not a string') end

				local pedgrouphash = joaat(v.pedrelations.groupname)

				if not DoesRelationshipGroupExist(pedgrouphash) then
					AddRelationshipGroup(v.pedrelations.groupname)
				end

				SetPedRelationshipGroupHash(spawnedped, pedgrouphash)
				if v.pedrelations.toplayer then
					SetRelationshipBetweenGroups(v.pedrelations.toplayer, pedgrouphash, joaat('PLAYER'))
				end

				if v.pedrelations.toowngroup then
					SetRelationshipBetweenGroups(v.pedrelations.toowngroup, pedgrouphash, pedgrouphash)
				end
			end

			if v.weapon then
				if type(v.weapon.name) == 'string' then v.weapon.name = joaat(v.weapon.name) end

				if IsWeaponValid(v.weapon.name) then
					SetCanPedEquipWeapon(spawnedped, v.weapon.name, true)
					GiveWeaponToPed(spawnedped, v.weapon.name, v.weapon.ammo, v.weapon.hidden or false, true)
					SetPedCurrentWeaponVisible(spawnedped, not v.weapon.hidden or false, true)
				end
			end

			if v.target then
				if v.target.useModel then
					AddTargetModel(v.model, {
						options = v.target.options,
						distance = v.target.distance
					})
				else
					AddTargetEntity(spawnedped, {
						options = v.target.options,
						distance = v.target.distance
					})
				end
			end

			if v.action then
				v.action(v)
			end

			Config.Peds[k].currentpednumber = spawnedped
		end
	end
	pedsReady = true
end

function DeletePeds()
	if not pedsReady or not next(Config.Peds) then return end
	for k, v in pairs(Config.Peds) do
		DeletePed(v.currentpednumber)
		Config.Peds[k].currentpednumber = 0
	end
	pedsReady = false
end

exports("DeletePeds", DeletePeds)

local function SpawnPed(data)
	local spawnedped
	local key, value = next(data)
	if type(value) == 'table' and type(key) ~= 'string' then
		for _, v in pairs(data) do
			if v.spawnNow then
				RequestModel(v.model)
				while not HasModelLoaded(v.model) do
					Wait(0)
				end

				if type(v.model) == 'string' then v.model = joaat(v.model) end

				if v.minusOne then
					spawnedped = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z - 1.0, v.coords.w or 0.0, v.networked or false, true)
				else
					spawnedped = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z, v.coords.w or 0.0, v.networked or false, true)
				end

				if v.freeze then
					FreezeEntityPosition(spawnedped, true)
				end

				if v.invincible then
					SetEntityInvincible(spawnedped, true)
				end

				if v.blockevents then
					SetBlockingOfNonTemporaryEvents(spawnedped, true)
				end

				if v.animDict and v.anim then
					RequestAnimDict(v.animDict)
					while not HasAnimDictLoaded(v.animDict) do
						Wait(0)
					end

					TaskPlayAnim(spawnedped, v.animDict, v.anim, 8.0, 0, -1, v.flag or 1, 0, false, false, false)
				end

				if v.scenario then
					SetPedCanPlayAmbientAnims(spawnedped, true)
					TaskStartScenarioInPlace(spawnedped, v.scenario, 0, true)
				end

				if v.pedrelations and type(v.pedrelations.groupname) == 'string' then
					if type(v.pedrelations.groupname) ~= 'string' then error(v.pedrelations.groupname .. ' is not a string') end

					local pedgrouphash = joaat(v.pedrelations.groupname)

					if not DoesRelationshipGroupExist(pedgrouphash) then
						AddRelationshipGroup(v.pedrelations.groupname)
					end

					SetPedRelationshipGroupHash(spawnedped, pedgrouphash)
					if v.pedrelations.toplayer then
						SetRelationshipBetweenGroups(v.pedrelations.toplayer, pedgrouphash, joaat('PLAYER'))
					end

					if v.pedrelations.toowngroup then
						SetRelationshipBetweenGroups(v.pedrelations.toowngroup, pedgrouphash, pedgrouphash)
					end
				end

				if v.weapon then
					if type(v.weapon.name) == 'string' then v.weapon.name = joaat(v.weapon.name) end

					if IsWeaponValid(v.weapon.name) then
						SetCanPedEquipWeapon(spawnedped, v.weapon.name, true)
						GiveWeaponToPed(spawnedped, v.weapon.name, v.weapon.ammo, v.weapon.hidden or false, true)
						SetPedCurrentWeaponVisible(spawnedped, not v.weapon.hidden or false, true)
					end
				end

				if v.target then
					if v.target.useModel then
						AddTargetModel(v.model, {
							options = v.target.options,
							distance = v.target.distance
						})
					else
						AddTargetEntity(spawnedped, {
							options = v.target.options,
							distance = v.target.distance
						})
					end
				end

				v.currentpednumber = spawnedped

				if v.action then
					v.action(v)
				end
			end

			local nextnumber = #Config.Peds + 1
			if nextnumber <= 0 then nextnumber = 1 end

			Config.Peds[nextnumber] = v
		end
	else
		if data.spawnNow then
			RequestModel(data.model)
			while not HasModelLoaded(data.model) do
				Wait(0)
			end

			if type(data.model) == 'string' then data.model = joaat(data.model) end

			if data.minusOne then
				spawnedped = CreatePed(0, data.model, data.coords.x, data.coords.y, data.coords.z - 1.0, data.coords.w, data.networked or false, true)
			else
				spawnedped = CreatePed(0, data.model, data.coords.x, data.coords.y, data.coords.z, data.coords.w, data.networked or false, true)
			end

			if data.freeze then
				FreezeEntityPosition(spawnedped, true)
			end

			if data.invincible then
				SetEntityInvincible(spawnedped, true)
			end

			if data.blockevents then
				SetBlockingOfNonTemporaryEvents(spawnedped, true)
			end

			if data.animDict and data.anim then
				RequestAnimDict(data.animDict)
				while not HasAnimDictLoaded(data.animDict) do
					Wait(0)
				end

				TaskPlayAnim(spawnedped, data.animDict, data.anim, 8.0, 0, -1, data.flag or 1, 0, false, false, false)
			end

			if data.scenario then
				SetPedCanPlayAmbientAnims(spawnedped, true)
				TaskStartScenarioInPlace(spawnedped, data.scenario, 0, true)
			end

			if data.pedrelations then
				if type(data.pedrelations.groupname) ~= 'string' then error(data.pedrelations.groupname .. ' is not a string') end

				local pedgrouphash = joaat(data.pedrelations.groupname)

				if not DoesRelationshipGroupExist(pedgrouphash) then
					AddRelationshipGroup(data.pedrelations.groupname)
				end

				SetPedRelationshipGroupHash(spawnedped, pedgrouphash)
				if data.pedrelations.toplayer then
					SetRelationshipBetweenGroups(data.pedrelations.toplayer, pedgrouphash, joaat('PLAYER'))
				end

				if data.pedrelations.toowngroup then
					SetRelationshipBetweenGroups(data.pedrelations.toowngroup, pedgrouphash, pedgrouphash)
				end
			end

			if data.weapon then
				if type(data.weapon.name) == 'string' then data.weapon.name = joaat(data.weapon.name) end

				if IsWeaponValid(data.weapon.name) then
					SetCanPedEquipWeapon(spawnedped, data.weapon.name, true)
					GiveWeaponToPed(spawnedped, data.weapon.name, data.weapon.ammo, data.weapon.hidden or false, true)
					SetPedCurrentWeaponVisible(spawnedped, not data.weapon.hidden or false, true)
				end
			end

			if data.target then
				if data.target.useModel then
					AddTargetModel(data.model, {
						options = data.target.options,
						distance = data.target.distance
					})
				else
					AddTargetEntity(spawnedped, {
						options = data.target.options,
						distance = data.target.distance
					})
				end
			end

			if data.action then
				data.action(data)
			end

			data.currentpednumber = spawnedped
		end

		local nextnumber = #Config.Peds + 1
		if nextnumber <= 0 then nextnumber = 1 end

		Config.Peds[nextnumber] = data
	end
end

exports("SpawnPed", SpawnPed)

local function RemovePed(peds)
	if type(peds) == 'table' then
		for k, v in pairs(peds) do
			DeletePed(v)
			if Config.Peds[k] then Config.Peds[k].currentpednumber = 0 end
		end
	elseif type(peds) == 'number' then
		DeletePed(peds)
	end
end

exports("RemoveSpawnedPed", RemovePed)