-- ██████╗ ██╗   ██╗███╗   ██╗██████╗  █████╗ ███╗   ██╗ ██████╗ ███████╗███████╗
-- ██╔════╝ ██║   ██║████╗  ██║██╔══██╗██╔══██╗████╗  ██║██╔════╝ ██╔════╝██╔════╝
-- ██║  ███╗██║   ██║██╔██╗ ██║██████╔╝███████║██╔██╗ ██║██║  ███╗█████╗  ███████╗
-- ██║   ██║██║   ██║██║╚██╗██║██╔══██╗██╔══██║██║╚██╗██║██║   ██║██╔══╝  ╚════██║
-- ╚██████╔╝╚██████╔╝██║ ╚████║██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗███████


-- ██████╗██╗   ██╗███████╗████████╗ ██████╗ ███╗   ███╗    ██████╗  █████╗ ███╗   ██╗ ██████╗ ███████╗███████╗
-- ██╔════╝██║   ██║██╔════╝╚══██╔══╝██╔═══██╗████╗ ████║    ██╔══██╗██╔══██╗████╗  ██║██╔════╝ ██╔════╝██╔════╝
-- ██║     ██║   ██║███████╗   ██║   ██║   ██║██╔████╔██║    ██████╔╝███████║██╔██╗ ██║██║  ███╗█████╗  ███████╗
-- ██║     ██║   ██║╚════██║   ██║   ██║   ██║██║╚██╔╝██║    ██╔══██╗██╔══██║██║╚██╗██║██║   ██║██╔══╝  ╚════██║
-- ╚██████╗╚██████╔╝███████║   ██║   ╚██████╔╝██║ ╚═╝ ██║    ██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗███████║
--  ╚═════╝ ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝

Config = {}

