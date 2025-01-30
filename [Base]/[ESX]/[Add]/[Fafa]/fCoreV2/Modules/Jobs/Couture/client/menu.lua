local openGarageCouture = false 
menuGarageCouture = RageUI.CreateMenu("Garage", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuGarageCouture.Closed = function()
    openGarageCouture = false 
end

cooldown = true 
function openMenuGarageCouture()
    if openGarageCouture then 
        openGarageCouture = false 
        RageUI.Visible(menuGarageCouture, false)
        return
    else
        openGarageCouture = true 
        RageUI.Visible(menuGarageCouture, true)
        CreateThread(function()
            while openGarageCouture do 
                DisableControlAction(1, 51, true)
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuGarageCouture, function()
                    RageUI.Separator(Translation.Couture["takeService"])
                    RageUI.Line("color", 249, 130,42)
                    RageUI.Checkbox(Translation.Couture["checkbox_take_service"] , nil, Cfg.inService, {}, {
                        onChecked = function()
                            Cfg.inService = true
                            for k,infos in pairs(Couture.Cloak.clothes.Employe) do
                                applySkinSpecific(infos)
                            end 
                        end,
                        onUnChecked = function()
                            Cfg.inService = false
                            for k, infos in pairs(Couture.Cloak.clothes.civil) do 
                                applySkinSpecific(infos)
                            end
                        end
                    })
                    if Cfg.inService then 
                        RageUI.Separator(Translation.Couture["separator_available_vehicle"])
                        RageUI.Line("color", 19, 107, 190)
                        for k,v in pairs(Couture.Garage) do 
                            RageUI.Button(v.label, nil, {RightLabel = "→→"}, cooldown, {
                                onSelected = function()
                                    if ESX.Game.IsSpawnPointClear(v.spawn, 5) then 
                                        cooldown = false
                                        RequestModel(v.name)
                                        while not HasModelLoaded(v.name) do
                                            Citizen.Wait(10)
                                        end
                                        vehicleCouture = CreateVehicle(v.name, v.spawn, v.heading, true, false)
                                        TriggerServerEvent("fCore:Couture:Caution", v.caution, 1)
                                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicleCouture, -1)
                                        RageUI.CloseAll()
                                        openGarageCouture = false 
                                        Wait(10000)
                                        cooldown = true
                                    else
                                        cNotification(Translation.Couture["cNotif_spawn_not_clear"])
                                    end
                                end
                            })
                        end
                    end
                end)
            Wait(0)
            FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end

