CreateThread(function()
    while true do
        local wait = 1000
        for _,v in pairs(GaragePublic.Position.GaragePublic) do
            local pos = v.pos
            local pPos = GetEntityCoords(PlayerPedId())
            local dst = #(pos-pPos)
            if dst <= GaragePublic.MarkerDistance then
                wait = 0
                if v.Type == "vehicle" then 
                    -- DrawMarker(type, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, red, green, blue, alpha, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureName, drawOnEnts)
                    DrawMarker(36, pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 40, 190, 0, 55555, false, true, 2, false, false, false, false)
                elseif v.Type == "bateau" then 
                    DrawMarker(35, pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 40, 190, 0, 55555, false, true, 2, false, false, false, false)                
                end
            end
            if dst <= 2.0 then
                wait = 0
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour intéragir.")
                if IsControlJustPressed(1, 51) then
                    FreezeEntityPosition(PlayerPedId(), true)
                    openMenuGaragePublic(v.Type, v.PosSortie)
                end
            end
        end
        for _,v in pairs(GaragePublic.Position.Fourriere) do
            local pos = v.pos
            local pPos = GetEntityCoords(PlayerPedId())
            local dst = #(pos-pPos)
            if dst <= GaragePublic.MarkerDistance then
                wait = 0
                if v.Type == "vehicle" then 
                    DrawMarker(39, pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, true, 2, false, false, false, false)
                elseif v.Type == "bateau" then 
                    DrawMarker(35, pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, true, 2, false, false, false, false)
                end
            end
            if dst <= 2.0 then
                wait = 0
                ESX.ShowHelpNotification(("Appuyez sur ~INPUT_CONTEXT~ pour intéragir. (~g~%s$~s~)"):format(GaragePublic.PriceFourriere))
                if IsControlJustPressed(1, 51) then
                    FreezeEntityPosition(PlayerPedId(), true)
                    openMenuFourriere(v.Type, v.PosSortie)
                end
            end
        end

        for k,v in pairs(GaragePublic.Position.Sortie) do
            local pos = v.pos
            local pPos = GetEntityCoords(PlayerPedId())
            local dst = #(pos-pPos)
            if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), -1) then
                if dst <= GaragePublic.MarkerDistance then
                    wait = 0
                    if v.Type == "vehicle" then 
                        DrawMarker(36, pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 41, 0, 55555, false, true, 2, false, false, false, false)
                    elseif v.Type == "bateau" then
                        DrawMarker(35, pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 41, 0, 55555, false, true, 2, false, false, false, false)
                    end
                end
                if dst <= 2.0 then
                    wait = 0
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour intéragir.")
                    if IsControlJustPressed(1, 51) then
                        ESX.TriggerServerCallback("xGarage:stockCar", function(can)
                            if can then
                                ESX.TriggerServerCallback("xGarage:getMaxCar", function(nbrCar, maxCar)
                                    if nbrCar < maxCar then 
                                        TriggerServerEvent("xGarage:setStats", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)), 1, ESX.Game.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId(), false)))
                                        DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                                        FreezeEntityPosition(PlayerPedId(), false)
                                        SetEntityCoords(PlayerPedId(), v.PosEntree)
                                    else
                                        cNotification("(~r~Erreur~s~)\n Vous avez le max de véhicule dans votre garage.")
                                    end
                                end)
                            else
                                cNotification("(~r~Erreur~s~)\nLe véhicule ne vous appartient pas.")
                            end
                        end, GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)))
                    end
                end
            end
        end

        Wait(wait)
    end
end)