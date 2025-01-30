

CreateThread(function()
    getInformationGarage()
    while true do 
        local interval = 1500
        local playerPos = GetEntityCoords(PlayerPedId())
        if GarageLoad then 
            for k, v in pairs(getInformationGarageBdd) do 
                local posExt = json.decode(v.posGarageExt)
                local distExt = #(playerPos-vector3(posExt.x, posExt.y, posExt.z))
                if distExt <= 10 then 
                    interval = 0
                    DrawMarker(27, posExt.x, posExt.y, posExt.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                    if distExt <= 2 then 
                        ESX.ShowHelpNotification("E", "Pour entrée dans le garage", "Information", {97, 32, 32})
                        if IsControlJustPressed(1, 51) then
                            inGarage = true
                            openMenuGarageImmo("ExtGarage", v)
                        end
                    end
                end
                if inGarage then 
                    local posInt = json.decode(v.positionGarage)
                    local distInt = #(playerPos-vector3(posInt.x, posInt.y, posInt.z))
                    if distInt <= 10 then 
                        interval = 0
                        DrawMarker(27, posExt.x, posExt.y, posExt.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                        if distInt <= 2 then 
                            ESX.ShowHelpNotification("E", "Pour quitter le garage", "Information", {97, 32, 32})
                            if IsControlJustPressed(1, 51) then 
                                openMenuGarageImmo("IntGarage", v)
                            end
                        end
                    end
                end
            end
        end
        if HouseLoad then
            for k, v in pairs(getInformationHouseBdd) do 
                local posExt = json.decode(v.posHouseExt)
                local distExt = #(playerPos-vector3(posExt.x, posExt.y, posExt.z))
                if distExt <= 10 then 
                    interval = 0
                    DrawMarker(27, posExt.x, posExt.y, posExt.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                    if distExt <= 2 then 
                        ESX.ShowHelpNotification("E", "Pour entrée dans la maison", "Information", {97, 32, 32})
                        if IsControlJustPressed(1, 51) then 
                            inHouse = true
                            openMenuHouseImmo("ExtHouse", v)
                        end
                    end
                end
                if inHouse then 
                    local posInt = json.decode(v.positionProperty)
                    local distInt = #(playerPos-vector3(posInt.x, posInt.y, posInt.z))
                    if distInt <= 10 then 
                        interval = 0
                        DrawMarker(27, posExt.x, posExt.y, posExt.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                        if distInt <= 2 then 
                            ESX.ShowHelpNotification("E", "Pour quitter la maison", "Information", {97, 32, 32})
                            if IsControlJustPressed(1, 51) then 
                                openMenuHouseImmo("IntHouse", v)
                            end
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)