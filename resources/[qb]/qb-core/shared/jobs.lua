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
                payment = 300
            },
        },
	},
    ['burgershot'] = {
        label = 'Burgershot',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 75
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['vanilla'] = {
        label = 'vanilla',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 75
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['postop'] = {
        label = 'Post OP',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 75
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['fbi'] = {
        label = 'Federal Investigation Bureau',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 500
            },
            ['1'] = {
                name = 'Agent',
                payment = 550
            },
            ['2'] = {
                name = 'Field Agent',
                payment = 600
            },
            ['3'] = {
                name = 'Special Agent',
                payment = 650
            },
            ['4'] = {
                name = 'Director',
                isboss = true,
                payment = 700
            },
        },
    },
    ['galaxy'] = {
        label = 'Galaxy nightclub',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 75
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['casino'] = {
        label = 'Diamond Casino',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['ap'] = {
        label = 'ap Mech',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['malle'] = {
        label = 'malle',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['taco'] = {
        label = 'Atm taco',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 300
            },
            ['1'] = {
                name = 'Worker',
                payment = 400
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 600
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 700
            },
        },
    },
    ['tox'] = {
        label = 'Tox',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 300
            },
            ['1'] = {
                name = 'Worker',
                payment = 400
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 600
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 700
            },
        },
    },
    ['pawnstore'] = {
        label = 'Pawn Store',
        defaultDuty = true,
        grades = {
                ['0'] = {
                    name = 'Employee',
                    payment = 300
                },
                ['1'] = {
                    name = 'Manager',
                    isboss = true,
                    payment = 400
                },
            },
      },

    ["gotur"] = {
        label = "gotur",
        defaultDuty = true,
        grades = {
            ['0'] = {
                    name = "Messenger",
                    payment = 300
                },
        ['1'] = {
                    name = "Manager",
            isboss = true,
                    payment = 400
                },
            },
    },

    ['oilwell'] = {
        label = 'Oil Company',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 75
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },

    ['tuner'] = {
        label = 'Tuner',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 300
            },
            ['1'] = {
                name = 'Worker',
                payment = 400
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 600
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 700
            },
        },
    },

    ['catcafe'] = {
        label = 'UwU Cafe',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 300
            },
            ['1'] = {
                name = 'Worker',
                payment = 400
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 600
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 700
            },
        },
    },
    
    ['pizza'] = {
        label = 'Pizzaria',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 300
            },
            ['1'] = {
                name = 'Worker',
                payment = 400
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 600
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 700
            },
        },
    },
    
    ['beanmachine'] = {
        label = 'Bean Machine',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 300
            },
            ['1'] = {
                name = 'Worker',
                payment = 400
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 600
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 700
            },
        },
    },
    
    ['vu'] = {
        label = 'Strip Club',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 300
            },
            ['1'] = {
                name = 'Worker',
                payment = 400
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 600
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 700
            },
        },
    },
    
    ['henhouse'] = {
        label = 'Hen House',
		defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Worker',
                payment = 100
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 150
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },
    ['gruppesechs'] = {
        label = 'Gruppe 6',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Collector',
                payment = 50
            },
        },
    },
	['police'] = {
		label = 'Law Enforcement',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 300
            },
			['1'] = {
                name = 'Officer',
                payment = 400
            },
			['2'] = {
                name = 'Sergeant',
                payment = 500
            },
			['3'] = {
                name = 'Bestyrelsen',
                payment = 600
            },
			['4'] = {
                name = 'Ledelse',
				isboss = true,
                payment = 700
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
                payment = 500
            },
			['1'] = {
                name = 'Paramedic',
                payment = 550
            },
			['2'] = {
                name = 'Doctor',
                payment = 650
            },
			['3'] = {
                name = 'Surgeon',
                payment = 700
            },
			['4'] = {
                name = 'Chief',
				isboss = true,
                payment = 750
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
                payment = 300
            },
			['1'] = {
                name = 'House Sales',
                payment = 450
            },
			['2'] = {
                name = 'Business Sales',
                payment = 500
            },
			['3'] = {
                name = 'Broker',
                payment = 550
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 600
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
                payment = 300
            },
            ['1'] = {
                name = 'Worker',
                payment = 400
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 600
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 700
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
                payment = 150
            },
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 300
            },
            ['1'] = {
                name = 'Worker',
                payment = 400
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 600
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 700
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
                payment = 1500
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
                payment = 1500
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
                payment = 600
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
                payment = 600
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
                payment = 50
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
                payment = 500
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
                payment = 500
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
                payment = 400
            },
        },
	},
}