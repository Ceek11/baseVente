local openGarageAbatoire = false 
menuGarageAbatoire = RageUI.CreateMenu("Garage", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuGarageAbatoire.Closed = function()
    openGarageAbatoire = false 
end

cooldown = true 
function openMenuGarageAbatoire()
    if openGarageAbatoire then 
        openGarageAbatoire = false 
        RageUI.Visible(menuGarageAbatoire, false)
        return
    else
        openGarageAbatoire = true 
        RageUI.Visible(menuGarageAbatoire, true)
        CreateThread(function()
            while openGarageAbatoire do 
                DisableControlAction(1, 51, true)
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuGarageAbatoire, function()
                    RageUI.Separator(Translation.Abatoire["takeService"])
                    RageUI.Line("color", 249, 130,42)
                    RageUI.Checkbox(Translation.Abatoire["checkbox_take_service"] , nil, Cfg.inService, {}, {
                        onChecked = function()
                            Cfg.inService = true
                            for k,infos in pairs(Abatoire.Cloak.clothes.Employe) do
                                applySkinSpecific(infos)
                            end 
                        end,
                        onUnChecked = function()
                            Cfg.inService = false
                            for k, infos in pairs(Abatoire.Cloak.clothes.civil) do 
                                applySkinSpecific(infos)
                            end
                        end
                    })
                    if Cfg.inService then 
                        RageUI.Separator(Translation.Abatoire["separator_available_vehicle"])
                        RageUI.Line("color", 19, 107, 190)
                        for k,v in pairs(Abatoire.Garage) do 
                            RageUI.Button(v.label, nil, {RightLabel = "→→"}, cooldown, {
                                onSelected = function()
                                    if ESX.Game.IsSpawnPointClear(v.spawn, 5) then 
                                        TriggerServerEvent("fCore:Abatoire:Caution", v.caution, 1, v.name, v.spawn, v.heading)
                                    else
                                        cNotification(Translation.Abatoire["cNotif_spawn_not_clear"])
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


RegisterNetEvent("fCore:Abatoire:SpawnVehi")
AddEventHandler("fCore:Abatoire:SpawnVehi", function(name, spawn, heading)
    cooldown = false
    RequestModel(name)
    while not HasModelLoaded(name) do
        Citizen.Wait(10)
    end
    vehicleAbatoire = CreateVehicle(name, spawn, heading, true, false)
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicleAbatoire, -1)
    RageUI.CloseAll()
    openGarageAbatoire = false 
    Wait(10000)
    cooldown = true
end)

