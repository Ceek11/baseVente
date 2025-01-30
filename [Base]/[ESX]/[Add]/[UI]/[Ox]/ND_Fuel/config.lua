config = {
    standalone = true, -- if you're using ND Framework keep this false. It will use your money and pay for gas.
    jerryCanPrice = 45, -- jery cans can be purchased from the gas statoin.
    jerryCanrefillCost = 50, -- The price of the jerrycans refill, this will be calculated and adjusted to how much is left in it.
    fuelCostMultiplier = 1.0, -- 2.0 will double the price of fuel and 1.5 will increase it by half.

    -- Class multipliers. If you want SUVs to use less fuel, you can change it to anything under 1.0, and vise versa.
    vehicleClasses = {
        [0] = 0.7, -- Compacts
        [1] = 0.7, -- Sedans
        [2] = 0.7, -- SUVs
        [3] = 0.7, -- Coupes
        [4] = 0.7, -- Muscle
        [5] = 0.7, -- Sports Classics
        [6] = 0.7, -- Sports
        [7] = 1.0, -- Super
        [8] = 0.7, -- Motorcycles
        [9] = 0.7, -- Off-road
        [10] = 1.0, -- Industrial
        [11] = 1.0, -- Utility
        [12] = 1.2, -- Vans
        [13] = 0.0, -- Cycles
        [14] = 1.0, -- Boats
        [15] = 1.0, -- Helicopters
        [16] = 1.0, -- Planes
        [17] = 1.0, -- Service
        [18] = 1.0, -- Emergency
        [19] = 1.9, -- Military
        [20] = 1.8, -- Commercial
        [21] = 1.0, -- Trains
    },

    electricVehicles = {
        `Imorgon`,
        `Neon`,
        `Raiden`,
        `Cyclone`,
        `Voltic`,
        `Voltic2`,
        `Tezeract`,
        `Dilettante`,
        `Dilettante2`,
        `Airtug`,
        `Caddy`,
        `Caddy2`,
        `Caddy3`,
        `Surge`,
        `Khamelion`,
        `RCBandito`
    },
    pumpModels = {
        [-2007231801] = true,
        [1339433404] = true,
        [1694452750] = true,
        [1933174915] = true,
        [-462817101] = true,
        [-469694731] = true,
        [-164877493] = true
    },

    -- you can spawn pump here. Search up gta objects and then search pump.
    addPumps = {
        -- {hash = "prop_gas_pump_old2", x = 721.93, y = 1480.80, z = 5.06},
    }
}