Config.CustomGunrange = {
    ['LS'] = {
        enabled = true,
        propTarget = `gr_prop_gr_target_05c`, --The main gunrange target prop.
        propArm = `prop_target_arm_b`, --The arm/handle of the main gunrange target prop.
        target_mirror = false,
        scoring = 'ammunation',
        [1] = {
            defaultCoords = vector3(14.02,-1079.51,30.9695),
            frontCoords = vector3(11.14,-1088.07,30.9695),
            backCoords = vector3(17.86,-1068.87,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(8.45,-1095.55,29.80),
                left= vector3(8.26,-1095.27,29.80)
            }
        },
        [2] = {
            defaultCoords = vector3(15.02,-1079.86,30.9695),
            frontCoords = vector3(11.83,-1088.51,30.9695),
            backCoords = vector3(18.83,-1069.41,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(9.47,-1095.62,29.80),
                left= vector3(9.32,-1095.59,29.80)
            }
        },
        [3] = {
            defaultCoords = vector3(16.02,-1080.21,30.9695),
            frontCoords = vector3(12.75,-1088.60,30.9695),
            backCoords = vector3(19.77,-1069.79,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(10.41,-1096.01,29.80),
                left= vector3(10.02,-1095.93,29.80)
            }
        },
        [4] = {
            defaultCoords = vector3(16.90,-1080.56,30.9695),
            frontCoords = vector3(13.78,-1089.14,30.9695),
            backCoords = vector3(20.65,-1070.24,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(11.34,-1096.40,29.80),
                left= vector3(11.14,-1096.26,29.80)
            }
        },
        [5] = {
            defaultCoords = vector3(17.85,-1080.91,30.9695),
            frontCoords = vector3(14.66,-1089.63,30.9695),
            backCoords = vector3(21.53,-1070.66,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(12.38,-1096.93,29.80),
                left= vector3(12.05,-1096.67,29.80)
            }
        },
        [6] = {
            defaultCoords = vector3(18.75,-1081.26,30.9695),
            frontCoords = vector3(15.54,-1089.90,30.9695),
            backCoords = vector3(22.55,-1070.92,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(13.28,-1097.32,29.80),
                left= vector3(12.90,-1097.15,29.80)
            }
        },
        [7] = {
            defaultCoords = vector3(19.80,-1081.61,30.9695),
            frontCoords = vector3(16.56,-1090.37,30.9695),
            backCoords = vector3(23.54,-1071.13,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(14.16,-1097.61,29.80),
                left= vector3(13.76,-1097.46,29.80)
            }
        },
        [8] = {
            defaultCoords = vector3(20.81,-1081.94,30.9695),
            frontCoords = vector3(17.59,-1090.61,30.9695),
            backCoords = vector3(24.43,-1071.52,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(15.03,-1097.92,29.80),
                left= vector3(14.71,-1097.80,29.80)
            }
        },
        [9] = {
            defaultCoords = vector3(21.60,-1082.31,30.9695),
            frontCoords = vector3(18.57,-1090.79,30.9695),
            backCoords = vector3(25.51,-1071.77,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(16.04,-1098.01,29.80),
                left= vector3(15.83,-1097.99,29.80)
            }
        },
        [10] = {
            defaultCoords = vector3(22.60,-1082.66,30.9695),
            frontCoords = vector3(19.42,-1091.02,30.9695),
            backCoords = vector3(26.40,-1072.16,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(17.05,-1098.46,29.80),
                left = vector3(16.81,-1098.32,29.80),
            }
        },
        [11] = {
            defaultCoords = vector3(23.40,-1083.01,30.9695),
            frontCoords = vector3(20.35,-1091.55,30.9695),
            backCoords = vector3(27.23,-1072.45,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(17.99,-1098.74,29.80),
                left= vector3(17.72,-1098.66,29.80)
            }
        },
        [12] = {
            defaultCoords = vector3(24.40,-1083.36,30.9695),
            frontCoords = vector3(21.19,-1091.99,30.9695),
            backCoords = vector3(28.19,-1072.98,30.9695),
            heading = 162.0,
            booth = {
                right = vector3(18.96,-1099.18,29.80),
                left= vector3(18.67,-1098.99,29.80)
            }
        },
    },
    ['SF'] = {
        enabled = true,
        propTarget = `gr_prop_gr_target_05c`, --The main gunrange target prop.
        propArm = `prop_target_arm_b`, --The arm/handle of the main gunrange target prop.
        target_mirror = true,
        scoring = 'ammunation',
        [1] = {
            defaultCoords = vector3(827.13,-2180.61,30.9695),
            frontCoords = vector3(827.15,-2171.42,30.9695),
            backCoords = vector3(827.06,-2191.61,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(826.89,-2163.83,29.80),
                left= vector3(827.16,-2163.82,29.80)
            }
        },
        [2] = {
            defaultCoords = vector3(826.14,-2180.47,30.9695),
            frontCoords = vector3(826.18,-2171.51,30.9695),
            backCoords = vector3(826.06,-2191.80,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(825.92,-2163.78,29.80),
                left= vector3(826.14,-2163.79,29.80)
            }
        },
        [3] = {
            defaultCoords = vector3(825.15,-2180.47,30.9695),
            frontCoords = vector3(825.14,-2171.48,30.9695),
            backCoords = vector3(825.0,-2191.60,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(824.91,-2163.79,29.80),
                left= vector3(825.11,-2163.80,29.80)
            }
        },
        [4] = {
            defaultCoords = vector3(824.12,-2180.46,30.9695),
            frontCoords = vector3(824.05,-2171.57,30.9695),
            backCoords = vector3(824.12,-2191.54,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(823.95,-2163.79,29.80),
                left= vector3(824.14,-2163.81,29.80)
            }
        },
        [5] = {
            defaultCoords = vector3(823.07,-2180.40,30.9695),
            frontCoords = vector3(823.06,-2171.50,30.9695),
            backCoords = vector3(823.15,-2191.70,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(822.73,-2163.70,29.80),
                left= vector3(823.21,-2163.83,29.80)
            }
        },
        [6] = {
            defaultCoords = vector3(822.14,-2180.50,30.9695),
            frontCoords = vector3(822.11,-2171.46,30.9695),
            backCoords = vector3(822.15,-2191.66,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(821.72,-2163.65,29.80),
                left= vector3(822.17,-2163.79,29.80)
            }
        },
        [7] = {
            defaultCoords = vector3(821.0,-2180.45,30.9695),
            frontCoords = vector3(821.12,-2171.39,30.9695),
            backCoords = vector3(821.13,-2191.71,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(820.75,-2163.64,29.80),
                left= vector3(821.32,-2163.65,29.80)
            }
        },
        [8] = {
            defaultCoords = vector3(820.14,-2180.57,30.9695),
            frontCoords = vector3(820.05,-2171.44,30.9695),
            backCoords = vector3(819.97,-2191.66,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(819.92,-2163.72,29.80),
                left= vector3(820.26,-2163.73,29.80)
            }
        },
        [9] = {
            defaultCoords = vector3(819.15,-2180.48,30.9695),
            frontCoords = vector3(819.12,-2171.43,30.9695),
            backCoords = vector3(819.15,-2191.73,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(818.92,-2163.81,29.80),
                left= vector3(819.11,-2163.81,29.80)
            }
        },
        [10] = {
            defaultCoords = vector3(818.08,-2180.61,30.9695),
            frontCoords = vector3(818.09,-2171.28,30.9695),
            backCoords = vector3(818.11,-2191.67,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(817.96,-2163.82,29.80),
                left = vector3(818.13,-2163.77,29.80),
            }
        },
        [11] = {
            defaultCoords = vector3(817.08,-2180.55,30.9695),
            frontCoords = vector3(817.08,-2171.54,30.9695),
            backCoords = vector3(816.99,-2191.56,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(816.92,-2163.77,29.80),
                left= vector3(817.15,-2163.73,29.80)
            }
        },
        [12] = {
            defaultCoords = vector3(816.16,-2180.50,30.9695),
            frontCoords = vector3(816.05,-2171.38,30.9695),
            backCoords = vector3(816.05,-2171.68,30.9695),
            heading = 346.0,
            booth = {
                right = vector3(815.79,-2163.75,29.80),
                left= vector3(816.14,-2163.79,29.80)
            }
        },
    }
}



