local openVenteObject = false
menuVenteObject = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuVenteObject.Closed = function()
    openVenteObject = false
    FreezeEntityPosition(PlayerPedId(), false)
end

local PriceTotalVenteObject = 0
function openMenuVenteObject(valeur)
    if openVenteObject then 
        openVenteObject = false 
        RageUI.Visible(menuVenteObject, false)
        return
    else
        openVenteObject = true 
        RageUI.Visible(menuVenteObject, true)
        CreateThread(function()
            while openVenteObject do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuVenteObject, function()
                    for k,v in pairs(valeur.Produit) do
                        local items = {}
                        table.insert(items, 1, "0")
                        for i = 1, v.MaxList do 
                            table.insert(items, i)
                        end
                        local colorPrefix = valeur.typeMoney == "black_money" and "~r~" or "~g~"
                        local price = (colorPrefix .. "%s$"):format(v.price)
                        RageUI.List(v.label, items, v.Index, nil, {RightLabel = price}, true, {
                            onListChange = function(Index, Items)
                                v.Index = Index
                            end,
                            onSelected = function()
                                if v.Index > 1 then 
                                    TriggerServerEvent("fCore:resellObject:Resell", v.name, (v.Index-1)*v.price, valeur.typeMoney, v.label, v.Index-1)
                                else
                                    cNotification("~r~Vous n'avez pas sélectionner le nombre de produit")
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