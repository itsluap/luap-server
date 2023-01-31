QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
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
                payment = 1000
            },
			['1'] = {
                name = 'Officer',
                payment = 1500
            },
			['2'] = {
                name = 'Sergeant',
                payment = 3000
            },
			['3'] = {
                name = 'Lieutenant',
                payment = 4000
            },
            ['4'] = {
                name = 'Captain',
                payment = 5000
            },
            ['5'] = {
                name = 'Deputy Chief',
                payment = 6000
            },
			['6'] = {
                name = 'Chief',
				isboss = true,
                bankAuth = true,
                payment = 8000
            },
        },
	},
	['ambulance'] = {
		label = 'EMS',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1000
            },
			['1'] = {
                name = 'Paramedic',
                payment = 2000
            },
			['2'] = {
                name = 'Doctor',
                payment = 4000
            },
			['3'] = {
                name = 'Surgeon',
                payment = 8000
            },
			['4'] = {
                name = 'Chief',
				isboss = true,
                bankAuth = true,
                payment = 16000
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
        type = "ottos",
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
        type = "tuner",
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
