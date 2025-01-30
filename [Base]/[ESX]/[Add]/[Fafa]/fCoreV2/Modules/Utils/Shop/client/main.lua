CreateThread(function()
    while true do 
        local interval = 1500
        local playerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Shop) do 
            local dest = v.point
            local dist = #(dest-playerPos)
            if dist <= v.distMarker then 
                interval = 0
                DrawMarker(v.markerType, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, v.rotX, v.rotY, v.rotX, v.sizeX,  v.sizeY, v.sizeZ, v.r, v.g, v.b, v.a, false, false, 2, false, false, false, false)
                if dist <= v.dist3D then 
                    DrawName3D(dest.x, dest.y, dest.z, v.text, 255,255,255)
                    if IsControlJustPressed(1, 51) then 
                        openMenuShop(v.Produit, v.point, v.typeMoney)
                    end
                end
            end
        end
        Wait(interval) 
    end
end)