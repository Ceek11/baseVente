Citizen.CreateThread(function()
    while true do 
        local interval = 1000 
        local playerPos = GetEntityCoords(PlayerPedId())
        for _,v in pairs(Coiffeur.Shop) do 
            local dest = v
            local dist = #(dest-playerPos)
            if dist <= 3 then 
                interval = 0
                DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                if dist <= 3 then 
                    DrawName3D(dest.x, dest.y, dest.z, TranslationUtils.Coiffeur["ChangeHair"], 255,255,255)
                    if IsControlJustPressed(1, 51) then 
                        openMenuCoiffeur()
                    end
                end
            end
        end
        Wait(interval)
    end
end)