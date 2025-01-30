local OpenGarageBoss = false
GarageMainBoss = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
VehicleInPoundBoss = RageUI.CreateSubMenu(GarageMainBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
ChangeInfoVehiculeBoss = RageUI.CreateSubMenu(GarageMainBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
SubChangeInfoVehiculeBoss = RageUI.CreateSubMenu(ChangeInfoVehiculeBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
GarageMainBoss.Closed = function()
    OpenGarageBoss = false
end
local Recherche

function _BossMainOpenGarage(valeur, garage)
    _JobBuilder:GetInfoVehicule()
    if OpenGarageBoss then
        OpenGarageBoss = false 
    else 
        OpenGarageBoss = true 
        RageUI.Visible(GarageMainBoss, true)
            Citizen.CreateThread(function()
            while OpenGarageBoss do
                RageUI.IsVisible(GarageMainBoss, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    DisableControlAction(1, 51, true)                    
                    RageUI.Separator(TranslationJob.AllJob["separator_vehicle_in_society"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Recherche de véhicule", nil, {}, true, {
                        onSelected = function()
                            Recherche = nil
                            local input = lib.inputDialog("Recherche de véhicule", {"Recherche de véhicule"})
                            if input then 
                                Recherche = input[1]
                            end
                        end
                    })
                    if Recherche then 
                        RageUI.Button("Annuler la recherche", nil, {}, true, {
                            onSelected = function()
                                Recherche = nil
                            end
                        })
                    end
                    RageUI.Line("color", 19, 107, 190)
                    if not Recherche then 
                        for i = 1, #InfoVehiculeInBdd do
                            local vehicule = InfoVehiculeInBdd[i]
                            if vehicule.type == garage.Type then 
                                if vehicule.job == ESX.PlayerData.job.name then 
                                    if vehicule.number == 1 then 
                                        if ESX.PlayerData.job.grade >= vehicule.grade then 
                                            RageUI.Button("[~b~ Grade~s~ : "..vehicule.grade.."] - "..vehicule.label, nil, {RightLabel = ("Plaque : ~b~[%s]~s~"):format(vehicule.plate)}, true, {
                                                onSelected = function()
                                                    RequestModel(vehicule.name)
                                                    while not HasModelLoaded(vehicule.name) do
                                                        Citizen.Wait(10)
                                                    end
                                                    vehi = CreateVehicle(vehicule.name, garage.spawnpoint.x, garage.spawnpoint.y, garage.spawnpoint.z, garage.spawnpoint.w, true, false)
                                                    TaskWarpPedIntoVehicle(PlayerPedId(), vehi, -1)
                                                    SetVehicleNumberPlateText(vehi, vehicule.plate)
                                                    SetVehicleFuelLevel(vehi, vehicule.fuelLevel)
                                                    ESX.Game.SetVehicleProperties(vehi, vehicule.custom)
                                                    TriggerServerEvent("fCore:Keys:AddKeysJob", vehicule.plate)
                                                    TriggerServerEvent("fCore:Boss:ExitVehicule", vehicule.plate, vehicule.label)
                                                    SetTimeout(100,function()
                                                        _JobBuilder:GetInfoVehicule()
                                                    end)
                                                    OpenGarageBoss = false
                                                    RageUI.CloseAll()
                                                end
                                            })
                                        else 
                                            RageUI.Button("[~b~ Grade~s~ : "..vehicule.grade.."] - "..vehicule.label.." : ~b~Permission insuffisante~s~", nil, {}, false, {})
                                        end
                                    else
                                        RageUI.Button("[~b~ Grade~s~ : "..vehicule.grade.."] - "..vehicule.label.." : ~b~Sortie~s~", nil, {}, false, {})
                                    end
                                end
                            end
                        end
                    else
                        local lowercaseRecherche = string.lower(Recherche)
                        for i = 1, #InfoVehiculeInBdd do
                            local vehicule = InfoVehiculeInBdd[i]
                            local lowercaseLabel = string.lower(vehicule.label)
                            if vehicule.type == garage.Type then 
                                if vehicule.job == ESX.PlayerData.job.name then 
                                    if vehicule.number == 1 then 
                                        if ESX.PlayerData.job.grade >= vehicule.grade then 
                                            if string.find(lowercaseLabel, lowercaseRecherche, 1, true) then 
                                                RageUI.Button("[~b~ Grade~s~ : "..vehicule.grade.."] - "..vehicule.label, nil, {RightLabel = ("Plaque : ~b~[%s]~s~"):format(vehicule.plate)}, true, {
                                                    onSelected = function()
                                                        RequestModel(vehicule.name)
                                                        while not HasModelLoaded(vehicule.name) do
                                                            Citizen.Wait(10)
                                                        end
                                                        vehi = CreateVehicle(vehicule.name, garage.spawnpoint.x, garage.spawnpoint.y, garage.spawnpoint.z, garage.spawnpoint.w, true, false)
                                                        TaskWarpPedIntoVehicle(PlayerPedId(), vehi, -1)
                                                        SetVehicleNumberPlateText(vehi, vehicule.plate)
                                                        SetVehicleFuelLevel(vehi, vehicule.fuelLevel)
                                                        ESX.Game.SetVehicleProperties(vehi, vehicule.custom)
                                                        TriggerServerEvent("fCore:Keys:AddKeysJob", vehicule.plate)
                                                        TriggerServerEvent("fCore:Boss:ExitVehicule", vehicule.plate, vehicule.label)
                                                        SetTimeout(100,function()
                                                            _JobBuilder:GetInfoVehicule()
                                                        end)
                                                        OpenGarageBoss = false
                                                        RageUI.CloseAll()
                                                    end
                                                })
                                            end
                                        else 
                                            RageUI.Button("[~b~ Grade~s~ : "..vehicule.grade.."] - "..vehicule.label.." : ~b~Permission insuffisante~s~", nil, {}, false, {})
                                        end
                                    else
                                        RageUI.Button("[~b~ Grade~s~ : "..vehicule.grade.."] - "..vehicule.label.." : ~b~Sortie~s~", nil, {}, false, {})
                                    end
                                end
                            end
                        end
                    end
                    if ESX.PlayerData.job.name == valeur.jobName and ESX.PlayerData.job.grade_name == valeur.gradeBoss then 
                        RageUI.Separator("↓ ~b~Gestion du garage~s~ ↓")
                        RageUI.Line("color", 19, 107, 190)
                        RageUI.Button(TranslationJob.AllJob["button_change_info_vehicle"], nil, {RightLabel = "→→"}, true, {}, ChangeInfoVehiculeBoss)
                        RageUI.Button(TranslationJob.AllJob["button_vehicle_in_pound"], nil, {RightLabel = "→→"}, true, {}, VehicleInPoundBoss)
                    end
                end)
                RageUI.IsVisible(VehicleInPoundBoss, function()
                    RageUI.Separator(TranslationJob.AllJob["separator_vehicle_in_pound"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Info("Garage :", {(TranslationJob.AllJob["price_of_pound"]):format(Cfg.PriceFoundEntreprise)}, {""}) 
                    for i = 1, #InfoVehiculeInBdd do
                        local vehicule = InfoVehiculeInBdd[i]
                        if vehicule.type == garage.Type then 
                            if vehicule.number == 0 and vehicule.job == ESX.PlayerData.job.name then
                                RageUI.Button("- "..vehicule.label, nil, {RightLabel = "~r~ En fourrière"}, true, {
                                    onSelected = function()
                                        TriggerServerEvent("fCore:Boss:removeVehiculeToFound", vehicule.plate, valeur.societyName)
                                        SetTimeout(100, function()
                                            _JobBuilder:GetInfoVehicule()
                                        end)
                                    end
                                })
                            end
                        end
                    end
                end)
                RageUI.IsVisible(ChangeInfoVehiculeBoss, function()
                    for i = 1, #InfoVehiculeInBdd do
                        local vehicule = InfoVehiculeInBdd[i]
                        if vehicule.type == garage.Type then 
                            RageUI.Button("- "..vehicule.label, nil, {RightLabel = ("Plaque : ~b~[%s]~s~"):format(vehicule.plate)}, true, {
                                onSelected = function()
                                    VehiculePlate = vehicule.plate
                                end
                            }, SubChangeInfoVehiculeBoss)
                        end
                    end
                end)
                RageUI.IsVisible(SubChangeInfoVehiculeBoss, function()
                    RageUI.Button(TranslationJob.AllJob["button_change_label_vehicle"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local NewLabel = Visual.KeyboardText(TranslationJob.AllJob["choose_name_vehicle"], "", 10)
                            if NewLabel == " " or NewLabel == nil or NewLabel == "" then 
                                cNotification(TranslationJob.AllJob["Cnotif_true_data"])
                            else
                                TriggerServerEvent("fCore:Boss:ChangeInfoVehicle", "Label", NewLabel, VehiculePlate)
                                SetTimeout(100,function()
                                    _JobBuilder:GetInfoVehicule()
                                end)
                            end
                        end
                    })
                    RageUI.Button(TranslationJob.AllJob["button_change_grade_vehicle"] , nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local NewGrade = Visual.KeyboardNumber(TranslationJob.AllJob["choose_grade_vehicle"], "", 2)
                            if not tonumber(NewGrade) then 
                                cNotification(TranslationJob.AllJob["Cnotif_enter_number"]) 
                            else 
                                TriggerServerEvent("fCore:Boss:ChangeInfoVehicle", "Grade", NewGrade, VehiculePlate)
                                SetTimeout(100,function()
                                    _JobBuilder:GetInfoVehicule()
                                end)
                            end
                        end
                    })
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("~r~Revendre un véhicule", nil, {}, true, {
                        onSelected = function()
                            local validation = Visual.KeyboardText("Etes vous sur ?", "Oui / Non", 25)
                            if validation == "Oui" then 
                                TriggerServerEvent("fCore:Boss:ResellVehicule", VehiculePlate, valeur.societyName)
                                SetTimeout(100,function()
                                    _JobBuilder:GetInfoVehicule()
                                end)
                            else
                                cNotification("Vous avez annuler la confirmation")
                            end
                        end
                    })
                end)
            Wait(0)
            FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end
   