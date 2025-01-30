CreateThread(function()
    while true do 
        local interval = 1500
        local playerPos = GetEntityCoords(PlayerPedId())
        for _, shop in ipairs(ShopIllegal) do
            local distance = #(shop.point - playerPos)
            if distance <= shop.distMarker then
                for _, authorizedJob in ipairs(shop.GangAutorized) do
                    if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == authorizedJob then
                        local canOpenShop = true
                        if shop.Boss and ESX.PlayerData.job2.grade_name ~= "boss" then
                            canOpenShop = false
                        end
                        if canOpenShop and distance <= shop.dist3D then
                            interval = 0
                            DrawMarker(shop.markerType, shop.point.x, shop.point.y, shop.point.z - 1, 0, 0, 0, shop.rotX, shop.rotY, shop.rotX, shop.sizeX, shop.sizeY, shop.sizeZ, shop.r, shop.g, shop.b, shop.a, false, false, 2, false, false, false, false)
                            DrawName3D(shop.point.x, shop.point.y, shop.point.z, shop.text, 255, 255, 255)
                            if IsControlJustPressed(1, 51) then
                                openMenuShopIllegal(shop.Weapon, shop)
                            end
                        end
                        break
                    end
                end
            end
        end
        Wait(interval) 
    end
end)