local openVenteDarme = false 
menuVenteDarme = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuFactureVenteDarme = RageUI.CreateSubMenu(menuVenteDarme, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuVenteDarme.Closed = function()
    openVenteDarme = false
end

FactureVenteDarme = {}
local PriceTotalVenteDarme = 0
function openMenuVenteDarme(valeur)
    if openVenteDarme then 
        openVenteDarme = false 
        RageUI.Visible(menuVenteDarme, false)
        return
    else
        openVenteDarme = true
        RageUI.Visible(menuVenteDarme, true)
        CreateThread(function()
            while openVenteDarme do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuVenteDarme, function()
                    RageUI.Separator(TranslationJob.Armurerier["WeaponInSell"])
                    RageUI.Line("color", 249, 130, 42)

                    for k,v in pairs(valeur.Produit) do
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
                                    PriceTotalVenteDarme = PriceTotalVenteDarme + v.price*(v.Index-1)
                                    table.insert(FactureVenteDarme, {label = v.label, name = v.name, Index = v.Index-1, price = v.price*(v.Index-1), GetItem = v.GetItem})
                                else
                                    cNotification(TranslationJob.Armurerier["NotSelectNumberProducts"])
                                end
                            end
                        })
                    end
                    RageUI.Button(TranslationJob.Armurerier["ShowInvoice"], nil, {}, true, {}, menuFactureVenteDarme)
                end)
                RageUI.IsVisible(menuFactureVenteDarme, function()
                    if #FactureVenteDarme == 0 then 
                        RageUI.Separator(" ")
                        RageUI.Separator(TranslationJob.Armurerier["NoInvoice"])
                        RageUI.Separator(" ")
                    else
                        RageUI.Separator(TranslationJob.Armurerier["Invoice"])
                        RageUI.Separator((TranslationJob.Armurerier["PriceTotal"]):format(PriceTotalVenteDarme))
                        RageUI.Line("color", 249, 130, 42)
                        for k,v in pairs(FactureVenteDarme) do
                            RageUI.Button(("[~b~x%s~s~] - %s"):format(v.Index, v.label), TranslationJob.Armurerier["removeProductInvoice"], {RightLabel = ("~g~%s$"):format(v.price)}, true, {
                                onSelected = function()
                                    table.remove(FactureVenteDarme, k)
                                    PriceTotalVenteDarme = PriceTotalVenteDarme - v.price
                                end
                            })
                        end
                        RageUI.Line("color", 249, 130, 42)
                        RageUI.Button(TranslationJob.Armurerier["CancelInvoice"], nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                FactureVenteDarme = {}
                            end
                        })
                        RageUI.Button(TranslationJob.Armurerier["ValidateInvoice"], nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                targetT = GetNearbyPlayer(false, true)
                                if not targetT then return end 
                                if targetT then
                                    for k,v in pairs(FactureVenteDarme) do
                                        TriggerServerEvent("fCore:Weapon:SellWeapon", v.name, v.label, v.price, v.GetItem, v.Index, GetPlayerServerId(targetT), valeur.society, valeur.point)
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


local openShowWeapon = false 
menuShowWeapon = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuShowWeapon.Closed = function()
    openShowWeapon = false 
end

function openMenuShowWeapon(valeur)
    if openShowWeapon then 
        openShowWeapon = false 
        RageUI.Visible(menuShowWeapon, false)
        return
    else
        openShowWeapon = true
        RageUI.Visible(menuShowWeapon, true)
        CreateThread(function()
            while openShowWeapon do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuShowWeapon, function()
                    RageUI.Separator(TranslationJob.Armurerier["ProductInShop"])
                    RageUI.Line("color", 249, 130, 42)
                    for k,v in pairs(valeur.Produit) do
                        RageUI.Button((TranslationJob.Armurerier["PriceShow"]):format(v.label, v.price), nil, {}, true, {})
                    end
                end)
                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end