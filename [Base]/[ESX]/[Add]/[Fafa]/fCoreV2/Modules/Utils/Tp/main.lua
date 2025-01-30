ESX = nil 
Citizen.CreateThread(function()
    ESX = exports["es_extended"]:getSharedObject()
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

CreateThread(function()
    while true do
        local interval = 1500
        local playerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(tp.tpSimple) do
            local dest = v.pointEntre
            local dist = #(playerPos-dest)
            if dist <= v.maxDist then 
                interval = 0
                local jobCheck = (not v.job) or (ESX.PlayerData.job and ESX.PlayerData.job.name == v.jobName)
                if jobCheck then 
                    DrawMarker(v.markerType, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, v.rotX, v.rotY, v.rotX, v.sizeX,  v.sizeY, v.sizeZ, v.r, v.g, v.b, v.a, false, false, 2, false, false, false, false)
                    if dist <= v.max3D  then 
                    DrawName3D(dest.x, dest.y, dest.z, v.texteEntre, 255,255,255)
                        if IsControlJustPressed(1, 51) then 
                            SetEntityCoords(GetPlayerPed(-1), v.pointSortie.x, v.pointSortie.y, v.pointSortie.z)
                        end
                    end
                end
            end
            local destSortie = v.pointSortie
            local dist = #(playerPos-destSortie)
            if dist <= v.maxDist  then 
                interval = 0
                local jobCheck = (not v.job) or (ESX.PlayerData.job and ESX.PlayerData.job.name == v.jobName)
                if jobCheck then 
                    DrawMarker(v.markerType, destSortie.x, destSortie.y, destSortie.z-1, 0.0, 0.0, 0.0, v.rotX, v.rotY, v.rotX, v.sizeX,  v.sizeY, v.sizeZ, v.r, v.g, v.b, v.a, false, false, 2, false, false, false, false)
                    if dist <= v.max3D  then 
                    DrawName3D(destSortie.x, destSortie.y, destSortie.z, v.textSortie, 255,255,255)
                        if IsControlJustPressed(1, 51) then 
                            SetEntityCoords(GetPlayerPed(-1), v.pointEntre.x, v.pointEntre.y, v.pointEntre.z)
                        end
                    end
                end
            end
        end
        for k,v in pairs(tp.tpEtage) do
            for _, Etage in pairs(v.Etage) do 
                local dest = Etage.Point 
                local dist = #(playerPos-dest)
                if Etage.Point ~= v.Point and dist <= v.maxDist then 
                    interval = 0
                    DrawMarker(v.markerType, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, v.rotX, v.rotY, v.rotX, v.sizeX,  v.sizeY, v.sizeZ, v.r, v.g, v.b, v.a, false, false, 2, false, false, false, false)
                    if dist <= v.max3D then 
                        DrawName3D(dest.x, dest.y, dest.z+1, Etage.Text, 255,255,255)
                        if IsControlJustPressed(1, 51) then 
                            openMenuTp(v.Etage)
                        end
                    end
                end
            end
            local dest = v.Point
            local dist = #(playerPos-dest)
            if dist <= v.maxDist then 
                interval = 0
                DrawMarker(v.markerType, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, v.rotX, v.rotY, v.rotX, v.sizeX,  v.sizeY, v.sizeZ, v.r, v.g, v.b, v.a, false, false, 2, false, false, false, false)
                if dist <= v.max3D then 
                    DrawName3D(dest.x, dest.y, dest.z+1, v.Text, 255,255,255)
                    if IsControlJustPressed(1, 51) then 
                        openMenuTp(v.Etage)
                    end
                end
            end
        end
      Wait(interval)
    end
end)
  