-- ██████╗  █████╗ ██████╗ ███████╗    ███╗   ███╗ █████╗ ██████╗ ███████╗
-- ██╔════╝ ██╔══██╗██╔══██╗╚══███╔╝    ████╗ ████║██╔══██╗██╔══██╗██╔════╝
-- ██║  ███╗███████║██████╔╝  ███╔╝     ██╔████╔██║███████║██████╔╝███████╗
-- ██║   ██║██╔══██║██╔══██╗ ███╔╝      ██║╚██╔╝██║██╔══██║██╔═══╝ ╚════██║
-- ╚██████╔╝██║  ██║██████╔╝███████╗    ██║ ╚═╝ ██║██║  ██║██║     ███████

Config.gunRangeLocation = { --⚠️PLEASE READ⚠️; DONT CHANGE THESE IF YOU DONT KNOW WHAT YOUR DOING.
    ['LS'] = {
        enabled = false,
        propTarget = `gr_prop_gr_target_05c`, --The main gunrange target prop.
        propArm = `prop_target_arm_b`, --The arm/handle of the main gunrange target prop.
        target_mirror = true,
        scoring = 'ammunation',
        [1] = {
            defaultCoords = vector3(14.65,-1085.87,30.9695),
            frontCoords = vector3(12.650,-1091.39,30.9695),
            backCoords = vector3(15.15,-1084.49,30.9695),
            booth = {
                right = vector3(11.15,-1096.07,29.80),
                left= vector3(10.79,-1095.98,29.80)
            }
        },
        [2] = {
            defaultCoords = vector3(16.1398,-1085.875,30.9695),
            frontCoords = vector3(13.98,-1091.80,30.9),
            backCoords = vector3(16.45,-1085.0,30.9695),
            booth = {
                right = vector3(12.59,-1096.47,29.80),
                left= vector3(12.0,-1096.28,29.80)
            }
        },
        [3] = {
            defaultCoords = vector3(16.48412,-1088.877,30.9695),
            frontCoords = vector3(15.30,-1092.30,30.9),
            backCoords = vector3(17.75,-1085.53,30.9),
            booth = {
                right = vector3(13.89,-1096.94,29.80),
                left= vector3(13.33,-1096.74,29.80)
            }
        },
        [4] = {
            defaultCoords = vector3(18.31554,-1088.023,30.9695),
            frontCoords = vector3(16.60,-1092.72,30.9),
            backCoords = vector3(19.05,-1086.0,30.9),
            booth = {
                right = vector3(15.20,-1097.42,29.80),
                left= vector3(14.64,-1097.22,29.80)
            }
        },
        [5] = {
            defaultCoords = vector3(20.25432,-1086.745,30.9695),
            frontCoords = vector3(18.0,-1093.10,30.9),
            backCoords = vector3(20.35,-1086.53,30.9),
            booth = {
                right = vector3(16.46,-1098.0,29.80),
                left= vector3(15.90,-1097.82,29.80)
            }
        },
        [6] = {
            defaultCoords = vector3(21.02761,-1088.689,30.9695),
            frontCoords = vector3(19.30,-1093.54,30.9),
            backCoords = vector3(21.60,-1087.0,30.9),
            booth = {
                right = vector3(17.77,-1098.49,29.80),
                left= vector3(17.20,-1098.30,29.80)
            }
        },
        [7] = {
            defaultCoords = vector3(21.84576,-1090.49,30.9695),
            frontCoords = vector3(20.56,-1094.0,30.9),
            backCoords = vector3(22.95,-1087.51,30.9),
            booth = {
                right = vector3(19.07,-1098.96,29.80),
                left= vector3(18.52,-1098.76,29.80)
            }
        }
    },
    ['SF'] ={
        enabled = false,
        target_mirror = true,
        propTarget = `gr_prop_gr_target_05c`, --The main gunrange target prop.
        propArm = `prop_target_arm_b`, --The arm/handle of the main gunrange target prop.
        scoring = 'ammunation',
        [1] = {
            defaultCoords = vector3(824.3883,-2174.764,30.79148),
            frontCoords = vector3(824.42,-2168.83,30.79148),
            backCoords = vector3(824.42,-2176.46,30.79148),
            booth = {
                right = vector3(824.04,-2164.16,29.62),
                left= vector3(824.68,-2164.13,29.62)
            }
        },
        [2] = {
            defaultCoords = vector3(822.993,-2175.272,30.79148),
            frontCoords = vector3(823.0,-2168.85,30.79148),
            backCoords = vector3(823.0,-2176.48,30.79148),
            booth = {
                right = vector3(822.71,-2164.08,29.80),
                left= vector3(823.35,-2164.12,29.80)
            }
        },
        [3] = {
            defaultCoords = vector3(821.6084,-2172.475,30.79148),
            frontCoords = vector3(821.75,-2168.90,30.79148),
            backCoords = vector3(821.75,-2176.53,30.79148),
            booth = {
                right = vector3(821.32,-2164.12,29.80),
                left= vector3(821.94,-2164.05,29.80)
            }
        },
        [4] = {
            defaultCoords = vector3(820.2137,-2173.998,30.79148),
            frontCoords = vector3(820.37,-2168.82,30.79148),
            backCoords = vector3(820.37,-2176.35,30.79148),
            booth = {
                right = vector3(819.93,-2164.10,29.80),
                left= vector3(820.54,-2164.05,29.80)
            }
        },
        [5] = {
            defaultCoords = vector3(818.829,-2175.862,30.79148),
            frontCoords = vector3(819.02,-2168.90,30.79148),
            backCoords = vector3(819.02,-2176.03,30.79148),
            booth = {
                right = vector3(818.54,-2164.11,29.80),
                left= vector3(819.09,-2164.13,29.80)
            }
        },
        [6] = {
            defaultCoords = vector3(817.4376,-2174.30,30.79148),
            frontCoords = vector3(817.61,-2168.93,30.79148),
            backCoords = vector3(817.61,-2176.16,30.79148),
            booth = {
                right = vector3(817.15,-2164.11,29.80),
                left= vector3(817.75,-2164.0,29.80)
            }
        },
        [7] = {
            defaultCoords = vector3(816.0527,-2172.887,30.79148),
            frontCoords = vector3(816.06,-2168.86,30.79148),
            backCoords = vector3(816.06,-2175.86,30.79148),
            booth = {
                right = vector3(815.76,-2164.10,29.80),
                left= vector3(816.36,-2164.10,29.80)
            }
        }
    },
}