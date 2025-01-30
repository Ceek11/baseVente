local openPharmacie = false 
menuPharmacie = RageUI.CreateMenu("Pharmacie", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuPharmacie.Closed = function()
    openPharmacie = false 
end

function openPharmacieMenu()
    print("mmmmmm")
    if openPharmacie then 
        openPharmacie = false 
        RageUI.Visible(menuPharmacie, false)
        return 
    else
        openPharmacie = true
        RageUI.Visible(menuPharmacie, true)
        CreateThread(function()
            while openPharmacie do 
                RageUI.IsVisible(menuPharmacie, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    RageUI.Separator(Translation.Pharmacie["heal_available"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(Translation.Pharmacie["button_heal_complet"], (Translation.Pharmacie["desc_buy_heal"]):format(Cfg.PriceHeal), {RightLabel = ("~g~%s$~s~→→"):format(Cfg.PriceHeal)}, true, {
                        onSelected = function()
                            local maxHeal = GetEntityHealth(PlayerPedId())
                            if maxHeal >= 200 then 
                                cNotification("Vous êtes déjà full vie")
                            else 
                                TriggerServerEvent("fCore:Pharmacie:BuyHeal")
                                SetEntityHealth(PlayerPedId(), 200.0)
                            end
                        end
                    })
                end)
                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end