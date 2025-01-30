function getAnimal(outEntity)
    for k,v in pairs(Chasse.WhiteList) do 
        if GetEntityModel(outEntity) == GetHashKey(v) and IsEntityDead(outEntity) and not IsEntityAMissionEntity(outEntity) then 
            return true
        end
    end
    return false
end

CreateThread(function()

    while true do 
        local interval = 1500
        local retval, outEntity = FindFirstPed()
        local succesPed = nil 
        repeat
            local pPos = GetEntityCoords(PlayerPedId())
            pPos = GetEntityCoords(PlayerPedId())
            succesPed, outEntity = FindNextPed(retval)
            if getAnimal(outEntity) then 
                local cPos = GetEntityCoords(outEntity)
                local dst = Vdist(pPos.x, pPos.y, pPos.z, cPos.x, cPos.y, cPos.z)
                if dst <= 5.0 then
                    interval = 0
                    SetBlockingOfNonTemporaryEvents(outEntity, true)
                    PlayAmbientSpeech2(outEntity, "GENERIC_HI", "SPEECH_PARAMS_FORCE")
                    SetPedCanRagdollFromPlayerImpact(outEntity, false)
                    if dst <= 3.0 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour récupérer l'animal.")
                        if IsControlJustPressed(1, 51) then
                            if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_knife") then
                                TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", 0, 1)
                                for k,v in pairs(Chasse.WhiteList) do 
                                    if GetHashKey(v) == GetEntityModel(outEntity) then 
                                        TriggerServerEvent("fCore:Chasse:ButcherAnimal", k)
                                    end
                                end
                                Wait(10000)
                                DeleteEntity(outEntity)
                                ClearPedTasks(PlayerPedId())
                            else
                                cNotification("Vous n'avez pas de couteau en main")
                            end
                        end
                    end
                end
            end
        until not succesPed
        EndFindPed(retval)
        Wait(interval)
    end
end)



