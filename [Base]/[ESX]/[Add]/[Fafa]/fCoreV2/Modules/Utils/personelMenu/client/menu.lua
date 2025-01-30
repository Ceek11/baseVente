openPersonel = false 
menuPersonel = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
SubMenuPreference = RageUI.CreateSubMenu(menuPersonel, " ", " ", nil, nil, BannerConfig.Banner, BannerConfig.TextureName)
SubMenuVehicle = RageUI.CreateSubMenu(menuPersonel, " ", " ", nil, nil, BannerConfig.Banner, BannerConfig.TextureName)
SubMenuDocument = RageUI.CreateSubMenu(menuPersonel, " ", " ", nil, nil, BannerConfig.Banner, BannerConfig.TextureName)
SubMenuInformation = RageUI.CreateSubMenu(menuPersonel, " ", " ", nil, nil, BannerConfig.Banner, BannerConfig.TextureName)
menuPersonel.Closed = function()
    openPersonel = false 
end

local SwitchPPA = 1
local SwitchIdentity = 1
local SwitchDrive = 1
local SwitchVehicle = 1
local hasCinematic = false

function openMenuPersonel()
    if openPersonel then 
        openPersonel = false
        RageUI.Visible(menuPersonel, false) 
        return 
    else
        openPersonel = true
        RageUI.Visible(menuPersonel, true) 
        CreateThread(function()
            while openPersonel do 
                RageUI.IsVisible(menuPersonel, function()
                    RageUI.Button(Translation.PersonelMenu["button_information"], Translation.PersonelMenu["desc_see_your_information"], {RightLabel = "→→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('fCore:personelMenu:GetInformation', function(job, money, bank, black_money, job2)
                                orgaJoueur = job2
                                jobJoueur = job
                                moneyJoueur = money
                                bankJoueur = bank
                                black_moneyJoueur = black_money
                            end)
                        end
                    }, SubMenuInformation)
                    RageUI.Button(Translation.PersonelMenu["button_document"], Translation.PersonelMenu["desc_see_your_document"], {RightLabel = "→→"}, true, {}, SubMenuDocument)
                    if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId()), false) then 
                        RageUI.Button(Translation.PersonelMenu["button_vehicle"], Translation.PersonelMenu["desc_manage_vehi"], {RightLabel = "→→"}, true, {}, SubMenuVehicle)
                    end
                    RageUI.Button(Translation.PersonelMenu["button_preferences"], Translation.PersonelMenu["desc_see_your_preferences"], {RightLabel = "→→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('fCore:personelMenu:GetStatsHelmet', function(result) 
                                for k,v in pairs(result) do
                                    casqueState = v.helmet
                                end
                            end)
                        end
                    },SubMenuPreference)
                end)
                RageUI.IsVisible(SubMenuPreference, function()
                    RageUI.Separator("↓ ~b~Mes préférences~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Checkbox(Translation.PersonelMenu["checkbox_automatic_helmet"], Translation.PersonelMenu["desc_disable_automatic_heltmet"], casqueState, {}, {
                        onChecked = function()
                            casqueState = true
                            TriggerServerEvent("fCore:personelMenu:helmetAuto", true)
                        end,
                        onUnChecked = function()
                            casqueState = false
                            TriggerServerEvent("fCore:personelMenu:helmetAuto", false)
                        end
                    })
                    RageUI.Checkbox(Translation.PersonelMenu["checkbox_cinematic_mode"], nil, cinematique, {}, {
                        onChecked = function()
                            cinematique = true
                            TriggerEvent("openCinema:ui", true)
                            TriggerEvent("ui:toggle", false)
                            DisplayRadar(false)
                            TriggerEvent("ui:toggle", false)
                            ExecuteCommand("hud")
                        end,
                        onUnChecked = function()
                            cinematique = false
                            TriggerEvent("openCinema:ui", false)
                            TriggerEvent("ui:toggle", true)
                            DisplayRadar(true)
                            ExecuteCommand("hud")
                        end
                    })
                    RageUI.Checkbox(Translation.PersonelMenu["checkbox_hide_hud"], nil, hideHud, {}, {
                        onChecked = function()
                            hideHud = true
                            ExecuteCommand("hud")
                        end,
                        onUnChecked = function()
                            hideHud = false
                            ExecuteCommand("hud")
                        end
                    })
                    RageUI.Checkbox(Translation.PersonelMenu["checkbox_hide_radar"], nil, hideRadar, {}, {
                        onChecked = function()
                            hideRadar = true
                            DisplayRadar(false)
                        end,
                        onUnChecked = function()
                            hideRadar = false
                            DisplayRadar(true)
                        end
                    })
                end)
                RageUI.IsVisible(SubMenuDocument, function()
                    RageUI.Separator(Translation.PersonelMenu["separor_paper"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.List(Translation.PersonelMenu["list_id_card"], {"~g~Regarder~s~", "~r~Montrer~s~"}, SwitchIdentity, nil, {}, true, {
                        onListChange = function(Index, Items)
                            SwitchIdentity = Index
                        end,
                        onSelected = function()
                            if SwitchIdentity == 1 then 
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                            else
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 and distance <= 3.0 then
                                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
                                else
                                    cNotification(Translation.PersonelMenu["cNotif_players_nearby"])
                                end
                            end
                        end
                    })
                    RageUI.List(Translation.PersonelMenu["list_drivers_license"], {"~g~Regarder~s~", "~r~Montrer~s~"}, SwitchDrive, nil, {}, true, {
                        onListChange = function(Index, Items)
                            SwitchDrive = Index
                        end,
                        onSelected = function()
                            if SwitchDrive == 1 then 
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                            else
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 and distance <= 3.0 then
                                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
                                else
                                    cNotification(Translation.PersonelMenu["cNotif_players_nearby"])
                                end
                            end
                        end
                    })
                    RageUI.List(Translation.PersonelMenu["list_paa"], {"~g~Regarder~s~", "~r~Montrer~s~"}, SwitchPPA, nil, {}, true, {
                        onListChange = function(Index, Items)
                            SwitchPPA = Index
                        end,
                        onSelected = function()
                            if SwitchPPA == 1 then 
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                            else
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 and distance <= 3.0 then
                                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
                                else
                                    cNotification(Translation.PersonelMenu["cNotif_players_nearby"])
                                end
                            end
                        end
                    })
                end)
                RageUI.IsVisible(SubMenuInformation, function()
                    RageUI.Separator(Translation.PersonelMenu["separor_information"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Separator(("Métier : ~b~%s"):format(jobJoueur))
                    if orgaJoueur == "Civil" then 
                        RageUI.Separator("Gang / Orga : ~b~Aucune")
                    else
                        RageUI.Separator(("Gang / Orga : ~b~%s"):format(orgaJoueur))
                    end
                    RageUI.Separator(("Espèce : ~g~%s$"):format(moneyJoueur))
                    RageUI.Separator(("Banque : ~b~%s$"):format(bankJoueur))
                    RageUI.Separator(("Argent sale : ~r~%s$"):format(black_moneyJoueur))
                end)
                RageUI.IsVisible(SubMenuVehicle, function()
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    local engine = GetVehicleEngineHealth(vehicle) /10
                    local essence = GetVehicleFuelLevel(vehicle)
                    RageUI.Separator(Translation.PersonelMenu["separor_vehicle_action"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Separator("Etat du moteur : ~g~"..math.floor(engine).."%")
                    RageUI.Separator("Niveau d'essence : ~g~"..math.floor(essence).."%")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.List(Translation.PersonelMenu["list_door"], {"Avant Gauche~s~", "Avant droite~s~", "Arrière gauche~s~", "Arrière droite~s~", "Copot~s~", "Coffre~s~",}, SwitchVehicle, Translation.PersonelMenu["desc_manage_door"], {}, true, {
                        onListChange = function(Index, Items)
                            SwitchVehicle = Index
                        end,
                        onSelected = function()
                            local SwitchVehicle = SwitchVehicle -1 
                            local vehicle = GetVehiclePedIsIn(PlayerPedId())
                            if openBeforeDoorLeft then 
                                openBeforeDoorLeft = false
                                SetVehicleDoorShut(vehicle, SwitchVehicle, false)
                            else
                                openBeforeDoorLeft = true
                                SetVehicleDoorOpen(vehicle, SwitchVehicle, false)
                            end
                        end
                    })
                    RageUI.Button(Translation.PersonelMenu["list_engine"], nil, {}, true, {
                        onSelected = function()
                            StatsVehicle()
                        end
                    })
                    RageUI.Button(Translation.PersonelMenu["list_anchor"], nil, {}, true, {
                        onSelected = function()
                            local vehicle = GetVehiclePedIsIn(PlayerPedId())
                            local vehicleClass = GetVehicleClass(vehicle)
                            local speed = GetEntitySpeed(vehicle)
                            if IsPedInVehicle(PlayerPedId(), vehicle, true) and vehicleClass == 14 then
                                if speed <= 5 then
                                    if entityFreeze then 
                                        entityFreeze = false
                                        FreezeEntityPosition(vehicle, true)
                                    else
                                        entityFreeze = true
                                        FreezeEntityPosition(vehicle, false)
                                    end
                                else
                                    cNotification(Translation.PersonelMenu["cNotif_boat_not_standstill"])
                                end
                            else
                                cNotification(Translation.PersonelMenu["cNotif_not_in_boat"])
                            end
                        end
                    })
                end)
                Wait(0)
            end
        end)
    end
end

