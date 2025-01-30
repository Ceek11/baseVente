local openHouseImmo = false 
menuHouseImmo = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuHouseImmo.Closed = function()
    openHouseImmo = false 
end

function openMenuHouseImmo(endroit, valeur)
    if valeur.statusBuy then 
        GetOwnerHouse(valeur.id)
    end
    if openHouseImmo then 
        openHouseImmo = false 
        RageUI.Visible(menuHouseImmo, false)
        return
    else
        openHouseImmo = true
        RageUI.Visible(menuHouseImmo, true)
        CreateThread(function()
            while openHouseImmo do 
                RageUI.IsVisible(menuHouseImmo, function()
                    if endroit == "ExtHouse" then 
                        if not valeur.statusBuy then 
                            RageUI.Button("Visiter le House", nil, {}, true, {
                                onSelected = function()
                                    inProperty = true
                                    local positionIntHouse = json.decode(valeur.positionProperty)
                                    SetEntityCoords(PlayerPedId(), positionIntHouse.x, positionIntHouse.y, positionIntHouse.z)
                                end
                            })
                            if ESX.PlayerData.job.name == "agent-immo" then
                                RageUI.Line("color", 249, 130, 42)
                                RageUI.Button("Louer la maison à quelqu'un", nil, {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                        targetT = GetNearbyPlayer(false, true)
                                        if not targetT then return end 
                                        if targetT then
                                            if valeur.vip then
                                                ESX.TriggerServerCallback("fCore:vip:GetIfPlayerHaveVip", function(result)
                                                    if result then 
                                                        TriggerServerEvent("fCore:AgentImmo:rentalHouse", GetPlayerServerId(targetT), valeur.priceLocation, valeur.id)
                                                    else
                                                        cNotitication("La personne n'a pas le VIP")
                                                    end
                                                end, GetPlayerServerId(targetT))
                                            else
                                                TriggerServerEvent("fCore:AgentImmo:rentalHouse", GetPlayerServerId(targetT), valeur.priceLocation, valeur.id)
                                            end
                                        end 
                                    end
                                })
                                RageUI.Button("Vendre la maison à quelqu'un", nil, {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                        targetT = GetNearbyPlayer(false, true)
                                        if not targetT then return end
                                        if targetT then
                                            ESX.TriggerServerCallback("fCore:vip:GetIfPlayerHaveVip", function(result)
                                                if result then 
                                                    TriggerServerEvent("fCore:AgentImmo:resellHouse", GetPlayerServerId(targetT), valeur.priceVente, valeur.id)
                                                else
                                                    cNotitication("La personne n'a pas le VIP")
                                                end
                                            end, GetPlayerServerId(targetT))
                                        end 
                                    end
                                })
                            end
                        else
                            if OwnerHouse then 
                                if valeur.expiration ~= false then 
                                    RageUI.Separator(("Votre location expire dans %s"):format(valeur.expiration))
                                end
                                RageUI.Line("color", 249, 130, 42)
                                RageUI.Button("Rentrer dans ma maison.", nil, {}, true, {
                                    onSelected = function()
                                        inProperty = true
                                        local positionIntHouse = json.decode(valeur.positionProperty)
                                        SetEntityCoords(PlayerPedId(), positionIntHouse.x, positionIntHouse.y, positionIntHouse.z)
                                        CreatePointHouse(json.decode(valeur.posCoffre), json.decode(valeur.posManage), valeur.weightCoffre, valeur.weightCoffreVIP, valeur.id)
                                    end
                                })
                            else
                                if #ColocHouse > 0 then 
                                    for k,v in pairs(ColocHouse) do 
                                        if ColocHouse then
                                            RageUI.Button("Rentrer dans ma maison.", nil, {}, true, {
                                                onSelected = function()
                                                    inProperty = true
                                                    local positionIntHouse = json.decode(valeur.positionProperty)
                                                    SetEntityCoords(PlayerPedId(), positionIntHouse.x, positionIntHouse.y, positionIntHouse.z)
                                                    CreatePointHouse(json.decode(valeur.posCoffre), json.decode(valeur.posManage), valeur.weightCoffre, valeur.weightCoffreVIP, valeur.id)
                                                end
                                            })
                                        else
                                            RageUI.Button("Sonner chez la personne", nil, {}, true, {
                                                onSelected = function()
                                                    TriggerServerEvent("fCore:agentImmo:sonnerAppart", valeur.id)
                                                end
                                            })
                                        end
                                    end
                                elseif #JobHouse > 0 then
                                    for k,v in pairs(JobHouse) do 
                                        if JobHouse then
                                            RageUI.Button("Rentrer dans ma maison.", nil, {}, true, {
                                                onSelected = function()
                                                    inProperty = true
                                                    local positionIntHouse = json.decode(valeur.positionProperty)
                                                    SetEntityCoords(PlayerPedId(), positionIntHouse.x, positionIntHouse.y, positionIntHouse.z)
                                                    CreatePointHouse(json.decode(valeur.posCoffre), json.decode(valeur.posManage), valeur.weightCoffre, valeur.weightCoffreVIP, valeur.id)
                                                end
                                            })
                                        else
                                            RageUI.Button("Sonner chez la personne", nil, {}, true, {
                                                onSelected = function()
                                                    TriggerServerEvent("fCore:agentImmo:sonnerAppart", valeur.id)
                                                end
                                            })
                                        end
                                    end
                                elseif #GangHouse > 0 then
                                    for k,v in pairs(GangHouse) do 
                                        if GangHouse then
                                            RageUI.Button("Rentrer dans ma maison.", nil, {}, true, {
                                                onSelected = function()
                                                    inProperty = true
                                                    local positionIntHouse = json.decode(valeur.positionProperty)
                                                    SetEntityCoords(PlayerPedId(), positionIntHouse.x, positionIntHouse.y, positionIntHouse.z)
                                                    CreatePointHouse(json.decode(valeur.posCoffre), json.decode(valeur.posManage), valeur.weightCoffre, valeur.weightCoffreVIP, valeur.id)
                                                end
                                            })
                                        else
                                            RageUI.Button("Sonner chez la personne", nil, {}, true, {
                                                onSelected = function()
                                                    TriggerServerEvent("fCore:agentImmo:sonnerAppart", valeur.id)
                                                end
                                            })
                                        end
                                    end
                                else
                                    RageUI.Button("Sonner chez la personne", nil, {}, true, {
                                        onSelected = function()
                                            TriggerServerEvent("fCore:agentImmo:sonnerAppart", valeur.id)
                                        end
                                    })
                                end
                            end
                        end
                    elseif endroit == "IntHouse" then 
                        RageUI.Button("Sortir du House", nil, {}, true, {
                            onSelected = function()
                                inProperty = false
                                local posHouseExt = json.decode(valeur.posHouseExt)
                                SetEntityCoords(PlayerPedId(), posHouseExt.x, posHouseExt.y, posHouseExt.z)
                            end
                        })
                    end
                end)
            Wait(0)
            end
        end)
    end
end
