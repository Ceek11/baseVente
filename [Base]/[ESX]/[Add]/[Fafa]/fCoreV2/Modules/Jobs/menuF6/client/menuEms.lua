openAmbulance = false 
menuF6Ambulance = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuHeal = RageUI.CreateSubMenu(menuF6Ambulance, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuGeneral = RageUI.CreateSubMenu(menuF6Ambulance, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuRenfort = RageUI.CreateSubMenu(menuF6Ambulance, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuHistoriqueEms = RageUI.CreateSubMenu(menuF6Ambulance, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuAppelEms = RageUI.CreateSubMenu(subMenuHistoriqueEms, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuOperation = RageUI.CreateSubMenu(menuF6Ambulance, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuF6Ambulance.Closed = function()
    openAmbulance = false 
end

local secteurs = {"Sandy Shore", "Centre ville"}
local IndexSecteur = 1
local IndexInteraction = 1

function MenuF6openAmbulance(v)
    if openAmbulance then 
        openAmbulance = false 
        RageUI.Visible(menuF6Ambulance, false)
        return
    else 
        openAmbulance = true 
        RageUI.Visible(menuF6Ambulance, true)
        CreateThread(function()
            while openAmbulance do 
                RageUI.IsVisible(menuF6Ambulance, function()
                    RageUI.Button("Historique des appels", nil, {}, true, {
                        onSelected = function()
                            GetDistressSignal()
                        end
                    }, subMenuHistoriqueEms)
                    RageUI.Button("Général", nil, {}, true, {}, subMenuGeneral)
                    RageUI.Button("Soigner", nil, {}, true, {}, subMenuHeal)
                    RageUI.Button("Renforts", nil, {}, true, {},subMenuRenfort)
                    if v == "hopital_cayo" then 
                        RageUI.Button("Opération", nil, {}, true, {}, subMenuOperation)
                    end
                    RageUI.Button("~r~Prendre ma démission", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local Confirmation = lib.inputDialog("êtes vous sur ? Oui / Non", {"Oui / Non"})
                            if Confirmation[1] == "Oui" then 
                                openF6Global = false 
                                RageUI.CloseAll()
                                TriggerServerEvent("fCore:Boss:resignation")
                                cNotification("Vous venez de quitter votre job", "Action", "vert")
                            else
                                cNotification("~r~Vous avez annuler", "Action", "rouge")
                            end
                        end
                    })
                end)
                RageUI.IsVisible(subMenuOperation, function()
                    for k,v in pairs(MenuF6.Ambulance.hopital_cayo) do     
                        RageUI.Button(("Prélever %s"):format(v.label), nil, {}, true, {
                            onSelected = function()
                                targetT = GetNearbyPlayer(false, true)
                                if not targetT then return end 
                                if targetT then 
                                    if IsPlayerDead(targetT) then
                                        TriggerServerEvent("fCore:Hopital_cayo:takeHumanBody", GetPlayerServerId(targetT), v.item, v.count, v.label)   
                                    else
                                        cNotification("La personne n'est pas morte, vous ne pouvez rien prélever", "Action", "rouge")
                                    end
                                end
                            end
                        })
                    end
                end)
                RageUI.IsVisible(subMenuHistoriqueEms, function()
                    RageUI.Button("Effacer les appels", nil, {}, true, {
                        onSelected = function()
                            SignalEms = {}
                        end
                    })
                    RageUI.Line("color", 19, 107, 190)
                    if loadSignalEms then 
                        for k,v in pairs(SignalEms) do 
                            RageUI.Button(("[Patient : %s] - Numéro : %s"):format(v.name, k), nil, {}, true, {
                                onSelected = function()
                                    coords = v.coords
                                    id = k
                                end
                            }, subMenuAppelEms)
                        end
                    end
                end)
                RageUI.IsVisible(subMenuAppelEms, function()
                    RageUI.Button("Accepter l'appel", nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("fCore:EMS:DeleteCall", id)
                            SetNewWaypoint(coords.x, coords.y)
                            table.remove(SignalEms, id)
                        end
                    })
                    RageUI.Button("Refuser l'appel", nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("fCore:EMS:DeleteCall", id)
                            table.remove(SignalEms, id)
                        end
                    })
                end)
                RageUI.IsVisible(subMenuGeneral, function()
                    RageUI.Button("Mettre une facture", nil, {}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then
                                local input = lib.inputDialog("Choisire le montant de la facture", {{{type = 'number', label = "Choisire le montant de la facture", icon = 'hashtag'}}})
                                if not input then
                                    cNotification("Entrer un nombre valide", "Action", "rouge") 
                                else
                                    local raison = lib.inputDialog("Choisir la raison de la facture", {"Choisir la raison de la facture"})
                                    if raison then 
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(targetT), "society_"..v, v, input[1])
                                        TriggerServerEvent("fCore:Billing:HistoryBilling", GetPlayerServerId(targetT), raison[1], input[1], v, "society_"..v)
                                        cNotification("Vous venez d'envoyer la facture", "Action", "vert")
                                    else
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(targetT), "society_"..v, v, input[1])
                                        TriggerServerEvent("fCore:Billing:HistoryBilling", GetPlayerServerId(targetT), raison[1], input[1], v, "society_"..v)
                                        cNotification("Vous venez d'envoyer la facture", "Action", "vert")
                                    end
                                return
                                end
                            end
                        end
                    })
                    RageUI.Button("Facture automatique - Réanimation", nil, {}, true, {
                        onSelected = function()
                            giveBilling(v, "Réanimation", 500)
                        end
                    })
                    RageUI.Button("Facture automatique - Petit soin", nil, {}, true, {
                        onSelected = function()
                            giveBilling(v, "Petit soin", 500)
                        end
                    })
                    RageUI.Button("Facture automatique - Gros soin", nil, {}, true, {
                        onSelected = function()
                            giveBilling(v, "Gros soin", 500)
                        end
                    })
                    RageUI.Button("Facture automatique - Déplacement", nil, {}, true, {
                        onSelected = function()
                            giveBilling(v, "Déplacement", 500)
                        end
                    })
                    RageUI.Button("Facture automatique - Déplacement", nil, {}, true, {
                        onSelected = function()
                            giveBilling(v, "Déplacement", 500)
                        end
                    })
                    RageUI.Button("Facture automatique - Déplacement", nil, {}, true, {
                        onSelected = function()
                            giveBilling(v, "Déplacement", 500)
                        end
                    })
                end)
                RageUI.IsVisible(subMenuHeal, function()
                    RageUI.Button("Réanimer", nil, {}, true, {
                        onSelected = function()
                        targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                local health = GetEntityHealth(GetPlayerPed(targetT))
                                if health == 0 then 
                                    TriggerServerEvent("fCore:revive", GetPlayerServerId(targetT))
                                else
                                    cNotification("Le joueur n'est pas mort")
                                end
                            end
                        end
                    })
                    RageUI.Button("Soigner petites blessures", nil, {}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                TriggerServerEvent("fCore:ambulance:heal", GetPlayerServerId(targetT), 25)
                            end
                        end
                    })
                    RageUI.Button("Soigner grosse blessures", nil, {}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                TriggerServerEvent("fCore:ambulance:heal", GetPlayerServerId(targetT), 75)
                            end
                        end
                    })
                end)
                RageUI.IsVisible(subMenuRenfort, function()
                    RageUI.List("Secteur : ", secteurs, IndexSecteur, nil, {}, true, {
                        onListChange = function(Index, Items)
                            IndexSecteur = Index
                        end,
                    })
                    RageUI.Separator(("Votre secteur est : ~g~%s"):format(secteurs[IndexSecteur]))
                    RageUI.Line("color", 249, 130,42)
                    RageUI.List("Type d'intéraction : ", {"Etat de service", "Renfort", "Annonce"}, IndexInteraction, nil, {}, true, {
                        onListChange = function(Index, Items)
                            IndexInteraction = Index
                        end
                    })
                    if IndexInteraction == 1 then 
                        RageUI.Button("Prise de service", nil, {RightLabel = "→"}, true, {
                            onSelected = function()

                            end
                        })
                        RageUI.Button("Pause de service", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                            end
                        })
                        RageUI.Button("Fin de service", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                            end
                        })       
                    elseif IndexInteraction == 2 then 
                        RageUI.Button("Demande de renforts : Ambulance", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                
                            end
                        })
                        RageUI.Button("Demande de renforts : Hélocoptère", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                            end
                        })
                    elseif IndexInteraction == 3 then 
                        RageUI.Button(("Hopital %s ouvert"):format(secteurs[IndexSecteur]), nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                            end
                        })
                        RageUI.Button(("Hopital %s Fermer"):format(secteurs[IndexSecteur]), nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                            end
                        })
                    end
                end)
                Wait(0)
            end
        end)
    end
end



function giveBilling(jobName, raison, bill)
    targetT = GetNearbyPlayer(false, true)
    if not targetT then return end 
    if targetT then 
        if not tonumber(bill) then
            cNotification("Entrer un nombre valide", "Action", "rouge") 
        else
            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(targetT), "society_"..jobName, jobName, bill)
            TriggerServerEvent("fCore:Billing:HistoryBilling", GetPlayerServerId(targetT), raison, bill, jobName, "society_"..jobName)
            cNotification("Vous venez d'envoyer la facture", "Action", "vert")
        end
    end
end

