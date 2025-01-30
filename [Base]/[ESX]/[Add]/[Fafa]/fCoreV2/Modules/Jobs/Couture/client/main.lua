CreateThread(function()
    while true do 
        local interval = 1000
        local PlayerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(MarkerCouture.Patron) do
            local dist = #(v.Point-PlayerPos) 
            if dist <= v.distMax3D then 
                if ESX.PlayerData.job and ESX.PlayerData.job.name == v.jobName then 
                    interval = 0
                    DrawName3D(v.Point.x, v.Point.y, v.Point.z, v.text, 255,255,255)
                    if IsControlJustPressed(1, 51) then 
                        openMenuGarageCouture()
                    end
                end
            end
        end
        for k,v in pairs(MarkerCouture.Delete) do
            local dist = #(v.Point-PlayerPos) 
            if dist <= v.maxDistMarker then 
                if IsPedInVehicle(PlayerPedId(), vehicleCouture, true) then
                    interval = 0
                    DrawMarker(v.markerType, v.Point.x, v.Point.y, v.Point.z-1, 0.0, 0.0, 0.0, v.rotX, v.rotY, v.rotY, v.sizeZ,  v.sizeY, v.sizeZ, v.r, v.g, v.b, v.a, false, true, 2, false, false, false, false)
                    if dist <= v.distMax3D then 
                        DrawName3D(v.Point.x, v.Point.y, v.Point.z, v.text, 255,255,255)
                        if IsControlJustPressed(1, 51) then 
                            DoScreenFadeOut(1000)
                            Wait(1000)
                            ESX.Game.DeleteVehicle(vehicleCouture)
                            DoScreenFadeIn(1000)
                            TriggerServerEvent("fCore:Couture:Caution", v.caution, 2)
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)
