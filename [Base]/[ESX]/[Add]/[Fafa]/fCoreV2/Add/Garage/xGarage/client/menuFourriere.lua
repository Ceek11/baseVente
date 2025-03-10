local data = {}
RegisterNetEvent("xGarage:receiveFourriere")
AddEventHandler("xGarage:receiveFourriere", function(result) data = result end)

local open = false
local mainMenu =  RageUI.CreateMenu("Fourrière", "Interaction", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
mainMenu.Display.Header = true
mainMenu.Closed = function()
    open = false
    FreezeEntityPosition(PlayerPedId(), false)
end

function openMenuFourriere(Type, PosSortie)
    TriggerServerEvent("xGarage:getFourriere")
    if open then
        open = false
        RageUI.Visible(mainMenu, false)
    else
        open = true
        RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do
                Wait(0)
                RageUI.IsVisible(mainMenu, function()
                    if #data > 0 then
                        for _,v in pairs(data) do
                            if v.Type == Type then 
                                RageUI.Button(("~r~→~s~ %s [~r~%s~s~]"):format(GetDisplayNameFromVehicleModel(json.decode(v.vehicle).model), v.plate), nil, {RightBadge = RageUI.BadgeStyle.Car}, true, {
                                    onSelected = function()
                                        ESX.TriggerServerCallback("xGarage:payFourriere", function(can) 
                                            if can then
                                                if not ESX.Game.IsSpawnPointClear(GetEntityCoords(PlayerPedId()), 1) then return end
                                                if not IsModelInCdimage(json.decode(v.vehicle).model) then return end
                                                RequestModel(json.decode(v.vehicle).model)
                                                    while not HasModelLoaded(json.decode(v.vehicle).model) do
                                                    Citizen.Wait(10)
                                                end

                                                local car = CreateVehicle(json.decode(v.vehicle).model, PosSortie, GetEntityHeading(PlayerPedId()), true, false)
                                                ESX.Game.SetVehicleProperties(car, json.decode(v.vehicle))
                                                SetVehicleNumberPlateText(car, v.plate)
                                                SetPedIntoVehicle(PlayerPedId(), car, -1)
                                                TriggerServerEvent("xGarage:setStats", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)), 2, ESX.Game.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId(), false)))
                                                FreezeEntityPosition(PlayerPedId(), false)
                                                RageUI.CloseAll()
                                                open = false
                                                data = {}
                                            end
                                        end)
                                    end
                                })
                            end
                        end
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~Aucun véhicule en fourrière.~s~")
                        RageUI.Separator("")
                    end
                end)
            end
        end)
    end
end

