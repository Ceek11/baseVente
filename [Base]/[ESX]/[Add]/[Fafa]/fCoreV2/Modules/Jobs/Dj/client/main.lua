CreateThread(function()
    while true do 
        local interval = 1500
        local posPlayer = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Dj.Pos) do
            local dest = v.coords
            local dist = #(dest-posPlayer) 
            if dist <= v.maxDistMarker then 
                interval = 0
                if ESX.PlayerData.job and ESX.PlayerData.job.name == v.jobName then 
                    DrawMarker(v.markerType, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, v.rotX, v.rotY, v.rotZ, v.sizeX, v.sizeY, v.sizeZ, v.r, v.g, v.b, v.a, false, false, 2, false, false, false, false)
                    if dist <= v.distMax3D then 
                        DrawName3D(dest.x, dest.y, dest.z, v.text, 255,255,255)
                        if IsControlJustPressed(1, 51) then 
                            openMenuDJ(v)
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)