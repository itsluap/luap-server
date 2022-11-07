RegisterMaxSpeed_EVENT = false

classBoost = {
    --[[
        maxSpeed speed (km/h) (-1 to keep actual maxSpeedspeed)
        torque :
            <1.0 - Decreased torque
            =1.0 - Default torque
            >1.0 - Increased torque
            Negative values will cause the vehicle to go backwards instead of forwards while accelerating.
            value - is between 0.2 and 1.8 in normal scripts but you can add more torque (an the vehicle will drift)
            Dont use 0.0 or the car will not have tha ability to moove
        power :
            <0.0 - Decreased power
            =0.0 - Default power
            >0.0 - Increased power
            value - is between -50.0 and 50.0 in normal scripts (but you can do more)
    ]]
    [7] = {
        maxSpeed = 200, 
        torque = 1.0,
        power = 0.0
    },
    [18] = {
        maxSpeed = 200, 
        torque = 1.0,
        power = 0.0
    },
    [6] = {
        maxSpeed = 200,
        torque = 1.0,
        power = 0.0
    },
    [3] = {
        maxSpeed = 200,
        torque = 1.0,
        power = 0.0
    },
    [5] = {
        maxSpeed = 200,
        torque = 1.0,
        power = 0.0
    },
    [4] = {
        maxSpeed = 200,
        torque = 1.0,
        power = 0.0
    },
    [8] = {
        maxSpeed = 200,
        torque = 1.0,
        power = 0.0
    },
    [1] = {
        maxSpeed = 200,
        torque = 1.0,
        power = 0.0
    },
    others = {
        maxSpeed = 200,
        torque = 1.0,
        power = 0.0
    },
}

--[[

    CLASS LIST

    0: Compacts  
    1: Sedans  
    2: SUVs  
    3: Coupes  
    4: Muscle  
    5: Sports Classics  
    6: Sports  
    7: Super  
    8: Motorcycles  
    9: Off-road  
    10: Industrial  
    11: Utility  
    12: Vans  
    13: Cycles  
    14: Boats  
    15: Helicopters  
    16: Planes  
    17: Service  
    18: Emergency  
    19: Military  
    20: Commercial  
    21: Trains  


]]

vehicleBoost = {
    -- import vehicles --
    chr20 = {
        maxSpeed = -1, 
        torque = 0,
        power = 0
    },
    --
    adder = {
        maxSpeed = 250, 
        torque = 1.7,
        power = 70.0
    },
    issy = {
        maxSpeed = 200, 
        torque = 1.0,
        power = 0.0
    },
}