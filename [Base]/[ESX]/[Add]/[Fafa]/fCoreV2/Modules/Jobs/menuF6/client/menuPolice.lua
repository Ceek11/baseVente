openMenuF6Police = false 
menuF6Police = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
InteractionCitoyenPolice = RageUI.CreateSubMenu(menuF6Police, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuAmendePolice = RageUI.CreateSubMenu(InteractionCitoyenPolice, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuDeleteLicense = RageUI.CreateSubMenu(InteractionCitoyenPolice, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)

MenuFouille = RageUI.CreateSubMenu(InteractionCitoyenPolice, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
InteractionRadioPolice = RageUI.CreateSubMenu(menuF6Police, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
AnnonceLSPD = RageUI.CreateSubMenu(menuF6Police, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
InteractionVehiculePolice = RageUI.CreateSubMenu(menuF6Police, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuCallPolice = RageUI.CreateSubMenu(menuF6Police, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuAppelCentral = RageUI.CreateSubMenu(subMenuCallPolice, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuGestionAppelCentral = RageUI.CreateSubMenu(subMenuAppelCentral, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuAmendePolice = RageUI.CreateSubMenu(InteractionCitoyenPolice, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuF6Police.Closed = function()
    openMenuF6Police = false
end

local service = false
local IndexSecteur = 1
local IndexInteraction = 1
local CheckedPuce = false
local secteurs = {"Sandy Shore", "Centre ville"}
local indexVehi = 1
local IndexLicense = 1
local labelLicense = {}
local TypeLicense = {}
function MenuF6openPolice(valeur)
    _PoliceJob:GetInfoSalary()
    _PoliceJob:GetFilType()
    if openMenuF6Police then 
        openMenuF6Police = false
        RageUI.Visible(menuF6Police, false)
    else
        openMenuF6Police = true 
        RageUI.Visible(menuF6Police, true)
        CreateThread(function()
            while openMenuF6Police do 
                DisableControlAction(1, 51, true)
                RageUI.IsVisible(menuF6Police, function()
                    RageUI.Separator("↓ ~b~Option du métier ~s~↓")
                    RageUI.Line("color", 249, 130,42)
                    RageUI.Button("Interaction Citoyen", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            for k,v in pairs(License) do 
                                table.insert(labelLicense, v.label)
                                table.insert(TypeLicense, v.Type)
                            end
                        end
                    }, InteractionCitoyenPolice)
                    RageUI.Button("Interaction véhicule", nil, {RightLabel = "→"}, true, {}, InteractionVehiculePolice)
                    RageUI.Button("Code Radio", nil, {RightLabel = "→"}, true, {}, InteractionRadioPolice)
                    RageUI.Button("Annonce", nil, {RightLabel = "→"}, true, {}, AnnonceLSPD)
                    RageUI.Button("Les appels", nil, {RightLabel = "→"}, true, {}, subMenuCallPolice)
                    RageUI.Line("color", 249, 130,42)
                    RageUI.Button("~r~Prendre ma démission", nil, {}, true, {
                        onSelected = function()
                            local Confirmation = Visual.KeyboardText("êtes vous sur ? Oui / Non", "Oui / Non", 10)
                            if Confirmation == "Oui" then 
                                TriggerServerEvent("fCore:Boss:resignation")
                            else
                                cNotification("~r~Vous avez annuler")
                            end
                        end
                    })
                end)
                RageUI.IsVisible(subMenuCallPolice, function()
                    RageUI.Separator("↓ ~b~Liste des appels ~s~↓")
                    RageUI.Line("color", 249, 130,42)
                    RageUI.Button("Appels central", nil, {}, true, {}, subMenuAppelCentral)
                end)
                RageUI.IsVisible(AnnonceLSPD, function()
                    RageUI.Separator("↓ ~b~Annonces~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(MenuF6.Mecano.Annonce) do
                        RageUI.Button(v.label, nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:menuF6:Annonce", v.message, valeur)
                            end
                        })
                    end
                    RageUI.Button("Annonce personalisé", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            local AnnouncePerso = Visual.KeyboardText("Choissisez le message", "", 100)
                            if AnnouncePerso ~= " " and AnnouncePerso ~= "" or AnnouncePerso ~= nil then 
                                TriggerServerEvent("fCore:MenuF6:SendAnnouncePersonalized", AnnouncePerso, valeur)
                            end
                        end
                    })
                end)
                RageUI.IsVisible(subMenuAppelCentral, function()
                    if #TableAppelsCentral >= 1 then 
                        for k, v in ipairs(TableAppelsCentral) do
                            RageUI.Button("Individu : "..v.name, nil, {}, true, {
                                onSelected = function()
                                    raison = v.raison
                                    pos = v.pos
                                    id = k
                                end
                            }, subMenuGestionAppelCentral)
                        end
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~Il n'y a aucun appel central")
                        RageUI.Separator("")
                    end
   
                end)
                RageUI.IsVisible(subMenuGestionAppelCentral, function()
                    RageUI.Separator("↓ ~b~↓Appel au PDP~s~ ↓")
                    RageUI.Line("color", 249, 130,42)
                    RageUI.Button("~g~Accepter", ("Raison : %s"):format(raison), {}, true, {
                        onSelected = function()
                            blipsAppel(pos, "Appel Central")
                        end
                    })
                    RageUI.Button("~r~Suprimer", nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("DeleteAppelsCentral", id)
                            table.remove(TableAppelsCentral, id)
                        end
                    },subMenuAppelCentral)
                end)

                RageUI.IsVisible(InteractionCitoyenPolice, function()
                    RageUI.Separator("↓ ~b~Interaction citoyen ~s~↓")
                    RageUI.Line("color", 249, 130,42)
                    RageUI.Button("Amende", nil, {RightLabel = "→"}, true, {}, menuAmendePolice)
                    RageUI.Button("Fouiller", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                getItem(GetPlayerServerId(targetT))
                            end
                        end
                    }, MenuFouille)
                    RageUI.Line("color", 249, 130,42)
                    RageUI.Button("Menotter / démenotter", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                TriggerServerEvent('fCore:Police:handcuff', GetPlayerServerId(targetT))
                            end
                        end
                    })
                    RageUI.Button("Escorter", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                TriggerServerEvent('fCore:Police:drag', GetPlayerServerId(targetT))
                            end
                        end
                    })
                    RageUI.Button("Mettre dans un véicule", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                TriggerServerEvent('fCore:Police:putInVehicle', GetPlayerServerId(targetT))
                            end
                        end
                    })
                    RageUI.Button("Sortir la personne du véicule", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                TriggerServerEvent('fCore:Police:OutVehicle', GetPlayerServerId(targetT))
                            end
                        end
                    })
                    RageUI.Line("color", 249, 130,42)
                    RageUI.Button("Donner le PPA", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                TriggerServerEvent("fCore:Police:givePpa", GetPlayerServerId(targetT), LicensePpa)
                            end
                        end
                    })
                    RageUI.List("Retirer une license", labelLicense, IndexLicense, nil, {}, true, {
                        onListChange = function(Index, Items)
                            IndexLicense = Index
                        end,
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                local input = lib.inputDialog("Etes vous sur ?", {{type = 'input', "Retrier la license", required = true},})
                                if input then 
                                    if input[1] == "oui" then
                                        TriggerServerEvent("fCore:Police:wipeLicense", GetPlayerServerId(targetT), TypeLicense[IndexLicense])
                                    end
                                end
                            end
                        end
                    })
                    RageUI.Button("Voir les amendes non payer", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                _PoliceJob:checkAmendes(GetPlayerServerId(targetT))
                            end
                        end
                    }, subMenuAmendePolice)
                end)                
                RageUI.IsVisible(MenuFouille, function()
                    if inventoryLoad then 
                        if #inventory > 0 then 
                            for k,v in pairs(inventory) do 
                                RageUI.Button(("[~b~x%s~s~] - %s"):format(v.count, v.label), nil, {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                        targetT = GetNearbyPlayer(false, true)
                                        local input = lib.inputDialog("Enelever des objets", {
                                            {type = 'number', label = "Enelever des objets", icon = 'hashtag'},
                                        })
                                        if input then
                                            if tonumber(input[1]) <= v.count then 
                                                TriggerServerEvent("fCore:Police:withdrawItem", input[1], v.name, GetPlayerServerId(targetT))
                                                SetTimeout(200, function()
                                                    getItem(GetPlayerServerId(targetT))
                                                end)
                                            end
                                        end    
                                    end
                                })
                            end
                        else
                            RageUI.Separator("")
                            RageUI.Separator("~r~Il n'y à rien dans l'inventaire")
                            RageUI.Separator("")
                        end
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~L'inventaire n'est pas charger")
                        RageUI.Separator("")
                    end
                end)
                RageUI.IsVisible(subMenuAmendePolice, function()
                    if checkAmendes then 
                        if #infoAmendesInBdd > 0 then 
                            for k,v in pairs(infoAmendesInBdd) do
                                RageUI.Button(v.label, nil, {}, true, {})
                            end
                        else
                            RageUI.Separator("")
                            RageUI.Separator("~r~Aucune amendes")
                            RageUI.Separator("")
                        end
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~Personne dans les alentours")
                        RageUI.Separator("")
                    end
                end)
                RageUI.IsVisible(InteractionRadioPolice, function()
                    RageUI.Separator("↓ ~b~Code radio ~s~↓")
                    RageUI.Line("color", 249, 130,42)
                    RageUI.List("Secteur : ", secteurs, IndexSecteur, nil, {}, true, {
                        onListChange = function(Index, Items)
                            IndexSecteur = Index
                        end,
                    })
                    RageUI.Separator(("Votre secteur est : ~g~%s"):format(secteurs[IndexSecteur]))
                    RageUI.Line("color", 249, 130,42)
                    RageUI.List("Type d'intéraction : ", {"Etat de service", "Interaction"}, IndexInteraction, nil, {}, true, {
                        onListChange = function(Index, Items)
                            IndexInteraction = Index
                        end
                    })
                    RageUI.Line("color", 249, 130,42)
                    if IndexInteraction == 1 then 
                        RageUI.Button("Prise de service", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:Police:CodeRadio", "Prise de service", "10-8", secteurs[IndexSecteur], valeur)
                            end
                        })
                        RageUI.Button("Pause de service", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:Police:CodeRadio", "Pause de service", "10-8", secteurs[IndexSecteur], valeur)
                            end
                        })
                        RageUI.Button("Fin de service", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:Police:CodeRadio", "Fin de service", "10-8", secteurs[IndexSecteur], valeur)
                            end
                        })
                    elseif IndexInteraction == 2 then 
                        RageUI.Button("Refus d'optempérer", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent('fCore:Police:renfort', GetEntityCoords(PlayerPedId()), "Refus d'optempérer", valeur)
                            end
                        })
                        RageUI.Button("Control en cours", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent('fCore:Police:renfort', GetEntityCoords(PlayerPedId()), "Control en cours")
                            end
                        })
                        RageUI.Button("Fusillade en cours", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent('fCore:Police:renfort', GetEntityCoords(PlayerPedId()), "Fusillade en cours", valeur)
                            end
                        })
                        RageUI.Button("Demande de renfort", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent('fCore:Police:renfort', GetEntityCoords(PlayerPedId()), "Demande de renfort", valeur)
                            end
                        })
                    end
                end)
                RageUI.IsVisible(InteractionVehiculePolice, function()
                    RageUI.Separator("↓ ~b~Action véhicule~s~ ↓")
                    RageUI.Line("color", 249, 130,42)
                    RageUI.Button("Rechercher une plaque", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            local plate = Visual.KeyboardText("Noter la plaque d'imatriculation", "", 10)
                            if plate ~= nil or plate ~= "" or plate ~= " " then 
                                TriggerServerEvent("fCore:Police:searchPlateInBdd", plate)
                            else
                                cNotification("Vous n'avez pas donner de bon valeur pour la plaque")
                            end
                        end
                    })
                    RageUI.Button("Mettre en fourrière", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            ImpoundVehicle()
                        end
                    })
                    RageUI.Button("Crocheter le véhicule", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            CrochetVehicle()
                        end
                    })
                    RageUI.Line("color", 249, 130,42)
                    RageUI.Button("Poser/Prendre Radar", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            TriggerEvent('fCore:Police:radarPolice')
                        end
                    })
                end)
                RageUI.IsVisible(menuAmendePolice, function()
                    for k,v in pairs(fillTypeInBdd) do 
                        RageUI.Button(v.label, nil, {}, true, {
                            onSelected = function()
                                if not targetT then return end 
                                if targetT then 
                                    TriggerServerEvent("fCore:Police:AddAmende", GetPlayerServerId(targetT), ESX.PlayerData.job.name, v.label, v.amount)
                                end
                            end
                        })
                    end
                end)
                Wait(0)
            end
        end)
    end
end

TableAppelsCentral = {}
RegisterNetEvent("SendAppelCentral")
AddEventHandler("SendAppelCentral", function(appels)
    TableAppelsCentral = appels
end)
