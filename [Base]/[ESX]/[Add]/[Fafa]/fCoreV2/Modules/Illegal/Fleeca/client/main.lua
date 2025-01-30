local countCops = nil
local animPed = false
local pedFleeca = {} 

RegisterNetEvent("fCore:Fleeca:giveInformation")
AddEventHandler("fCore:Fleeca:giveInformation", function(police)
    countCops = police
end)

RegisterNetEvent("fCore:Fleeca:UpdateObject")
AddEventHandler("fCore:Fleeca:UpdateObject", function(pedIndex, robbed, InRobbery)
    Fleeca.Info[pedIndex].robbed = robbed
end)

RegisterNetEvent("ActiveAnim")
AddEventHandler('ActiveAnim', function(pedIndex)
    animPed = pedIndex
    while animPed do 
        anim(pedFleeca[pedIndex], 'random@arrests@busted', 'idle_a')
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    for i = 1, #Fleeca.Info do
        local info = Fleeca.Info[i]
        while not HasModelLoaded(info.pedHash) do
            RequestModel(info.pedHash)
            Wait(20)
        end
        pedFleeca[i] = CreatePed(4, info.pedHash, info.posPed.x, info.posPed.y, info.posPed.z, info.heading, false, true) -- Mettre les coordonnées ICI
        SetBlockingOfNonTemporaryEvents(pedFleeca[i], true)
    end
    while true do 
        local interval = 1000
        local aimingEntity, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId())
        for i = 1, #Fleeca.Info do
            local info = Fleeca.Info[i]
            local distance = #(GetEntityCoords(PlayerPedId()) - info.posPed)
            if aimingEntity and distance <= 5 then   
                interval = 0    
                if not info.robbed then
                    TriggerServerEvent("fCore:Fleeca:getCops")
                    while countCops == nil do 
                        Wait(0)
                    end
                    if countCops >= Fleeca.requiertPolice then 
                        TriggerServerEvent("fCore:Fleeca:GetObject", i) -- Passez l'index du ped braqué en tant qu'argument
                        SetEntityInvincible(pedFleeca[i], false)
                        if DoesEntityExist(targetPed) and not IsEntityDead(targetPed) then
                            local pedModelHash = GetEntityModel(targetPed)
                            local scared = 0
                            if pedModelHash == info.pedHash then 
                                TriggerEvent("ActiveAnim", i)
                                while scared < 100 and not IsPedDeadOrDying(pedFleeca[i]) do 
                                    local distance = #(GetEntityCoords(PlayerPedId()) - info.posPed)
                                    if distance >= 10 then 
                                        info.robbed = true
                                        scared = 100
                                        print("3")
                                        cNotification(TranslationIllegal.Fleeca["TooFar"])
                                    end
                                    local sleep = 1200
                                    SetEntityAnimSpeed(pedFleeca[i], "missheist_agency2ahands_up", "handsup_anxious", 1.0)
                                    if IsPlayerFreeAiming(PlayerId()) then
                                        sleep = 500
                                        SetEntityAnimSpeed(pedFleeca[i], "missheist_agency2ahands_up", "handsup_anxious", 1.3)
                                    end
                                    if IsPedArmed(PlayerPedId(), 4) and GetAmmoInClip(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId())) > 0 and IsControlPressed(0, 24) then
                                        sleep = 150
                                        SetEntityAnimSpeed(pedFleeca[i], "missheist_agency2ahands_up", "handsup_anxious", 1.7)
                                    end
                                    sleep = GetGameTimer() + sleep
                                    while sleep >= GetGameTimer() and not IsPedDeadOrDying(pedFleeca[i]) do
                                        Wait(0)
                                        DrawRect(0.5, 0.5, 0.2, 0.03, 75, 75, 75, 200)
                                        local draw = scared/500
                                        DrawRect(0.5, 0.5, draw, 0.03, 249, 130, 42, 200)
                                    end
                                    scared = scared + 2
                                end
                                if IsPedDeadOrDying(pedFleeca[i]) then 
                                    cNotification(TranslationIllegal.Fleeca["KillNPC"])
                                else
                                    ActiveMarkerFleeca(info.InRobbery, info)
                                    info.robbed = true -- Mettez à jour la clé "robbed" du ped actuel sur le client
                                end
                            end
                        end
                    else
                        showMessage = true
                        while showMessage do
                            Wait(0)
                            local distance = #(GetEntityCoords(PlayerPedId()) - info.posPed)
                            if distance <= 5 then
                                DrawText3D(info.posPed, TranslationIllegal.Fleeca["NotEnoughPolice"])
                            else
                                showMessage = false
                            end
                        end
                    end
                else
                    showMessage = true
                    while showMessage do
                        Wait(0)
                        local distance = #(GetEntityCoords(PlayerPedId()) - info.posPed)
                        if distance <= 5 then 
                            DrawText3D(info.posPed, TranslationIllegal.Fleeca["AlreadyRobbed"])
                        else
                            showMessage = false
                        end
                    end
                end
            end
        end        
        Wait(interval)
    end
