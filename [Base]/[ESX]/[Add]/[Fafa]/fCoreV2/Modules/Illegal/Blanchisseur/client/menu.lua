local openBlanchisseur = false 
menuBlanchisseur = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuBlanchisseur.Closed = function()
    openBlanchisseur = false 
end

function openMenuBlanchisseur()
    stats = true
    getInformationPlayer()
    if openBlanchisseur then 
        openBlanchisseur = false 
        RageUI.Visible(menuBlanchisseur, false)
    else
        openBlanchisseur = true
        RageUI.Visible(menuBlanchisseur, true)
        CreateThread(function()
            while openBlanchisseur do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuBlanchisseur, function()
                    for _, info in ipairs(informationPlayer) do 
                        local expiration = info.expiration or "Maintenant"
                        if info.expiration ~= nil then 
                            stats = false
                        else
                            stats = true
                        end
                        RageUI.Separator((TranslationIllegal.Blanchiment["CanWhiten"]):format(expiration))
                        RageUI.Separator(TranslationIllegal.Blanchiment["WhitenFee"])
                        RageUI.Separator((TranslationIllegal.Blanchiment["DirtyMoney"]):format(info.black_money))
                        RageUI.Line("color", 19, 107, 190)
                        RageUI.Button(TranslationIllegal.Blanchiment["WhitenMoney"], TranslationIllegal.Blanchiment["MaxWhitenAmount"], {RightLabel = "→→"}, stats, {
                            onSelected = function()
                                local sumFakeMoney = Visual.KeyboardNumber(TranslationIllegal.Blanchiment["EnterWhitenAmount"], "", 10)
                                if tonumber(sumFakeMoney) then 
                                    if sumFakeMoney <= 10000 then 
                                        TriggerServerEvent("fCore:Blanchisseur:makeFakeMoney", sumFakeMoney)
                                        ESX.SetTimeout(100,function()
                                            getInformationPlayer()
                                        end)
                                    else
                                        cNotification(TranslationIllegal.Blanchiment["MaxAmountExceeded"])
                                    end
                                else
                                    cNotification(TranslationIllegal.Blanchiment["InvalidAmount"])
                                end
                            end
                        })
                    end
                end)
                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end