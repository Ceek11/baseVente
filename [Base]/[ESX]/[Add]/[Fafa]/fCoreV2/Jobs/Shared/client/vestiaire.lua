local OpenVestiaireBoss = false 
MenuVestiaireBoss = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
DeleteOutifBoss = RageUI.CreateSubMenu(MenuVestiaireBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
ChangeOutifBoss= RageUI.CreateSubMenu(MenuVestiaireBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
SubChangeOutifBoss= RageUI.CreateSubMenu(ChangeOutifBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
MenuVestiaireBoss.Closed = function()
    OpenVestiaireBoss = false
end


local Boss = false
CreateOutfit = {}
function _BossOpenMenu(valeur, info)
    _JobBuilder:GetOutfit()
    if OpenVestiaireBoss then 
        OpenVestiaireBoss = false 
        RageUI.Visible(MenuVestiaireBoss, false)
         return
    else 
        OpenVestiaireBoss = true 
        RageUI.Visible(MenuVestiaireBoss, true)
        CreateThread(function()
            while OpenVestiaireBoss do 
                FreezeEntityPosition(PlayerPedId(), true)
                DisableControlAction(1, 51, true)
                RageUI.IsVisible(MenuVestiaireBoss, function()
                    RageUI.Checkbox("Prendre son service", nil, InServiceJob, {}, {
                        onChecked = function()  
                            InServiceJob = true
                            TriggerServerEvent("fCore:Boss:addCountService", "add", valeur.jobName)
                        end,
                        onUnChecked = function()
                            InServiceJob = false
                            TriggerServerEvent("fCore:Boss:addCountService", "remove" , valeur.jobName)
                        end
                    })
                    if InServiceJob then 
                        if ESX.PlayerData.job.grade_name == valeur.gradeBoss then
                            RageUI.Separator("↓ ~b~Création de tenue ~s~↓")
                            RageUI.Line("color", 19, 107, 190)
                            RageUI.Checkbox("Créer une tenue", nil, Boss, {LeftBadge = RageUI.BadgeStyle.Star}, {
                                onChecked = function()  
                                    Boss = true
                                end,
                                onUnChecked = function()
                                    Boss = false
                                end
                            })
                            if Boss then 
                                RageUI.Button(TranslationJob.AllJob["button_register_outfit"], nil, {RightLabel = "→"}, true, {
                                    onSelected = function()
                                        local NameTenu = Visual.KeyboardText("Nom de la tenue", "", 40) 
                                        CreateOutfit.NameTenu = NameTenu
                                        if CreateOutfit.NameTenu == nil or CreateOutfit.NameTenu == "" or  CreateOutfit.NameTenu == " " then 
                                            cNotification(TranslationJob.AllJob["Cnotif_enter_name_outfit"], "Action", "rouge") 
                                        else
                                            local GradeTenu = Visual.KeyboardText("Grade de la tenue", "", 10) 
                                            CreateOutfit.GradeTenu = GradeTenu
                                            if not tonumber(CreateOutfit.GradeTenu) then 
                                                cNotification(TranslationJob.AllJob["Cnotif_enter_grade_outfit"], "Action", "rouge") 
                                            else
                                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                                        MaTenu = {
                                                            tshirt_1 = skin.tshirt_1,
                                                            tshirt_2 = skin.tshirt_2,
                                                            torso_1 = skin.torso_1,
                                                            torso_2 = skin.torso_2,
                                                            torso_1 = skin.torso_1,
                                                            pants_1 = skin.pants_1,
                                                            pants_2 = skin.pants_2,
                                                            arms = skin.arms,
                                                            glasses_1 = skin.glasses_1,
                                                            glasses_2 = skin.glasses_2,
                                                            mask_1 = skin.mask_1,
                                                            mask_2 = skin.mask_2,
                                                            bproof_1 = skin.bproof_1,
                                                            bproof_2 = skin.bproof_2,
                                                            chain_1 = skin.chain_1,
                                                            chain_2 = skin.chain_2,
                                                            bags_1 = skin.bags_1,
                                                            bags_2 = skin.bags_2,
                                                            bracelets_1 = skin.bracelets_1,
                                                            bracelets_2 = skin.bracelets_2,
                                                            watches_1 = skin.watches_1,
                                                            watches_2 = skin.watches_2,
                                                            helmet_1 = skin.helmet_1,
                                                            helmet_2 = skin.helmet_2,
                                                            ears_1 = skin.ears_1,
                                                            ears_2 = skin.ears_2,
                                                            shoes_1 = skin.shoes_1,
                                                            shoes_2 = skin.shoes_2
                                                        }
                                                        TriggerServerEvent("fCore:Boss:addnewvetement", MaTenu, NameTenu, ESX.PlayerData.job.name, GradeTenu, valeur.jobName, valeur.gradeBoss, valeur.Webhooks, info.point)
                                                        cNotification(TranslationJob.AllJob["Cnotif_create_new_outfit"], "Action", "vert")
                                                        ESX.SetTimeout(500,function()
                                                            _JobBuilder:GetOutfit()
                                                        end)
                                                    end)
                                                end)
                                            end
                                        end
                                    end
                                })
                                RageUI.Button(TranslationJob.AllJob["button_delete_outfit"], nil, {RightLabel = "→"}, true, {}, DeleteOutifBoss)
                                RageUI.Button(TranslationJob.AllJob["button_info_outfit"], nil, {RightLabel = "→"}, true, {}, ChangeOutifBoss)
                            end
                            -- RageUI.Line("color", 19, 107, 190)
                        end
                        RageUI.Separator(TranslationJob.AllJob["separator_cloakroom_job"] )
                        RageUI.Line("color", 19, 107, 190)
                        RageUI.Button(TranslationJob.AllJob["button_take_outfit"], nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                        TriggerEvent('skinchanger:loadClothes', skin)
                                    end)
                                end)
                            end
                        })
                        RageUI.Separator(TranslationJob.AllJob["separator_cloakroom"])
                        for k,v in pairs(Outfit) do
                            if ESX.PlayerData.job.grade >= v.grade then 
                                RageUI.Button(v.NameOutfit, nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                                    onSelected = function()
                                        SetPedComponentVariation(GetPlayerPed(-1), 3, v.tenue.arms)
                                        SetPedComponentVariation(GetPlayerPed(-1), 8, v.tenue.tshirt_1, v.tenue.tshirt_2, 2)
                                        SetPedComponentVariation(GetPlayerPed(-1), 11, v.tenue.torso_1, v.tenue.torso_2, 2)
                                        SetPedComponentVariation(GetPlayerPed(-1), 4, v.tenue.pants_1,v.tenue.pants_2, 2)
                                        SetPedComponentVariation(GetPlayerPed(-1), 6, v.tenue.shoes_1,v.tenue.shoes_2, 2)
                                        SetPedComponentVariation(GetPlayerPed(-1), 5, v.tenue.bags_1,v.tenue.bags_2, 2)
                                        SetPedComponentVariation(GetPlayerPed(-1), 7, v.tenue.bproof_1,v.tenue.bproof_2, 2)
                                        SetPedComponentVariation(GetPlayerPed(-1), 1, v.tenue.mask_1, v.tenue.mask_2, 2)
                                        SetPedPropIndex(GetPlayerPed(-1), 2, v.tenue.ears_1, v.tenue.ears_2, 2)
                                        SetPedPropIndex(GetPlayerPed(-1), 1, v.tenue.glasses_1, v.tenue.glasses_2, 2)
                                        SetPedPropIndex(GetPlayerPed(-1), 0, v.tenue.helmet_1, v.tenue.helmet_2, 2)
                                        SetPedPropIndex(GetPlayerPed(-1), 6, v.tenue.watches_1, v.tenue.watches_2, 2)
                                        SetPedPropIndex(GetPlayerPed(-1), 1, v.tenue.bracelets_1, v.tenue.bracelets_2, 2)
                                    end
                                })
                            else
                                RageUI.Button("- "..v.NameOutfit.." : ~b~Permission insuffisante~s~", nil, {}, false, {})
                            end
                        end
                    end
                end)
                RageUI.IsVisible(DeleteOutifBoss, function()
                    for k,v in pairs(Outfit) do 
                        RageUI.Button(v.NameOutfit, nil, {}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:Boss:DeleteOutif", v.idOutfit, valeur.jobName, valeur.gradeBoss,valeur.Webhooks, info.point)
                                ESX.SetTimeout(500,function()
                                    _JobBuilder:GetOutfit()
                                end)
                            end
                        },MenuVestiaireBoss)
                    end
                end)
                RageUI.IsVisible(ChangeOutifBoss, function()
                    RageUI.Separator(TranslationJob.AllJob["separator_change_name"])
                    RageUI.Line("color", 19, 107, 190)
                    for i = 1, #Outfit do
                        local v = Outfit[i]
                        RageUI.Button("- "..v.NameOutfit, nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                id = v.idOutfit
                            end
                        }, SubChangeOutifBoss)
                    end
                end)
                RageUI.IsVisible(SubChangeOutifBoss, function()
                    RageUI.Button(TranslationJob.AllJob["button_change_label_clothe"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local newName = Visual.KeyboardText(TranslationJob.AllJob["choose_name_clothe"], "", 10)
                            if newName == " " or newName == nil or newName == "" then 
                                cNotification(TranslationJob.AllJob["Cnotif_true_data"], "Action", "rouge")
                            else
                                TriggerServerEvent("fCore:Boss:ChangeInfoClothe", "label", newName, id, valeur.jobName, valeur.gradeBoss, info.point)
                                ESX.SetTimeout(500,function()
                                    _JobBuilder:GetOutfit()
                                end)
                            end
                        end
                    }, ChangeOutifBoss)
                    RageUI.Button(TranslationJob.AllJob["button_change_grade_clothe"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local NewGrade = Visual.KeyboardNumber(TranslationJob.AllJob["choose_grade_clothe"], "", 2)
                            if not tonumber(NewGrade) then 
                                cNotification(TranslationJob.AllJob["Cnotif_enter_number"], "Action", "rouge") 
                            else 
                                TriggerServerEvent("fCore:Boss:ChangeInfoClothe", "grade", NewGrade, id, valeur.jobName, valeur.gradeBoss, info.point)
                                ESX.SetTimeout(500,function()
                                    _JobBuilder:GetOutfit()
                                end)
                            end
                        end
                    }, ChangeOutifBoss)
                end)
                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end

CreateThread(function()
    ClearPedTasks(PlayerPedId())
end)