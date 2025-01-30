PriceKitRepa = 500
maxEmployee = 20
InServiceJob = true
Patron = {
    {
        
        EmployeeInService = 0,
        jobName = "police",
        jobLabel = "LSPD",
        societyName = "society_police",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "",
        Boss = {
            {
                makeFakeMoney = false,
                percentageMoney = 90,        
                point = vec3(460.559723, -985.478210, 29.728075), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = true, historyBill = true, stockBateau = true, stockVehicle = true, stockHeli = true, saisie = true}
                },
            },
        },
        HeliShop = {
            {label = "Maverick2", name = "pmaverick", price = 10000},
        },
        BateauShop = {
            {label = "Predator", name = "predator", price = 10000},
        },
        Vehicule = {
            {label = "Sutlan", name = "sultan", price = 10000},
            {label = "Tulip Banalisé", name = "tulipum", price = 10000},
            {label = "Scout 2 Banalisé", name = "nscouttrafpol", price = 10000},
            {label = "Felon", name = "policefelon", price = 10000},
            {label = "Buffalo STX", name = "polbuffalor", price = 10000},
            {label = "Scout E-M", name = "umkscout", price = 10000},
            {label = "Alamo 2", name = "polalamor2", price = 10000},
            {label = "Caracara", name = "polcarar", price = 10000},
            {label = "Bison", name = "polbisonr", price = 10000},
            {label = "Fugitive", name = "polfugitiver", price = 10000},
            {label = "Scout 2", name = "nscoutlssd", price = 10000},
            {label = "Torence", name = "poltorencer", price = 10000},
            {label = "Scout", name = "polscoutr", price = 10000},
            {label = "Buffalo", name = "polbuffalor2", price = 10000},
            {label = "Moto", name = "polbikeb", price = 10000},
            {label = "Stanier", name = "polstanierr", price = 10000},
            {label = "Speedo", name = "polspeedor", price = 10000},
            {label = "Scout HP", name = "nscoutsahp", price = 10000},
            {label = "Scout 2 HP", name = "nscoutsahp2", price = 10000},
            {label = "Coquette HP", name = "polcoquetter", price = 10000},
            {label = "Gauntlet HP", name = "polgauntletr", price = 10000},
            {label = "Banalisé Everon", name = "fateveron", price = 10000},
            {label = "Banalisé Stalker", name = "fatstalker", price = 10000},
            {label = "Banalisé Torrence 2", name = "fattorrence", price = 10000},
            {label = "Banalisé Buffalo 2", name = "fatbuffalo", price = 10000},
            {label = "Banalisé Novak", name = "apoliceu10", price = 10000},
            {label = "Banalisé Baller", name = "apoliceub", price = 10000},
            {label = "Banalisé Schafter", name = "apoliceu15", price = 10000},
            {label = "Banalisé Torence", name = "apoliceu7", price = 10000},
            {label = "Banalisé Scout", name = "apoliceu6", price = 10000},
            {label = "Banalisé Buffalo", name = "apoliceu14", price = 10000},
            {label = "Banalisé Speedo", name = "apoliceu13", price = 10000},
            {label = "Banalisé Oracle", name = "apoliceu9", price = 10000},
            {label = "Banalisé Stanier", name = "apoliceu", price = 10000},
            {label = "Banalisé Stanier Old", name = "apoliceu2", price = 10000},
            {label = "Stalker RAD", name = "polstalkerr", price = 10000},
            {label = "Scout DOA/SWAT", name = "umkscout2", price = 10000},
            {label = "Insurgent", name = "swatinsur", price = 10000},
            {label = "Stockade", name = "swatstoc", price = 10000},
            {label = "Rumpo DOA", name = "swatvanr2 ", price = 10000},
            {label = "Speepo SWAT", name = "swatvans2", price = 10000},
            {label = "Hazard", name = "hazard2", price = 10000},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vec3(472.673920, -997.453003, 25.273281),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            },
        },
        Garage = {
            { ---Heli
                Type = "car",
                maxMarker = 15,
                max3D = 2.5,
                point = vec3(441.554230, -984.484924, 25.699812),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vec4(432.148132, -987.539734, 25.699804, 166.74),
            },
            { ---Heli
                Type = "Heli",
                maxMarker = 15,
                max3D = 2.5,
                point = vec3(463.927399, -985.317139, 43.691662),
                markerType = 34, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vec4(432.148132, -987.539734, 25.699804, 166.74),
            },
        },
        
        DeleteVehi = {
            { ---
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(432.148132, -987.539734, 25.699804),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~l'~b~hélicoptère",
            },
            { ---
                maxMarker = 15,
                max3D = 1.5,
                point =  vec3(449.182709, -981.423218, 43.691395),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~l'~b~hélicoptère",
            },
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vec3(463.367554, -996.563599, 29.689514),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            },
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "lssd",
        jobLabel = "LSSD",
        societyName = "society_lssd",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "",
        Boss = {
            {
                makeFakeMoney = false,
                percentageMoney = 90,        
                point = vector3(-433.056092, 6006.037598, 35.995678), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = true, historyBill = true, stockBateau = true, stockVehicle = true, stock = true, stockKitRepa = false, saisie = true}
                }
            },
        },
        Shop = {
            {label = "Maverick", name = "lguardmav", price = 10000},
        },
        BateauShop = {
            {label = "Predator", name = "predator", price = 10000},
        },
        Vehicule = {
            {label = "Buffalo STX", name = "polbuffalop", price = 10000},
            {label = "Alamo 2", name = "polalamop2", price = 10000},
            {label = "Caracara", name = "polcarap", price = 10000},
            {label = "Scout 2 Ranger", name = "nscoutnps", price = 10000},
            {label = "Fugitive", name = "polfugitivep", price = 10000},
            {label = "Scout 2", name = "nscoutlssd2", price = 10000},
            {label = "Torence", name = "poltorencep", price = 10000},
            {label = "Scout", name = "polscoutp", price = 10000},
            {label = "Buffalo", name = "polbuffalop2", price = 10000},
            {label = "Moto", name = "polbikeb2", price = 10000},
            {label = "Stanier", name = "polstanierp", price = 10000},
            {label = "Speedo", name = "polspeedop", price = 10000},
            {label = "Scout 2 HP", name = "nscoutsahp", price = 10000},
            {label = "Scout 2 HP", name = "nscoutsahp2", price = 10000},
            {label = "Coquette HP", name = "polcoquettep", price = 10000},
            {label = "Gauntlet HP", name = "polgauntletp", price = 10000},
            {label = "Banalisé Everon", name = "fateveron", price = 10000},
            {label = "Banalisé Stalker", name = "fatstalker", price = 10000},
            {label = "Banalisé Torrence", name = "fattorrence", price = 10000},
            {label = "Banalisé Buffalo", name = "fatbuffalo", price = 10000},
            {label = "Banalisé Novak", name = "apoliceu10", price = 10000},
            {label = "Banalisé Baller", name = "apoliceub", price = 10000},
            {label = "Banalisé Schafter", name = "apoliceu15", price = 10000},
            {label = "Banalisé Torence", name = "apoliceu7", price = 10000},
            {label = "Banalisé Scout", name = "apoliceu6", price = 10000},
            {label = "Banalisé Buffalo", name = "apoliceu14", price = 10000},
            {label = "Banalisé Speedo", name = "apoliceu13", price = 10000},
            {label = "Banalisé Oracle", name = "apoliceu9", price = 10000},
            {label = "Banalisé Stanier", name = "apoliceu", price = 10000},
            {label = "Banalisé Stanier Old", name = "apoliceu2", price = 10000},
            {label = "Stalker RAD", name = "polstalkerp", price = 10000},
            {label = "Scout DOA/SWAT", name = "umkscout2", price = 10000},
            {label = "Insurgent", name = "swatinsur", price = 10000},
            {label = "Stockade", name = "swatstoc", price = 10000},
            {label = "RCV", name = "riot2", price = 10000},
            {label = "Rumpo DOA", name = "swatvanr2", price = 10000},
            {label = "Speepo SWAT", name = "swatvans2", price = 10000},
            {label = "Hazard", name = "hazard2", price = 10000},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-446.864868, 6018.393554, 31.30),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            { ---Heli Paleto
                Type = "Heli",
                maxMarker = 15,
                max3D = 2.5,
                point = vec3(-477.758666, 6005.299804, 31.311826),
                markerType = 34, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-475.351594, 5988.409668, 31.336498, 317.68951416016),
            },
            { ---Heli Sandy
                Type = "Heli",
                maxMarker = 15,
                max3D = 2.5,
                point = vec3(1833.042114, 3675.807862, 38.930596),
                markerType = 34, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(1832.832032, 3668.327880, 38.930610, 33.195365905762),
            },
            { ---Paleto Vehi
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-459.330384, 6029.642578, 31.489814),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-481.224030, 6023.574218, 31.206542, 223.652633667),
            },
            { ---Sandy Vehi
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(1856.797486, 3687.908448, 34.327136),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(1859.055420, 3694.115234, 33.441734, 210.98992919922),
            },
        },
        DeleteVehi = {
            { ---Heli Paleto
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-475.351594, 5988.409668, 31.336498),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~l'~b~hélicoptère",
            },
            { ---Heli Sandy
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(1833.705200, 3668.793458, 38.930610),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~l'~b~hélicoptère",
            },
            { ---Paleto Vehi
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-481.224030, 6023.574218, 31.206542),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            },
            { ---Sandy Vehi
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(1859.055420, 3694.115234, 33.441734),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            { ---Paleto
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-439.177246, 6010.936036, 35.995686),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            },
            { ---Sandy
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(1838.446534, 3678.817138, 37.945),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "ems",
        jobLabel = "EMS",
        societyName = "society_ems",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "",
        Boss = {
            {
                makeFakeMoney = false,
                percentageMoney = 90,        
                point = vector3(-1882.964600, -297.544220, 83.06), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true,stockBateau = true, stockVehicle = true,stockHeli = true, stockKitRepa = false}
                }
            },
        },
        Vehicule = {
            {label = "Ambulance", name = "ambulance", price = 10000},
            {label = "Ambulance 2", name = "ambulance2", price = 1000},
            {label = "Landstalker XL", name = "emsstalker", price = 10000},
        },
        HeliShop = {
            {label = "Hélicoptère", name = "emsswift", price = 10000},
        },
        BateauShop = {
            {label = "Bateau", name = "dinghy", price = 10000},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-1871.819702, -337.074218, 52.755592),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            { ---Heli Ocean
                Type = "Heli",
                maxMarker = 15,
                max3D = 2.5,
                point = vec3(-1868.924682, -343.091674, 58.098206),
                markerType = 34, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-1867.290162, -352.645142, 58.098538, 319.47314453125),
            },
            { ---EMSocean Vehi
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1846.490112, -367.614654, 40.803524),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-1847.790162, -375.606506, 40.176156, 230.8678741455),
            },
        },
        DeleteVehi = {
            { ---Heli Ocean
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1867.290162, -352.645142, 58.098538),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~l'~b~hélicoptère",
            },
            { ---EMSocean Vehi
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1847.790162, -375.606506, 40.803524),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            },
        },
        Vestiaire = {
            { ---EMSoceanfemme
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1820.0974121094,-360.23864746094,49.449611663818),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            },
            { ---EMSoceanhomme
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1814.2250976562,-353.18557739258,49.468421936035),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    }, 













    {
        
        EmployeeInService = 0,
        jobName = "concess",
        jobLabel = "Concessionaire Auto",
        societyName = "society_concess",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(-25.2841, -1104.358, 26.27434), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                }
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-35.20638, -1085.664, 26.28),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-23.0492, -1099.024, 27.0),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-11.799834, -1101.785156, 26.717170, 70.550552368164),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-9.867092, -1095.624024, 27.0),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-26.21808, -1106.912, 26.28),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },

    
    {
        
        EmployeeInService = 0,
        jobName = "vigneron",
        jobLabel = "Vigneron",
        societyName = "society_vigneron",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(-1898.503052, 2068.412598, 140.10), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                }
            },
        },
        Vehicule = {
		    {label = "Van (speed)", name = "burrito2v", price = 14000},
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-1894.643188, 2063.667236, 140.05),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1918.846314, 2056.877442, 140.528564),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-1919.527832, 2052.706298, 140.528732, 257.90197753906),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1919.527832, 2052.706298, 140.528732),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1875.702392, 2053.848632, 140.10),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "tabac",
        jobLabel = "Tabac",
        societyName = "society_tabac",
        maxFakeMoney = 5000,
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(2901.176758, 4411.539062, 49.29), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                }
            },
        },
        Vehicule = {
		    {label = "Van (speed)", name = "burrito2red", price = 14000},
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(2878.492432, 4416.558106, 48.19),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(2888.669434, 4390.552734, 50.748158),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(2881.917724, 4395.697754, 50.542160, 202.59985351562),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(2881.917724, 4395.697754, 50.542160),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(2895.546142, 4421.463868, 49.29),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "yellowjack",
        jobLabel = "YellowJack",
        societyName = "society_yellowjack",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(1993.765014, 3045.151612, 49.52), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Van (speedo)", name = "burrito2yellow", price = 21500},
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(1994.486694, 3043.263916, 46.22),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(2001.984008, 3044.125732, 46.988026),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(1994.868896, 3035.317138, 46.770516, 149.48574829102),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(1998.970948, 3041.879638, 46.987842),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(1989.210938, 3049.372314, 49.51),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "tequilala",
        jobLabel = "Tequilala",
        societyName = "society_tequilala",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(-568.520812, 291.323364, 78.18), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Van (speedo)", name = "burrito2tequi", price = 21500},
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-561.645264, 289.593444, 81.185),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-566.793458, 302.686554, 83.137658),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-562.194152, 302.153870, 82.901412, 263.35556030274),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-562.304322, 302.230866, 83.167266),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-564.415406, 279.891326, 81.98),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "tacos",
        jobLabel = "Tacos",
        societyName = "society_tacos",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(428.711944, -1914.458252, 24428.71194), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Van (speedo)", name = "burrito2ta", price = 21500},
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(425.353486, -1911.923706, 24.48),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(414.933686, -1924.979492, 24.853422),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(414.092560, -1928.471802, 24.273550, 225.8179473877),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(411.925018, -1930.591918, 24.315678),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(419.933808, -1919.393188, 24.48),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "armurier",
        jobLabel = "Armurier",
        societyName = "society_armurier",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(818.106446, -2155.449952, 28.618988), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(827.308838, -2151.879150, 28.65),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(821.980102, -2147.814454, 28.712986),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(821.996826, -2144.785888, 28.562404, 0.33619803190232),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(822.157044, -2144.079102, 28.778678),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(825.110046, -2149.327636, 28.65),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "ltdls",
        jobLabel = "LTD Little Seoul",
        societyName = "society_ltdls",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(-709.407958, -905.055236, 18.25), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-705.499268, -904.986694, 18.25),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-721.790772, -913.243348, 19.013906),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-723.668518, -913.178772, 18.806746, 89.849166870118),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-722.399048, -916.486572, 19.013908),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-708.981506, -907.174744, 18.23),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "ltdcayo",
        jobLabel = "LTD Cayo",
        societyName = "society_ltdcayo",
        maxFakeMoney = 5000,

        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,
                point = vector3(5133.944824, -5118.415528, 1.24), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (winky)", name = "winky", price = 17850},
            {label = "Véhicule patron (yosemite3)", name = "yosemite3", price = 26850},      
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(5134.478516, -5115.905274, 1.22),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(5123.246582, -5113.609375, 2.126528),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(5127.607422, -5111.140625, 1.920272, 88.519912719726),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(5127.607422, -5111.140625, 1.920272),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~r~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(5131.999024, -5116.656738, 1.22),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "ltddp",
        jobLabel = "LTD Del Perro",
        societyName = "society_ltddp",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(-1478.906982, -374.915040, 38.163284), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-1483.740722, -375.532746, 39.163384),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1503.639038, -386.314972, 40.390190),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-1504.923584, -385.012390, 40.370880, 44.167175292968),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1506.075562, -383.809936, 40.742188),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1482.178100, -379.182128, 39.163384),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "ltdmp",
        jobLabel = "LTD Mirror Park",
        societyName = "society_ltdmp",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(1159.891846, -314.848144, 68.25), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(1163.724122, -314.175994, 68.25),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {  
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(1153.494384, -330.380646, 68.994110),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(1153.715820, -331.804902, 68.649758, 190.07723999024),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(1154.114136, -332.866334, 68.747802),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(1160.753418, -316.848876, 68.25),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "ltdgs",
        jobLabel = "LTD Grove Street",
        societyName = "society_ltdgs",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(-43.843346, -1749.188720, 28.45), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-40.811744, -1751.759888, 28.45),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-55.955544, -1744.404052, 29.320680),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-57.310078, -1743.096192, 29.128168, 51.126983642578),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-57.349582, -1742.922242, 29.358732),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-44.844082, -1751.164428, 28.45),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "ltdfd",
        jobLabel = "LTD Forum Drive",
        societyName = "society_ltdfd",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(28.940534, -1339.574708, 28.55), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(26.332926, -1339.108154, 28.51),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(18.788846, -1342.289428, 29.285412),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(15.440554, -1339.762452, 29.078482, 178.96432495118),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(15.365674, -1342.317504, 29.286508),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(26.611214, -1341.234130, 28.51),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "concess_bateau",
        jobLabel = "Concess Bateau",
        societyName = "society_concess_bateau",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(-788.787110, -1346.139648, 4.179), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-789.336182, -1344.638550, 4.179),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-815.293702, -1318.144532, 5.000380),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-812.292114, -1318.538696, 4.793682, 169.84523010254),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-812.292114, -1318.538696, 4.793682),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~r~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-787.850342, -1350.531982, 4.179),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "bahamas",
        jobLabel = "Bahamas",
        societyName = "society_bahamas",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(-1365.7492675781,-623.85681152344,30.325441360474), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                }
            },
        },
        Vehicule = {
            {label = "Van (speed)", name = "burrito2baha", price = 14000},
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-1365.4890136719,-617.00244140625,30.31941986084),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1385.2668457031,-634.59307861328,28.695962905884),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-1392.3220214844,-634.42846679688,28.695955276489,119.43198394775),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1392.0577392578,-634.28985595703,28.695957183838),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1381.4349365234,-591.49420166016,30.319679260254),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },


    {
        
        EmployeeInService = 0,
        jobName = "unicorn",
        jobLabel = "Unicorn",
        societyName = "society_unicorn",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(95.159736633301,-1293.2495117188,29.263521194458), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Van (speed)", name = "burrito2u", price = 14000},
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(92.477836608887,-1291.8442382812,29.263540267944),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(93.967422485352,-1281.9371337891,29.245727539062),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(85.990234375,-1280.4742431641,29.070617675781,124.94180297852),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(86.321258544922,-1280.2971191406,29.052761077881),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(105.2613067627,-1303.1337890625,28.769008636475),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    -- {
        
    --     EmployeeInService = 0,
    --     jobName = "lscustomsud",
    --     jobLabel = "LsCustom Sud",
    --     societyName = "society_lscustomsud",
    --     maxFakeMoney = 5000,
    --     gradeBoss = "boss",
    --     Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
    --     Boss = {
    --         {
    --             makeFakeMoney = true,
    --             percentageMoney = 90,        
    --             point = vector3(-352.061432, -128.698166, 42.15), 
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
    --             Option = {
    --                 {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = true}
    --             } 
    --         },
    --     },
    --     Vehicule = {
    --         {label = "Petite dépaneuse (towtruck)", name = "towtruck", price = 12850},
    --         {label = "Grande dépaneuse (flatbed)", name = "flatbed", price = 36950},
    --         {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
    --         {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
    --     },
    --     Coffre = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point =  vector3(-349.785492, -168.553010, 38.0),
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
    --         }
    --     },
    --     Garage = {
    --         {   
    --             Type = "car",
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(-354.916932, -163.719924, 38.991234),
    --             markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
    --             spawnpoint = vector4(-357.579896, -159.125320, 38.179740, 30.520446777344),
    --         },
    --     },
    --     DeleteVehi = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(-357.069396, -160.459458, 38.214196),
    --             markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 41, b = 0, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
    --         }
    --     },
    --     Vestiaire = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(-351.382324, -124.390098, 42.15),
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
    --         }
    --     },
    -- },
    -- {
        
    --     EmployeeInService = 0,
    --     jobName = "benny",
    --     jobLabel = "Benny's",
    --     societyName = "society_benny",
    --     maxFakeMoney = 5000,
    --     gradeBoss = "boss",
    --     Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
    --     Boss = {
    --         {
    --             makeFakeMoney = true,
    --             percentageMoney = 90,        
    --             point = vector3(-194.837768, -1315.816406, 30.300494), 
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
    --             Option = {
    --                 {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = true}
    --             } 
    --         },
    --     },
    --     Vehicule = {
    --         {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
    --         {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
    --     },
    --     Coffre = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point =  vector3(-227.510086, -1319.283936, 30.300458),
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
    --         }
    --     },
    --     Garage = {
    --         {   
    --             Type = "car",
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(-219.755250, -1337.834350, 31.301404),
    --             markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
    --             spawnpoint = vector4(-222.189072, -1336.108032, 31.094764, 359.6502380371),
    --         }
    --     },
    --     DeleteVehi = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(-222.322022, -1337.036132, 31.300458),
    --             markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
    --         }
    --     },
    --     Vestiaire = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(-194.197602, -1336.165284, 30.300486),
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
    --         }
    --     },
    -- },
    -- {
        
    --     EmployeeInService = 0,
    --     jobName = "lscustomnord",
    --     jobLabel = "LsCustom Nord",
    --     societyName = "society_lscustomnord",
    --     maxFakeMoney = 5000,
    --     gradeBoss = "boss",
    --     Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
    --     Boss = {
    --         {
    --             makeFakeMoney = true,
    --             percentageMoney = 90,        
    --             point = vector3(1187.304078, 2637.188964, 37.401970), 
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
    --             Option = {
    --                 {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = true}
    --             } 
    --         },
    --     },
    --     Vehicule = {
    --         {label = "Petite dépaneuse (towtruck)", name = "towtruck", price = 12850},
    --         {label = "Grande dépaneuse (flatbed)", name = "flatbed", price = 36950},
    --         {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
    --         {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
    --     },
    --     Coffre = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point =  vector3(1188.600708, 2640.923828, 37.401912),
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
    --         }
    --     },
    --     Garage = {
    --         {   
    --             Type = "car",
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(1171.360840, 2637.527832, 37.806388),
    --             markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
    --             spawnpoint = vector4(1207.257202, 2642.720458, 36.916172, 315.80307006836),
    --         }
    --     },
    --     DeleteVehi = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(1208.662964, 2643.685546, 37.832462),
    --             markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
    --         }
    --     },
    --     Vestiaire = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(1199.682006, 2644.007568, 36.81),
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
    --         }
    --     },
    -- },
    -- {
        
    --     EmployeeInService = 0,
    --     jobName = "garage_cayo",
    --     jobLabel = "Garage Cayo",
    --     societyName = "society_garage_cayo",
    --     maxFakeMoney = 5000,
    --     gradeBoss = "boss",
    --     Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
    --     Boss = {
    --         {
    --             makeFakeMoney = true,
    --             percentageMoney = 90,        
    --             point = vector3(5126.221192, -5140.164550, 1.23), 
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
    --             Option = {
    --                 {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = true}
    --             } 
    --         },
    --     },
    --     Vehicule = {
    --         {label = "Petite dépaneuse (towtruck)", name = "towtruck", price = 12850},
    --         {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
    --         {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
    --     },
    --     Coffre = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point =  vector3(5134.850098, -5131.347656, 1.23),
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
    --         }
    --     },
    --     Garage = {
    --         {   
    --             Type = "car",
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(5136.679688, -5135.382324, 2.133822),
    --             markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
    --             spawnpoint = vector4(5139.954102, -5131.624512, 2.104048, 357.11206054688),
    --         }
    --     },
    --     DeleteVehi = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(5139.954102, -5131.624512, 2.104048),
    --             markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ranger ~s~le ~b~vehicule",
    --         }
    --     },
    --     Vestiaire = {
    --         {
    --             maxMarker = 15,
    --             max3D = 1.5,
    --             point = vector3(5134.592286, -5139.473144, 1.23),
    --             markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
    --             text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
    --         }
    --     },
    -- },
    
    
   
    {
        
        EmployeeInService = 0,
        jobName = "gouvernement",
        jobLabel = "Gouvernement",
        societyName = "society_gouvernement",
        maxFakeMoney = 100000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(-522.10314941406,-195.29689025879,38.218433380127), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false, fisc = true}
                }
            },
        },
        Vehicule = {
            {label = "Alamo", name = "ussssuv2", price = 39450},
            {label = "halfack", name = "halfback2", price = 39850},
            {label = "Watchtower", name = "watchtower2", price = 41500},
            {label = "Roadrunner", name = "roadrunner2", price = 43950},
            {label = "Inaugural", name = "inaugural2", price = 46200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-523.46765136719,-193.20523071289,38.21826171875),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-531.97326660156,-266.78591918945,35.390460968018),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-529.62475585938,-269.17163085938,35.236167907715,111.93244934082),  
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-529.61163330078,-269.26962280273,35.236042022705),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~r~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-540.15161132812,-180.40728759766,38.219272613525),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            },
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-534.78411865234,-192.26249694824,38.219295501709),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        EmployeeInService = 0,
        jobName = "avocat",
        jobLabel = "Avocat",
        societyName = "society_avocat",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(-568.69750976562,-193.99475097656,38.218456268311), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},    
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-566.06311035156,-192.76127624512,38.218242645264),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-531.97326660156,-266.78591918945,35.390460968018),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-529.62475585938,-269.17163085938,35.236167907715,111.93244934082),  
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-529.61163330078,-269.26962280273,35.236042022705),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~r~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-540.15161132812,-180.40728759766,38.219272613525),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            },
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-534.78411865234,-192.26249694824,38.219295501709),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },

    {
        
        EmployeeInService = 0,
        jobName = "burgershot",
        jobLabel = "BurgerShot",
        societyName = "society_burgershot",
        maxFakeMoney = 4000,

        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,
                point = vector3(-1197.5842285156,-893.31915283203,13.886160850525), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Van (speedo)", name = "burrito2t", price = 21500},
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},      
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-1196.5424804688,-901.83837890625,13.886154174805),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1184.6055908203,-905.50518798828,13.383876800537),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-1177.8712158203,-901.10479736328,13.6217212677,302.6257019043),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1180.0950927734,-902.68676757812,13.540420532227),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~r~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(1586.479980, 3768.019288, 34.435814),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            },
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1203.0661621094,-894.17913818359,13.886150360107),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
   
    {
        
        EmployeeInService = 0,
        jobName = "weazelnewz",
        jobLabel = "Weazel Newz",
        societyName = "society_weazelnewz",
        maxFakeMoney = 5000,

        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = false,
                percentageMoney = 90,
                point = vector3(-575.38720703125,-938.46997070312,29.287076950073), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},    
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-559.31799316406,-878.36584472656,25.237331390381),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-539.70556640625,-886.43725585938,25.206295013428),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-536.92431640625,-904.60314941406,23.863342285156,234.17819213867),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-537.56781005859,-904.04962158203,23.862258911133),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~r~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-604.01159667969,-919.24407958984,23.815700531006),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            },
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-603.63861083984,-916.57495117188,23.815700531006),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "agent-immo",
        jobLabel = "Agent Immobilier",
        societyName = "society_agent-immo",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,
                point = vector3(-125.864028, -640.986084, 167.820466), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},      
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(-126.299996, -636.540650, 167.820374),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1368.668580, -481.426880, 31.595576),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(-1371.867432, -480.962830, 31.388056, 7.9145736694336),
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-1371.867432, -480.962830, 31.388056),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~r~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(-132.619568, -632.891296, 167.820466),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
    {
        
        EmployeeInService = 0,
        jobName = "concess_moto",
        jobLabel = "Concess Moto",
        societyName = "society_concess_moto",
        maxFakeMoney = 5000,
        gradeBoss = "boss",
        Webhooks = "https://discord.com/api/webhooks/1144746689282969660/uTjo9NMCC4Sb1hPJhZh2t1AHLR7vBX8GlkFEagsIcze_uDFmJIJntG2Xi5MQLjTfHjBN",
        Boss = {
            {
                makeFakeMoney = true,
                percentageMoney = 90,        
                point = vector3(-873.84045410156,-198.31423950195,37.849552154541), 
                maxMarker = 15,
                max3D = 1.5,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~menu patron",
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                Option = {
                    {armurerie = false, historyBill = true, stockVehicle = true, stockKitRepa = false}
                } 
            },
        },
        Vehicule = {
            {label = "Véhicule employé (oracle)", name = "oracle", price = 24850},
            {label = "Véhicule patron (oracle2)", name = "oracle2", price = 29200},
        },
        Coffre = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point =  vector3(980.606934, -139.254440, 73.061164),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~coffre",
            }
        },
        Garage = {
            {   
                Type = "car",
                Type = "car",
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(965.177978, -108.494934, 74.363732),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 40, g = 190, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~garage",
                spawnpoint = vector4(959.031982, -113.023902, 74.157662, 224.6063079834)
            }
        },
        DeleteVehi = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(959.031982, -113.023902, 74.157662),
                markerType = 36, sizeX = 0.5, sizeY = 0.5,  sizeZ = 0.5, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 255, g = 0, b = 0, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~r~ranger ~s~le ~b~vehicule",
            }
        },
        Vestiaire = {
            {
                maxMarker = 15,
                max3D = 1.5,
                point = vector3(992.264832, -135.290436, 73.061470),
                markerType = 27, sizeX = 0.5, sizeY = 0.5,  sizeZ = 1.0, rotX = 0.0, rotY = 0.0, rotX = 0.0, r = 249, g = 130, b = 42, a = 55555,
                text = "Appuyer ~b~[E] ~s~pour ~g~ouvrir ~s~le ~b~vestiaire",
            }
        },
    },
}


