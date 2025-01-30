CreateThread(function()
    while true do 
        local interval = 1000
        local posPlayer = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Vente.Object) do 
             local dest = v.point 
             local dist = #(dest-posPlayer)
             if dist <= 3 then 
                interval = 0
                DrawName3D(dest.x, dest.y, dest.z, v.text, 255,255,255)
                if IsControlJustPressed(1, 51) then  
                    openMenuVenteObject(v)
                end
            end
        end
        Wait(interval)
    end
end)