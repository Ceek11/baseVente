Citizen.CreateThread(function()
    while true do 
        local interval = 1500 
        local playerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(jobNameAcess) do 
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v then 
                for _,v in pairs(JobPolice.Gav) do 
                    local dest = v.pos
                    local dist = #(dest-playerPos)
                    if dist <= 15 then 
                        interval = 0
                        DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                        if dist <= 1.5 then 
                            DrawName3D(dest.x, dest.y, dest.z, TranslationJob.Police["PressToPutIngav"], 255,255,255)
                            if IsControlJustPressed(1, 51) then 
                                openMenuGav()
                            end
                        end
                    end
                end
                for _,v in pairs(JobPolice.Tig) do 
                    local dest = v
                    local dist = #(dest-playerPos)
                    if dist <= 15 then 
                        interval = 0
                        DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                        if dist <= 1.5 then 
                            DrawName3D(dest.x, dest.y, dest.z, TranslationJob.Police["PressToPutInTig"], 255,255,255)
                            if IsControlJustPressed(1, 51) then 
                                openMenuTig()
                            end
                        end
                    end
                end
                for _,v in pairs(JobPolice.Federale) do 
                    local dest = v.pos
                    local dist = #(dest-playerPos)
                    if dist <= 15 then 
                        interval = 0
                        DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                        if dist <= 1.5 then 
                            DrawName3D(dest.x, dest.y, dest.z, TranslationJob.Police["PressToPutInFederal"], 255,255,255)
                            if IsControlJustPressed(1, 51) then 
                                openMenuFederale()
                            end
                        end
                    end
                end
                for _,v in pairs(JobPolice.Bracelet) do 
                    local dest = v
                    local dist = #(dest-playerPos)
                    if dist <= 15 then 
                        interval = 0
                        DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                        if dist <= 1.5 then 
                            DrawName3D(dest.x, dest.y, dest.z, TranslationJob.Police["PressToPutBracelet"], 255,255,255)
                            if IsControlJustPressed(1, 51) then 
                                openMenuBracelet()
                            end
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)


