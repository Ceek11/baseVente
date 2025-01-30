local openVenteConcess = false 
menuVenteConcess = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuCategoryVente = RageUI.CreateSubMenu(menuVenteConcess, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuVenteVehicle = RageUI.CreateSubMenu(menuCategoryVente, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuInfoVente = RageUI.CreateSubMenu(menuVenteVehicle, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuVenteConcess.Closed = function()
    openVenteConcess = false 
end

function openMenuVenteConcess(valeur)
    _Concess:getCategorieVehicule()
    _Concess:getVehicleBdd()
    if openVenteConcess then 
        openVenteConcess = false 
        RageUI.Visible(menuVenteConcess, false)
        return 
    else
        openVenteConcess = true
        RageUI.Visible(menuVenteConcess, true)
        CreateThread(function()
            while openVenteConcess do
                DisableControlAction(1, 51, true)
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuVenteConcess, function()
                    RageUI.Separator(Translation.ConcessVehi["SellVehicle"])
                    RageUI.Line("color", 249, 130, 42)
                    RageUI.Button(Translation.ConcessVehi["list_of_vehicles"], nil, {}, true, {}, menuCategoryVente)
                end)
                RageUI.IsVisible(menuCategoryVente, function()
                    RageUI.Separator(Translation.ConcessVehi["ListeVehicle"])
                    RageUI.Line("color", 249, 130, 42)
                    for _, v in pairs(listCategorie) do 
                        for _, category in pairs(valeur.categoryVehicule) do 
                            if v.name == category then 
                                RageUI.Button("Catégorie - "..v.label, nil, {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                        nameCategory = v.name
                                        labelCategory = v.label
                                    end
                                }, menuVenteVehicle)
                            end
                        end
                    end                
                end)
                RageUI.IsVisible(menuVenteVehicle, function()
                    RageUI.Separator((Translation.ConcessVehi["categorie"]):format(labelCategory))
                    RageUI.Line("color", 249, 130, 42)
                    for _, v in pairs(listVehicleConcess) do 
                        if nameCategory == v.category then
                            RageUI.Button(v.name, (Translation.ConcessVehi["price_of_the_vehicle"]):format(v.price), {RightBadge = RageUI.BadgeStyle.Car}, true, {
                                onSelected = function()
                                    name = v.name
                                    model = v.model
                                    price = v.price
                                    revenuVendeur = math.ceil(price*percentVendeur)
                                    revenuFournisseur = math.ceil(price*percentsupplier)
                                    revenuEntreprise = math.ceil(price*percentSociety)
                                end
                            },menuInfoVente)
                        end
                    end
                end)
                RageUI.IsVisible(menuInfoVente, function()
                    RageUI.Separator(Translation.ConcessVehi["SellOfVehicle"])
                    RageUI.Line("color", 249, 130, 42)
                    RageUI.Button((Translation.ConcessVehi["name_of_the_vehicle"]):format(name), nil, {}, true, {})
                    RageUI.Button((Translation.ConcessVehi["customer_price"]):format(price), ("Prix fournisseur : %s \nRevenu entreprise : %s$ \nRevenu vendeur : %s$"):format(revenuFournisseur, revenuEntreprise, revenuVendeur), {}, true, {})
                    RageUI.Button(Translation.ConcessVehi["selling_to_the_customer"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                TriggerServerEvent("fCore:Boss:Concess:giveInfoPaimentVehicle", GetPlayerServerId(targetT), model, price, name, valeur.SocietyConcess, valeur.Type, valeur.point)
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

RegisterNetEvent("fCore:Concess:SpawnVehicle")
AddEventHandler("fCore:Concess:SpawnVehicle", function(name, target, Type)
    newPlate = GeneratePlate()
    if Type == "vehicle" then 
        SpawnVehicle(name, CoordsSpawnVehi, HeadingSpawnVehi)
    elseif Type == "bateau" then 
        SpawnVehicle(name, CoordsSpawnBateau, HeadingSpawnBateau)
    elseif Type == "motorcycles" then 
        SpawnVehicle(name, CoordsSpawnMotorcycles, HeadingSpawnMotorcycles)
    
    end
    local vehicleProps = ESX.Game.GetVehicleProperties(vehi)
    vehicleProps.plate = newPlate
    SetVehicleNumberPlateText(vehi, newPlate)
    TriggerServerEvent("fCore:Boss:setVehicleOwnedPlayerId", target, vehicleProps, Type)
    TriggerServerEvent("fCore:Keys:AddKeys", newPlate, target)
    TriggerServerEvent("xKeys:addKeys", newPlate, name, target)
end)

RegisterNetEvent("fCore:Concess:giveInfoPaiment")
AddEventHandler("fCore:Concess:giveInfoPaiment", function(targetT, model, price, src, name, SocietyConcess, Type, pos)
    cNotification((Translation.ConcessVehi["check_paiement"]):format(price, model))
    verifPaiement(targetT, src, price, model, SocietyConcess, Type, pos)
end)

function verifPaiement(targetT, src, price, name, SocietyConcess, Type,pos)
    CreateThread(function()
        local keyPressed = false
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then
                if targetT then 
                    TriggerServerEvent("fCore:Concess:GiveBilling", src, price, name, SocietyConcess, Type, pos)
                    cNotification(Translation.ConcessVehi["accepted_the_payment"])
                    keyPressed = true
                end
            elseif IsControlJustPressed(1, 246) then 
                if targetT then 
                    cNotification(Translation.ConcessVehi["to_refuse_payment"])
                    TriggerServerEvent("fCore:Concess:sendMessageEmploye", src)
                    keyPressed = true
                end
            end
            Wait(0)
        end
    end)
end