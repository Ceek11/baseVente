CreateThread(function()
    while true do 
        local interval = 1000
        local posPlayer = GetEntityCoords(PlayerPedId())
        for k, v in pairs(VenteWeapon) do
            local destCatalogueArme = v.pointCatalogueArme
            local distCatalogueArme = #(destCatalogueArme-posPlayer) 
            if distCatalogueArme <= v.distMarker then 
                interval = 0
                DrawMarker(v.markerType, destCatalogueArme.x, destCatalogueArme.y, destCatalogueArme.z-1, 0.0, 0.0, 0.0, v.rotX, v.rotY, v.rotX, v.sizeX, v.sizeY, v.sizeZ, v.r, v.g, v.b, v.a, false, false, 2, false, false, false, false)
                if distCatalogueArme <= v.dist3D then 
                    DrawName3D(destCatalogueArme.x, destCatalogueArme.y, destCatalogueArme.z, v.textCatalogueArme, 255,255,255)
                    if IsControlJustPressed(1, 51) then 
                        openMenuShowWeapon(v)
                    end
                end
            end
        end
        Wait(interval)
    end
end)

