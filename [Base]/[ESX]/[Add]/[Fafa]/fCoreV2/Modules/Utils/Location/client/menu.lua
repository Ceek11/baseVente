
local isOpenRental = false 
menuRental = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuRental.Closed = function()
    isOpenRental = false 
end

function openMenuRental(Type)
    if isOpenRental then 
        isOpenRental = false 
        RageUI.Visible(menuRental, false)
        return
    else
        isOpenRental = true 
        RageUI.Visible(menuRental, true)
        CreateThread(function()
            while isOpenRental do 
                DisableControlAction(1, 51, true)
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuRental, function()
                    RageUI.Separator(TranslationUtils.Location["separator_rental"])
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(Location.Vehicle) do 
                        if Type == v.Type then 
                            RageUI.Button(v.label, v.description, {RightLabel = "~g~"..v.price.."$~s~ →→"}, true, {
                                onSelected = function()
                                    TriggerServerEvent("fCore:Location:BuyRental", v.price, v.label, v.spawn, v.name, v.caution, v.heading)
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

RegisterNetEvent("fCore:location:SpawnVehicule")
AddEventHandler("fCore:location:SpawnVehicule", function(spawn, name, caution, heading)
    if ESX.Game.IsSpawnPointClear(spawn, 5) then 
        ESX.Game.SpawnVehicle(name, spawn, heading, function(vehicle)
            local plate = GetVehicleNumberPlateText(vehicle)
            vehiclePlate = plate                                            
            drawCautionLocation = true
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            isOpenRental = false 
            RageUI.CloseAll()
        end)
    else
        cNotification(TranslationUtils.Location["cNotif_spawn_not_clear"])
    end
end)

