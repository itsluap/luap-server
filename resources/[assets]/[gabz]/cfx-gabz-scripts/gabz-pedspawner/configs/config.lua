Config = {}

--██╗███╗   ███╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ███╗   ██╗████████╗
--██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗████╗  ██║╚══██╔══╝
--██║██╔████╔██║██████╔╝██║   ██║██████╔╝   ██║   ███████║██╔██╗ ██║   ██║   
--██║██║╚██╔╝██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║╚██╗██║   ██║   
--██║██║ ╚═╝ ██║██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║ ╚████║   ██║   
--╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝


Config.DebugPrints = false --To enable debug prints.


--  ██████╗ ██████╗  ██████╗ ██████╗ ██████╗ ███████╗
-- ██╔════╝██╔═══██╗██╔═══██╗██╔══██╗██╔══██╗██╔════╝
-- ██║     ██║   ██║██║   ██║██████╔╝██║  ██║███████╗
-- ██║     ██║   ██║██║   ██║██╔══██╗██║  ██║╚════██║
-- ╚██████╗╚██████╔╝╚██████╔╝██║  ██║██████╔╝███████║
--  ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝


-- PED models can be located at [https://wiki.rage.mp/index.php?title=Peds], use the modal name.
-- TASK SCENARIO's and Anims + Dicts can be found at [https://alexguirre.github.io/animations-list], alternatively if you use an animations resource e.g. dpemotes, you can grab the names of anims from here
-- DO NOT change the resourceName of each map
Config.Locations = {
    ["mrpd"] = {
        resourceName = "cfx-gabz-mrpd",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(420.49, -975.24, 30.0),
        PedCoords = {
            [1] = {coords = vector4(433.90, -984.28, 30.71, 71.31), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [2] = {coords = vector4(442.77, -981.91, 30.69, 88.60), model = "s_f_y_cop_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [3] = {coords = vector4(458.00, -983.69, 30.68, 89.06), model = "s_m_y_cop_01", dict = "anim@amb@nightclub@peds@", anim = "rcmme_amanda1_stand_loop_cop"},
            [4] = {coords = vector4(483.95, -995.29, 30.68, 179.83), model = "s_m_y_swat_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [5] = {coords = vector4(455.25, -987.61, 34.97, 281.32), model = "ig_fbisuit_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [6] = {coords = vector4(448.01, -974.17, 33.97, 0.17), model = "s_m_y_cop_01", scenario = "PROP_HUMAN_ATM"},
            [7] = {coords = vector4(441.01, -989.57, 34.97, 315.51), model = "s_m_y_cop_01", dict = "misscarsteal4@actor", anim = "actor_berating_loop"},
            [8] = {coords = vector4(488.05, -1009.93, 26.27, 91.86), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [9] = {coords = vector4(413.22, -1024.70, 29.50, 215.83), model = "s_m_y_cop_01", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle"},
        }
    },
    ["barber1"] = {
        resourceName = "cfx-gabz-barber",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(130.20, -1714.81, 29.22),
        PedCoords = {
            [1] = {coords = vector4(130.91, -1711.88, 29.28, 140.37), model = "ig_car3guy1", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(133.58, -1714.68, 29.28, 132.06), model = "s_m_o_busker_01", scenario = "WORLD_HUMAN_MUSICIAN"},
            [3] = {coords = vector4(138.53, -1704.51, 29.29, 140.55), model = "a_m_y_stbla_02", dict = "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", anim = "idle_a"},
        }
    },
    ["barber2"] = {
        resourceName = "cfx-gabz-barber",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-1291.081, -1116.42, 6.633),
        PedCoords = {
            [1] = {coords = vector4(-1290.53, -1114.37, 6.70, 93.97), model = "ig_car3guy1", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(-1291.36, -1119.27, 6.55, 99.21), model = "s_m_o_busker_01", scenario = "WORLD_HUMAN_MUSICIAN"},
            [3] = {coords = vector4(-1279.11, -1119.53, 6.99, 12.58), model = "a_m_y_stbla_02", dict = "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", anim = "idle_a"},
        }
    },
    ["barber3"] = {
        resourceName = "cfx-gabz-barber",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1935.83, 3721.41, 32.86),
        PedCoords = {
            [1] = {coords = vector4(1932.91, 3724.30, 32.79, 242.79), model = "ig_car3guy1", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(1937.45, 3723.68, 32.86, 215.67), model = "s_m_o_busker_01", scenario = "WORLD_HUMAN_MUSICIAN"},
            [3] = {coords = vector4(1933.40, 3729.22, 32.84, 31.83), model = "a_m_y_stbla_02", dict = "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", anim = "idle_a"},
        }
    },
    ["barber4"] = {
        resourceName = "cfx-gabz-barber",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1202.6, -469.6, 66.24),
        PedCoords = {
            [1] = {coords = vector4(1205.52, -469.18, 66.27, 166.09), model = "ig_car3guy1", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(1205.18, -472.57, 66.16, 109.1), model = "s_m_o_busker_01", scenario = "WORLD_HUMAN_MUSICIAN"},
            [3] = {coords = vector4(1209.00, -473.76, 66.20, 76.21), model = "a_m_y_stbla_02", dict = "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", anim = "idle_a"},
        }
    },
    ["barber5"] = {
        resourceName = "cfx-gabz-barber",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-29.314, -144.949, 57.014),
        PedCoords = {
            [1] = {coords = vector4(-31.25, -146.02, 57.03, 309.50), model = "ig_car3guy1", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(-32.12, -145.1, 57.08, 348.34), model = "s_m_o_busker_01", scenario = "WORLD_HUMAN_MUSICIAN"},
            [3] = {coords = vector4(-31.07, -151.39, 57.07, 71.43), model = "a_m_y_stbla_02", dict = "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", anim = "idle_a"},
        }
    },
    ["barber6"] = {
        resourceName = "cfx-gabz-barber",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-284.46, 6235.14, 31.4703),
        PedCoords = {
            [1] = {coords = vector4(-281.37, 6234.94, 31.48, 109.82), model = "ig_car3guy1", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(-284.59, 6231.72, 31.49, 28.93), model = "s_m_o_busker_01", scenario = "WORLD_HUMAN_MUSICIAN"},
            [3] = {coords = vector4(-276.75, 6228.39, 31.69, 136.70), model = "a_m_y_stbla_02", dict = "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", anim = "idle_a"},
        }
    },
    ["ammunation1"] = {
        resourceName = "cfx-gabz-ammunation",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(10.90, -1105.65, 28.79),
        PedCoords = {
            [1] = {coords = vector4(9.37, -1110.34, 29.79, 341.39), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(9.48, -1106.87, 29.79, 248.76), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [3] = {coords = vector4(18.36, -1100.40, 29.79, 69.004), model = "csb_mweather", scenario = "WORLD_HUMAN_CLIPBOARD"},
        }
    },
    ["ammunation2"] = {
        resourceName = "cfx-gabz-ammunation",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(821.144, -2154.89, 28.61),
        PedCoords = {
            [1] = {coords = vector4(817.76, -2152.80, 29.61, 359.06), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(823.18, -2150.49, 29.61, 181.18), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [3] = {coords = vector4(826.90, -2162.26, 29.61, 89.41), model = "csb_mweather", scenario = "WORLD_HUMAN_CLIPBOARD"},
        }
    },
    ["ammunation3"] = {
        resourceName = "cfx-gabz-ammunation",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-3167.29, 1084.71, 19.83),
        PedCoords = {
            [1] = {coords = vector4(-3164.48, 1086.34, 20.83, 155.25), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(-3174.50, 1087.82, 20.83, 248.41), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
        }
    },
    ["ammunation4"] = {
        resourceName = "cfx-gabz-ammunation",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-663.17, -940.75, 20.82),
        PedCoords = {
            [1] = {coords = vector4(-665.31, -939.51, 21.82, 269.77), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(-663.87, -930.28, 21.82, 176.47), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
        }
    },
    ["ammunation5"] = {
        resourceName = "cfx-gabz-ammunation",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(843.29, -1028.10, 27.19),
        PedCoords = {
            [1] = {coords = vector4(845.98, -1026.66, 28.19, 91.70), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(846.01, -1031.06, 28.19, 91.93), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
        }
    },
    ["ammunation6"] = {
        resourceName = "cfx-gabz-ammunation",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(2568.83, 299.78, 107.73),
        PedCoords = {
            [1] = {coords = vector4(2565.83, 293.90, 108.73, 271.39), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(2571.02, 294.66, 108.73, 91.69), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
        }
    },
    ["ammunation7"] = {
        resourceName = "cfx-gabz-ammunation",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-1310.87, -392.0, 35.69),
        PedCoords = {
            [1] = {coords = vector4(-1313.08, -393.56, 36.69, 344.54), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(-1311.66, -389.05, 36.69, 165.83), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
        }
    },
    ["ammunation8"] = {
        resourceName = "cfx-gabz-ammunation",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1696.95, 3755.44, 33.70),
        PedCoords = {
            [1] = {coords = vector4(1693.64, 3762.00, 34.70, 138.33), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(1692.49, 3755.40, 34.70, 279.58), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
        }
    },
    ["ammunation9"] = {
        resourceName = "cfx-gabz-ammunation",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-327.17, 6079.25, 30.45),
        PedCoords = {
            [1] = {coords = vector4(-328.92, 6077.41, 31.45, 314.86), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(-330.94, 6079.47, 31.45, 317.08), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
        }
    },
    ["ammunation10"] = {
        resourceName = "cfx-gabz-ammunation",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(247.37, -47.24, 68.94),
        PedCoords = {
            [1] = {coords = vector4(251.86, -50.42, 69.94, 30.92), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(249.98, -46.22, 69.94, 162.89), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
        }
    },
    ["ammunation11"] = {
        resourceName = "cfx-gabz-ammunation",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-1114.84, 2693.81, 17.55),
        PedCoords = {
            [1] = {coords = vector4(-1115.37, 2697.86, 18.55, 133.31), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(-1119.75, 2696.28, 18.55, 312.88), model = "s_m_m_security_01", scenario = "WORLD_HUMAN_COP_IDLES"},
        }
    },
    ["247x1"] = {
        resourceName = "cfx-gabz-247",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1960.68, 3744.54, 31.34),
        PedCoords = {
            [1] = {coords = vector4(1966.45, 3746.34, 31.34, 301.06), model = "a_m_y_beachvesp_02", scenario = "PROP_HUMAN_ATM"},
            [2] = {coords = vector4(1960.69, 3739.71, 32.34, 303.31), model = "a_m_y_beachvesp_01", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle"},
            [3] = {coords = vector4(1957.85, 3743.49, 31.34, 120.66), model = "a_m_m_bevhills_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["247x2"] = {
        resourceName = "cfx-gabz-247",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1731.95, 6417.24, 34.03),
        PedCoords = {
            [1] = {coords = vector4(1736.79, 6413.43, 34.03, 243.54), model = "a_m_y_beachvesp_02", scenario = "PROP_HUMAN_ATM"},
            [2] = {coords = vector4(1727.81, 6414.66, 35.037, 245.18), model = "a_m_y_beachvesp_01", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle"},
            [3] = {coords = vector4(1733.44, 6414.80, 35.03, 61.48), model = "a_m_m_bevhills_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["247x3"] = {
        resourceName = "cfx-gabz-247",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(2553.69, 383.73, 107.62),
        PedCoords = {
            [1] = {coords = vector4(2555.29, 389.68, 107.62, 359.10), model = "a_m_y_beachvesp_02", scenario = "PROP_HUMAN_ATM"},
            [2] = {coords = vector4(2557.75, 381.05, 108.62, 359.69), model = "a_m_y_beachvesp_01", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle"},
            [3] = {coords = vector4(2552.46, 386.75, 108.62, 85.51), model = "a_m_m_bevhills_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["247x4"] = {
        resourceName = "cfx-gabz-247",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(165.05, 6642.21, 30.69),
        PedCoords = {
            [1] = {coords = vector4(168.34, 6636.99, 30.69, 227.18), model = "a_m_y_beachvesp_02", scenario = "PROP_HUMAN_ATM"},
            [2] = {coords = vector4(160.39, 6640.97, 31.69, 225.28), model = "a_m_y_beachvesp_01", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle"},
            [3] = {coords = vector4(164.48, 6640.36, 31.69, 220.03), model = "a_m_m_bevhills_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["247x5"] = {
        resourceName = "cfx-gabz-247",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(2676.21, 3283.60, 54.24),
        PedCoords = {
            [1] = {coords = vector4(2680.30, 3288.14, 54.24, 334.21), model = "a_m_y_beachvesp_02", scenario = "PROP_HUMAN_ATM"},
            [2] = {coords = vector4(2678.70, 3279.51, 55.24, 332.78), model = "a_m_y_beachvesp_01", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle"},
            [3] = {coords = vector4(2675.12, 3283.06, 55.24, 61.99), model = "a_m_m_bevhills_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["247x6"] = {
        resourceName = "cfx-gabz-247",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-3043.27, 586.07, 6.908),
        PedCoords = {
            [1] = {coords = vector4(-3043.94, 592.29, 6.90, 19.80), model = "a_m_y_beachvesp_02", scenario = "PROP_HUMAN_ATM"},
            [2] = {coords = vector4(-3038.55, 585.05, 7.90, 18.45), model = "a_m_y_beachvesp_01", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle"},
            [3] = {coords = vector4(-3042.33, 592.96, 7.90, 18.01), model = "a_m_m_bevhills_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["247x7"] = {
        resourceName = "cfx-gabz-247",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-3245.64, 1003.06, 11.83),
        PedCoords = {
            [1] = {coords = vector4(-3243.82, 1008.92, 11.83, 354.01), model = "a_m_y_beachvesp_02", scenario = "PROP_HUMAN_ATM"},
            [2] = {coords = vector4(-3241.73, 1000.26, 12.83, 353.75), model = "a_m_y_beachvesp_01", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle"},
            [3] = {coords = vector4(-3246.01, 1000.51, 12.83, 173.94), model = "a_m_m_bevhills_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["247x8"] = {
        resourceName = "cfx-gabz-247",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(376.13, 329.26, 102.56),
        PedCoords = {
            [1] = {coords = vector4(381.53, 326.53, 102.56, 255.13), model = "a_m_y_beachvesp_02", scenario = "PROP_HUMAN_ATM"},
            [2] = {coords = vector4(372.79, 325.78, 103.56, 258.60), model = "a_m_y_beachvesp_01", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle"},
            [3] = {coords = vector4(378.81, 327.48, 103.56, 255.29), model = "a_m_m_bevhills_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["247x9"] = {
        resourceName = "cfx-gabz-247",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(27.248, -1343.6, 28.49),
        PedCoords = {
            [1] = {coords = vector4(33.31, -1345.00, 28.49, 270.45), model = "a_m_y_beachvesp_02", scenario = "PROP_HUMAN_ATM"},
            [2] = {coords = vector4(24.85, -1347.86, 29.49, 270.51), model = "a_m_y_beachvesp_01", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle"},
            [3] = {coords = vector4(26.19, -1347.80, 29.49, 88.95), model = "a_m_m_bevhills_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["binco1"] = {
        resourceName = "cfx-gabz-binco",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1693.45, 4823.67, 40.88),
        PedCoords = {
            [1] = {coords = vector4(1690.20, 4818.03, 42.06, 8.14), model = "ig_drfriedlander", dict = "anim@amb@nightclub@lazlow@ig1_vip@", anim = "clubvip_base_laz"},
            [2] = {coords = vector4(1690.74, 4828.90, 42.06, 187.26), model = "s_m_m_hairdress_01", dict = "timetable@tracy@ig_8@base", anim = "base"},
        }
    },
    ["binco2"] = {
        resourceName = "cfx-gabz-binco",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(5.26, 6513.2, 30.69),
        PedCoords = {
            [1] = {coords = vector4(1.20, 6510.13, 31.88, 312.72), model = "ig_drfriedlander", dict = "anim@amb@nightclub@lazlow@ig1_vip@", anim = "clubvip_base_laz"},
            [2] = {coords = vector4(4.84, 6510.05, 31.88, 41.41), model = "s_m_m_hairdress_01", dict = "timetable@tracy@ig_8@base", anim = "base"},
        }
    },
    ["binco3"] = {
        resourceName = "cfx-gabz-binco",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-1101.9, 2709.7, 17.92),
        PedCoords = {
            [1] = {coords = vector4(-1094.90, 2709.58, 19.11, 132.01), model = "ig_drfriedlander", dict = "anim@amb@nightclub@lazlow@ig1_vip@", anim = "clubvip_base_laz"},
            [2] = {coords = vector4(-1100.28, 2703.88, 19.11, 44.29), model = "s_m_m_hairdress_01", dict = "timetable@tracy@ig_8@base", anim = "base"},
        }
    },
    ["binco4"] = {
        resourceName = "cfx-gabz-binco",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1195.75, 2709.89, 37.04),
        PedCoords = {
            [1] = {coords = vector4(1200.04, 2710.49, 38.22, 179.42), model = "ig_drfriedlander", dict = "anim@amb@nightclub@lazlow@ig1_vip@", anim = "clubvip_base_laz"},
            [2] = {coords = vector4(1195.98, 2706.91, 38.22, 180.78), model = "s_m_m_hairdress_01", dict = "timetable@tracy@ig_8@base", anim = "base"},
        }
    },
    ["binco5"] = {
        resourceName = "cfx-gabz-binco",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(425.24, -805.33, 28.31),
        PedCoords = {
            [1] = {coords = vector4(420.75, -810.40, 29.49, 1.27), model = "ig_drfriedlander", dict = "anim@amb@nightclub@lazlow@ig1_vip@", anim = "clubvip_base_laz"},
            [2] = {coords = vector4(425.46, -805.34, 29.49, 268.70), model = "s_m_m_hairdress_01", dict = "timetable@tracy@ig_8@base", anim = "base"},
        }
    },
    ["binco6"] = {
        resourceName = "cfx-gabz-binco",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-823.02, -1074.29, 10.14),
        PedCoords = {
            [1] = {coords = vector4(-817.86, -1072.95, 11.33, 120.14), model = "ig_drfriedlander", dict = "anim@amb@nightclub@lazlow@ig1_vip@", anim = "clubvip_base_laz"},
            [2] = {coords = vector4(-825.11, -1075.86, 11.33, 210.94), model = "s_m_m_hairdress_01", dict = "timetable@tracy@ig_8@base", anim = "base"},
        }
    },
    ["binco7"] = {
        resourceName = "cfx-gabz-binco",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(75.70, -1393.81, 28.19),
        PedCoords = {
            [1] = {coords = vector4(78.32, -1388.67, 29.37, 180.04), model = "ig_drfriedlander", dict = "anim@amb@nightclub@lazlow@ig1_vip@", anim = "clubvip_base_laz"},
            [2] = {coords = vector4(81.17, -1394.41, 29.37, 93.02), model = "s_m_m_hairdress_01", dict = "timetable@tracy@ig_8@base", anim = "base"},
        }
    },
    ["tattoo1"] = {
        resourceName = "cfx-gabz-tattoo",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-287.43, 6201.58, 31.45),
        PedCoords = {
            [1] = {coords = vector4(-292.65, 6196.62, 31.49, 293.35), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_STAND_MOBILE"},
            [2] = {coords = vector4(-296.88, 6196.79, 31.49, 311.52), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_LEANING"},
        }
    },
    ["tattoo2"] = {
        resourceName = "cfx-gabz-tattoo",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1856.848, 3747.04, 33.10),
        PedCoords = {
            [1] = {coords = vector4(1863.76, 3751.54, 33.03, 92.58), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_STAND_MOBILE"},
            [2] = {coords = vector4(1867.92, 3750.1, 33.03, 124.99), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_LEANING"},
        }
    },
    ["tattoo3"] = {
        resourceName = "cfx-gabz-tattoo",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-3165.63, 1073.301, 20.83),
        PedCoords = {
            [1] = {coords = vector4(-3172.79, 1073.76, 20.83, 222.01), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_STAND_MOBILE"},
            [2] = {coords = vector4(-3173.99, 1078.13, 20.83, 248.8), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_LEANING"},
        }
    },
    ["tattoo4"] = {
        resourceName = "cfx-gabz-tattoo",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(319.8, 175.1, 103.9),
        PedCoords = {
            [1] = {coords = vector4(320.6, 183.2, 103.59, 115.98), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_STAND_MOBILE"},
            [2] = {coords = vector4(324.6, 184.94, 103.59, 165.88), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_LEANING"},
        }
    },
    ["tattoo5"] = {
        resourceName = "cfx-gabz-tattoo",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-1157.709, -1418.70, 4.62),
        PedCoords = {
            [1] = {coords = vector4(-1150.95, -1425.83, 4.96, 359.94), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_STAND_MOBILE"},
            [2] = {coords = vector4(-1151.74, -1430.01, 4.96, 37.3), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_LEANING"},
        }
    },
    ["tattoo6"] = {
        resourceName = "cfx-gabz-tattoo",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1320.69, -1648.813, 52.14),
        PedCoords = {
            [1] = {coords = vector4(1325.94, -1652.08, 52.28, 356.58), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_STAND_MOBILE"},
            [2] = {coords = vector4(1325.45, -1656.28, 52.28, 36.41), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_LEANING"},
        }
    },
    ["ponsonbys1"] = {
        resourceName = "cfx-gabz-ponsonbys",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-165.24, -304.39, 38.07),
        PedCoords = {
            [1] = {coords = vector4(-171.52, -305.44, 38.73, 72.73), model = "a_m_y_hasjew_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [2] = {coords = vector4(-166.96, -301.48, 38.73, 246.0), model = "u_m_o_finguru_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [3] = {coords = vector4(-163.05, -300.77, 38.74, 331.44), model = "a_m_m_hasjew_01", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
            [4] = {coords = vector4(-157.77, -303.16, 39.73, 159.89), model = "u_m_m_jewelsec_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
        }
    },
    ["ponsonbys2"] = {
        resourceName = "cfx-gabz-ponsonbys",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-1448.10, -236.84, 48.15),
        PedCoords = {
            [1] = {coords = vector4(-1442.5, -238.35, 48.82, 264.64), model = "a_m_y_hasjew_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [2] = {coords = vector4(-1447.21, -239.93, 48.82, 57.19), model = "u_m_o_finguru_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [3] = {coords = vector4(-1451.9, -238.97, 48.81, 150.99), model = "a_m_m_hasjew_01", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
            [4] = {coords = vector4(-1455.46, -235.55, 49.80, 316.53), model = "u_m_m_jewelsec_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
        }
    },
    ["ponsonbys3"] = {
        resourceName = "cfx-gabz-ponsonbys",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-709.81, -150.62, 35.75),
        PedCoords = {
            [1] = {coords = vector4(-706.51, -145.68, 36.42, 301.83), model = "a_m_y_hasjew_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [2] = {coords = vector4(-706.73, -150.8, 36.42, 122.78), model = "u_m_o_finguru_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [3] = {coords = vector4(-708.67, -154.86, 36.42, 196.98), model = "a_m_m_hasjew_01", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
            [4] = {coords = vector4(-713.46, -157.25, 37.41, 26.11), model = "u_m_m_jewelsec_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
        }
    },
    ["suburban1"] = {
        resourceName = "cfx-gabz-suburban",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(124.97, -217.62, 55.81),
        PedCoords = {
            [1] = {coords = vector4(118.17, -222.66, 54.56, 65.14), model = "ig_jimmyboston", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [2] = {coords = vector4(122.63, -222.05, 54.56, 353.83), model = "ig_joeminuteman", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [3] = {coords = vector4(122.96, -212.06, 54.56, 246.14), model = "ig_josh", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [4] = {coords = vector4(125.33, -205.85, 54.59, 172.14), model = "ig_janet", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
        }
    },
    ["suburban2"] = {
        resourceName = "cfx-gabz-suburban",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(617.47, 2757.48, 43.34),
        PedCoords = {
            [1] = {coords = vector4(621.47, 2765.05, 42.09, 272.43), model = "ig_jimmyboston", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [2] = {coords = vector4(617.55, 2762.77, 42.09, 198.85), model = "ig_joeminuteman", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [3] = {coords = vector4(621.6, 2753.33, 42.09, 88.19), model = "ig_josh", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [4] = {coords = vector4(621.86, 2746.3, 42.02, 350.94), model = "ig_janet", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
        }
    },
    ["suburban3"] = {
        resourceName = "cfx-gabz-suburban",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-1195.86, -773.57, 18.58),
        PedCoords = {
            [1] = {coords = vector4(-1187.62, -773.14, 17.33, 218.38), model = "ig_jimmyboston", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [2] = {coords = vector4(-1191.55, -770.76, 17.32, 143.27), model = "ig_joeminuteman", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [3] = {coords = vector4(-1197.04, -779.12, 17.33, 40.31), model = "ig_josh", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [4] = {coords = vector4(-1202.72, -783.16, 17.33, 285.74), model = "ig_janet", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
        }
    },
    ["suburban4"] = {
        resourceName = "cfx-gabz-suburban",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-3170.96, 1049.93, 22.12),
        PedCoords = {
            [1] = {coords = vector4(-3177.64, 1045.13, 20.86, 71.07), model = "ig_jimmyboston", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [2] = {coords = vector4(-3173.47, 1045.4, 20.86, 42.16), model = "ig_joeminuteman", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [3] = {coords = vector4(-3172.78, 1055.57, 20.86, 243.27), model = "ig_josh", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [4] = {coords = vector4(-3169.36, 1062.02, 20.85, 138.25), model = "ig_janet", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
        }
    },
    ["paletobank"] = {
        resourceName = "cfx-gabz-paletobank",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-109.299, 6464.035, 31.627),
        PedCoords = {
            [1] = {coords = vector4(-107.0, 6474.54, 31.63, 225.52), model = "cs_debra", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [2] = {coords = vector4(-103.37, 6459.92, 30.63, 54.46), model = "a_m_m_farmer_01", scenario = "CODE_HUMAN_CROSS_ROAD_WAIT"},
            [3] = {coords = vector4(-99.62, 6469.7, 31.63, 227.42), model = "s_m_y_construct_01", scenario = "WORLD_HUMAN_MAID_CLEAN"},
            [4] = {coords = vector4(-106.37, 6468.14, 31.64, 35.71), model = "s_m_m_fiboffice_01", scenario = "CODE_HUMAN_CROSS_ROAD_WAIT"},
            [5] = {coords = vector4(-108.10, 6462.44, 31.38, 29.22), model = "u_m_m_jewelsec_01", scenario = "CODE_HUMAN_CROSS_ROAD_WAIT"},
        }
    },
    ["pacificbank"] = {
        resourceName = "cfx-gabz-pacificbank",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(223.313, 208.295, 105.521),
        PedCoords = {
            [1] = {coords = vector4(262.14, 226.38, 106.28, 151.31), model = "s_f_y_airhostess_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [2] = {coords = vector4(266.83, 224.68, 106.28, 151.16), model = "ig_bankman", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [3] = {coords = vector4(257.36, 228.15, 106.28, 156.9), model = "s_f_y_airhostess_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [4] = {coords = vector4(241.99, 222.85, 106.28, 255.84), model = "a_f_m_bevhills_01", scenario = "PROP_HUMAN_ATM"},
        }
    },
    ["bobcat"] = {
        resourceName = "cfx-gabz-bobcat",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(919.2, -2122.193, 30.49),
        PedCoords = {
            [1] = {coords = vector4(915.17, -2123.99, 30.23, 266.82), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(915.55, -2120.08, 30.23, 260.06), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [3] = {coords = vector4(908.48, -2116.07, 31.23, 272.66), model = "s_f_y_cop_01", scenario = "WORLD_HUMAN_COP_IDLES"},
        }
    },
    ["townhall"] = {
        resourceName = "cfx-gabz-townhall",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-541.01, -210.01, 37.01),
        PedCoords = {
            [1] = {coords = vector4(-554.53, -199.45, 38.22, 299.53), model = "ig_fbisuit_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [2] = {coords = vector4(-556.31, -196.45, 38.22, 300.27), model = "ig_fbisuit_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [3] = {coords = vector4(-542.50, -203.92, 38.21, 205.43), model = "ig_fbisuit_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [4] = {coords = vector4(-546.67, -206.37, 38.21, 222.26), model = "ig_fbisuit_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [5] = {coords = vector4(-544.46, -193.70, 38.22, 118.03), model = "ig_fbisuit_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [6] = {coords = vector4(-546.12, -190.65, 38.22, 136.58), model = "ig_fbisuit_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [7] = {coords = vector4(-535.95, -182.96, 38.22, 35.44), model = "ig_fbisuit_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [8] = {coords = vector4(-566.23, -204.14, 43.36, 119.58), model = "ig_fbisuit_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [9] = {coords = vector4(-576.76, -201.86, 43.36, 210.35), model = "ig_fbisuit_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [10] = {coords = vector4(-569.51, -214.49, 43.36, 30.73), model = "ig_fbisuit_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
        }
    },
    ["ottos"] = {
        resourceName = "cfx-gabz-ottos",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(793.01, -817.01, 27.01),
        PedCoords = {
            [1] = {coords = vector4(836.0, -811.73, 25.35, 267.69), model = "s_m_y_xmech_02_mp", scenario = "PROP_HUMAN_BUM_BIN"},
            [2] = {coords = vector4(836.37, -808.37, 25.35, 276.49), model = "mp_m_waremech_01", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
            [3] = {coords = vector4(822.1, -829.96, 25.33, 355.11), model = "s_m_y_xmech_02", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(823.41, -829.34, 25.33, 63.62), model = "s_m_y_xmech_01", scenario = "WORLD_HUMAN_SMOKING"},
            [5] = {coords = vector4(828.60, -803.62, 26.33, 0.86), model = "s_m_y_xmech_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [6] = {coords = vector4(832.84, -829.36, 26.33, 180.50), model = "mp_m_waremech_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["casino"] = {
        resourceName = "cfx-gabz-casino",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(918.01, 51.01, 80.01),
        PedCoords = {
            [1] = {coords = vector4(952.58, 21.65, 71.9, 0.65), model = "mp_m_g_vagfun_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [2] = {coords = vector4(931.99, 37.95, 80.1, 57.51), model = "ig_vagspeak", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [3] = {coords = vector4(935.44, 44.48, 80.1, 67.3), model = "ig_vagspeak", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [4] = {coords = vector4(990.87, 38.49, 71.06, 5.54), model = "ig_milton", scenario = "WORLD_HUMAN_PARTYING"},
            [5] = {coords = vector4(980.64, 28.84, 71.46, 164.88), model = "g_m_y_korlieut_01", scenario = "WORLD_HUMAN_PARTYING"},
            [6] = {coords = vector4(986.29, 41.36, 71.06, 284.93), model = "u_m_y_chip", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
            [7] = {coords = vector4(981.24, 42.61, 71.91, 109.23), model = "a_m_y_hasjew_01", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
            [8] = {coords = vector4(978.03, 24.1, 70.46, 83.35), model = "a_m_m_hasjew_01", scenario = "PROP_HUMAN_BUM_SHOPPING_CART"},
            [9] = {coords = vector4(980.54, 25.41, 71.46, 325.53), model = "ig_chengsr", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [10] = {coords = vector4(1016.72, 43.52, 69.86, 163.51), model = "u_m_m_bankman", scenario = "WORLD_HUMAN_SMOKING"},
            [11] = {coords = vector4(1016.81, 41.6, 69.86, 21.07), model = "a_f_y_bevhills_02", scenario = "WORLD_HUMAN_SMOKING"},
            [12] = {coords = vector4(1015.29, 42.01, 69.86, 308.43), model = "a_f_m_bevhills_02", scenario = "WORLD_HUMAN_SMOKING"},
            [13] = {coords = vector4(967.85, 46.92, 71.7, 151.46), model = "a_m_y_bevhills_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [14] = {coords = vector4(923.28, 47.2, 80.11, 81.62), model = "s_m_y_valet_01", scenario = "WORLD_HUMAN_CAR_PARK_ATTENDANT"},
            [15] = {coords = vector4(920.65, 40.68, 81.09, 113.62), model = "s_m_m_movprem_01", scenario = "WORLD_HUMAN_SMOKING"},
            [16] = {coords = vector4(920.09, 39.79, 81.09, 346.05), model = "u_f_o_moviestar", scenario = "WORLD_HUMAN_SMOKING"},
            [17] = {coords = vector4(1020.16, 47.61, 69.86, 85.38), model = "mp_m_boatstaff_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [18] = {coords = vector4(1024.20, 51.52, 69.86, 338.5), model = "u_m_y_chip", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [19] = {coords = vector4(1025.35, 49.41, 69.86, 201.4), model = "a_m_m_hasjew_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [20] = {coords = vector4(998.764, 41.77, 71.06, 214.5), model = "a_m_y_hasjew_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [21] = {coords = vector4(996.727, 43.28, 71.06, 38.67), model = "u_m_m_jewelthief", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [22] = {coords = vector4(982.413, 47.79, 71.06, 11.45), model = "g_m_y_korlieut_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [23] = {coords = vector4(990.478, 50.66, 71.06, 188.1), model = "ig_milton", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [24] = {coords = vector4(983.297, 26.25, 71.46, 116.3), model = "mp_g_m_pros_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["arcade"] = {
        resourceName = "cfx-gabz-arcade",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-1648.761, -1084.628, 13.156),
        PedCoords = {
            [1] = {coords = vector4(-1657.1, -1063.41, 11.16, 340.57), model = "a_f_m_salton_01", scenario = "WORLD_HUMAN_PARTYING"},
            [2] = {coords = vector4(-1654.5, -1064.37, 11.16, 330.25), model = "a_f_o_salton_01", scenario = "WORLD_HUMAN_PARTYING"},
            [3] = {coords = vector4(-1652.66, -1068.84, 11.16, 233.88), model = "a_m_m_salton_01", scenario = "WORLD_HUMAN_WINDOW_SHOP_BROWSE"},
            [4] = {coords = vector4(-1650.38, -1074.5, 11.16, 313.09), model = "u_m_y_paparazzi", scenario = "WORLD_HUMAN_WINDOW_SHOP_BROWSE"},
            [5] = {coords = vector4(-1659.81, -1073.74, 11.76, 139.68), model = "a_f_m_salton_01", scenario = "WORLD_HUMAN_SMOKING"},
            [6] = {coords = vector4(-1658.86, -1074.77, 11.76, 146.23), model = "a_f_o_salton_01", scenario = "WORLD_HUMAN_SMOKING"},
            [7] = {coords = vector4(-1662.46, -1067.27, 12.76, 138.62), model = "g_m_y_pologoon_01", scenario = "WORLD_HUMAN_PARTYING"},
            [8] = {coords = vector4(-1662.38, -1068.31, 12.76, 55.49), model = "ig_roccopelosi", scenario = "WORLD_HUMAN_PARTYING"},
        }
    },
    ["beanmachine"] = {
        resourceName = "cfx-gabz-beanmachine",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(116.16, -1022.99, 29.3),
        PedCoords = {
            [1] = {coords = vector4(121.46, -1041.06, 29.27, 70.39), model = "s_m_y_barman_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [2] = {coords = vector4(120.89, -1037.16, 29.27, 251.37), model = "ig_car3guy2", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [3] = {coords = vector4(114.56, -1033.69, 29.34, 153.51), model = "a_f_m_tourist_01", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(113.90, -1035.59, 29.33, 336.77), model = "a_f_y_tourist_01", scenario = "WORLD_HUMAN_SMOKING"},
        }
    },
    ["bowling"] = {
        resourceName = "cfx-gabz-bowling",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(760.792, -777.724, 26.456),
        PedCoords = {
            [1] = {coords = vector4(756.55, -774.73, 26.34, 93.17), model = "ig_car3guy1", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [2] = {coords = vector4(756.42, -767.85, 26.34, 108.89), model = "ig_car3guy2", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [3] = {coords = vector4(751.0, -767.68, 26.34, 130.41), model = "a_f_m_tourist_01", scenario = "WORLD_HUMAN_PARTYING"},
            [4] = {coords = vector4(751.12, -769.06, 26.34, 62.2), model = "a_f_y_tourist_01", scenario = "WORLD_HUMAN_PARTYING"},
            [5] = {coords = vector4(750.94, -781.68, 26.33, 20.74), model = "a_m_m_tourist_01", scenario = "WORLD_HUMAN_PARTYING"},
            [6] = {coords = vector4(751.09, -779.99, 26.33, 146.58), model = "a_f_y_tourist_02", scenario = "WORLD_HUMAN_PARTYING"},
        }
    },
    ["carmeet"] = {
        resourceName = "cfx-gabz-carmeet",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(952.7775, -1700.9637, 29.7632),
        PedCoords = {
            [1] = {coords = vector4(951.1806640625, -1831.2072753906, 21.035543441772, 31.616861343384), model = "u_m_y_tattoo_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(917.22564697266, -1751.6633300781, 22.138027191162, 173.6022644043), model = "s_m_y_xmech_02", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(920.39794921875, -1798.2700195313, 22.138837814331, 288.60516357422), model = "mp_m_waremech_01", scenario = "WORLD_HUMAN_SMOKING"},
        }
    },
    ["catcafe"] = {
        resourceName = "cfx-gabz-catcafe",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-580.862, -1079.083, 22.330),
        PedCoords = {
            [1] = {coords = vector4(-581.97, -1054.8, 22.43, 15.79), model = "a_c_cat_01", scenario = nil, dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base"},
            [2] = {coords = vector4(-581.95, -1055.87, 22.43, 88.47), model = "a_c_cat_01", scenario = nil, dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base"},
            [3] = {coords = vector4(-569.99, -1054.3, 21.75, 77.95), model = "a_c_cat_01", scenario = nil, dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base"},
            [4] = {coords = vector4(-580.18, -1059.17, 22.34, 320.24), model = "a_c_cat_01", scenario = nil, dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base"},
            [5] = {coords = vector4(-582.29, -1065.91, 22.34, 77.77), model = "a_c_cat_01", scenario = nil, dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base"},
            [6] = {coords = vector4(-577.54, -1066.37, 22.34, 36.250), model = "a_c_cat_01", scenario = nil, dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base"},
            [7] = {coords = vector4(-585.27, -1063.74, 22.34, 358.78), model = "a_f_m_fatbla_01", dict = "anim@amb@nightclub@lazlow@ig1_vip@", anim = "clubvip_base_laz"},
        }
    },
    ["davispd"] = {
        resourceName = "cfx-gabz-davispd",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(383.423, -1590.407, 29.276),
        PedCoords = {
            [1] = {coords = vector4(379.97, -1589.32, 28.28, 27.82), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(378.85, -1587.72, 28.27, 206.38), model = "s_f_y_cop_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(382.47, -1596.98, 29.05, 47.93), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [4] = {coords = vector4(398.77, -1605.18, 28.29, 223.18), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_CAR_PARK_ATTENDANT"},   
            [5] = {coords = vector4(375.63, -1593.63, 30.05, 229.92), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_COP_IDLES"}, 
            [6] = {coords = vector4(368.97, -1605.07, 30.05, 320.42), model = "s_f_y_cop_01", scenario = "WORLD_HUMAN_COP_IDLES"},   
            [7] = {coords = vector4(367.027, -1597.25, 31.05, 229.86), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_COP_IDLES"},   
        }
    },
    ["diner"] = {
        resourceName = "cfx-gabz-diner",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1576.905, 6451.104, 25.006),
        PedCoords = {
            [1] = {coords = vector4(1582.82, 6451.13, 24.21, 202.69), model = "a_m_o_acult_02", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(1583.23, 6450.19, 24.19, 19.28), model = "a_m_o_acult_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(1592.1, 6453.73, 25.01, 325.39), model = "s_m_y_ammucity_01", scenario = "PROP_HUMAN_BUM_SHOPPING_CART"},
            [4] = {coords = vector4(1579.96, 6434.03, 24.86, 145.43), model = "s_m_m_gentransport", scenario = "WORLD_HUMAN_CAR_PARK_ATTENDANT"},
            [5] = {coords = vector4(1587.32, 6458.25, 26.01, 159.55), model = "s_m_y_chef_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["esbltd"] = {
        resourceName = "cfx-gabz-esbltd",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-58.676, -1757.732, 29.077),
        PedCoords = {
            [1] = {coords = vector4(-63.07, -1776.07, 28.9, 34.88), model = "g_m_y_ballaeast_01", scenario = "WORLD_HUMAN_DRUG_DEALER"},
            [2] = {coords = vector4(-63.89, -1774.15, 28.96, 154.08), model = "g_m_y_ballaorig_01", scenario = "WORLD_HUMAN_DRUG_DEALER"},
            [3] = {coords = vector4(-65.67, -1774.95, 28.88, 226.12), model = "g_f_y_ballas_01", scenario = "WORLD_HUMAN_DRUG_DEALER"},
            [4] = {coords = vector4(-64.39, -1771.37, 28.06, 81.55), model = "g_m_y_ballasout_01", scenario = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"},
            [5] = {coords = vector4(-73.46, -1768.08, 28.29, 239.39), model = "s_f_y_stripper_02", scenario = "WORLD_HUMAN_PROSTITUTE_LOW_CLASS"},
        }
    },
    ["firedept1"] = {
        resourceName = "cfx-gabz-firedept",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1197.553, -1454.430, 34.958),
        PedCoords = {
            [1] = {coords = vector4(1209.38, -1461.88, 33.84, 55.5), model = "s_m_y_fireman_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(1208.22, -1459.78, 33.84, 167.78), model = "s_m_y_fireman_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(1207.11, -1461.92, 33.84, 269.92), model = "s_m_y_fireman_01", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(1207.43, -1466.68, 33.86, 267.07), model = "s_m_y_fireman_01", scenario = "PROP_HUMAN_BUM_BIN"},
            [5] = {coords = vector4(1194.46, -1465.89, 33.86, 120.55), model = "s_m_y_fireman_01", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
            [6] = {coords = vector4(1216.17, -1466.05, 34.85, 2.84), model = "s_m_y_fireman_01", scenario = "PROP_HUMAN_BUM_SHOPPING_CART"},
        }
    },
    ["firedept2"] = {
        resourceName = "cfx-gabz-firedept",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(217.21, -1636.09, 30.44),
        PedCoords = {
            [1] = {coords = vector4(205.13, -1635.77, 28.88, 304.42), model = "s_m_y_fireman_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(206.7, -1636.75, 28.87, 18.95), model = "s_m_y_fireman_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(206.5, -1634.67, 28.82, 119.69), model = "s_m_y_fireman_01", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(215.07, -1650.54, 28.8, 232.34), model = "s_m_y_fireman_01", scenario = "PROP_HUMAN_BUM_BIN"},
            [5] = {coords = vector4(205.67, -1641.71, 28.8, 47.08), model = "s_m_y_fireman_01", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
            [6] = {coords = vector4(222.09, -1655.50, 29.80, 321.72), model = "s_m_y_fireman_01", scenario = "PROP_HUMAN_BUM_SHOPPING_CART"},
        }
    },
    ["harmony"] = {
        resourceName = "cfx-gabz-harmony",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1178.985, 2653.985, 37.862),
        PedCoords = {
            [1] = {coords = vector4(1189.02, 2651.27, 36.84, 132.34), model = "s_m_y_xmech_02_mp", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(1187.61, 2651.27, 36.84, 232.08), model = "mp_m_waremech_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(1189.67, 2649.49, 36.84, 32.75), model = "s_m_y_xmech_02", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(1179.0, 2635.99, 36.75, 161.66), model = "s_m_y_xmech_02_mp", scenario = "PROP_HUMAN_BUM_BIN"},
            [5] = {coords = vector4(1184.07, 2639.29, 36.75, 266.37), model = "s_m_y_xmech_01", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
        }
    },
    ["haters"] = {
        resourceName = "cfx-gabz-haters",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-1115.524, -1439.953, 5.107),
        PedCoords = {
            [1] = {coords = vector4(-1127.12, -1440.13, 4.23, 285.41), model = "csb_isldj_03", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [2] = {coords = vector4(-1121.43, -1437.05, 5.22, 138.95), model = "csb_isldj_04", dict = "anim@amb@nightclub@djs@dixon@", anim ="dixn_dance_cntr_open_dix"},
            [3] = {coords = vector4(-1120.93, -1441.01, 4.23, 203.16), model = "csb_isldj_02", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
            [4] = {coords = vector4(-1118.72, -1436.14, 4.11, 286.9), model = "csb_isldj_01", scenario = "WORLD_HUMAN_SMOKING"},
            [5] = {coords = vector4(-1117.33, -1436.51, 4.11, 81.66), model = "csb_isldj_00", scenario = "WORLD_HUMAN_SMOKING"},
        }
    },
    ["hayes"] = {
        resourceName = "cfx-gabz-hayes",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-1434.173, -441.539, 35.624),
        PedCoords = {
            [1] = {coords = vector4(-1432.35, -445.31, 34.67, 30.04), model = "s_m_y_xmech_02_mp", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(-1433.96, -445.5, 34.63, 310.51), model = "mp_m_waremech_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(-1431.67, -444.03, 34.67, 138.45), model = "s_m_y_xmech_01", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(-1415.67, -451.62, 34.91, 219.87), model = "s_m_y_xmech_02", scenario = "PROP_HUMAN_BUM_BIN"},
            [5] = {coords = vector4(-1410.32, -439.71, 34.91, 331.33), model = "mp_m_waremech_01", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
        }
    },
    ["hub"] = {
        resourceName = "cfx-gabz-hub",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-50.734, -1041.996, 28.163),
        PedCoords = {
            -- bennys
            [1] = {coords = vector4(-49.14, -1049.0, 27.08, 65.05), model = "s_m_y_xmech_02_mp", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(-49.47, -1047.43, 27.1, 147.73), model = "mp_m_waremech_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(-50.52, -1049.96, 27.02, 309.99), model = "s_m_y_xmech_02", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(-36.0, -1070.1, 27.4, 142.55), model = "mp_m_waremech_01", scenario = "PROP_HUMAN_BUM_BIN"},
            [5] = {coords = vector4(-28.46, -1068.08, 27.4, 250.17), model = "s_m_y_xmech_01", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
            --pdm
            [6] = {coords = vector4(-61.96, -1091.67, 25.55, 72.05), model = "a_m_m_hasjew_01", scenario = "WORLD_HUMAN_SMOKING"},
            [7] = {coords = vector4(-62.62, -1090.11, 25.65, 160.28), model = "a_m_y_hasjew_01", scenario = "WORLD_HUMAN_SMOKING"},
            [8] = {coords = vector4(-63.15, -1092.33, 25.55, 332.38), model = "a_m_m_hasjew_01", scenario = "WORLD_HUMAN_SMOKING"},
            [9] = {coords = vector4(-31.33, -1098.01, 26.27, 63.89), model = "u_m_o_finguru_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [10] = {coords = vector4(-39.84, -1097.64, 26.27, 134.17), model = "a_m_m_farmer_01", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
            -- impound
            [11] = {coords = vector4(-185.59, -1157.33, 22.05, 352.16), model = "s_m_y_xmech_01", scenario = "WORLD_HUMAN_SMOKING"},
            [12] = {coords = vector4(-183.94, -1156.28, 22.05, 82.35), model = "s_m_y_xmech_02", scenario = "WORLD_HUMAN_SMOKING"},
            [13] = {coords = vector4(-187.29, -1156.18, 22.05, 255.64), model = "mp_m_waremech_01", scenario = "WORLD_HUMAN_SMOKING"},
            [14] = {coords = vector4(-193.34, -1162.34, 22.67, 274.87), model = "s_m_y_xmech_02_mp", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [15] = {coords = vector4(-187.61, -1170.34, 22.16, 168.32), model = "s_m_y_xmech_02", scenario = "WORLD_HUMAN_CAR_PARK_ATTENDANT"},
        }
    },
    ["import"] = {
        resourceName = "cfx-gabz-import",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(946.637, -990.316, 39.228),
        PedCoords = {
            [1] = {coords = vector4(937.55, -987.31, 37.4, 182.91), model = "s_m_y_xmech_02", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(936.48, -988.22, 38.28, 261.62), model = "s_m_y_xmech_02_mp", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(938.46, -988.60, 38.46, 86.126), model = "mp_m_waremech_01", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(947.39, -972.26, 38.49, 272.11), model = "s_m_y_xmech_02", scenario = "PROP_HUMAN_BUM_BIN"},
            [5] = {coords = vector4(935.82, -983.38, 39.49, 99.04), model = "s_m_y_xmech_01", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
            [6] = {coords = vector4(925.18, -985.13, 39.49, 182.27), model = "mp_m_waremech_01", scenario = "PROP_HUMAN_BUM_BIN"},
            [7] = {coords = vector4(928.54, -957.41, 39.49, 2.6973), model = "s_m_y_xmech_02_mp", scenario = "PROP_HUMAN_BUM_BIN"},
        }
    },
    ["lamesapd"] = {
        resourceName = "cfx-gabz-lamesapd",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(825.3735, -1291.083, 29.2664),
        PedCoords = {
            [1] = {coords = vector4(815.80, -1296.12, 26.26, 3.19), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(815.76, -1294.00, 26.26, 175.08), model = "s_f_y_cop_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(837.13, -1288.55, 28.24, 179.57), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [4] = {coords = vector4(821.41, -1320.96, 26.09, 86.12), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_CAR_PARK_ATTENDANT"},   
            [5] = {coords = vector4(849.39, -1287.85, 28.24, 181.68), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_COP_IDLES"}, 
            [6] = {coords = vector4(852.83, -1287.76, 28.24, 180.70), model = "s_f_y_cop_01", scenario = "WORLD_HUMAN_COP_IDLES"},   
            [7] = {coords = vector4(850.68, -1305.10, 27.24, 271.47), model = "s_m_y_cop_01", scenario = "PROP_HUMAN_BUM_BIN"},   
            [8] = {coords = vector4(835.83, -1299.64, 28.24, 91.16), model = "s_m_y_cop_01", scenario = "PROP_HUMAN_BUM_BIN"},   
        }
    },
    ["lostmc"] = {
        resourceName = "cfx-gabz-lost",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(957.232, -143.250, 74.496),
        PedCoords = {
            [1] = {coords = vector4(966.18, -141.21, 74.45, 43.22), model = "g_f_y_lost_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(966.11, -139.38, 74.41, 153.35), model = "g_m_y_lost_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(964.44, -140.76, 74.45, 277.82), model = "g_m_y_lost_02", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(979.29, -127.78, 74.06, 238.92), model = "g_m_y_lost_03", scenario = "PROP_HUMAN_BUM_BIN"},
            [5] = {coords = vector4(952.13, -128.22, 74.40, 105.42), model = "g_f_y_lost_01", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
            [6] = {coords = vector4(976.63, -111.48, 74.35, 174.16), model = "g_m_y_lost_03", scenario = "WORLD_HUMAN_SMOKING"},
            [7] = {coords = vector4(977.21, -112.79, 74.35, 41.56), model = "g_m_y_lost_02", scenario = "WORLD_HUMAN_SMOKING"},
            [8] = {coords = vector4(975.54, -112.20, 74.35, 288.39), model = "g_m_y_lost_01", scenario = "WORLD_HUMAN_SMOKING"},
            [9] = {coords = vector4(956.79, -110.88, 74.36, 45.41), model = "g_f_y_lost_01", scenario = "PROP_HUMAN_BUM_BIN"},
            [10] = {coords = vector4(962.41, -105.81, 74.36, 43.64), model = "g_m_y_lost_02", scenario = "PROP_HUMAN_BUM_BIN"},
        }
    },
    ["lsc"] = {
        resourceName = "cfx-gabz-lostsc",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(716.214, -1088.703, 22.365),
        PedCoords = {
            [1] = {coords = vector4(721.79, -1082.66, 22.21, 132.30), model = "s_m_y_xmech_02", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(721.26, -1084.03, 22.23, 8.94), model = "s_m_y_xmech_02_mp", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(720.82, -1081.97, 22.23, 199.24), model = "mp_m_waremech_01", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(731.68, -1064.55, 22.16, 0.22), model = "s_m_y_xmech_02", scenario = "PROP_HUMAN_BUM_BIN"},
            [5] = {coords = vector4(737.29, -1090.12, 22.16, 270.63), model = "s_m_y_xmech_01", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
        }
    },
    ["paletoliquorstore"] = {
        resourceName = "cfx-gabz-paletoliquor",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-154.363, 6329.432, 31.565),
        PedCoords = {
            [1] = {coords = vector4(-155.11, 6326.26, 31.58, 324.32), model = "u_f_o_prolhost_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(-156.93, 6322.45, 31.58, 226.44), model = "u_m_y_party_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [3] = {coords = vector4(-161.00, 6325.58, 31.58, 45.37), model = "g_m_y_pologoon_02", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
        }
    },
    ["paletopd"] = {
        resourceName = "cfx-gabz-paletopd",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-432.177, 6019.605, 31.490),
        PedCoords = {
            [1] = {coords = vector4(-433.03, 6020.97, 31.48, 290.91), model = "a_m_m_salton_02", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(-431.36, 6022.18, 31.48, 130.74), model = "a_m_y_salton_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(-448.41, 6014.01, 32.28, 228.85), model = "s_f_y_ranger_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [4] = {coords = vector4(-438.70, 6011.72, 27.58, 118.65), model = "s_m_y_ranger_01", scenario = "WORLD_HUMAN_CLIPBOARD"},   
            [5] = {coords = vector4(-448.34, 6017.51, 27.58, 225.60), model = "s_f_y_ranger_01", scenario = "WORLD_HUMAN_COP_IDLES"}, 
            [6] = {coords = vector4(-445.97, 6014.79, 36.99, 226.76), model = "s_m_y_ranger_01", scenario = "WORLD_HUMAN_COP_IDLES"},   
            [7] = {coords = vector4(-442.30, 5999.50, 35.99, 239.72), model = "s_f_y_ranger_01", scenario = "PROP_HUMAN_BUM_BIN"},   
            [8] = {coords = vector4(-447.50, 6010.88, 36.99, 224.91), model = "s_m_y_ranger_01", scenario = "WORLD_HUMAN_COP_IDLES"},   
        }
    },
    ["parkranger"] = {
        resourceName = "cfx-gabz-parkranger",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(388.640, 787.820, 187.474),
        PedCoords = {
            [1] = {coords = vector4(394.05, 790.31, 187.67, 134.52), model = "s_f_y_ranger_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(394.05, 790.31, 187.67, 134.57), model = "s_m_y_ranger_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(384.65, 795.18, 187.46, 236.38), model = "s_f_y_ranger_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [4] = {coords = vector4(386.89, 798.63, 190.49, 178.97), model = "s_m_y_ranger_01", scenario = "WORLD_HUMAN_CLIPBOARD"},   
            [5] = {coords = vector4(383.83, 797.55, 187.46, 271.95), model = "s_f_y_ranger_01", scenario = "WORLD_HUMAN_COP_IDLES"}, 
        }
    },
    ["pillbox"] = {
        resourceName = "cfx-gabz-pillbox",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(286.562, -570.565, 43.168),
        PedCoords = {
            [1] = {coords = vector4(284.27, -613.55, 43.32, 295.72), model = "a_m_m_fatlatin_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(286.10, -613.12, 43.34, 80.05), model = "a_f_m_fatwhite_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(284.31, -611.11, 43.30, 187.24), model = "a_f_m_fatbla_01", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(300.45, -578.30, 43.26, 143.94), model = "a_f_m_fatbla_01", scenario = "WORLD_HUMAN_SMOKING"},
            [5] = {coords = vector4(299.30, -580.53, 43.26, 336.25), model = "a_m_m_farmer_01", scenario = "WORLD_HUMAN_SMOKING"},
            [6] = {coords = vector4(310.55, -586.17, 43.28, 342.41), model = "s_m_m_paramedic_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [7] = {coords = vector4(303.94, -591.88, 43.28, 72.24), model = "a_m_m_salton_03", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
            [8] = {coords = vector4(310.72, -596.61, 42.28, 160.73), model = "s_m_m_paramedic_01", scenario = "PROP_HUMAN_BUM_BIN"},
            [9] = {coords = vector4(308.50, -595.13, 43.28, 68.50), model = "s_m_m_doctor_01", scenario = "WORLD_HUMAN_CLIPBOARD"},  
            [10] = {coords = vector4(322.94, -582.35, 43.28, 337.13), model = "s_m_m_paramedic_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
        
        }
    },
    ["pinkcage"] = {
        resourceName = "cfx-gabz-pinkcage",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(322.326, -218.825, 54.087),
        PedCoords = {
            [1] = {coords = vector4(327.31, -200.59, 54.22, 249.78), model = "a_m_m_trampbeac_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(328.86, -200.91, 54.22, 67.28), model = "a_f_m_trampbeac_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(311.04, -204.91, 54.21, 251.09), model = "s_m_m_trucker_01", scenario = "WORLD_HUMAN_STAND_MOBILE"},
            [4] = {coords = vector4(341.97, -211.59, 54.21, 74.15), model = "a_m_y_vinewood_01", scenario = "WORLD_HUMAN_SMOKING"},
            [5] = {coords = vector4(338.39, -220.66, 58.01, 75.14), model = "a_f_y_vinewood_02", scenario = "WORLD_HUMAN_SMOKING"},
            [6] = {coords = vector4(324.50, -232.12, 54.21, 71.71), model = "a_m_y_vinewood_02", scenario = "WORLD_HUMAN_STAND_MOBILE"},
            [7] = {coords = vector4(312.11, -228.28, 54.21, 253.88), model = "a_m_m_tranvest_02", scenario = "WORLD_HUMAN_SMOKING"},
        }
    },
    ["pizzeria"] = {
        resourceName = "cfx-gabz-pizzeria",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(789.087, -758.266, 26.728),
        PedCoords = {
            [1] = {coords = vector4(800.28, -741.74, 26.78, 263.50), model = "a_m_o_beach_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(802.19, -741.89, 26.78, 87.89), model = "a_m_y_beach_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(801.01, -746.71, 26.78, 0.17), model = "s_m_y_barman_01", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(813.15, -752.90, 26.78, 273.13), model = "s_m_y_chef_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [5] = {coords = vector4(812.17, -754.67, 26.78, 184.45), model = "s_m_y_barman_01", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
            [6] = {coords = vector4(812.07, -751.04, 26.78, 89.85), model = "s_f_y_bartender_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
        }
    },
    ["prison"] = {
        resourceName = "cfx-gabz-prison",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1855.556, 2586.384, 45.673),
        PedCoords = {
            [1] = {coords = vector4(1845.90, 2584.32, 45.67, 270.56), model = "s_m_m_prisguard_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [2] = {coords = vector4(1845.91, 2587.44, 45.67, 270.41), model = "s_m_m_prisguard_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [3] = {coords = vector4(1840.56, 2584.72, 46.01, 293.97), model = "s_m_m_prisguard_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [4] = {coords = vector4(1840.39, 2577.68, 46.01, 0.97), model = "s_m_m_prisguard_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [5] = {coords = vector4(1827.42, 2586.77, 46.01, 271.03), model = "s_m_m_prisguard_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [6] = {coords = vector4(1827.43, 2588.73, 46.01, 271.59), model = "s_m_m_prisguard_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [7] = {coords = vector4(1899.19, 2604.25, 45.96, 181.95), model = "s_m_m_prisguard_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [8] = {coords = vector4(1899.16, 2606.63, 45.96, 359.58), model = "s_m_m_prisguard_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [9] = {coords = vector4(1829.20, 2603.99, 45.88, 7.52), model = "s_m_m_prisguard_01", scenario = "WORLD_HUMAN_COP_IDLES"},
            [10] = {coords = vector4(1664.60, 2507.84, 45.56, 56.53), model = "s_m_y_prismuscl_01", scenario = "WORLD_HUMAN_SMOKING"},
            [11] = {coords = vector4(1664.52, 2509.58, 45.56, 159.89), model = "u_m_y_prisoner_01", scenario = "WORLD_HUMAN_SMOKING"},
            [12] = {coords = vector4(1663.02, 2507.93, 45.56, 303.27), model = "s_m_y_prisoner_01", scenario = "WORLD_HUMAN_SMOKING"},
            [13] = {coords = vector4(1751.37, 2539.10, 43.58, 26.98), model = "s_m_y_prismuscl_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
            [14] = {coords = vector4(1739.23, 2528.85, 43.58, 28.16), model = "u_m_y_prisoner_01", scenario = "WORLD_HUMAN_LEANING"},
            [15] = {coords = vector4(1738.13, 2528.28, 43.58, 28.99), model = "s_m_y_prisoner_01", scenario = "WORLD_HUMAN_LEANING"},
        }
    },
    ["records"] = {
        resourceName = "cfx-gabz-records",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(-832.578, -698.627, 27.280),
        PedCoords = {
            [1] = {coords = vector4(-830.26, -704.85, 28.05, 228.87), model = "g_m_m_chigoon_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(-828.31, -704.58, 28.05, 138.14), model = "g_m_m_chigoon_02", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(-829.10, -706.48, 28.05, 0.70), model = "g_m_m_chiboss_01", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(-818.41, -697.77, 28.06, 89.79), model = "ig_claypain", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [5] = {coords = vector4(-812.28, -700.79, 28.06, 270.93), model = "s_f_m_shop_high", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
            [6] = {coords = vector4(-831.64, -728.58, 28.06, 12.53), model = "s_m_y_barman_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [7] = {coords = vector4(-829.40, -728.52, 28.06, 359.23), model = "s_f_y_bartender_01", dict = "anim@amb@nightclub@lazlow@ig1_vip@", anim = "clubvip_base_laz"},
            [8] = {coords = vector4(-816.41, -717.93, 28.06, 90.60), model = "s_m_y_barman_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [9] = {coords = vector4(-818.52, -718.92, 32.34, 270.31), model = "csb_ary", dict = "anim@amb@nightclub@djs@dixon@", anim ="dixn_dance_cntr_open_dix"},
            [10] = {coords = vector4(-820.7, -722.66, 32.34, 92.74), model = "g_m_y_strpunk_01", scenario = "WORLD_HUMAN_SMOKING"},
            [11] = {coords = vector4(-822.0, -723.35, 32.34, 319.7), model = "g_m_y_strpunk_02", scenario = "WORLD_HUMAN_SMOKING"},
        }
    },
    ["sandypd"] = {
        resourceName = "cfx-gabz-records",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(1871.4530, 3664.9644, 33.6869),
        PedCoords = {
            [1] = {coords = vector4(1844.62, 3674.93, 33.97, 150.71), model = "csb_cop", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(1843.41, 3674.18, 33.97, 276.40), model = "s_f_y_cop_01", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(1833.08, 3679.44, 34.18, 209.88), model = "csb_cop", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [4] = {coords = vector4(1855.21, 3682.33, 33.97, 205.14), model = "s_m_y_cop_01", scenario = "WORLD_HUMAN_CAR_PARK_ATTENDANT"},   
            [5] = {coords = vector4(1832.35, 3673.09, 34.18, 0.66), model = "csb_cop", scenario = "WORLD_HUMAN_COP_IDLES"}, 
            [6] = {coords = vector4(1829.26, 3678.14, 38.85, 122.26), model = "s_f_y_cop_01", scenario = "WORLD_HUMAN_COP_IDLES"},   
            [7] = {coords = vector4(1834.28, 3679.06, 38.85, 300.22), model = "csb_cop", scenario = "CODE_HUMAN_MEDIC_KNEEL"},   
            [8] = {coords = vector4(1831.44, 3680.37, 38.85, 295.69), model = "csb_cop", scenario = "CODE_HUMAN_MEDIC_KNEEL"},   
        }
    },
    ["studio"] = {
        resourceName = "cfx-gabz-studio",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(478.9987, -108.6757, 63.1550),
        PedCoords = {
            [1] = {coords = vector4(481.09, -109.05, 63.15, 109.34), model = "g_m_m_chigoon_01", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(479.03, -110.50, 62.70, 331.85), model = "g_m_m_chigoon_02", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(479.15, -108.57, 63.15, 242.15), model = "g_m_m_chiboss_01", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(476.85, -95.047, 63.16, 162.03), model = "ig_claypain", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [5] = {coords = vector4(484.31, -101.43, 63.16, 252.77), model = "s_f_m_shop_high", scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
            [6] = {coords = vector4(500.45, -72.18, 58.16, 326.07), model = "csb_ary", dict = "anim@amb@nightclub@djs@dixon@", anim ="dixn_dance_cntr_open_dix"},
            [7] = {coords = vector4(496.95, -72.52, 58.16, 293.48), model = "g_m_y_strpunk_01", scenario = "WORLD_HUMAN_SMOKING"},
            [8] = {coords = vector4(498.44, -71.51, 58.16, 119.16), model = "g_m_y_strpunk_02", scenario = "WORLD_HUMAN_SMOKING"},
        }
    },
    ["tuner"] = {
        resourceName = "cfx-gabz-tuner",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(166.715, -3014.122, 5.888),
        PedCoords = {
            [1] = {coords = vector4(156.30, -3047.55, 7.03, 336.76), model = "s_m_y_xmech_02", scenario = "WORLD_HUMAN_SMOKING"},
            [2] = {coords = vector4(156.14, -3045.62, 7.03, 231.73), model = "s_m_y_xmech_02_mp", scenario = "WORLD_HUMAN_SMOKING"},
            [3] = {coords = vector4(158.03, -3046.10, 7.03, 98.05), model = "mp_m_waremech_01", scenario = "WORLD_HUMAN_SMOKING"},
            [4] = {coords = vector4(130.18, -3031.92, 7.07, 76.384), model = "s_m_y_xmech_02", scenario = "PROP_HUMAN_BUM_BIN"},
            [5] = {coords = vector4(137.51, -3050.45, 7.04, 181.28), model = "s_m_y_xmech_01", scenario = "CODE_HUMAN_MEDIC_KNEEL"},
            [6] = {coords = vector4(149.17, -3013.22, 7.04, 179.27), model = "mp_m_waremech_01", scenario = "WORLD_HUMAN_STAND_IMPATIENT"},
        }
    },
    ["vu"] = {
        resourceName = "cfx-gabz-vu",
        isEnabled = false, -- will be false for locations (if you set this to true, it will force spawn the peds even if the MLO is not loaded)
        coords = vector3(135.409, -1308.931, 28.991),
        PedCoords = {
            [1] = {coords = vector4(128.13, -1299.43, 29.23, 210.45), model = "s_m_m_bouncer_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [2] = {coords = vector4(130.01, -1298.38, 29.23, 210.67), model = "s_m_m_bouncer_01", scenario = "WORLD_HUMAN_GUARD_STAND"},
            [3] = {coords = vector4(129.74, -1284.53, 29.26, 110.06), model = "s_m_y_barman_01", scenario = "WORLD_HUMAN_CLIPBOARD"},
            [4] = {coords = vector4(104.58, -1291.70, 29.24, 299.38), model = "s_f_y_stripper_02", dict = "mp_safehouse", anim ="lap_dance_girl"},
            [5] = {coords = vector4(120.45, -1281.46, 29.48, 118.86), model = "csb_ary", dict = "anim@amb@nightclub@djs@dixon@", anim ="dixn_dance_cntr_open_dix"},
        }
    },
}
