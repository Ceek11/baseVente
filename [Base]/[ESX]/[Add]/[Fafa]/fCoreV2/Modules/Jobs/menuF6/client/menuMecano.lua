openF6Mecano = false 
menuF6Mecano = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
PositionF6Mecano = RageUI.CreateSubMenu(menuF6Mecano," ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
AnnonceF6Mecano = RageUI.CreateSubMenu(menuF6Mecano," ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
OptionF6Mecano = RageUI.CreateSubMenu(menuF6Mecano," ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuF6Mecano.Closed = function()
    openF6Mecano = false 
end

option = true
function openMenuF6Mecano(jobName)
    if openF6Mecano then 
        openF6Mecano = false 
        RageUI.Visible(menuF6Mecano, false)
        return
    else
        openF6Mecano = true 
        RageUI.Visible(menuF6Mecano, true)
        CreateThread(function()
            while openF6Mecano do 
                RageUI.IsVisible(menuF6Mecano, function()
                    RageUI.Separator("↓ ~b~Options de l'entreprise~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Option Métier", nil, {RightLabel = "→→"}, true, {}, OptionF6Mecano)
                    RageUI.Button("Faire une facture", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
                                local bill = Visual.KeyboardNumber("Choisire le montant de la facture", "", 5)
                                if not tonumber(bill) then
                                    cNotification("Entrer un nombre valide") 
                                else
                                    local raison = Visual.KeyboardText("Choisir la raison de la facture", "", 40)
                                    if raison == " " or raison == nil or raison == "" then 
                                        raison = "Aucune"
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(targetT), "society_"..jobName, jobName, bill)
                                        TriggerServerEvent("fCore:Billing:HistoryBilling", GetPlayerServerId(targetT), raison, bill, jobName, "society_"..jobName)
                                        cNotification("Vous venez d'envoyer la facture")
                                    else
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(targetT), "society_"..jobName, jobName, bill)
                                        TriggerServerEvent("fCore:Billing:HistoryBilling", GetPlayerServerId(targetT), raison, bill, jobName, "society_"..jobName)
                                        cNotification("Vous venez d'envoyer la facture")
                                    end
                                return
                                end
                            end
                        end
                    })
                    RageUI.Button("Faire une Annonce", nil, {RightLabel = "→→"}, true, {}, AnnonceF6Mecano)
                    RageUI.Button("Position GPS", nil, {RightLabel = "→→"}, true, {}, PositionF6Mecano)
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("~r~Prendre ma démission", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local Confirmation = Visual.KeyboardText("êtes vous sur ? Oui / Non", "Oui / Non", 10)
                            if Confirmation == "Oui" then 
                                openF6Mecano = false 
                                RageUI.CloseAll()
                                TriggerServerEvent("fCore:Boss:resignation")
                                cNotification("Vous venez de quitter votre job")
                            else
                                cNotification("~r~Vous avez annuler")
                            end
                        end
                    })
                end)
                RageUI.IsVisible(PositionF6Mecano, function()
                    RageUI.Separator("↓ ~b~Positions GPS~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(MenuF6.Mecano.Position) do 
                        if k == jobName then 
                            for _, pos in pairs(v) do 
                                RageUI.Button(pos.button, pos.desc, {RightLabel = "→"}, true, {
                                    onSelected = function()
                                        SetNewWaypoint(pos.pos)
                                    end
                                })
                            end
                        end
                    end
                end)
                RageUI.IsVisible(AnnonceF6Mecano, function()
                    RageUI.Separator("↓ ~b~Annonces~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(MenuF6.Mecano.Annonce) do
                        RageUI.Button(v.label, nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:menuF6:Annonce", v.message, jobName)
                            end
                        })
                    end
                    RageUI.Button("Annonce personalisé", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            local AnnouncePerso = Visual.KeyboardText("Choissisez le message", "", 100)
                            if AnnouncePerso ~= " " and AnnouncePerso ~= "" or AnnouncePerso ~= nil then 
                                TriggerServerEvent("fCore:MenuF6:SendAnnouncePersonalized", AnnouncePerso, jobName)
                            end
                        end
                    })
                end)
                RageUI.IsVisible(OptionF6Mecano, function()
                    RageUI.Button("Nettoyer le véhicule", nil, {RightLabel = "→→"}, option , {
                        onActive = function()
                            ClosetVehWithDisplay()
                        end,
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            local vehicle   = ESX.Game.GetVehicleInDirection()
                            local coords    = GetEntityCoords(playerPed)
                            if IsPedSittingInAnyVehicle(playerPed) then
                                cNotification('Vous ne pouvez pas effectuer cette action depuis un véhicule!')
                                return
                            end
                            if DoesEntityExist(vehicle) then
                                TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
                                Citizen.CreateThread(function()
                                    Citizen.Wait(10000)
                
                                    SetVehicleDirtLevel(vehicle, 0)
                                    ClearPedTasksImmediately(playerPed)
                                    cNotification('Véhicule nettoyer')
                                end)
                            else
                                cNotification('~r~Aucun véhicule à proximité')
                            end
                            option = false
                            ESX.SetTimeout(5000,function()
                                option = true
                            end)
                        end
                    })
                    RageUI.Button("Réparer le véhicule", nil, {RightLabel = "→→"}, option , {
                        onActive = function()
                            ClosetVehWithDisplay()
                        end,
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            local vehicle   = ESX.Game.GetVehicleInDirection()
                            local coords    = GetEntityCoords(playerPed)
                            if IsPedSittingInAnyVehicle(playerPed) then
                                cNotification('Vous ne pouvez pas effectuer cette action depuis un véhicule!')
                                return
                            end
                            if DoesEntityExist(vehicle) then
                                TriggerServerEvent("fCore:MenuF6:Mecano:repairkit")
                            else
                                cNotification('~r~Aucun véhicule à proximité')
                            end
                            option = false
                            ESX.SetTimeout(5000,function()
                                option = true
                            end)
                        end
                    })
                    RageUI.Button("Crocheter le vehicule", nil, {RightLabel = "→→"}, option, {
                        onActive = function()
                            ClosetVehWithDisplay()
                        end,
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            local vehicle   = ESX.Game.GetVehicleInDirection()
                            local coords    = GetEntityCoords(playerPed)
                            if IsPedSittingInAnyVehicle(playerPed) then
                                cNotification('Vous ne pouvez pas effectuer cette action depuis un véhicule!')
                                return
                            end
                            if DoesEntityExist(vehicle) then
                                TriggerServerEvent("fCore:MenuF6:Mecano:crocheter")
                            else
                                cNotification('~r~Aucun véhicule à proximité')
                            end
                            option = false
                            ESX.SetTimeout(5000,function()
                                option = true
                            end)
                        end
                    })
                    RageUI.Button("Véhicule en fourrière", nil, {RightLabel = "→"}, option, { 
                        onActive = function()
                            ClosetVehWithDisplay()
                        end,
                        onSelected = function() 
                            ImpoundVehicle()
                            option = false
                            ESX.SetTimeout(5000,function()
                                option = true
                            end)
                        end 
                    })    


                    for _,v in pairs(MenuF6.Mecano.plateau) do
                        if ESX.PlayerData.job and ESX.PlayerData.job.name == v then  
                            RageUI.Button("Mettre sur le plateau", nil, {RightLabel = "→→"}, option, {
                                onActive = function()
                                    ClosetVehWithDisplay()
                                end,
                                onSelected = function()
                                    local playerPed = PlayerPedId()
                                    vehicle = GetVehiclePedIsIn(playerPed, true)
                                    local towmodel = GetHashKey('flatbed')
                                    local isvehicletow = IsVehicleModel(vehicle, towmodel)
                                    if isvehicletow then
                                        local targetVehicle = ESX.Game.GetClosestVehicle()
                                        if CurrentlyTowedVehicle == nil then
                                            if targetVehicle ~= 0 then
                                                if not IsPedInAnyVehicle(playerPed, true) then
                                                    if vehicle ~= targetVehicle then
                                                        AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 0.9, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                                        CurrentlyTowedVehicle = targetVehicle
                                                        cNotification('Véhicule attacher avec succes')
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    option = false
                                    ESX.SetTimeout(5000,function()
                                        option = true
                                    end)
                                end
                            })
                            RageUI.Button("Enlever du plateau", nil, {RightLabel = "→→"}, option, {
                                onActive = function()
                                    ClosetVehWithDisplay()
                                end,
                                onSelected = function()
                                    AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                    DetachEntity(CurrentlyTowedVehicle, true, true)
                                    CurrentlyTowedVehicle = nil
                                    option = false
                                    ESX.SetTimeout(5000,function()
                                        option = true
                                    end)
                                end
                            })
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end

RegisterNetEvent("startRepairVehicle")
AddEventHandler("startRepairVehicle", function()
    repairVehicle()
end)

RegisterNetEvent("startCrocheterVehicle")
AddEventHandler("startCrocheterVehicle", function()
    local playerPed = PlayerPedId()
    local vehicle = ESX.Game.GetClosestVehicle()
    local coords = GetEntityCoords(playerPed)

    if DoesEntityExist(vehicle) then
        TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
        Citizen.CreateThread(function()
            Citizen.Wait(10000)
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            ClearPedTasksImmediately(playerPed)
            cNotification("Véhicule déverouiller")
        end)
    else
        cNotification("Aucun vehicule a proximité")
    end
end)


function ClosetVehWithDisplay()
    local veh = ESX.Game.GetClosestVehicle()
    local vCoords = GetEntityCoords(veh)
    DrawMarker(2, vCoords.x, vCoords.y, vCoords.z + 1.3, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255,24,20, 255, 55555, false, true, 2, false, false, false, false)
end

