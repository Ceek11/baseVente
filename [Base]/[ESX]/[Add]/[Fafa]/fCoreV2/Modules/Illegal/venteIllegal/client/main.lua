CreateThread(function()
    while true do 
        local interval = 5000
        local playerPos = GetEntityCoords(PlayerPedId())
        for _, vente in ipairs(VenteIllegal.Resell) do
            local distance = #(vente.point - playerPos)
            if distance <= vente.distMarker then
                interval = 0
                if #vente.GangAutorized > 0 then 
                    for _, authorizedJob in ipairs(vente.GangAutorized) do
                        if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == authorizedJob then
                            local canOpenShop = true
                            if vente.Boss and ESX.PlayerData.job2.grade_name ~= "boss" then
                                canOpenShop = false
                            end
                            if canOpenShop and distance <= vente.dist3D then
                                DrawName3D(vente.point.x, vente.point.y, vente.point.z, vente.text, 255, 255, 255)
                                if IsControlJustPressed(1, 51) then
                                    openMenuVenteIllegal(vente)
                                end
                            end
                            break
                        end
                    end
                else
                    if distance <= vente.dist3D then
                        DrawName3D(vente.point.x, vente.point.y, vente.point.z, vente.text, 255, 255, 255)
                        if IsControlJustPressed(1, 51) then
                            openMenuVenteIllegal(vente)
                        end
                    end
                end
            end
        end
        Wait(interval) 
    end
end)

