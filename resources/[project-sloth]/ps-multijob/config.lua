Config = Config or {}

-- Side of the screen where you want the ui to be on. Can either be "left" or "right"
Config.Side = "right"

Config.MaxJobs = 4
Config.IgnoredJobs = {
	["unemployed"] = true,
}

Config.DenyDuty = {
	["ambulance"] = true,
	["police"] = true,
}

Config.WhitelistJobs = {
	["police"] = true,
	["ambulance"] = true,
	["mechanic"] = true,
	["cardealer"] = true,
	["realestate"] = true,
	["ottos"] = true,
	["tuner"] = true,
	["autoex"] = true,
	["burgershot"] = true,
	["vanilla"] = true,
	["judge"] = true,
	["lawyer"] = true,
	["casino"] = true,
	["irc"] = true,
	["puffpuffpass"] = true,
}

Config.Descriptions = {
	["police"] = "Shoot some criminals or maybe be a good cop and arrest them",
	["ambulance"] = "Fix the bullet holes",
	["mechanic"] = "Fix and customize cars",
	["ottos"] = "Fix and customize cars",
	["tuner"] = "Fix and customize cars",
	["autoex"] = "Fix and customize cars",
	["tow"] = "Pickup the tow truck and steal some vehicles",
	["taxi"] = "You should retire, this job sucks",
	["bus"] = "You should retire, this job sucks",
	["realestate"] = "Sell houses or something",
	["cardealer"] = "Sell cars or something",
	["burgershot"] = "Sell burgers or something",
	["vanilla"] = "Shawty I don't mind",
	["judge"] = "Decide if people are guilty",
	["lawyer"] = "Help the good or the bad",
	["reporter"] = "Lowkey useless",
	["trucker"] = "Drive a truck",
	["garbage"] = "Drive a garbage truck",
	["vineyard"] = "Get them vines",
	["hotdog"] = "Sell them glizzys",
	["unemployed"] = "You should probably get a job",
}

-- Change the icons to any free font awesome icon, also add other jobs your server might have to the list
-- List: https://fontawesome.com/search?o=r&s=solid
Config.FontAwesomeIcons = {
	["police"] = "fa-solid fa-handcuffs",
	["ambulance"] = "fa-solid fa-user-doctor",
	["mechanic"] = "fa-solid fa-wrench",
	["tow"] = "fa-solid fa-truck-tow",
	["taxi"] = "fa-solid fa-taxi",
	["bus"] = "fa-solid fa-bus",
	["realestate"] = "fa-solid fa-sign-hanging",
	["cardealer"] = "fa-solid fa-cards",
	["judge"] = "fa-solid fa-gave",
	["lawyer"] = "fa-solid fa-gavel",
	["reporter"] = "fa-solid fa-microphone",
	["trucker"] = "fa-solid fa-truck-front",
	["garbage"] = "fa-solid fa-trash-can",
	["vineyard"] = "fa-solid fa-wine-bottle",
	["hotdog"] = "fa-solid fa-hotdog",
}
