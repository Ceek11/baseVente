local visualisationOpen = false 
menuVisualisation = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuListVehicle = RageUI.CreateSubMenu(menuVisualisation, " "," ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuInfoVehicle = RageUI.CreateSubMenu(menuListVehicle, " "," ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)


menuInfoVehicle.Closed = function()
    DeleteVehicle(vehicule)
    isMenuVehicleOpened = false 
end
menuListVehicle.Closed = function()
    RenderScriptCams(0, 2500, 2500, 1,1)
end

function visualisationMenuOpen(valeur, i)
    _Concess:getCategorieVehicule()
    _Concess:getVehicleBdd()
    TriggerServerEvent("fCore:Concess:CantVisualisation", i)
    if not valeur.menuOpen then 
        if visualisationOpen then 
            visualisationOpen = false
            RageUI.Visible(menuVisualisation, false)
            return
        else
            visualisationOpen = true
            RageUI.Visible(menuVisualisation, true)
            CreateThread(function()
                menuVisualisation.Closed = function()
                    visualisationOpen = false
                    TriggerServerEvent("fCore:Concess:CanVisualisation", i)
                end 
                while visualisationOpen do
                    DisableControlAction(1, 51, true)
                    FreezeEntityPosition(PlayerPedId(), true)
                        RageUI.IsVisible(menuVisualisation, function()
                            RageUI.Separator(Translation.ConcessVehi["Catalogue"])
                            RageUI.Line("color", 249, 130,42)
                            for k,v in pairs(listCategorie) do 
                                for _, category in pairs(valeur.categoryVehicule) do 
                                    if v.name == category then 
                                        RageUI.Button("Catégorie - "..v.label, nil, {RightLabel = "→→"}, true, {
                                            onSelected = function()
                                                nameCategory = v.name
                                                labelCategory = v.label
                                            end
                                        }, menuListVehicle)
                                    end
                                end
                            end
                        end)
                        RageUI.IsVisible(menuListVehicle, function()
                            RageUI.Separator((Translation.ConcessVehi["categorie"]):format(labelCategory))
                            RageUI.Line("color", 249, 130, 42)
                            for k,v in pairs(listVehicleConcess) do 
                                if nameCategory == v.category then 
                                    RageUI.Button(v.name, (Translation.ConcessVehi["price_of_the_vehicle"]):format(v.price), {}, true, {
                                        onSelected = function()
                                            if valeur.Type == "bateau" then
                                                local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
                                                SetCamCoord(cam, valeur.CamCoordsBoat)
                                                PointCamAtCoord(cam, valeur.CamCoordsPointBoat)
                                                SetCamActive(cam, true)
                                                RenderScriptCams(1, 2500, 2500, 1,1)
                                            end
                                            name = v.name
                                            model = v.model
                                            price = v.price
                                            stockage = v.stockage
                                            pointVehicle = valeur.pointVehicle
                                            RequestModel(model)
                                            while not HasModelLoaded(model) do
                                                Citizen.Wait(10)
                                            end
                                            vehicule = CreateVehicle(v.model, valeur.pointVehicle, valeur.headingVehicle, true, false)
                                            isMenuVehicleOpened = true
                                            if not valeur.Type == "motorcycles" then
                                                updateRotationVehicle(valeur.headingVehicle)
                                            end
                                        end
                                    },menuInfoVehicle)
                                end
                            end
                        end)
                        RageUI.IsVisible(menuInfoVehicle, function()
                            RageUI.Separator((Translation.ConcessVehi["model"]):format(name))
                            RageUI.Line("color", 249, 130, 42)
                            RageUI.Separator((Translation.ConcessVehi["Storage"]):format(stockage))
                            RageUI.Separator((Translation.ConcessVehi["price"] ):format(price))
                            RageUI.Line("color", 249, 130, 42)
                            RageUI.Button(Translation.ConcessVehi["test_vehicle"], nil, {}, true, {
                                onSelected = function()
                                    visualisationOpen = false 
                                    RageUI.CloseAll()
                                    TriggerServerEvent("fCore:Concess:CanVisualisation", i)
                                    AddTimerBar("Timer :", {endTime = GetGameTimer() + TimeTestVehicle})
                                    DeleteVehicle(vehicule)
                                    if valeur.Type == "vehicle" then 
                                        SetEntityCoords(PlayerPedId(), CoordsTestVehi)
                                    elseif valeur.Type == "bateau" then
                                        SetEntityCoords(PlayerPedId(), CoordsTestBateau)
                                    elseif valeur.Type == "motorcycles" then
                                        SetEntityCoords(PlayerPedId(), CoordsTestMotorcycles)
                                    end
                                    TriggerServerEvent("fCore:setPlayerToBucket", GetPlayerServerId(PlayerId()))
                                    Wait(100)
                                    RequestModel(model)
                                    while not HasModelLoaded(model) do
                                        Citizen.Wait(10)
                                    end
                                    if valeur.Type == "vehicle" then 
                                        vehi = CreateVehicle(model, CoordsTestVehi, HeadingTestVehi, true, false)
                                    elseif valeur.Type == "bateau" then
                                        vehi = CreateVehicle(model, CoordsTestBateau, HeadingTestBateau, true, false)
                                    elseif valeur.Type == "motorcycles" then
                                        vehi = CreateVehicle(model, CoordsTestMotorcycles, HeadingTestMotorcycles, true, false)
                                    end
                                    TaskWarpPedIntoVehicle(PlayerPedId(), vehi, -1)
                                    Wait(TimeTestVehicle)
                                    DeleteVehicle(vehi)
                                    SetEntityCoords(PlayerPedId(), pointVehicle)
                                    TriggerServerEvent("fCore:setPlayerToNormalBucket")
                                    RemoveTimerBar()
                                end
                            })
                            RageUI.StatisticPanel((GetVehicleModelEstimatedMaxSpeed(GetHashKey(model))/60), "Vitesse maximal")
                            RageUI.StatisticPanel((GetVehicleModelMaxBraking(GetHashKey(model))/4), "Freinage")
                        end)
                    Wait(0)
                    FreezeEntityPosition(PlayerPedId(), false) 
                end
            end)
        end
    else
        cNotification(Translation.ConcessVehi["HasOnePlayerShow"])
    end
end
