local OpenVip = false 
menuVip = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuBuyVip = RageUI.CreateSubMenu(menuVip, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuBuyVehicle = RageUI.CreateSubMenu(menuVip, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuVip.Closed = function()
    OpenVip = false
end

local vip = false
AchatEffectuer = true


function openMenuVIP()
    Getcoins()
    if OpenVip then 
        OpenVip = false 
        RageUI.Visible(menuVip, false)
        return
    else
        OpenVip = true 
        RageUI.Visible(menuVip, true)
        CreateThread(function()
            while OpenVip do 
                RageUI.IsVisible(menuVip, function()
                    RageUI.Separator("↓ ~b~Menu VIP~s~ ↓")  
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Ouvrir le liens de la boutique", nil, {}, true, {
                        onSelected = function()
                            SendNUIMessage({
                                action = "open",
                                data = "https://www.youtube.fr/",
                            })
                        end
                    })
                    for k, v in pairs(getNumbercoins) do
                        local vip = v.vip and "Oui" or "Non"
                        local expiration = v.expiration
                        RageUI.Button(("coins (NOC): ~b~%s NOC"):format(v.coins), nil, {}, true, {})
                        if expiration == nil and not vip then 
                            RageUI.Button(("Vip: ~r~%s"):format(vip), nil, {}, true, {})
                        else
                            RageUI.Button(("Vip: ~r~%s"):format(vip), nil, {RightLabel = expiration}, true, {})
                        end
                    end                    
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Acheter un Vehicule", nil, {}, true, {}, menuBuyVehicle)
                end)
                RageUI.IsVisible(menuBuyVehicle, function()
                    for k,v in pairs(vehicleVip) do 
                        RageUI.Button(v.label, nil, {RightLabel = ("~b~ %s NOC"):format(v.coins)}, AchatEffectuer, {
                            onSelected = function()
                                local input = lib.inputDialog("Saisissez 'oui' pour confirmer", {" "})
                                    if input then
                                    local confirmation = input[1]
                                    if confirmation == 'oui' then 
                                        TriggerServerEvent("fCore:MenuVip:BuyVehicle", v.coins, v.name)
                                    else
                                        cNotification("Vous avez annuler l'achat", "action", "rouge")
                                    end
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

Keys.Register('F10', "VIP", 'ouvrir le menu VIP', function()
    if OpenVip == false then
        openMenuVIP()
    end
end)

