local openCoiffeur = false 
menuCoiffeur = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuEsthetic = RageUI.CreateSubMenu(menuCoiffeur, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuCoiffure = RageUI.CreateSubMenu(menuCoiffeur, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)

menuCoiffeur.Closed = function()
    openCoiffeur = false 
    isMenuPlayerOpened = false
    FreezeEntityPosition(PlayerPedId(), false)
    if currentSkin ~= nil then
        TriggerEvent("skinchanger:loadSkin", currentSkin)
    end 
    currentSkin = nil
end


local SettingsMenu = {
    percentage = 0.0,
    ColorHear = {primary = {1, 1}, secondary = {1, 1}},
    ColorBrow = {primary = {1, 1}, secondary = {1, 1}},
    ColorBeard = {primary = {1, 1}, secondary = {1, 1}}
}

function openMenuCoiffeur()
    if openCoiffeur then 
        openCoiffeur = false 
        RageUI.Visible(menuCoiffeur, false)
        return
    else
        openCoiffeur = true 
        RageUI.Visible(menuCoiffeur, true)
        TriggerEvent("skinchanger:getSkin", function(skin) currentSkin = skin end)    
        CreateThread(function()
            while openCoiffeur do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuCoiffeur, function()
                    RageUI.Separator(TranslationUtils.Coiffeur["MainTitle"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationUtils.Coiffeur["HairStyleTitle"], nil, {}, true, {
                        onSelected = function()
                            isMenuPlayerOpened = true
                            -- updateRotationPlayer(GetEntityHeading(PlayerPedId()))
                        end
                    }, menuCoiffure)
                    RageUI.Button("Esthétic", nil, {}, true, {
                        onSelected = function()
                            isMenuPlayerOpened = true
                            -- updateRotationPlayer(GetEntityHeading(PlayerPedId()))
                        end
                    }, menuEsthetic)
                end)
                RageUI.IsVisible(menuEsthetic, function()
                    menuEsthetic.EnableMouse = true
                    RageUI.Separator("↓ ~b~Esthetic~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.List((TranslationUtils.Coiffeur["Eyebrows"]):format(Coiffeur.Prix.Sourcil), listSourcil, settingsList.Sourcil.IndexChange, nil, {}, true, {
                        onListChange = function(Items, Index)
                            settingsList.Sourcil.IndexChange = Index
                            TriggerEvent("skinchanger:change", "eyebrows_1", settingsList.Sourcil.IndexChange)
                        end,
                        onSelected = function()
                            TriggerServerEvent('fCore:Coiffeur:Payer', Coiffeur.Prix.Sourcil)
                        end
                    })

                    RageUI.List((TranslationUtils.Coiffeur["Lipstick"]):format(Coiffeur.Prix.Lipstick), listLipstick, settingsList.Lipstick.IndexChange, nil, {}, true, {
                        onListChange = function(Items, Index)
                            settingsList.Lipstick.IndexChange = Index
                            TriggerEvent("skinchanger:change", "lipstick_1", settingsList.Lipstick.IndexChange)
                        end,
                        onSelected = function()
                            TriggerServerEvent('fCore:Coiffeur:Payer', Coiffeur.Prix.Lipstick)
                        end
                    })

                    RageUI.List((TranslationUtils.Coiffeur["Blemishes"]):format(Coiffeur.Prix.Blemishes), listBlemishes, settingsList.Blemishes.IndexChange, nil, {}, true, {
                        onListChange = function(Items, Index)
                            settingsList.Blemishes.IndexChange = Index
                            TriggerEvent("skinchanger:change", "blemishes_1", settingsList.Blemishes.IndexChange)
                        end,
                        onSelected = function()
                            TriggerServerEvent('fCore:Coiffeur:Payer', Coiffeur.Prix.Blemishes)
                        end
                    })

                    RageUI.List((TranslationUtils.Coiffeur["Blush"]):format(Coiffeur.Prix.Blush), listBlush, settingsList.Blush.IndexChange, nil, {}, true, {
                        onListChange = function(Items, Index)
                            settingsList.Blush.IndexChange = Index
                            TriggerEvent("skinchanger:change", "blush_1", settingsList.Blush.IndexChange)
                        end
                        ,
                        onSelected = function()
                            TriggerServerEvent('fCore:Coiffeur:Payer', Coiffeur.Prix.Blush)
                        end
                    })

                    RageUI.List((TranslationUtils.Coiffeur["Foundation"]):format(Coiffeur.Prix.Complexion), listComplexion, settingsList.Complexion.IndexChange, nil, {}, true, {
                        onListChange = function(Items, Index)
                            settingsList.Complexion.IndexChange = Index
                            TriggerEvent("skinchanger:change", "complexion_1", settingsList.Complexion.IndexChange)
                        end,
                        onSelected = function()
                            TriggerServerEvent('fCore:Coiffeur:Payer', Coiffeur.Prix.Complexion)
                        end
                    })

                    RageUI.List((TranslationUtils.Coiffeur["Makeup"]):format(Coiffeur.Prix.Maquillage), listMaquillage, settingsList.Maquillage.IndexChange, nil, {}, true, {
                        onListChange = function(Items, Index)
                            settingsList.Maquillage.IndexChange = Index
                            TriggerEvent("skinchanger:change", "makeup_1", settingsList.Maquillage.IndexChange)
                        end,
                        onSelected = function()
                            TriggerServerEvent('fCore:Coiffeur:Payer', Coiffeur.Prix.Maquillage)
                        end
                    })

                    RageUI.List((TranslationUtils.Coiffeur["Contacts"]):format(Coiffeur.Prix.Lentile), listLentile, settingsList.Lentile.IndexChange, nil, {}, true, {
                        onListChange = function(Items, Index)
                            settingsList.Lentile.IndexChange = Index
                            TriggerEvent("skinchanger:change", "eye_color", settingsList.Lentile.IndexChange)
                        end,
                        onSelected = function()
                            TriggerServerEvent('fCore:Coiffeur:Payer', Coiffeur.Prix.Lentile)
                        end
                    })

                    RageUI.ColourPanel(TranslationUtils.Coiffeur["EyebrowColor"], RageUI.PanelColour.HairCut, SettingsMenu.ColorBrow.primary[1], SettingsMenu.ColorBrow.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorBrow.primary[1] = MinimumIndex
                            SettingsMenu.ColorBrow.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "eyebrows_3", SettingsMenu.ColorBrow.primary[2])
                        end
                    }, 3);
                    RageUI.PercentagePanel(SettingsMenu.percentage, 'Opacité', '0%', '100%', {
                        onProgressChange = function(Percentage)
                            SettingsMenu.percentage = Percentage
                            TriggerEvent("skinchanger:change", "eyebrows_2", Percentage * 10)
                        end
                    }, 3);

                    RageUI.ColourPanel(TranslationUtils.Coiffeur["LipstickColor"], RageUI.PanelColour.HairCut, SettingsMenu.ColorBrow.primary[1], SettingsMenu.ColorBrow.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorBrow.primary[1] = MinimumIndex
                            SettingsMenu.ColorBrow.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "lipstick_3", SettingsMenu.ColorBrow.primary[2])
                        end
                    }, 4);
                    RageUI.PercentagePanel(SettingsMenu.percentage, 'Opacité', '0%', '100%', {
                        onProgressChange = function(Percentage)
                            SettingsMenu.percentage = Percentage
                            TriggerEvent("skinchanger:change", "lipstick_2", Percentage * 10)
                        end
                    }, 4);
                    RageUI.PercentagePanel(SettingsMenu.percentage, 'Opacité', '0%', '100%', {
                        onProgressChange = function(Percentage)
                            SettingsMenu.percentage = Percentage
                            TriggerEvent("skinchanger:change", "blemishes_2", Percentage * 10)
                        end
                    }, 5);
                    RageUI.ColourPanel(TranslationUtils.Coiffeur["BlushIntensity"], RageUI.PanelColour.HairCut, SettingsMenu.ColorBrow.primary[1], SettingsMenu.ColorBrow.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorBrow.primary[1] = MinimumIndex
                            SettingsMenu.ColorBrow.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "blush_3", SettingsMenu.ColorBrow.primary[2])
                        end
                    }, 6);
                    RageUI.PercentagePanel(SettingsMenu.percentage, 'Opacité', '0%', '100%', {
                        onProgressChange = function(Percentage)
                            SettingsMenu.percentage = Percentage
                            TriggerEvent("skinchanger:change", "blush_2", Percentage * 10)
                        end
                    }, 6);

                    RageUI.ColourPanel(TranslationUtils.Coiffeur["FoundationColor"], RageUI.PanelColour.HairCut, SettingsMenu.ColorBrow.primary[1], SettingsMenu.ColorBrow.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorBrow.primary[1] = MinimumIndex
                            SettingsMenu.ColorBrow.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "complexion_1", SettingsMenu.ColorBrow.primary[2])
                        end
                    }, 7);
                    RageUI.PercentagePanel(SettingsMenu.percentage, 'Opacité', '0%', '100%', {
                        onProgressChange = function(Percentage)
                            SettingsMenu.percentage = Percentage
                            TriggerEvent("skinchanger:change", "complexion_2", Percentage * 10)
                        end
                    }, 7);
                    RageUI.PercentagePanel(SettingsMenu.percentage, 'Opacité', '0%', '100%', {
                        onProgressChange = function(Percentage)
                            SettingsMenu.percentage = Percentage
                            TriggerEvent("skinchanger:change", "makeup_2", Percentage * 10)
                        end
                    }, 8);
                end)
                RageUI.IsVisible(menuCoiffure, function()
                    menuCoiffure.EnableMouse = true
                    RageUI.Separator(TranslationUtils.Coiffeur["HairStyle"])
                    RageUI.Line(249, 130, 42) -- Utilisation de RageUI.Line sans "color" en tant que fonction statique
                    RageUI.List(("Cheveux | ~g~Prix : %s$"):format(Coiffeur.Prix.Cheveux), listHair, settingsList.Hair.IndexChange, nil, {}, true, {
                        onListChange = function(Items, Index)
                            settingsList.Hair.IndexChange = Index
                            TriggerEvent("skinchanger:change", "hair_1", settingsList.Hair.IndexChange)
                        end,
                        onSelected = function()
                            TriggerServerEvent('fCore:Coiffeur:Payer', Coiffeur.Prix.Cheveux)
                        end
                    })
                    RageUI.List((TranslationUtils.Coiffeur["BeardStyle"]):format(Coiffeur.Prix.Barbe), listBarbe, settingsList.Barbe.IndexChange, nil, {}, true, {
                        onListChange = function(Items, Index)
                            settingsList.Barbe.IndexChange = Index
                            TriggerEvent("skinchanger:change", "beard_1", settingsList.Barbe.IndexChange)
                        end,
                        onSelected = function()
                            TriggerServerEvent('fCore:Coiffeur:Payer', Coiffeur.Prix.Barbe)
                        end
                    })
                    RageUI.ColourPanel(TranslationUtils.Coiffeur["HairColor"], RageUI.PanelColour.HairCut, SettingsMenu.ColorHear.primary[1], SettingsMenu.ColorHear.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorHear.primary[1] = MinimumIndex
                            SettingsMenu.ColorHear.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "hair_color_1", SettingsMenu.ColorHear.primary[2])
                        end
                    }, 3)
                    RageUI.ColourPanel(TranslationUtils.Coiffeur["HairColor"], RageUI.PanelColour.HairCut, SettingsMenu.ColorHear.secondary[1], SettingsMenu.ColorHear.secondary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorHear.secondary[1] = MinimumIndex
                            SettingsMenu.ColorHear.secondary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "hair_color_2", SettingsMenu.ColorHear.secondary[2])
                        end
                    }, 3);
                    RageUI.ColourPanel(TranslationUtils.Coiffeur["BeardColor"], RageUI.PanelColour.HairCut, SettingsMenu.ColorBeard.primary[1], SettingsMenu.ColorBeard.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorBeard.primary[1] = MinimumIndex
                            SettingsMenu.ColorBeard.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "beard_3",SettingsMenu.ColorBeard.primary[2])
                        end
                    }, 4);
                    RageUI.PercentagePanel(SettingsMenu.percentage, 'Opacité', '0%', '100%', {
                        onProgressChange = function(Percentage)
                            SettingsMenu.percentage = Percentage
                            TriggerEvent("skinchanger:change", "beard_2", Percentage * 10)
                        end
                    }, 4);
                end)
                
                Wait(0)
            end
        end)
    end
end

RegisterNetEvent("fCore:Coiffeur:saveSkin")
AddEventHandler("fCore:Coiffeur:saveSkin", function()
    TriggerEvent("skinchanger:getSkin", function(skin) 
        currentSkin = skin  
        TriggerServerEvent('esx_skin:save', skin)
    end)
end)
