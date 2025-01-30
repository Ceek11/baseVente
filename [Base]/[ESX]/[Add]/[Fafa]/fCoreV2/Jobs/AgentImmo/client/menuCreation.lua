local InformationProperty = {}
local posExtProperty = "~r~Indefini"
local posIntProperty = "~r~Indefini"
local posExtGarage = "~r~Indefini"
local posIntGarage = "~r~Indefini"
local LabelPriceVente = "~r~Indefini"
local LabelPriceLocation = "~r~Indefini"
local IndexTypeProperty = 1
local selectedPropertyIndex
local IndexTypeGarage = 1
local menuAgentImmoOpen = false 
local inProperty = false
local inGarage = false
menuAgentImmo = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuAgentImmo = RageUI.CreateSubMenu(menuAgentImmo, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuListProperty = RageUI.CreateSubMenu(menuAgentImmo, '', " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuProperty = RageUI.CreateSubMenu(subMenuListProperty, '', " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuPropertyInfo = RageUI.CreateSubMenu(subMenuProperty, '', " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuHouse = RageUI.CreateSubMenu(subMenuListProperty, '', " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuGarage = RageUI.CreateSubMenu(subMenuListProperty, '', " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)

local CheckAppartement = false
local CheckMaison = false
local CheckEntrepot = false
local CheckGarage = false
local typePropety = nil

menuAgentImmo.Closed = function()
    menuAgentImmoOpen = false 
end

function openMenuF6AgentImmo()
    if menuAgentImmoOpen then 
        menuAgentImmoOpen = false
        RageUI.Visible(menuAgentImmo, false)
        return 
    else
        menuAgentImmoOpen = true
        RageUI.Visible(menuAgentImmo, true)
        CreateThread(function()
            while menuAgentImmoOpen do 
                RageUI.IsVisible(menuAgentImmo, function()
                    RageUI.Button("Crée un propriéte", nil, {RightLabel = "→→"}, true, {}, subMenuAgentImmo)
                    RageUI.Button("Liste des propriétes", nil, {RightLabel = "→→"}, true, {}, subMenuListProperty)
                end)
                RageUI.IsVisible(subMenuListProperty, function()
                    RageUI.Button("Propriété", nil, {}, true, {
                        onSelected = function()
                            getInformationProperty()
                        end
                    }, subMenuProperty)
                    RageUI.Button("Maison", nil, {}, true, {}, subMenuHouse)
                    RageUI.Button("Garage", nil, {}, true, {}, subMenuGarage)
                end)
                RageUI.IsVisible(subMenuProperty, function()
                    if PropertyLoad then 
                        for k,v in pairs(getInformationPropertyBdd) do 
                            if not v.statusBuy then 
                                RageUI.Button(("- %s | %s: ~b~N°%s "):format(v.label, v.TypeGarage, v.id), "Status : Réservé \nCoffre 100Kg \nGarage : 2 PLace", {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                        wayPointHouse = json.decode(v.posGarageExt)
                                        wayPointGarage = json.decode(v.posHouseExt)
                                    end
                                }, subMenuPropertyInfo)
                            end
                        end
                    end
                end)
                RageUI.IsVisible(subMenuPropertyInfo, function()
                    RageUI.Button("Position Maison", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            SetNewWaypoint(wayPointHouse.x, wayPointHouse.y)
                        end
                    })
                    RageUI.Button("Position Garage", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            SetNewWaypoint(wayPointGarage.x, wayPointGarage.y)
                        end
                    })
                end)
                RageUI.IsVisible(subMenuHouse, function()
                    if HouseLoad then 
                        for k,v in pairs(getInformationHouseBdd) do 
                            if not v.statusBuy then 
                                RageUI.Button(("- %s~b~ N°%s "):format(v.label, v.id), "Status : Réservé \nCoffre 100Kg", {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                        local wayPointHouse = json.decode(v.posHouseExt)
                                        SetNewWaypoint(wayPointHouse.x, wayPointHouse.y)
                                    end
                                })
                            end
                        end
                    end
                end)
                RageUI.IsVisible(subMenuGarage, function()
                    if GarageLoad then 
                        for k,v in pairs(getInformationGarageBdd) do 
                            if not v.statusBuy then 
                                RageUI.Button(("- %s~b~ N°%s "):format(v.TypeGarage, v.id), "Status : Réservé \nGarage : 2 Place", {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                        local wayPointGarage = json.decode(v.posGarageExt)
                                        SetNewWaypoint(wayPointGarage.x, wayPointGarage.y)
                                    end
                                })
                            end
                        end
                    end
                end)
                RageUI.IsVisible(subMenuAgentImmo, function()
                    RageUI.Separator("↓ ~b~Choisir le type de propriéte~s~ ↓")
                    RageUI.Separator("Rue : ~b~"..GetStreetNameFromHashKey(Citizen.InvokeNative(0x2EB41072B4C1E4C0, GetEntityCoords(PlayerPedId()), Citizen.PointerValueInt(), Citizen.PointerValueInt())))
                    RageUI.Line("color", 249, 130, 42)
                    if not CheckGarage and not CheckEntrepot and not CheckMaison then 
                        RageUI.Checkbox("Appartement", nil, CheckAppartement, {}, {
                            onChecked = function()
                                InformationProperty = {}
                                CheckAppartement = true
                                typePropety = "Appartement"
                            end,
                            onUnChecked = function()
                                CheckAppartement = false
                                typePropety = nil
                            end
                        })
                    end
                    if not CheckAppartement and not CheckGarage and not CheckEntrepot then 
                        RageUI.Checkbox("Maison", nil, CheckMaison, {}, {
                            onChecked = function()
                                InformationProperty = {}
                                CheckMaison = true
                                typePropety = "Maison"
                            end,
                            onUnChecked = function()
                                CheckMaison = false
                                typePropety = nil
                            end
                        })
                    end
                    if not CheckAppartement and not CheckGarage and not CheckMaison then 
                        RageUI.Checkbox("Entrepôt", nil, CheckEntrepot, {}, {
                            onChecked = function()
                                InformationProperty = {}
                                CheckEntrepot = true
                                typePropety = "Entrepôt"
                            end,
                            onUnChecked = function()
                                CheckEntrepot = false
                                typePropety = nil
                            end
                        })
                    end
                    if not CheckAppartement and not CheckEntrepot and not CheckMaison then 
                        RageUI.Checkbox("Garage", nil, CheckGarage, {}, {
                            onChecked = function()
                                InformationProperty = {}
                                CheckGarage = true
                                typePropety = "Garage"
                            end,
                            onUnChecked = function()
                                CheckGarage = false
                                typePropety = nil
                            end
                        })    
                    end
                    if CheckMaison or CheckEntrepot or CheckAppartement then 
                        RageUI.Line("color", 249, 130, 42)
                        RageUI.Button("Position Exterieur Propriété", nil, {RightLabel = posExtProperty}, true, {
                            onSelected = function()
                                posExtProperty = "~g~Défini"
                                local posExtProperty = GetEntityCoords(PlayerPedId())
                                InformationProperty.posExtProperty = posExtProperty
                            end
                        })
                        if InformationProperty.posExtProperty ~= nil then
                            local TypeProperty = {}
                            local propertyIndex = {}
                            table.insert(TypeProperty, 1, "Aucune")
                            for i, property in ipairs(AgentImmo.Property) do
                                if property.TypeHouse == typePropety then 
                                    table.insert(TypeProperty, property.label)
                                    propertyIndex[property.label] = i
                                end
                            end
                            
                            RageUI.List("Types:", TypeProperty, IndexTypeProperty, nil, {}, true, {
                                onListChange = function(Index, Items)
                                    IndexTypeProperty = Index
                                    selectedPropertyIndex = propertyIndex[TypeProperty[Index]]
                                end,
                                onSelected = function(Index)
                                    InformationProperty.TypeProperty = TypeProperty[IndexTypeProperty]
                                    selectedPropertyIndex = propertyIndex[TypeProperty[Index]]
                                    if selectedPropertyIndex then
                                        local selectedProperty = AgentImmo.Property[selectedPropertyIndex]
                                        inProperty = true
                                        SetEntityCoords(PlayerPedId(), selectedProperty.positionProperty)
                                    end
                                end
                            })
                            if inProperty then 
                                RageUI.Button("~r~Quitter la propriété", nil, {}, true, {
                                    onSelected = function()
                                        inProperty = false
                                        SetEntityCoords(PlayerPedId(), InformationProperty.posExtProperty)
                                    end
                                })
                            end
                        end

                        RageUI.Line("color", 249, 130, 42)
                        RageUI.Button("Prix Vente", nil, {RightLabel = LabelPriceVente}, true, {
                            onSelected = function()
                                local input = lib.inputDialog("Choisir le prix de la vente", {" "})
                                if input then 
                                    local priceVente = input[1]
                                    if tonumber(priceVente) then 
                                        InformationProperty.priceVente = priceVente
                                        LabelPriceVente = ("~g~%s$"):format(InformationProperty.priceVente)
                                    else
                                        cNotification("Il faut enregistrer un bon prix")
                                    end
                                end
                            end
                        })
                        RageUI.Button("Prix Location", nil, {RightLabel = LabelPriceLocation}, true, {
                            onSelected = function()
                                local input = lib.inputDialog("Choisir le prix de location", {" "})
                                if input then 
                                    local priceLocation = input[1]
                                    if tonumber(priceLocation) then 
                                        InformationProperty.priceLocation = priceLocation
                                        LabelPriceLocation = ("~g~%s$"):format(InformationProperty.priceLocation)
                                    else
                                        cNotification("Il faut enregistrer un bon prix")
                                    end
                                end
                            end
                        })

                        RageUI.Button("Créer la propriété", nil, {}, true, {
                            onSelected = function()
                                createHouse()
                            end
                        })  
                        RageUI.Button("~r~Annuler", nil, {}, true, {
                            onSelected = function()
                                InformationProperty = {}
                            end
                        })
                    end   
                    
                    if CheckGarage then 
                        RageUI.Button("Position Exterieur Garage", nil, {RightLabel = posExtGarage}, posExtGarage, {
                            onSelected = function()
                                posExtGarage = "~g~Défini"
                                local posExtGarage = GetEntityCoords(PlayerPedId())
                                InformationProperty.posExtGarage = posExtGarage
                            end
                        })
                        if InformationProperty.posExtGarage ~= nil then 
                            local TypeGarage = {}
                            local GarageIndex = {}
                            for k,v in ipairs(AgentImmo.Garage) do 
                                table.insert(TypeGarage, v.TypeGarage)
                                GarageIndex[v.TypeGarage] = k
                            end

                            RageUI.List("Nombre de place", TypeGarage, IndexTypeGarage, nil, {}, true, {
                                onListChange = function(Index, Items)
                                    IndexTypeGarage = Index
                                end,
                                onSelected = function()
                                    InformationProperty.TypeGarage = TypeGarage[IndexTypeGarage]
                                    local selectedGarageIndex = GarageIndex[TypeGarage[IndexTypeGarage]]
                                    if selectedGarageIndex then
                                        SelectedGarage =  AgentImmo.Garage[selectedGarageIndex]
                                        SetEntityCoords(PlayerPedId(), SelectedGarage.positionGarage)
                                        inGarage = true
                                    end
                                end
                            })
                            if inGarage then
                                RageUI.Button("~r~Quitter le garage", nil, {}, true, {
                                    onSelected = function()
                                        inGarage = false
                                        SetEntityCoords(PlayerPedId(), InformationProperty.posExtGarage)
                                    end
                                })
                            end
                        end

                        RageUI.Line("color", 249, 130, 42)
                        RageUI.Button("Prix Vente", nil, {RightLabel = LabelPriceVente}, true, {
                            onSelected = function()
                                local input = lib.inputDialog("Choisir le prix de la vente", {" "})
                                if input then 
                                    local priceVente = input[1]
                                    if tonumber(priceVente) then 
                                        InformationProperty.priceVente = priceVente
                                        LabelPriceVente = ("~g~%s$"):format(InformationProperty.priceVente)
                                    else
                                        cNotification("Il faut enregistrer un bon prix")
                                    end
                                end
                            end
                        })
                        RageUI.Button("Prix Location", nil, {RightLabel = LabelPriceLocation}, true, {
                            onSelected = function()
                                local input = lib.inputDialog("Choisir le prix de location", {" "})
                                if input then 
                                    local priceLocation = input[1]
                                    if tonumber(priceLocation) then 
                                        InformationProperty.priceLocation = priceLocation
                                        LabelPriceLocation = ("~g~%s$"):format(InformationProperty.priceLocation)
                                    else
                                        cNotification("Il faut enregistrer un bon prix")
                                    end
                                end
                            end
                        })
                        
                        RageUI.Line("color", 249, 130, 42)
                        RageUI.Button("Créer la propriété", nil, {}, true, {
                            onSelected = function()
                                createGarage()
                            end
                        })  
                        RageUI.Button("~r~Annuler", nil, {}, true, {
                            onSelected = function()
                                InformationProperty = {}
                            end
                        }) 

                    end  
                end)
                Wait(0)
            end
        end)
    end
end

Keys.Register("F6", "AgentImmo", "Ouvrir le menu agent immobilier", function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == "agent-immo" then
        if not menuAgentImmoOpen then 
            openMenuF6AgentImmo()
        end
    end
end)



function createGarage()
    if InformationProperty.posExtGarage ~= nil and InformationProperty.priceLocation ~= nil and InformationProperty.priceVente ~= nil then 
        TriggerServerEvent("fCore:AgentImmo:CreateHouse", InformationProperty, "Garage", AgentImmo.Garage, typePropety)
        cNotification("Vous venez de crée un garage")
        InformationProperty = {}
    else 
        cNotification("Vous n'avez pas tout défini")
    end
end

function createHouse()
    if InformationProperty.posExtProperty ~= nil  and InformationProperty.priceLocation ~= nil and InformationProperty.priceVente ~= nil then 
        TriggerServerEvent("fCore:AgentImmo:CreateHouse", InformationProperty, "Maison", AgentImmo.Property, typePropety, AgentImmo.Property[selectedPropertyIndex].label)
        cNotification("Vous venez de crée une maison")
        posExtProperty = "~r~Indefini"
        posIntProperty = "~r~Indefini"
        posExtGarage = "~r~Indefini"
        posIntGarage = "~r~Indefini"
        LabelPriceVente = "~r~Indefini"
        LabelPriceLocation = "~r~Indefini"
        InformationProperty = {}
    else 
        cNotification("Vous n'avez pas tout défini")
    end
end

