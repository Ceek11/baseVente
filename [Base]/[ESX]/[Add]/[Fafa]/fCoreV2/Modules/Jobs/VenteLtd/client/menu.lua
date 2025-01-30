local openVenteLtd = false 
menuVenteLtd = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuFactureLtd = RageUI.CreateSubMenu(menuVenteLtd, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuVenteLtd.Closed = function()
    openVenteLtd = false 
end


local PriceTotalLtd = 0
FactureVenteLtd = {}
function openMenuVenteLtd(VenteLTD)
    if openVenteLtd then 
        openVenteLtd = false 
        RageUI.Visible(menuVenteLtd, false)
        return
    else
        openVenteLtd = true 
        RageUI.Visible(menuVenteLtd, true)
        CreateThread(function()
            while openVenteLtd do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuVenteLtd, function()
                    RageUI.Separator("↓ ~b~Vendre au client~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(VenteLTD.Produit) do 
                        local items = {}
                        table.insert(items, 1, "0")
                        for i = 1, v.MaxList do 
                            table.insert(items, i)
                        end
                        RageUI.List(v.label, items, v.Index, nil, {}, true, {
                            onListChange = function(Index, Items)
                                v.Index = Index 
                            end,
                            onSelected = function()
                                if v.Index > 1 then 
                                    PriceTotalLtd = PriceTotalLtd + v.price*(v.Index-1)
                                    table.insert(FactureVenteLtd, {label = v.label, name = v.name, Index = v.Index-1, price = v.price*(v.Index-1), GetItem = v.GetItem})
                                else
                                    cNotification("~r~Vous n'avez pas sélectionner le nombre de produit", "Action", "rouge")
                                end
                            end
                        })
                    end
                    RageUI.Button("~g~Voir la facture~s~", nil, {}, true, {}, menuFactureLtd)
                end)
                RageUI.IsVisible(menuFactureLtd, function()
                    if #FactureVenteLtd == 0 then 
                        RageUI.Separator(" ")
                        RageUI.Separator("~r~Aucune facture")
                        RageUI.Separator(" ")
                    else
                        RageUI.Separator("↓ ~b~Facture~s~ ↓")
                        RageUI.Separator(("Prix total : ~g~%s$"):format(PriceTotalLtd))
                        RageUI.Line("color", 19, 107, 190)
                        for k,v in pairs(FactureVenteLtd) do
                            RageUI.Button(("[~b~x%s~s~] - %s"):format(v.Index, v.label), "Appuyer sur ~g~ENTRER~s~ pour ~r~enlever~s~ le produit de la facture", {RightLabel = ("~g~%s$"):format(v.price)}, true, {
                                onSelected = function()
                                    table.remove(FactureVenteLtd, k)
                                    PriceTotalLtd = PriceTotalLtd - v.price
                                end
                            })
                        end
                        RageUI.Line("color", 19, 107, 190)
                        RageUI.Button("~r~Annuler la facture~s~", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                FactureVenteLtd = {}
                            end
                        })
                        RageUI.Button("~g~Valider la facture~s~", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                targetT = GetNearbyPlayer(false, true)
                                if not targetT then return end 
                                if targetT then
                                    for k,v in pairs(FactureVenteLtd) do
                                        TriggerServerEvent("fCore:Vente:SellProduit", v.name, v.label, v.price, v.GetItem, v.Index, GetPlayerServerId(targetT), VenteLTD.society, VenteLTD.point)
                                    end
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



local openRecetteLtd = false 
menuRecetteLtd = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuRecetteLtd.Closed = function()
    openRecetteLtd = false 
end

function openMenuRecetteLTD(valeur)
    if openRecetteLtd then 
        openRecetteLtd = false 
        RageUI.Visible(menuRecetteLtd, false)
        return
    else
        openRecetteLtd = true
        RageUI.Visible(menuRecetteLtd, true)
        CreateThread(function()
            while openRecetteLtd do 
                RageUI.IsVisible(menuRecetteLtd, function()
                    RageUI.Separator("↓ ~b~Nos produits en vente~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(valeur.Produit) do
                        RageUI.Button(("~b~%s~s~ | Prix: ~g~%s$~s~ "):format(v.label, v.price), valeur.description, {}, true, {})
                    end
                end)
                Wait(0)
            end
        end)
    end
end