end)


function stopAllBraquage()
    Robbery = false
    showPiratagePoint = false
    PerceuseStats = false
    showPointPerceuse = false
    robStats = false
    showPointCash = false
    showPointCash2 = false
    TriggerEvent("fCore:Fleeca:openDoors", 2)
    TriggerEvent("fCore:Fleeca:openDoors", 3)
    RemoveTimerBar()
    DeleteObject(Trolley1)
    DeleteObject(Trolley2)
end


local activeMarkerFleecaValue
local showPiratagePoint = false
local Robbery = false
function ActiveMarkerFleeca(Robbery, valeur)
    AddTimerBar("Timer :", {endTime = GetGameTimer() + 120 * 1000})
    ESX.SetTimeout(120*1000,function()
        stopAllBraquage()
    end)
    showPiratagePoint = true 
    activeMarkerFleecaValue = valeur
    Robbery = true
    CreateThread(function()
        while Robbery do 
            local interval = 1500
            local posPlayer = GetEntityCoords(PlayerPedId())
            for k, v in pairs(valeur.PiratageActive) do 
                local dest = v.posPirate 
                local dist = #(dest-posPlayer)
                if dist >= 40 then 
                    print("2")
                    Robbery = false
                    showPiratagePoint = false
                    DeleteEntity(Trolley1)
                    DeleteEntity(Trolley2)
                    cNotification(TranslationIllegal.Fleeca["TooFar"])
                end
                if dist <= 15 and showPiratagePoint then
                    interval = 0
                    DrawMarker(20, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.2, 249,130, 42, 55555, false, true, 2, false, false, false, false)
                    if dist <= 1.5 then 
                        ESX.ShowHelpNotification(TranslationIllegal.Fleeca["HackPrompt"])
                        if IsControlJustPressed(1, 51) then 
                            showPiratagePoint = false
                            ESX.TriggerServerCallback("fCore:Fleeca:GetItemPiratage", function(result) 
                                if result then 
                                    TriggerEvent("mhacking:show")
                                    TriggerEvent("mhacking:start", 7, 19, verifPiratage) 
                                    getInformationPiratage(valeur)
                                else 
                                    cNotification(TranslationIllegal.Fleeca["cantHaveKeyPiratage"])
                                end
                            end)
                        end
                    end
                end
            end
            Wait(interval)
        end
    end)
end

local PirageValue = nil
RegisterNetEvent("fCore:Piratage:GetInformation")
AddEventHandler("fCore:Piratage:GetInformation", function(success)
    PirageValue = success
end)


function getInformationPiratage(valeur)
    local InformationPiratage = true
    CreateThread(function()
        while InformationPiratage do 
            if PirageValue then 
                showPiratagePoint = false
                activePointPerceuse(valeur)
                spawnCash(valeur)
                InformationPiratage = false
                Robbery = false
            end
            Wait(0)
        end
    end)
end

local PerceuseStats = false
showPointPerceuse = false
function activePointPerceuse(valeur)
    showPointPerceuse = true
    PerceuseStats = true
    CreateThread(function()
        while PerceuseStats do 
            local interval = 1500
            local posPlayer = GetEntityCoords(PlayerPedId())
            for k,v in pairs(valeur.PiratageActive) do 
                local dest = v.posPerceuse 
                local dist = #(dest-posPlayer)
                if dist >= 40 then 
                    PerceuseStats = false
                    showPointPerceuse = false
                    DeleteObject(Trolley1)
                    DeleteObject(Trolley2)
                    TriggerEvent("fCore:Fleeca:openDoors", 2)
                    cNotification(TranslationIllegal.Fleeca["TooFar"])
                end
                if dist <= 15 and showPointPerceuse then 
                    interval = 0
                    DrawMarker(20, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.2, 249,130, 42, 55555, false, true, 2, false, false, false, false)
                    if dist <= 1.5 then 
                        ESX.ShowHelpNotification(TranslationIllegal.Fleeca["DrillPrompt"])
                        if IsControlJustPressed(1, 51) then 
                            ESX.TriggerServerCallback("fCore:Fleeca:GetItemPerceuse", function(result)     
                                if result then        
                                    showPointPerceuse = false
                                    getInformationPerceuse(v)
                                    Drill(v)
                                else
                                    cNotification(TranslationIllegal.Fleeca["NoDrill"])
                                end
                            end)
                        end
                    end
                end
            end
            Wait(interval)
        end
    end)
