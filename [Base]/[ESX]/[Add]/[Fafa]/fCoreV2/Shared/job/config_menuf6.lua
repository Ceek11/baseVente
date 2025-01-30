License = {
    {label = "Code de la route", Type = "dmv"},
    {label = "Permis voiture", Type = "drive"},
    {label = "Permis moto", Type = "drive_bike"},
    {label = "Permis camion", Type = "drive_truck"},
    {label = "Permis d'arme", Type = "weapon"},
    
}

LicensePpa = "weapon"

Position = {
    Abatoire = {
        {button = "Position revente", pos = vector2(-25.73208, 6285.564), desc = "La position de vente de l'entreprise"}
    },
}

MenuF6 = {
    PoleEmploi = {
        job = {"abatoire", "couture"},
        Position = {
            abatoire = {
			    {button = "Lieu de l'entreprise", pos = vector3(-69.492324, 6262.361328, 31.090106), desc = "Position de l'entreprise"},
                {button = "Récolte de poulet", pos = vector3(-62.601882, 6241.611328, 31.090082), desc = "Position de la récolte de poulet"},
				{button = "Traitement du poulet", pos = vector3(-78.144822, 6229.539550, 31.091892), desc = "Position du traitement des poulets"},
				{button = "Mise en barquette du poulet", pos = vector3(-101.780060, 6208.834960, 31.025018), desc = "Position pour mettre en barquette les cuisses de poulet"},
                {button = "Vente des barquettes de poulet", pos = vector3(-591.521180, -892.566528, 25.942870), desc = "Position de la vente des barquettes de poulet"},
            },
            couture = {
			    {button = "Lieu de l'entreprise", pos = vector3(717.614014, -972.843688, 25.739338), desc = "Position de l'entreprise"},
                {button = "Récolte de la laine", pos = vector3(1978.768310, 5171.389648, 47.639130), desc = "Position de la laine"},
				{button = "Traitement de la laine", pos = vector3(714.962830, -969.290344, 30.395340), desc = "Position du traitement de la laine"},
				{button = "Coudre les vêtements", pos = vector3(716.279114, -960.098510, 30.395342), desc = "Position pour coudre les vêtements"},
                {button = "Vendre les vêtements", pos = vector3(-822.746032, -1069.294556, 11.328112), desc = "Position de la vente des vêtements"},
            },
        },
    },
    Global = {
        job = {"armurier", "tacos", "bahamas", "tequilala", "unicorn", "horny", "yellowjack", "ltdls", "ltddp", "ltdgs", "ltdfdk", "nikkibeach", "uwucafe", "mineur", "burgershot", "gouvernement", "avocat", "henhouse", "vigneron", "tabac", "koi"},
        Position = {
            armurier = {
			    {button = "Lieu de l'entreprise", pos = vector3(812.107728, -2150.007324, 29.619010), desc = "Position du passage PPA"},
                {button = "Passage PPA", pos = vector3(821.388428, -2161.997802, 29.619008), desc = "Position du passage PPA"},
            },
            tacos = {
			    {button = "Lieu de l'entreprise", pos = vector3(412.408264, -1910.658570, 25.471238), desc = "Position de l'entreprise"},
                {button = "Récolte de barquette de poulet", pos = vector3(-152.914520, 6140.488282, 32.335086), desc = "Position de la récolte des barquettes de poulet"},
				{button = "Cuir les barquettes de poulet", pos = vector3(424.612732, -1920.100098, 25.471236), desc = "Position de la Cuisson les barquettes de poulet"},
				{button = "Faires des tacos", pos = vector3(426.904908, -1917.881348, 25.471236), desc = "Position pour faire des tacos"},
				{button = "Vente de tacos", pos = vector3(-1630.339966, -1075.725464, 13.065302), desc = "Postion de la vente de tacos"},
            },
            koi = {
			    {button = "Lieu de l'entreprise", pos = vector3(-1039.755494, -1476.156006, 5.579568), desc = "Position de l'entreprise"},
                {button = "Récupérer des daurades", pos = vector3(-308.517730, -2764.135742, 4.994704), desc = "Position pour récupérer des daurades"},
				{button = "Préparer les daurades", pos = vector3(-1078.048340, -1445.651368, -1.40), desc = "Position de la préparation des daurades"},
				{button = "Faires des sushi", pos = vector3(-1075.533814, -1446.681762, -1.40), desc = "Position pour faire des daurades"},
				{button = "Vente de sushi", pos = vector3(-1220.252198, -1504.631592, 4.37), desc = "Postion de la vente de daurades"},
            },
            bahamas = {
			    {button = "Lieu de l'entreprise", pos = vector3(-1387.520752, -587.998902, 30.214018), desc = "Position de l'entreprise"},
                {button = "Récolte de fruit fermenté", pos = vector3(282.105530, 6507.240722, 30.128748), desc = "Position de la récolte des fruits fermenté"},
				{button = "Fermenter les fruits fermenté", pos = vector3(839.535644, 2176.737548, 52.288800), desc = "Position de la fermentation des fruits fermenté"},
				{button = "Mettre en bouteille de champagne", pos = vector3(846.337768, 2136.371338, 52.861206), desc = "Position pour mettre en bouteille de champagne"},
				{button = "Vente des bouteilles de champagne", pos = vector3(-1220.542, -911.578, 12.32634), desc = "Postion de la vente des bouteilles de champagne"},
            },
            tequilala = {
			    {button = "Lieu de l'entreprise", pos = vector3(-560.450622, 277.738892, 82.976464), desc = "Position de l'entreprise"},
                {button = "Récolte de fruit fermenté", pos = vector3(208.5598, 6509.532, 31.47068), desc = "Position de la récolte des fruits fermenté"},
				{button = "Fermenter les fruits fermenté", pos = vector3(839.5238, 2176.768, 52.2888), desc = "Position de la fermentation des fruits fermenté"},
				{button = "Mettre en bouteille de tequila", pos = vector3(846.2992, 2136.368, 52.85436), desc = "Position pour mettre en bouteille de tequila"},
				{button = "Vente des bouteilles de tequila", pos = vector3(376.3674, 333.7366, 103.5664), desc = "Postion de la vente des bouteilles de tequila"},
            },
            unicorn = {
			    {button = "Lieu de l'entreprise", pos = vector3(127.989502, -1297.254760, 29.269318), desc = "Position de l'entreprise"},
                {button = "Récolte de fruit fermenté", pos = vector3(236.6606, 6502.404, 31.2043), desc = "Position de la récolte des fruits fermenté"},
				{button = "Fermenter les fruits fermenté", pos = vector3(839.5238, 2176.768, 52.2888), desc = "Position de la fermentation des fruits fermenté"},
				{button = "Mettre en bouteille de vodka", pos = vector3(846.2992, 2136.368, 52.85436), desc = "Position pour mettre en bouteille de vodka"},
				{button = "Vente des bouteilles de vodka", pos = vector3(1130.728, -982.7072, 46.4158), desc = "Postion de la vente des bouteilles de vodka"},
            },
            horny = {
			    {button = "Lieu de l'entreprise", pos = vector3(1241.919068, -365.167908, 69.084838), desc = "Position de l'entreprise"},
                {button = "Récolte des barquette de poulet", pos = vector3(-152.910828, 6140.479004, 32.335106), desc = "Position de la récolte des paquets de poulet"},
				{button = "Cuir les paquets de poulet", pos = vector3(1253.578002, -352.360778, 69.085), desc = "Position de la cuisson des paquets de poulet"},
				{button = "Faire des chickenburgers", pos = vector3(1252.142456, -355.584504, 69.085), desc = "Position pour faire des chickenburgers"},
				{button = "Vente des chickenburgers", pos = vector3(-1692.100830, -1136.289184, 13.151642), desc = "Postion de la vente des chickenburgers"},
            },
            yellowjack = {
			    {button = "Lieu de l'entreprise", pos = vector3(1989.838746, 3052.455078, 47.215270), desc = "Position de l'entreprise"},
                {button = "Récolte de fruit fermenté", pos = vector3(261.554, 6527.214, 30.73818), desc = "Position de la récolte des fruits fermenté"},
				{button = "Fermenter les fruits fermenté", pos = vector3(839.5238, 2176.768, 52.2888), desc = "Position de la fermentation des fruits fermenté"},
				{button = "Mettre en bouteille de whisky", pos = vector3(846.2992, 2136.368, 52.85436), desc = "Position pour mettre en bouteille de whisky"},
				{button = "Vente des bouteilles de whisky", pos = vector3(1166.272, 2714.342, 38.15772), desc = "Postion de la vente des bouteilles de whisky"},
            },
            nikkibeach = {
			    {button = "Lieu de l'entreprise", pos = vector3( -1426.471070, -1239.627808, 4.347518), desc = "Position de l'entreprise"},
                {button = "Récolte de fruit fermenté", pos = vector3(219.966186, 6499.898438, 31.384312), desc = "Position de la récolte des fruits fermenté"},
				{button = "Fermenter les fruits fermenté", pos = vector3(839.5238, 2176.768, 52.2888), desc = "Position de la fermentation des fruits fermenté"},
				{button = "Faire un cocktail de frozen margarita", pos = vector3(846.2992, 2136.368, 52.85436), desc = "Position pour faire un cocktail de frozen margerita"},
				{button = "Vente des cocktails de frozen margarita", pos = vector3(-2962.888672, 389.910156, 15.043300), desc = "Postion de la vente des cocktails de frozen margerita"},
            },
            uwucafe = {
			    {button = "Lieu de l'entreprise", pos = vector3(-580.958558, -1070.811036, 22.329686), desc = "Position de l'entreprise"},
                {button = "Récolte de farine", pos = vector3(416.206910, 6520.778320, 27.728448), desc = "Position de la récolte de farine"},
				{button = "Préparer des brownies", pos = vector3(-590.477294, -1056.531616, 22.3626), desc = "Position pour préparer des brownies"},
				{button = "Cuir des brownies", pos = vector3(-590.279114, -1059.745972, 22.344208), desc = "Position pour cuire des brownies"},
				{button = "Vente de brownies", pos = vector3(-1707.989624, -1099.523072, 13.152440), desc = "Postion de la vente de brownies"},
            },
            mineur = {
			    {button = "Lieu de l'entreprise", pos = vector3(2525.691894, 4122.006836, 38.918168), desc = "Position de l'entreprise"},
                {button = "Mine de pierre de beryl", pos = vector3(-588.5792, 2065.57, 131.0156), desc = "Position de la mine de pierre de beryl"},
				{button = "Extraire le beryl", pos = vector3(2527.674560, 4121.752930, 38.93), desc = "Position pour extraire des beryl"},
				{button = "Soustraire l'émeraude", pos = vector3(2530.941406, 4118.437012, 38.93), desc = "Position pour soustraire des émeraudes"},
				{button = "Vente d'émeraude", pos = vector3(-482.3258, -63.40806, 39.99424), desc = "Postion de la vente d'émeraude"},
            },
            burgershot = {
			    {button = "Lieu de l'entreprise", pos = vector3(1587.018066, 3750.351318, 34.433090), desc = "Position de l'entreprise"},
                {button = "Récolte des paquets de viande", pos = vector3(968.2016, -2111.208, 31.47526), desc = "Position de la récolte des paquets de viande"},
				{button = "Cuir les paquets de viande", pos = vector3(1594.531982, 3748.912354, 34.44), desc = "Position de la cuisson des paquets de viande"},
				{button = "Faire des hamburgers", pos = vector3(1592.147950, 3754.521728, 34.44), desc = "Position pour faire des hamburgers"},
				{button = "Vente des hamburgers", pos = vector3(1590.796875, 6461.816406, 25.317134), desc = "Postion de la vente des hamburgers"},
            },
            henhouse = {
			    {button = "Lieu de l'entreprise", pos = vector3(-301.908600, 6257.391602, 31.483136), desc = "Position de l'entreprise"},
                {button = "Récupérer des paquets de viande", pos = vector3(1208.745362, 1855.302490, 78.911568), desc = "Position de la récupérer des tomahawk de boeuf"},
				{button = "Cuir les tomahawk de boeuf", pos = vector3(-298.157104, 6271.590820, 31.484004), desc = "Position pour cuir les tomahawk de boeuf"},
				{button = "Préparer les tomahawk de boeuf", pos = vector3(-299.226806, 6270.416504, 31.483928), desc = "Position pour préparer les tomahawk de boeuf"},
				{button = "Vente des tomahawk de boeuf", pos = vector3(1983.643554, 3705.186768, 32.566712), desc = "Postion de la vente des tomahawk de boeuf"},
            },
            vigneron = {
			    {button = "Lieu de l'entreprise", pos = vector3(-1889.073242, 2047.942504, 140.880142), desc = "Position de l'entreprise"},
                {button = "Récolter des grappes de raisin", pos = vector3(-1809.734, 2168.664, 109.9464), desc = "Position de la récolte des grappes de raisin"},
				{button = "Traiter les grappes de raisin", pos = vector3(-1931.866, 2055.38, 140.80), desc = "Position du traitement de grappe de raisin"},
				{button = "Mise en bouteille", pos = vector3(-1867.29, 2056.068, 140.9994), desc = "Position pour mettre en bouteille"},
				{button = "Vente des grappes de raisin", pos = vector3(-157.901, -54.42962, 54.39612), desc = "Postion de la vente des grappes de raisin"},
            },
            tabac = {
			    {button = "Lieu de l'entreprise", pos = vector3(2906.275146, 4407.128418, 50.222920), desc = "Position de l'entreprise"},
                {button = "Récolter des feuilles de tabac", pos = vector3(2860.444, 4604.958, 47.91728), desc = "Position de la récolte de feuille de tabac"},
				{button = "Traiter les feuilles de tabac", pos = vector3(2899.868, 4489.966, 48.15552), desc = "Position du traitement de feuille de tabac"},
				{button = "Mise en packet de cigarette", pos = vector3(2923.578, 4473.752, 48.15274), desc = "Position pour mettre en packet de cigarette"},
				{button = "Vente des packets de cigarette", pos = vector3(-1224.198, -711.0584, 22.33994), desc = "Postion de la vente de packet de cigarette"},
            },
            gouvernement = {
			    {button = "Lieu de l'entreprise", pos = vector3(-551.2492, -193.7698, 38.469), desc = "Position de l'entreprise"},
            },
            avocat = {
			    {button = "Lieu de l'entreprise", pos = vector3(-1898.562988, -572.342530, 11.842694), desc = "Position de l'entreprise"},
            },
            ltdls = {
			    {button = "Lieu de l'entreprise", pos = vector3(-711.925660, -915.256530, 19.215592), desc = "Position de l'entreprise"},
            },
            ltddp = {
                {button = "Lieu de l'entreprise", pos = vector3(-1490.376586, -382.745452, 40.175206), desc = "Position de l'entreprise"},
            },
            ltdmp = {
                {button = "Lieu de l'entreprise", pos = vector3(1159.467408, -325.911744, 69.205062), desc = "Position de l'entreprise"},
            },
            ltdgs = {
                {button = "Lieu de l'entreprise", pos = vector3(-52.363536, -1755.750366, 29.421016), desc = "Position de l'entreprise"},
            },
            ltdfd = {
			    {button = "Lieu de l'entreprise", pos = vector3(29.126744, -1348.413452, 29.497020), desc = "Position de l'entreprise"},
            },
        },
        Annonce = {
            {label = "Ouverture", message = "Le %s viens d'ouvrir ses portes !! N'hésiter pas à passer !!"},
            {label = "Fermeture", message = "Le %s viens de fermer ses portes !!"},
            {label = "Recrutement", message = "Le %s recrute !!"},
        },
    },
    Mecano = {
        job = {"benny", "lscustomnord", "lscustomsud"},
        plateau = {"lscustomnord", "lscustomsud"},
        Position = {
            benny = {
			    {button = "Lieu de l'entreprise", pos = vector3(-230.950744, -1327.245240, 31.294530), desc = "Position de l'entreprise"},
            },
            lscustomnord = {
			    {button = "Lieu de l'entreprise", pos = vector3(1199.717042, 2654.777100, 38.000000), desc = "Position de l'entreprise"},
            },
            lscustomsud = {
			    {button = "Lieu de l'entreprise", pos = vector3(-333.371186, -128.715256, 38.997196), desc = "Position de l'entreprise"},
            },
        },
        Annonce = {
            {label = "Ouverture", message = "Le %s viens d'ouvrir ses portes !! N'hésiter pas à passer !!"},
            {label = "Fermeture", message = "Le %s viens de fermer ses portes !!"},
            {label = "Recrutement", message = "Le %s recrute !!"},
        },
    },
    Police = {
        job = {"police", "lssd"},
        Annonce = {
            {label = "Ouverture", message = "Le %s viens d'ouvrir ses portes !! N'hésiter pas à passer !!"},
            {label = "Fermeture", message = "Le %s viens de fermer ses portes !!"},
            {label = "Recrutement", message = "Le %s recrute !!"},
        },
    },
    Ambulance = {
        job = {"ems", "hopital_cayo", "ambualancenord"},
        hopital_cayo = {
            {label = "reins", item = "reins", count = 1},
            {label = "poumons", item = "poumons", count = 1},
            {label = "cerveau", item = "cerveau", count = 1},
            {label = "coeur", item = "coeur", count = 1},
        }
    },
}


