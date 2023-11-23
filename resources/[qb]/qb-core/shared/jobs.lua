QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = false -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 100
            },
        },
	},
	['police'] = {
		label = 'LSPD',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1900
            },
			['1'] = {
                name = 'Officer',
                payment = 2500
            },
			['2'] = {
                name = 'Senior Officer',
                payment = 3200
            },
            ['3'] = {
                name = 'Detective',
                payment = 4200
            },
            ['4'] = {
                name = 'Corporal',
                payment = 4800
            },
            ['5'] = {
                name = 'Sergeant',
                payment = 5200
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 5800
            },
            ['7'] = {
                name = 'Captain',
                payment = 6200
            },
            ['8'] = {
                name = 'Deputy Chief of LSPD',
                payment = 7000
            },
			['9'] = {
                name = 'Chief of LSPD',
				isboss = true,
                bankAuth = true,
                payment = 9000
            },
        },
	},
    ['sheriff'] = {
		label = 'BCSO',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1900
            },
			['1'] = {
                name = 'Deputy',
                payment = 2500
            },
			['2'] = {
                name = 'Senior Deputy',
                payment = 3200
            },
            ['3'] = {
                name = 'Detective',
                payment = 4200
            },
            ['4'] = {
                name = 'Corporal',
                payment = 4800
            },
            ['5'] = {
                name = 'Sergeant',
                payment = 5200
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 5800
            },
            ['7'] = {
                name = 'Captain',
                payment = 6200
            },
            ['8'] = {
                name = 'Deputy Sheriff',
                payment = 7000
            },
			['9'] = {
                name = 'Sheriff',
				isboss = true,
                bankAuth = true,
                payment = 9000
            },
        },
	},
    ['trooper'] = {
		label = 'SASP',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1900
            },
			['1'] = {
                name = 'Trooper',
                payment = 2500
            },
			['2'] = {
                name = 'Senior Trooper',
                payment = 3200
            },
            ['3'] = {
                name = 'Detective',
                payment = 4200
            },
            ['4'] = {
                name = 'Corporal',
                payment = 4800
            },
            ['5'] = {
                name = 'Sergeant',
                payment = 5200
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 5800
            },
            ['7'] = {
                name = 'Captain',
                payment = 6200
            },
            ['8'] = {
                name = 'Deputy Chief of SASP',
                payment = 7000
            },
			['9'] = {
                name = 'Chief of SASP',
				isboss = true,
                bankAuth = true,
                payment = 9000
            },
        },
	},
	['ambulance'] = {
		label = 'EMS',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'EMS Trainee',
                payment = 2000
            },
			['1'] = {
                name = 'EMT',
                payment = 4500
            },
			['2'] = {
                name = 'AEMT',
                payment = 5000
            },
			['3'] = {
                name = 'EMS Lieutenant',
                payment = 5500
            },
			['4'] = {
                name = 'Captain',
				isboss = true,
                bankAuth = true,
                payment = 6000
            },
            ['4'] = {
                name = 'Dean of EMS',
				isboss = true,
                bankAuth = true,
                payment = 9000
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
			['1'] = {
                name = 'House Sales',
                payment = 1000
            },
			['2'] = {
                name = 'Business Sales',
                payment = 2000
            },
			['3'] = {
                name = 'Broker',
                payment = 3000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 5000
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 200
            },
			['1'] = {
                name = 'Driver',
                payment = 500
            },
			['2'] = {
                name = 'Event Driver',
                payment = 800
            },
			['3'] = {
                name = 'Sales',
                payment = 1000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 2000
            },
        },
	},
    ['casino'] = {
		label = 'Diamond Casino',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Security',
                payment = 1000
            },
			['1'] = {
                name = 'Manager',
                payment = 5000
            },
			['2'] = {
                name = 'Owner',
                payment = 10000
            },
        },
	},
     ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 800
            },
		},
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 800
            },
			['2'] = {
                name = 'Business Sales',
                payment = 1000
            },
			['3'] = {
                name = 'Finance',
                payment = 2000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 4000
            },
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
        type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
			['1'] = {
                name = 'Novice',
                payment = 800
            },
			['2'] = {
                name = 'Experienced',
                payment = 1000
            },
			['3'] = {
                name = 'Advanced',
                payment = 2000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 4000
            },
        },
	},
    ['ottos'] = {
		label = 'Ottos Autos',
        type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
			['1'] = {
                name = 'Novice',
                payment = 800
            },
			['2'] = {
                name = 'Experienced',
                payment = 1000
            },
			['3'] = {
                name = 'Advanced',
                payment = 2000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                --bankAuth = true,
                payment = 4000
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
				isboss = true,
                bankAuth = true,
                payment = 6000
            },
        },
	},
    ['tuner'] = {
		label = 'Tuner Shop',
        type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
			['1'] = {
                name = 'Novice',
                payment = 800
            },
			['2'] = {
                name = 'Experienced',
                payment = 1000
            },
			['3'] = {
                name = 'Advanced',
                payment = 2000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                --bankAuth = true,
                payment = 4000
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
				isboss = true,
                bankAuth = true,
                payment = 6000
            },
        },
	},
    ['autoex'] = {
		label = 'Auto Exotics',
        type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
			['1'] = {
                name = 'Novice',
                payment = 800
            },
			['2'] = {
                name = 'Experienced',
                payment = 1000
            },
			['3'] = {
                name = 'Advanced',
                payment = 2000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                --bankAuth = true,
                payment = 4000
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
				isboss = true,
                bankAuth = true,
                payment = 6000
            },
        },
	},
    ['hayes'] = {
		label = 'Hayes Auto',
        type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
			['1'] = {
                name = 'Novice',
                payment = 800
            },
			['2'] = {
                name = 'Experienced',
                payment = 1000
            },
			['3'] = {
                name = 'Advanced',
                payment = 2000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                --bankAuth = true,
                payment = 4000
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
				isboss = true,
                bankAuth = true,
                payment = 6000
            },
        },
	},
    ['bennys'] = {
		label = "Benny's",
        type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
			['1'] = {
                name = 'Novice',
                payment = 800
            },
			['2'] = {
                name = 'Experienced',
                payment = 1000
            },
			['3'] = {
                name = 'Advanced',
                payment = 2000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                --bankAuth = true,
                payment = 4000
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
				isboss = true,
                bankAuth = true,
                payment = 6000
            },
        },
	},
    ['burgershot'] = {
		label = 'BurgerShot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 250 },
			['1'] = { name = 'Novice', payment = 500 },
			['2'] = { name = 'Experienced', payment = 850 },
			['3'] = { name = 'Advanced', payment = 1100 },
			['4'] = { name = 'Manager', isboss = true, payment = 1650 },
            ['5'] = { name = 'Owner', isboss = true, payment = 2000 },
        },
	},
    ['puffpuffpass'] = {
		label = 'Puff Puff Pass',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 250 },
			['1'] = { name = 'Novice', payment = 500 },
			['2'] = { name = 'Experienced', payment = 850 },
			['3'] = { name = 'Advanced', payment = 1100 },
			['4'] = { name = 'Manager', isboss = true, payment = 1650 },
            ['5'] = { name = 'Owner', isboss = true, payment = 2000 },
        },
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 10000
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                payment = 7500
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 2500
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 750
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 950
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 650
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 550
            },
        },
	},
    ['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 550
            },
        },
	},
    ['vanilla'] = {
		label = 'Vanilla Unicorn',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 250 },
			['1'] = { name = 'Novice', payment = 500 },
			['2'] = { name = 'Experienced', payment = 850 },
			['3'] = { name = 'Advanced', payment = 1100 },
			['4'] = { name = 'Manager', isboss = true, payment = 1650 },
            ['5'] = { name = 'Owner', isboss = true, payment = 2000 },
        },
	},
	['lcrc'] = {
		label = 'LCRC Investments',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Investor',
                payment = 100
            },
            ['1'] = {
                name = 'Founder',
                payment = 200
            },
        },
	},
    ['irc'] = {
		label = 'Indigo Racing Championship',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Intern',
                payment = 1000
            },
            ['1'] = {
                name = 'Board Member',
                payment = 2000
            },
            ['2'] = {
                name = 'Founders',
                payment = 2500
            },
        },
	},

}
