local openShop = false 
menuShop = RageUI.CreateMenu("Shop", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuShop.Closed = function()
    openShop = false 
end

function openMenuShop(Produit, pos, typeMoney)
    if openShop then 
        openShop = false 
        RageUI.Visible(menuShop, false)
        return
    else 
        openShop = true
        RageUI.Visible(menuShop, true)
        CreateThread(function()
            while openShop do 
                RageUI.IsVisible(menuShop, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    RageUI.Separator(Translation.Shop["separator_products_available"])
                    RageUI.Line("color", 19, 107, 190)
                    for _, v in pairs(Produit) do 
                        local items = {}
                        for i = 1, v.maxList do
                            table.insert(items, i)
                        end
                        local priceColor = typeMoney == "black_money" and "~r~" or "~g~"
                        RageUI.List(v.label.." | Prix : "..priceColor..v.price*v.Index.."$", items, v.Index, "Acheter ~b~x"..v.Index.."~s~ "..string.lower(v.label).." pour le prix de "..priceColor..v.price*v.Index.."$~s~", {}, true, {
                            onListChange = function(Items, Index)
                                v.Index = Index
                            end,
                            onSelected = function()
                                TriggerServerEvent("fCore:Shop:buy", v.name, v.label, v.price, v.Index, pos, typeMoney)
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