end

Trolley1 = nil 
Trolley2 = nil 
function spawnCash(valeur)
    for k,v in pairs(valeur.Props) do 
        Trolley1 = CreateObject(GetHashKey(Fleeca.Cash), v.Trollye1, true, true, false)
        Trolley2 = CreateObject(GetHashKey(Fleeca.Cash), v.Trollye2, true, true, false)
        local h1 = GetEntityHeading(Trolley1)
        local h2 = GetEntityHeading(Trolley2)
        SetEntityHeading(Trolley1, h1 + v.hTrolley1)
        SetEntityHeading(Trolley2, h2 + v.hTrolley2)
    end
end


function verifPiratage(success, timeremaining)
    if success then 
        Robbery = false
        showPiratagePoint = false
        TriggerEvent('mhacking:hide')
        TriggerEvent("fCore:Fleeca:openDoors", 1)
        TriggerEvent("fCore:Fleeca:openDoors", 4)
    else
        showPiratagePoint = true
        TriggerEvent('mhacking:hide')
    end
end


function getInformationPerceuse(v)
    local InformationPerceuse = true
    CreateThread(function()
        while InformationPerceuse do 
            if ResultPerceuse then 
                PerceuseStats = false 
                InformationPerceuse = false
                showPointPerceuse = false
                MarkerRobCash(v)
            end
            Wait(0)
        end
    end)
end

RegisterNetEvent("fCore:Fleeca:openDoors")
AddEventHandler("fCore:Fleeca:openDoors", function(stats)
    local valeur = activeMarkerFleecaValue 
    for k,v in pairs(valeur.doors) do
        if stats == 1 then 
            local obj = GetClosestObjectOfType(v.startloc.x, v.startloc.y, v.startloc.z, 10.0, GetHashKey(Fleeca.doorVault), false, false, false)
            local count = 0
            repeat
                local heading = GetEntityHeading(obj) - 0.10
                SetEntityHeading(obj, heading)
                count = count + 1
                Wait(10)
            until count == 900
        elseif stats == 2 then 
            local obj = GetClosestObjectOfType(v.startloc.x, v.startloc.y, v.startloc.z, 10.0, GetHashKey(Fleeca.doorVault), false, false, false)
            local count = 0
            repeat
                local heading = GetEntityHeading(obj) + 0.10
                SetEntityHeading(obj, heading)
                count = count + 1
                Wait(10)
            until count == 900
        elseif stats == 3 then 
            local secondDoords = GetClosestObjectOfType(v.secondloc.x, v.secondloc.y, v.secondloc.z, 10.0, GetHashKey(Fleeca.door), false, false, false)
            FreezeEntityPosition(secondDoords, false)
        elseif stats == 4 then 
            local secondDoords = GetClosestObjectOfType(v.secondloc.x, v.secondloc.y, v.secondloc.z, 10.0, GetHashKey(Fleeca.door), false, false, false)
            FreezeEntityPosition(secondDoords, true)
        end
    end
end)


LaserDrill = {
    ['animations'] = {
        {'intro', 'bag_intro', 'intro_drill_bit'},
        {'drill_straight_start', 'bag_drill_straight_start', 'drill_straight_start_drill_bit'},
        {'drill_straight_end_idle', 'bag_drill_straight_idle', 'drill_straight_idle_drill_bit'},
        {'drill_straight_fail', 'bag_drill_straight_fail', 'drill_straight_fail_drill_bit'},
        {'drill_straight_end', 'bag_drill_straight_end', 'drill_straight_end_drill_bit'},
        {'exit', 'bag_exit', 'exit_drill_bit'},
    },
    ['scenes'] = {}
}

