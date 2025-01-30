local openGarageImmo = false 
menuGarageImmo = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuGarageImmo.Closed = function()
    openGarageImmo = false 
end

function openMenuGarageImmo(endroit, valeur)
    if openGarageImmo then 
        openGarageImmo = false 
        RageUI.Visible(menuGarageImmo, false)
        return
    else
        openGarageImmo = true
        RageUI.Visible(menuGarageImmo, true)
        CreateThread(function()
            while openGarageImmo do 
                RageUI.IsVisible(menuGarageImmo, function()
                    if endroit == "ExtGarage" then 
                        if not valeur.statusBuy then 
                            RageUI.Button("Visiter le garage", nil, {}, true, {
                                onSelected = function()
                                    inGarage = true
                                    local positionIntGarage = json.decode(valeur.positionGarage)
                                    SetEntityCoords(PlayerPedId(), positionIntGarage.x, positionIntGarage.y, positionIntGarage.z)
                                end
                            })
                            if ESX.PlayerData.job.name == "agent-immo" then 
                                RageUI.Line("color", 249, 130, 42)
                                RageUI.Button("Louer la maison à quelqu'un", nil, {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                        targetT = GetNearbyPlayer(false, true)
                                        if not targetT then return end 
                                        if targetT then
                                            TriggerServerEvent("fCore:AgentImmo:rentalProprety", GetPlayerServerId(targetT), valeur.priceLocation)
                                        end 
                                    end
                                })
                                RageUI.Button("Vendre la maison à quelqu'un", nil, {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                    end
                                })
                            end
    
                        else
                            RageUI.Button("Sonner chez ....", nil, {}, true, {})
                        end
                    elseif endroit == "IntGarage" then 
                        RageUI.Button("Sortir du garage", nil, {}, true, {
                            onSelected = function()
                                inGarage = false
                                local posGarageExt = json.decode(valeur.posGarageExt)
                                SetEntityCoords(PlayerPedId(), posGarageExt.x, posGarageExt.y, posGarageExt.z)
                            end
                        })
                    end
                end)
            Wait(0)
            end
        end)
    end
end
