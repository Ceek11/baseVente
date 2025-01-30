CreateThread(function()
    local interval = 1500
    while true do
        local playerPos = GetEntityCoords(PlayerPedId())
        for _,v in pairs(Vetement.Pos) do 
            local dest = v.Point
            local dist = #(dest-playerPos)
            if dist <= v.distMarker then 
                interval = 0
                DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                if dist <= v.dist3D then 
                    DrawName3D(dest.x, dest.y, dest.z, v.text, 255,255,255)
                    if IsControlJustPressed(1, 51) then 
                        openMenuClothesShop(v.mask)
                    end
                end
            end
        end
        for _,v in pairs(Vetement.SaveOutif) do 
            local dest = v.Point
            local dist = #(dest-playerPos)
            if dist <= v.distMarker then 
                interval = 0
                DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 40, 190, 0, 55555, false, false, 2, false, false, false, false)
                if dist <= v.dist3D then 
                    DrawName3D(dest.x, dest.y, dest.z, v.text, 255,255,255)
                    if IsControlJustPressed(1, 51) then 
                        openMenuSaveOutif()
                    end
                end
            end
        end
        for _,v in pairs(Vetement.TenueModder) do 
            local dest = v.Point
            local dist = #(dest-playerPos)
            if dist <= v.distMarker then 
                interval = 0
                DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                if dist <= v.dist3D then 
                    DrawName3D(dest.x, dest.y, dest.z, v.text, 255,255,255)
                    if IsControlJustPressed(1, 51) then 
                        openMenuClothesShopModder(v.mask)
                    end
                end
            end
        end
        Wait(interval) 
    end
end)