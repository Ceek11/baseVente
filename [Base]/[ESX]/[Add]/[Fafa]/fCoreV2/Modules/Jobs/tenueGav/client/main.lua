CreateThread(function()
    while true do 
        local interval = 2000
        local PlayerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(TenueGav) do
            local dist = #(v.Point-PlayerPos) 
            if dist <= v.distMarker then 
                interval = 0
                DrawMarker(27, v.Point.x, v.Point.y, v.Point.z-1, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                if dist <= v.dist3D then 
                    DrawName3D(v.Point.x, v.Point.y, v.Point.z, TranslationJob.tenueGav["Instruction"], 255,255,255)
                    if IsControlJustPressed(1, 51) then 
                        openMenuTenueGav(v)
                    end
                end
            end
        end
        Wait(interval)
    end
end)