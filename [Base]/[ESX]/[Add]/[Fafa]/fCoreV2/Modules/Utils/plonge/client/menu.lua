local openPlonge = false 
menuPlonge = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuPlonge.Closed = function()
    openPlonge = false
end

function openMenuPlonge()
    if openPlonge then 
        openPlonge = false
        RageUI.Visible(menuPlonge, false) 
        return 
    else 
        openPlonge = true 
        RageUI.Visible(menuPlonge, true) 
        CreateThread(function()
            while openPlonge do 
                RageUI.IsVisible(menuPlonge, function()
                    RageUI.Separator("↓ ~b~Louer une tenue~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Tenues de plongées", nil, {RightLabel = "~g~325$"}, true, {
                        onSelected = function()
                            if not haveTenuePlonge then 
                                TriggerServerEvent("fCore:Plonge:BuyClothing")
                                haveTenuePlonge = true
                                SetPedMaxTimeUnderwater(PlayerPedId(), 150.0)
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    local uniformObject
                                    if skin.sex == 0 then
                                        uniformObject = {
                                            sex = 0,
                                            bags_1 = 0, bags_2 = 0,
                                            tshirt_1 = 23, tshirt_2 = 0,
                                            torso_1 = 134, torso_2 = 0,
                                            arms = 4,
                                            pants_1 = 133, pants_2 = 1,
                                            shoes_1 = 135, shoes_2 = 0,
                                            mask_1 = 0, mask_2 = 0,
                                            bproof_1 = 0, bproof_2 = 0,
                                            helmet_1 = -1, helmet_2 = 0,
                                            chain_1 = 0, chain_2 = 0,
                                            decals_1 = 0, decals_2 = 0,
                                            glasses_1 = -1, glasses_2 = 0,
                                            watches_1 = -1, watches_2 = 0
                                        }
                                    else
                                        uniformObject = {
                                            sex = 1,
                                            bags_1 = 0, bags_2 = 0,
                                            tshirt_1 = 135, tshirt_2 = 0,
                                            torso_1 = 127, torso_2 = 0,
                                            arms = 3,
                                            pants_1 = 135, pants_2 = 1,
                                            shoes_1 = 146, shoes_2 = 20,
                                            mask_1 = 0, mask_2 = 0,
                                            bproof_1 = 0, bproof_2 = 0,
                                            helmet_1 = -1, helmet_2 = 0,
                                            chain_1 = 0, chain_2 = 0,
                                            decals_1 = 0, decals_2 = 0,
                                            glasses_1 = -1, glasses_2 = 0,
                                            watches_1 = -1, watches_2 = 0
                                        }
                                    end
                                    if uniformObject then
                                        TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
                                    end
                                end)
                            else
                                TriggerServerEvent("fCore:Plonge:renderCaution", haveTenuePlonge)
                                haveTenuePlonge = false
                                SetPedMaxTimeUnderwater(PlayerPedId(), 10.0)
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                            end
                        end
                    })
                end)
                Wait(0)
            end
        end)
    end
end