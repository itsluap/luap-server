Config = {}

Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.PedList = {

	-- from ps-drugproccessing --

	{
		model = `a_m_m_hillbilly_02`, -- Model name as a hash.
		coords = vector4(-1187.73, -445.27, 43.91, 289.45), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'male' -- The gender of the ped, used for the CreatePed native.
	},

	{
		model = `a_m_m_mlcrisis_01`, -- Model name as a hash.
		coords = vector4(812.49, -2399.59, 23.66, 223.1), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'male' -- The gender of the ped, used for the CreatePed native.
	},

	-- indigo-taxijob --

	{
		model = `a_m_m_indian_01`, -- Model name as a hash.
		coords = vector4(901.34, -170.06, 74.08, 228.81), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'male' -- The gender of the ped, used for the CreatePed native.
	},

}

-- ox_lib stuff --

ps1_model = 'a_m_m_hillbilly_02'
ps2_model = 'a_m_m_mlcrisis_01'
taxi_model = 'a_m_m_indian_01'

ps1_options = {
	event = "ps-drugprocessing:EnterLab",
	icon = "fas fa-atom",
	label = "Talk to Walter",
}

ps2_options = {
	event = "ps-drugprocessing:EnterCWarehouse",
	icon = "fas fa-key",
	label = "Talk to Draco",
}

taxi_options = {
	event = "indigo-taxijob:client:requestcab",
	icon = "fas fa-sign-in-alt",
	label = '🚕 Request Taxi Cab',
	groups = "taxi",
}

exports.ox_target:addModel(ps1_model, ps1_options)

exports.ox_target:addModel(ps2_model, ps2_options)

exports.ox_target:addModel(taxi_model, taxi_options)