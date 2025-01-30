local openVenteIllegal = false 
menuVenteIllegal = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuVenteIllegal.Closed = function()
    openVenteIllegal = false
    VenteIllegal.PercentResell = 0
    PercentStatsResell = false
end


function openMenuVenteIllegal(valeur)
    if openVenteIllegal then 
        openVenteIllegal = false 
        RageUI.Visible(menuVenteIllegal, false)
        return
    else
        openVenteIllegal = true 
        RageUI.Visible(menuVenteIllegal, true)
        CreateThread(function()
            while openVenteIllegal do 
                RageUI.IsVisible(menuVenteIllegal, function()
                    RageUI.Separator(TranslationIllegal.VenteIllegal["Titre"])
                    RageUI.Line("color", 19, 107, 190) 
                    for k,v in pairs(valeur.ItemResel) do
                        RageUI.Button(v.label, nil, {RightLabel = (TranslationIllegal.VenteIllegal["Prix"]):format(v.price)}, true, {
                            onSelected = function()
                                VenteIllegal.PercentResell = 0
                                name = v.name 
                                price = v.price
                                PercentStatsResell = true
                            end
                        })
                    end
                    if PercentStatsResell then 
                        RageUI.PercentagePanel(VenteIllegal.PercentResell, (TranslationIllegal.VenteIllegal["ReventeEnCours"]):format(math.floor(VenteIllegal.PercentResell*100)), ' ', ' ', {})
                        if VenteIllegal.PercentResell < 1.0 then 
                            VenteIllegal.PercentResell = VenteIllegal.PercentResell + VenteIllegal.speedFarm
                        else
                            print(name)
                            VenteIllegal.PercentResell = 0
                            TriggerServerEvent("fCore:venteIllegal:addItem", name, price, valeur.typeMoney)
                            anim(PlayerPedId(), 'random@domestic', 'pickup_low')
                            VenteIllegal.PercentResell = 0
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end