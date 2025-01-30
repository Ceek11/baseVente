openF6Global = false 
menuF6Global = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
PositionF6Global = RageUI.CreateSubMenu(menuF6Global," ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
AnnonceF6Global = RageUI.CreateSubMenu(menuF6Global," ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuF6Global.Closed = function()
    openF6Global = false 
end

function openMenuF6Global(jobName)
    if openF6Global then 
        openF6Global = false 
        RageUI.Visible(menuF6Global, false)
        return
    else
        openF6Global = true 
        RageUI.Visible(menuF6Global, true)
        CreateThread(function()
            while openF6Global do 
                RageUI.IsVisible(menuF6Global, function()
                    RageUI.Separator("↓ ~b~Options de l'entreprise~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Faire une facture", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                local bill = Visual.KeyboardNumber("Choisire le montant de la facture", "", 5)
                                if not tonumber(bill) then
                                    cNotification("Entrer un nombre valide", "Action", "rouge") 
                                else
                                    local raison = Visual.KeyboardText("Choisir la raison de la facture", "", 40)
                                    if raison == " " or raison == nil or raison == "" then 
                                        raison = "Aucune"
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(targetT), "society_"..jobName, jobName, bill)
                                        TriggerServerEvent("fCore:Billing:HistoryBilling", GetPlayerServerId(targetT), raison, bill, jobName, "society_"..jobName)
                                        cNotification("Vous venez d'envoyer la facture", "Action", "vert")
                                    else
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(targetT), "society_"..jobName, jobName, bill)
                                        TriggerServerEvent("fCore:Billing:HistoryBilling", GetPlayerServerId(targetT), raison, bill, jobName, "society_"..jobName)
                                        cNotification("Vous venez d'envoyer la facture", "Action", "vert")
                                    end
                                return
                                end
                            end
                        end
                    })
                    RageUI.Button("Faire une Annonce", nil, {RightLabel = "→→"}, true, {}, AnnonceF6Global)
                    RageUI.Button("Position GPS", nil, {RightLabel = "→→"}, true, {}, PositionF6Global)
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("~r~Prendre ma démission", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local Confirmation = Visual.KeyboardText("êtes vous sur ? Oui / Non", "Oui / Non", 10)
                            if Confirmation == "Oui" then 
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
                RageUI.IsVisible(PositionF6Global, function()
                    RageUI.Separator("↓ ~b~Positions GPS~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(MenuF6.Global.Position) do 
                        if k == jobName then 
                            for _, pos in pairs(v) do 
                                RageUI.Button(pos.button, pos.desc, {RightLabel = "→"}, true, {
                                    onSelected = function()
                                        SetNewWaypoint(pos.pos)
                                    end
                                })
                            end
                        end
                    end
                end)
                RageUI.IsVisible(AnnonceF6Global, function()
                    RageUI.Separator("↓ ~b~Annonces~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(MenuF6.Global.Annonce) do
                        RageUI.Button(v.label, nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:menuF6:Annonce", v.message, jobName)
                            end
                        })
                    end
                    RageUI.Button("Annonce personalisé", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            local AnnouncePerso = Visual.KeyboardText("Choissisez le message", "", 100)
                            if AnnouncePerso ~= " " and AnnouncePerso ~= "" or AnnouncePerso ~= nil then 
                                TriggerServerEvent("fCore:MenuF6:SendAnnouncePersonalized", AnnouncePerso, jobName)
                            end
                        end
                    })
                end)
                Wait(0)
            end
        end)
    end
end



function revivePlayer(targetT)
    local playerPed = GetPlayerPed(GetPlayerFromServerId(id))
    if DoesEntityExist(playerPed) then
        StopScreenEffect('DeathFailOut')
        ClearPedTasksImmediately(playerPed)
        local coords = GetEntityCoords(playerPed)
        SetEntityCoords(playerPed, coords.x, coords.y, coords.z + 0.5, false, false, false, false)
        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z + 0.5, 0, true, false)
        SetPlayerInvincible(GetPlayerFromServerId(id), false)
        SetEntityInvincible(playerPed, false)
        SetEntityVisible(playerPed, true)
    end
end