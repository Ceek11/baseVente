drawCautionLocation = false
vehiclePlate = nil

CreateThread(function()
    while true do 
        local interval = 1500
        local playerPos = GetEntityCoords(PlayerPedId())
        for _,v in pairs(Location.Point) do 
            local dest = v.Point
            local dist = #(dest-playerPos)
            if dist <= v.dist3D then 
                interval = 0
                DrawName3D(dest.x, dest.y, dest.z, v.text, 255,255,255)
                if IsControlJustPressed(1, 51) then 
                    openMenuRental(v.Type)
                end
            end
        end
        if drawCautionLocation then
            for k, v in pairs(Location.pointCaution) do
                local dest = v.point
                local dist = #(dest - playerPos)
                if dist <= 10 then
                    interval = 0
                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                        DrawMarker(36, dest.x, dest.y, dest.z - 1, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 41, 0, 55555, false, false, 2, false, false, false, false)
                        if dist <= 3 then
                        DrawName3D(dest.x, dest.y, dest.z, TranslationUtils.Location["ReturnPrompt"], 255, 255, 255)
                            local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            local currentPlate = GetVehicleNumberPlateText(currentVehicle)
                            if currentPlate == vehiclePlate then
                                if IsControlJustPressed(1, 51) then
                                    drawCautionLocation = false
                                    DeleteVehicle(currentVehicle)
                                    TriggerServerEvent("fCore:Location:Caution", v.caution)
                                    SetEntityCoords(PlayerPedId(), v.respawnPoint)
                                end
                            end
                        end
                    end
                end
            end
        end
        Wait(interval) 
    end
end)