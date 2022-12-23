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
                payment = 10
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
                payment = 100
            },
			['1'] = {
                name = 'Officer',
                payment = 250
            },
			['2'] = {
                name = 'Sergeant',
                payment = 350
            },
			['3'] = {
                name = 'Lieutenant',
                payment = 450
            },
            ['4'] = {
                name = 'Captain',
                payment = 650
            },
            ['5'] = {
                name = 'Deputy Chief',
                payment = 750
            },
			['6'] = {
                name = 'Chief',
				isboss = true,
                bankAuth = true,
                payment = 900
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
                payment = 250
            },
			['1'] = {
                name = 'Paramedic',
                payment = 800
            },
			['2'] = {
                name = 'Doctor',
                payment = 1500
            },
			['3'] = {
                name = 'Surgeon',
                payment = 2500
            },
			['4'] = {
                name = 'Chief',
				isboss = true,
                bankAuth = true,
                payment = 3500
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
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 150
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
                payment = 50
            },
			['1'] = {
                name = 'Driver',
                payment = 75
            },
			['2'] = {
                name = 'Event Driver',
                payment = 100
            },
			['3'] = {
                name = 'Sales',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 150
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
                payment = 150
            },
			['1'] = {
                name = 'Manager',
                payment = 250
            },
			['2'] = {
                name = 'Owner',
                payment = 500
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
                payment = 50
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
                payment = 50
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Finance',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 150
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
                payment = 50
            },
			['1'] = {
                name = 'Novice',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Advanced',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 150
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
                payment = 150
            },
			['1'] = {
                name = 'Novice',
                payment = 300
            },
			['2'] = {
                name = 'Experienced',
                payment = 600
            },
			['3'] = {
                name = 'Advanced',
                payment = 1200
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                --bankAuth = true,
                payment = 1800
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
				isboss = true,
                bankAuth = true,
                payment = 2200
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
                payment = 150
            },
			['1'] = {
                name = 'Novice',
                payment = 300
            },
			['2'] = {
                name = 'Experienced',
                payment = 600
            },
			['3'] = {
                name = 'Advanced',
                payment = 1200
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                --bankAuth = true,
                payment = 1800
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
				isboss = true,
                bankAuth = true,
                payment = 2200
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
                payment = 150
            },
			['1'] = {
                name = 'Novice',
                payment = 300
            },
			['2'] = {
                name = 'Experienced',
                payment = 600
            },
			['3'] = {
                name = 'Advanced',
                payment = 1200
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                --bankAuth = true,
                payment = 1800
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
				isboss = true,
                bankAuth = true,
                payment = 2200
            },
        },
	},
    ["burgershot"] = {
		label = "Burgershot Employee",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 50
            },
			['1'] = {
                name = "Employee",
                payment = 75
            },
			['2'] = {
                name = "Burger Flipper",
                payment = 100
            },
			['3'] = {
                name = "Manager",
                payment = 125
            },
			['4'] = {
                name = "Owner",
				isboss = true,
                payment = 150
            },
        },
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 1000
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
                payment = 850
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
                payment = 250
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
                payment = 150
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
                payment = 450
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
                payment = 150
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
                payment = 150
            },
        },
	},
    ['vanilla'] = {
		label = 'Vanilla Unicorn',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
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

}
