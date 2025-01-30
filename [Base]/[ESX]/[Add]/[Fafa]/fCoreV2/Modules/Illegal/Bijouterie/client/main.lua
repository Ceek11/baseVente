local countCops = nil
local robbed = false
local animPed = false
RegisterNetEvent("fCore:Bijouterie:giveInformation")
AddEventHandler("fCore:Bijouterie:giveInformation", function(police)
    countCops = police
end)

RegisterNetEvent("fCore:Bijouterie:giveInformationRob")
AddEventHandler("fCore:Bijouterie:giveInformationRob", function(result)
    robbed = result
end)

CreateThread(function()

    local hash = GetHashKey(Bijouterie.pedHash)
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end
    pedBijouterie = CreatePed(4, hash, Bijouterie.posPed, Bijouterie.posHeading, false, true) -- Mettre les coordonnées ICI
    SetBlockingOfNonTemporaryEvents(pedBijouterie, true)
    SetEntityInvincible(pedBijouterie, true)
    while true do 
        local interval = 1500
        local aimingEntity, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId())
        local distance = #(GetEntityCoords(PlayerPedId()) - Bijouterie.posPed)
        if aimingEntity and distance <= 5 then
            interval = 0    
            if not robbed then
                TriggerServerEvent("fCore:Bijouterie:getCops")
                while countCops == nil do 
                    Wait(0)
                end
                if countCops >= Bijouterie.requiertPolice then 
                    TriggerServerEvent("fCore:Bijouterie:GetObject")
                    SetEntityInvincible(pedBijouterie, false)
                    if DoesEntityExist(targetPed) and not IsEntityDead(targetPed) then
                        local pedModelHash = GetEntityModel(targetPed)
                        local scared = 0
                        if pedModelHash == Bijouterie.pedHash then 
                            TriggerEvent("ActiveAnum")
                            while scared < 100 and not IsPedDeadOrDying(pedBijouterie) and distance <= 7.5 do 
                                local sleep = 1200
                                SetEntityAnimSpeed(pedBijouterie, "missheist_agency2ahands_up", "handsup_anxious", 1.0)
                                if IsPlayerFreeAiming(PlayerId()) then
                                    sleep = 500
                                    SetEntityAnimSpeed(pedBijouterie, "missheist_agency2ahands_up", "handsup_anxious", 1.3)
                                end
                                if IsPedArmed(PlayerPedId(), 4) and GetAmmoInClip(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId())) > 0 and IsControlPressed(0, 24) then
                                    sleep = 150
                                    SetEntityAnimSpeed(pedBijouterie, "missheist_agency2ahands_up", "handsup_anxious", 1.7)
                                end
                                sleep = GetGameTimer() + sleep
                                while sleep >= GetGameTimer() and not IsPedDeadOrDying(pedBijouterie) do
                                    Wait(0)
                                    DrawRect(0.5, 0.5, 0.2, 0.03, 75, 75, 75, 200)
                                    local draw = scared/500
                                    DrawRect(0.5, 0.5, draw, 0.03, 249, 130, 42, 200)
                                end
                                scared = scared + 2
                            end
                            if IsPedDeadOrDying(pedBijouterie) then 
                                cNotification(TranslationIllegal.Bijouterie["KillNPC"], "Action", "rouge")
                            else
                                ActiveMarkerBijouterie()     
                            end
                        end
                    end
                else
                    showMessage = true
                    while showMessage do
                        Wait(0)
                        local distance = #(GetEntityCoords(PlayerPedId()) - Bijouterie.posPed)
                        if distance <= 5 then
                            DrawText3D(Bijouterie.posPed, TranslationIllegal.Bijouterie["NotEnoughPolice"])
                        else
                            showMessage = false
                        end
                    end
                end
            else
                showMessage = true
                while showMessage do
                    Wait(0)
                    local distance = #(GetEntityCoords(PlayerPedId()) - Bijouterie.posPed)
                    if distance <= 5 then 
                        DrawText3D(Bijouterie.posPed, TranslationIllegal.Bijouterie["AlreadyRobbed"])
                    else
                        showMessage = false
                    end
                end
            end
        end        
        Wait(interval)
    end
end)

RegisterNetEvent("ActiveAnum")
AddEventHandler('ActiveAnum', function()
    animPed = true
    while animPed do 
        anim(pedBijouterie, 'random@arrests@busted', 'idle_a')
        Wait(0)
    end
end)

function ActiveMarkerBijouterie()
    local count = #Bijouterie.Marker
    Bijouterie.InRobbery = true
    CreateThread(function()
        while Bijouterie.InRobbery do
            local interval = 500
            local posPlayer = GetEntityCoords(PlayerPedId())
            for i = 1, #Bijouterie.Marker do
                local v = Bijouterie.Marker[i]
                if v.Active then 
                    local dest = v.pos
                    local dist = #(dest-posPlayer)
                    if dist <= 15 then 
                        interval = 0
                        DrawMarker(20, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.2, 249,130, 42, 55555, false, true, 2, false, false, false, false)
                        if dist <= 1.5 then 
                            ESX.ShowHelpNotification(TranslationIllegal.Bijouterie["RobPrompt"])
                            if IsControlJustPressed(1, 51) then
                                ESX.TriggerServerCallback("fCore:Bijouterie:getBreakglass", function(result) 
                                    if result then
                                        v.Active = false
                                        count = count - 1
                                        anim(PlayerPedId(), 'missheist_jewel', 'smash_case')
                                        Wait(5000)
                                        TriggerServerEvent("fCore:Bijouterie:giveItem", v.itemName, v.count)
                                        if count == 0 then 
                                            cNotification(TranslationIllegal.Bijouterie["finishHoldup"] )
                                            animPed = false
                                        end
                                    else 
                                        animPed = false
                                        cNotification(TranslationIllegal.Bijouterie["NoGlassBreaks"] )
                                    end
                                end)
                            end
                        end
                    end
                end
            end
            Wait(interval)
        end
    end)
end