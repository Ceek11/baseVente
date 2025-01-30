openF6PoleEmploi = false 
menuF6PoleEmploi = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
PositionF6PoleEmploi = RageUI.CreateSubMenu(menuF6PoleEmploi," ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuF6PoleEmploi.Closed = function()
    openF6PoleEmploi = false 
end

function openMenuF6PoleEmploi(valeur)
    if openF6PoleEmploi then 
        openF6PoleEmploi = false 
        RageUI.Visible(menuF6PoleEmploi, false)
        return
    else
        openF6PoleEmploi = true 
        RageUI.Visible(menuF6PoleEmploi, true)
        CreateThread(function()
            while openF6PoleEmploi do 
                RageUI.IsVisible(menuF6PoleEmploi, function()
                    RageUI.Separator("↓ ~b~Options de l'entreprise~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Position GPS", nil, {RightLabel = "→→"}, true, {}, PositionF6PoleEmploi)
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("~r~Prendre ma démission", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local Confirmation = Visual.KeyboardText("êtes vous sur ? Oui / Non", "Oui / Non", 10)
                            if Confirmation == "Oui" then 
                                openF6PoleEmploi = false 
                                RageUI.CloseAll()
                                TriggerServerEvent("fCore:Boss:resignation")
                                cNotification("Vous venez de quitter votre job")
                            else
                                cNotification("~r~Vous avez annuler")
                            end
                        end
                    })
                end)
                RageUI.IsVisible(PositionF6PoleEmploi, function()
                    for k,v in pairs(MenuF6.PoleEmploi.Position) do 
                        if k == valeur then 
                            for _, pos in pairs(v) do 
                                RageUI.Button(pos.button, pos.desc, {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                        SetNewWaypoint(pos.pos)
                                    end
                                })
                            end
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end

