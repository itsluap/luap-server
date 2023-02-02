print("^2Jim^7-^2Payments ^7v^42^7.^48^7.^44 ^7- ^2Payments Script by ^1Jimathy^7")

-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {
	Lan = "en",
	Debug = false,
	Notify = "qb",

	---------------------------------
	-- Default Job Payment Systems --
	---------------------------------

	RenewedBanking = true, -- Enable if using Renewed-Banking false if using QB-Management

	ApGov = false, -- Toggle support for AP-Goverment Tax

	List = true, -- "true" to use nearby player list feature in the cash registers, "false" for manual id entry
	PaymentRadius = 12, -- This is how far the playerlist will check for nearby players (based on the person charging)

	Peds = false, -- "true" to enable peds spawning in banks
	PedPool = {
		`IG_Bankman`,
		`U_M_M_BankMan`,
		`S_F_M_Shop_HIGH`,
		`S_M_M_HighSec_02`,
		`S_M_M_HighSec_03`,
		`S_M_M_HighSec_04`,
		`A_F_Y_Business_01`,
		`A_F_Y_Business_02`,
		`A_F_Y_Business_03`,
		`A_F_Y_Business_04`,
		`A_M_M_Business_01`,
		`A_M_Y_Business_02`,
		`A_M_Y_Business_03`,
		`U_F_M_CasinoShop_01`,
	},

	PhoneBank = false, 	-- Set this to false to use the popup payment system FOR CARD/BANK PAYMENTS instead of using phone invoices
						-- This doesn't affect Cash payments as they by default use confirmation now
						-- This is helpful for phones that don't support invoices well

	PhoneType = "qb", -- Change this setting to make invoices work with your phone script [still testing this currently]
						-- "qb" for qb-phone
						-- "gks"" for GKSPhone

	CashInLocation = vector4(252.23, 223.11, 106.29, 159.2), -- Default Third Window along in Pacific Bank

	TicketSystem = true, -- Enable this if you want to use the ticket system false
	TicketSystemAll = false, -- Enable this to give tickets to all workers clocked in

	Commission = true, -- Set this to true to enable Commissions and give the person charging a percentage of the total
	CommissionAll = false, -- Set this to true to give commission to workers clocked in
	CommissionDouble = false, -- Set this to true if you want the person charging to get double Commission
	CommissionLimit = false,	-- If true, this limits the Commission to only be given if over the "MinAmountForTicket".
								-- If false, Commission will be given for any amount

	-- MinAmountforTicket should be your cheapest item
	-- PayPerTicket should never be higher than MinAmountforTicket
	-- Commission is a percentage eg "0.10" becomes 10%
	Jobs = {
		--['beanmachine'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10, },
		--['bakery'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10, },
		['ottos'] = { MinAmountforTicket = 50, PayPerTicket = 50 , Commission = 0.10, },
		['hayes'] = { MinAmountforTicket = 50, PayPerTicket = 50 , Commission = 0.10, },
		['burgershot'] = { MinAmountforTicket = 50, PayPerTicket = 50 , Commission = 0.10, },
		['puffpuffpass'] = { MinAmountforTicket = 50, PayPerTicket = 50 , Commission = 0.10, },
		--['catcafe'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10, },
		--['henhouse'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10, },
		--['pizzathis'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10, },
		--['popsdiner'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10, },
		--['tequilala'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10, },
		['vanilla'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10, },
		--['mechanic'] = { MinAmountforTicket = 1000, PayPerTicket = 500, Commission = 0.10, },
		--['lostmc'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10, gang = true, }, -- Example of a gang being supported
	},

	------------------------------
	-- Custom Job Cash Register --
	------------------------------
	-- This adds the ability to add multiple locations for each job
	-- Basically adding ready made locations, all you need to a vector4 and to confrim if you need a new prop in that location
    CustomCashRegisters = {

	},

	-- The /polcharge command requires specific jobs to be set
	-- No tickets for these, it's just commission (0.25 = 25%)
	FineJobs = {
		['police'] = { Commission = 0.25, },
		['sheriff'] = { Commission = 0.25, },
		['trooper'] = { Commission = 0.25, },
		['ambulance'] = { Commission = 0.25, },
	},
	FineJobConfirmation = false, --"true" makes it so fines need confirmation, "false" skips this ands just removes the money
	FineJobList = true, -- "true" to use nearby player list feature in the cash registers, "false" for manual id entry

	---------------------
	-- Banking Systems --
	---------------------
	useATM = false, -- Enable this to use the scripts ATM's and controls
	useBanks = false, -- Enable this to use my banking stuff
	BankBlips = false, -- Enable this if you disabled qb-banking and need bank locations
	ATMBlips = false, -- Enable this if you are a pyscho and need every ATM to be on the map too

	Gabz = true, 	-- "true" to enable Gabz Bank locations

}
-- If Gabz banks enabled, load these locations instead
if Config.Gabz then
	Config.CashInLocation = vector4(269.28, 217.24, 106.28, 69.0)
end

Loc = {}
