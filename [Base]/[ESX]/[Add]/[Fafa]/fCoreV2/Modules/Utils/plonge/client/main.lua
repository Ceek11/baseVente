local haveTenuePlonge = false

Citizen.CreateThread(function()
    while true do 
        local interval = 1500 
        local playerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(PosTenue) do 
            local dest = v
            local dist = #(dest-playerPos)
            if dist <= 3 then 
                interval = 0
                DrawName3D(dest.x, dest.y, dest.z, "Appuyez ~b~[E] ~s~pour ~g~louer ~s~une ~b~tenue de plongée", 255,255,255)
                if IsControlJustPressed(1, 51) then 
                    openMenuPlonge()
                end
            end
        end
        Wait(interval)
    end
end)