Config = Config or {}

Config.ActivePaymentsStrip = {}

Config.InsideUnicorn = false

Config.CurrentEffect = {}

Config.Location = {['StripClub'] = {['X'] = 119.12, ['Y'] = -1289.86, ['Z'] = 28.26}}

Config.EffectsMenu = {
    [1] = {['Name'] = 'Firework',           ['Desc'] = 'Turn on the fireworks effect.',         ['Dict'] = 'proj_xmas_firework',  ['Effect'] = 'scr_firework_xmas_ring_burst_rgw',  ['Event'] = 'dream-stripclub:server:set:effect'},
    [2] = {['Name'] = 'Star Fountain',      ['Desc'] = 'Turn on the star fountain effect.',     ['Dict'] = 'scr_indep_fireworks', ['Effect'] = 'scr_indep_firework_fountain',       ['Event'] = 'dream-stripclub:server:set:effect'},
    [3] = {['Name'] = 'Water Fountain',     ['Desc'] = 'Turn on the water fountain effect.',    ['Dict'] = 'scr_carwash',         ['Effect'] = 'ent_amb_car_wash_jet',              ['Event'] = 'dream-stripclub:server:set:effect'},
    [4] = {['Name'] = 'Fire Fountain',      ['Desc'] = 'Turn on the fire fountain effect.',     ['Dict'] = 'core',                ['Effect'] = 'ent_amb_fbi_fire_beam',             ['Event'] = 'dream-stripclub:server:set:effect'},
}


Config.Effects = {
    ['scr_indep_firework_fountain'] = {
        [1] = {['Coords'] = {['X'] = 109.59, ['Y'] = -1290.86, ['Z'] = 28.41}},
        [2] = {['Coords'] = {['X'] = 107.85, ['Y'] = -1287.83, ['Z'] = 28.41}},
        [3] = {['Coords'] = {['X'] = 101.44, ['Y'] = -1288.69, ['Z'] = 28.41}},
        [4] = {['Coords'] = {['X'] = 105.62, ['Y'] = -1295.97, ['Z'] = 28.41}},
    },
    ['ent_amb_car_wash_jet'] = {
        [1] = {['Coords'] = {['X'] = 109.59, ['Y'] = -1290.86, ['Z'] = 28.41}},
        [2] = {['Coords'] = {['X'] = 107.85, ['Y'] = -1287.83, ['Z'] = 28.41}},
        [3] = {['Coords'] = {['X'] = 101.44, ['Y'] = -1288.69, ['Z'] = 28.41}},
        [4] = {['Coords'] = {['X'] = 105.62, ['Y'] = -1295.97, ['Z'] = 28.41}},
    },
    ['ent_amb_fbi_fire_beam'] = {
        [1] = {['Coords'] = {['X'] = 109.59, ['Y'] = -1290.86, ['Z'] = 28.71}},
        [2] = {['Coords'] = {['X'] = 107.85, ['Y'] = -1287.83, ['Z'] = 28.71}},
        [3] = {['Coords'] = {['X'] = 101.44, ['Y'] = -1288.69, ['Z'] = 28.71}},
        [4] = {['Coords'] = {['X'] = 105.62, ['Y'] = -1295.97, ['Z'] = 28.71}},
    },
    ['scr_firework_xmas_ring_burst_rgw'] = {
        [1] = {['Coords'] = {['X'] = 104.65, ['Y'] = -1291.79, ['Z'] = 27.41}},
    },
}

Config.Locations = {
	['shop'] = { ['x'] = 129.76, ['y'] = -1281.82, ['z'] = 29.26, ['h'] = 295.61 },
	['vip'] = { ['x'] = 118.81668 , ['y'] = -1302.461, ['z'] = 29.269309, ['h'] = 211.85334 },
	['stripper'] = { ['x'] = 108.55, ['y'] = -1305.98, ['z'] = 28.76, ['h'] = 212.00  },
	['boss'] = { ['x'] = 95.15, ['y'] = -1293.38, ['z'] = 29.26, ['h'] = 290.99  },
}


Config.UnicornProps = {
    [1] = {
        ['Visible'] = true,
        ['Prop'] = 'prop_cs_silver_tray',
        ['Coords'] = {
            ['X'] = 129.08, 
            ['Y'] = -1285.53, 
            ['Z'] = 29.32
        },
    },
}

Config.Items = {
    label = "Vanilla Unicorn",
    slots = 3,
    items = {
        [1] = {
            name = "mojito",
            price = 10,
            amount = 125,
            info = {},
            type = "item",
            slot = 1,
		},
        [2] = {
            name = "whiskey",
            price = 11,
            amount = 125,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "tequila",
            price = 15,
            amount = 125,
            info = {},
            type = "item",
            slot = 3,
        },
    }
}

Config.Poles = {
    [1] = {
        ['X'] = 108.81,
        ['Y'] = -1288.98,
        ['Z'] = 29.43,
    },
    [2] = {
        ['X'] = 104.80,
        ['Y'] = -1294.19,
        ['Z'] = 29.24,
    },
    [3] = {
        ['X'] = 102.25,
        ['Y'] = -1289.82,
        ['Z'] = 29.24,
    },
}

Config.Dances = {
    [1] = {
        ['Anim'] = 'pd_dance_01',
        ['Dict'] = 'mini@strip_club@pole_dance@pole_dance1',
    },
    [2] = {
        ['Anim'] = 'pd_dance_02',
        ['Dict'] = 'mini@strip_club@pole_dance@pole_dance2',
    },
    [3] = {
        ['Anim'] = 'pd_dance_03',
        ['Dict'] = 'mini@strip_club@pole_dance@pole_dance3',
    },
}

Config.DrankItems = {
    [1] = 'lemon',
    [2] = 'ice',
    [3] = 'vodka',
  }

Config.ItemsCigarettes = {
    label = "Cigarette Machine",
    slots = 2,
    items = {
        [1] = {
            name = "cigarettes",
            price = 5,
            amount = 85,
            info = {},
            type = "item",
            slot = 1,
		},
        [2] = {
            name = "condom",
            price = 11,
            amount = 45,
            info = {},
            type = "item",
            slot = 2,
        },
    }
}


Config.BossItems = {
    label = "Vanilla Unicorn VIP",
    slots = 1,
    items = {
        [1] = {
            name = "mojito",
            price = 6,
            amount = 125,
            info = {},
            type = "item",
            slot = 1,
        },
    }
}