VenteIllegal = {}
VenteIllegal.PercentResell = 0
VenteIllegal.speedFarm = 0.0040

VenteIllegal.Resell = {
    {-------Vente Pêche Légal
        shop = "Poissonner",
        typeMoney = "money",
        point = vector3(-330.979736, -2778.924804, 6.15),
        text = "Appuyer ~b~[E]~s~ pour ~g~parler ~s~au ~b~poissonner",
        distMarker = 10,
        dist3D = 5,
        GangAutorized = {},
        Boss = false,
        ItemResel = {
            {label = "Anchois", name = "anchois", price = 15},
            {label = "Morue", name = "morue", price = 45},
            {label = "Raie", name = "raie", price = 75},
            {label = "Saumon", name = "saumon", price = 90},
            {label = "Thon", name = "thon", price = 120},
        }
    }, 
    {-----Vente Chasse Légal
        shop = "Boucher",
        typeMoney = "money",
        point = vector3(-679.177368, 5834.396972, 18.34),
        text = "Appuyer ~b~[E]~s~ pour ~g~parler ~s~au ~b~boucher",
        distMarker = 10,
        dist3D = 5,
        GangAutorized = {},
        Boss = false,
        ItemResel = {
            {label = "Viande d'oie", name = "viande_oie", price = 105},
            {label = "Viande de lapin", name = "viande_lapin", price = 135},
            {label = "Viande de biche", name = "viande_biche", price = 195},
            {label = "Viande de sanglier", name = "viande_sanglier", price = 240},
        }
    }, 
    {-----Vente Pêche Illégal
        shop = "Braconnier",
        typeMoney = "black_money",
        point = vector3(-2166.488038, 5198.242676, 16.89),
        text = "Appuyer ~b~[E]~s~ pour ~g~parler ~s~au ~b~braconnier",
        distMarker = 10,
        dist3D = 5,
        GangAutorized = {},
        Boss = false,
        ItemResel = {
            {label = "Espadon", name = "espadon", price = 165},
            {label = "Requin", name = "requin", price = 210},
            {label = "Requin marteau", name = "requin_marteau", price = 375},
            {label = "Dauphin", name = "dauphin", price = 420},
        }
    },
    {-----Vente Chasse Illégal
        shop = "Braconnier",
        typeMoney = "black_money",
        point = vector3(1469.737548, 6549.848632, 14.91),
        text = "Appuyer ~b~[E]~s~ pour ~g~parler ~s~au ~b~braconnier",
        distMarker = 10,
        dist3D = 5,
        GangAutorized = {},
        Boss = false,
        ItemResel = {
            {label = "Peau de coyotte", name = "peau_coyotte", price = 450},
            {label = "Peau de puma", name = "peau_puma", price = 540},
        }
    },
    {-----Vente Bijoux
        shop = "Recéleur",
        typeMoney = "black_money",
        point = vector3(-169.065902, 6144.573242, 43.637424),
        text = "Appuyer ~b~[E]~s~ pour ~g~parler ~s~au ~b~recéleur",
        distMarker = 10,
        dist3D = 5,
        GangAutorized = {"ballas", "vagos", "f4l", "bloods", "marabunta", "oneil", "bmf", "lostmc", "madrazo"},
        Boss = false,
        ItemResel = {
            {label = "Bijoux", name = "bijoux", price = 1850},
        }
    }, 
}