Pnj = {
    {
       buttonCall = 'Appeler un agent du LSPD',
       Job = "police",
       point = vec3(442.783539, -981.855286, 30.689505),
       text = "Appuyer ~b~[E] ~s~pour ~g~appeler~s~ un agent du ~b~LSPD",
       sendInfoWebhooks = "https://discord.com/api/webhooks/1083366902530842655/jHkFTO2EZh2JVblFgndd0EZpRZ6WOnPPHoLTy_jycfxqMQArwTr6ueWzRDn7oNqfhkUS",
    },
    {
       buttonCall = 'Appler un agent de la LSSD',
       Job = "lssd",
       point = vector3(-448.237030, 6014.048828, 32.288662),
       text = "Appuyer ~b~[E] ~s~pour ~g~appeler~s~ un agent de la ~b~LSSD",
       sendInfoWebhooks = "https://discord.com/api/webhooks/1083366902530842655/jHkFTO2EZh2JVblFgndd0EZpRZ6WOnPPHoLTy_jycfxqMQArwTr6ueWzRDn7oNqfhkUS",
    },
    {
       buttonCall = 'Appler un agent de la LSSD',
       Job = "lssd",
       point = vector3(1831.411622, 3681.363038, 34.335866),
       text = "Appuyer ~b~[E] ~s~pour ~g~appeler~s~ un agent de la ~b~LSSD",
       sendInfoWebhooks = "https://discord.com/api/webhooks/1083366902530842655/jHkFTO2EZh2JVblFgndd0EZpRZ6WOnPPHoLTy_jycfxqMQArwTr6ueWzRDn7oNqfhkUS",
    },
}