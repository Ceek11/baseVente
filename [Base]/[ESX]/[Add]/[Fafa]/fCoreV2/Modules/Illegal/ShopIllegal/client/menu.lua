local openShopIllegal = false 
menuShopIllegal = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuShopIllegal.Closed = function()
    openShopIllegal = false 
end

function openMenuShopIllegal(weapon, valeur)
    local hasVip = false
    local loadInfo = false
    ESX.TriggerServerCallback("fCore:vip:GetIfHaveVip", function(result)
        hasVip = result 
        loadInfo = true
    end)
    while not loadInfo do 
        Wait(10)
    end
    getInformationVenteDarme(valeur.shop)
    if openShopIllegal then 
        openShopIllegal = false 
        RageUI.Visible(menuShopIllegal, false)
        return
    else
        openShopIllegal = true 
        RageUI.Visible(menuShopIllegal, true)
        CreateThread(function()
            while openShopIllegal do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuShopIllegal, function()
                    if not valeur.WeaponIllimited then 
                        for _, info in pairs(InformationVenteDarme) do
                            local separator = valeur.separator
                            local expiration = info.expiration
                            RageUI.Separator(separator)
                            RageUI.Line("color", 19, 107, 190) 
                            if expiration == nil and valeur.shop ~= info.shop then 
                                RageUI.Separator((TranslationIllegal.ShopIllegal["AchatPossible"]):format(valeur.maxWeapon)) 
                                RageUI.Line("color", 19, 107, 190)  

                                for _,v in pairs(weapon) do 
                                    -- Vérifier la condition pour afficher l'arme
                                    if (hasVip and v.vip) or (not v.vip) then
                                        local items = {}
                                        for i = 1, v.maxList do
                                            table.insert(items, i)
                                        end
                                        RageUI.List(v.label.." | Prix : ~r~"..v.price*v.Index.."$", items, v.Index, "Acheter ~b~x"..v.Index.."~s~ "..string.lower(v.label).." pour le prix de "..v.price*v.Index.."$~s~", {}, true, {
                                            onListChange = function(Items, Index)
                                                v.Index = Index
                                            end,
                                            onSelected = function()
                                                TriggerServerEvent("fCore:ShopIllegal:BuyWeapon", "first", v.price, v.name, v.Index, info.number, valeur.shop, valeur.point)
                                                ESX.SetTimeout(100,function()
                                                    getInformationVenteDarme(valeur.shop)
                                                end)
                                            end
                                        })
                                    end
                                end   
                            else
                                RageUI.Separator((TranslationIllegal.ShopIllegal["AchatPossibleArmes"]):format(valeur.maxWeapon - info.number))
                                RageUI.Separator((TranslationIllegal.ShopIllegal["ResetCompteur"]):format(expiration))
                                RageUI.Line("color", 19, 107, 190)         
                                for _,v in pairs(weapon) do 
                                    if (hasVip and v.vip) or (not v.vip) then
                                        local items = {}
                                        for i = 1, v.maxList do
                                            table.insert(items, i)
                                        end
                                        RageUI.List(v.label.." | Prix : ~r~"..v.price*v.Index.."$", items, v.Index, "Acheter ~b~x"..v.Index.."~s~ "..string.lower(v.label).." pour le prix de ~r~"..v.price*v.Index.."$~s~", {}, true, {
                                            onListChange = function(Items, Index)
                                                v.Index = Index
                                            end,
                                            onSelected = function()
                                                if v.Index + info.number <= 3 then 
                                                    TriggerServerEvent("fCore:ShopIllegal:BuyWeapon", "second", v.price, v.name, v.Index, info.number, valeur.shop, valeur.point)
                                                    ESX.SetTimeout(100,function()
                                                        getInformationVenteDarme(valeur.shop)
                                                    end)
                                                else
                                                    cNotification(TranslationIllegal.ShopIllegal["QuantiteImpossible"], "Action", "rouge")
                                                end                                        
                                            end
                                        })
                                    end
                                end
                            end
                        end
                    else
                        RageUI.Separator(valeur.separator)        
                        RageUI.Line("color", 19, 107, 190)  
                        for _,v in pairs(weapon) do 
                            -- Vérifier la condition pour afficher l'arme
                            if (hasVip and v.vip) or (not v.vip) then
                                local items = {}
                                for i = 1, v.maxList do
                                    table.insert(items, i)
                                end
                                RageUI.List(v.label.." | Prix : ~r~"..v.price*v.Index.."$", items, v.Index, "Acheter ~b~x"..v.Index.."~s~ "..string.lower(v.label).." pour le prix de "..v.price*v.Index.."$~s~", {}, true, {
                                    onListChange = function(Items, Index)
                                        v.Index = Index
                                    end,
                                    onSelected = function()
                                        TriggerServerEvent("fCore:ShopIllegal:BuyWeaponIllimited", v.price, v.name, v.Index, v.label, valeur.point)
                                    end
                                })
                            end
                        end   
                    end
                end)
                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end    
end