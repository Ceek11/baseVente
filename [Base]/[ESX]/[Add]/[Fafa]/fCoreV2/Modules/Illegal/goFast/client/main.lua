CreateThread(function()
    while true do 
        local interval = 1500
        local posPlayer = GetEntityCoords(PlayerPedId())
        local dest = goFastTable.Coords
        local dist = #(dest - posPlayer)
        if dist <= 3 then 
            interval = 0
            if IsControlJustPressed(1, 51) then
                startGofast()
            end
        else
            exports['HelpNotif']:CloseNotify()
        end
        Wait(interval)
    end
end)



function startGofast()
    ESX.TriggerServerCallback("fCore:goFast:getTime", function(result, Cops) 
        if Cops >= goFastTable.CopsMax and result then 
            cNotification("Vous venez de commencer le goFast", "Action", "vert")
            AddTimerBar("Timer :", {endTime = GetGameTimer() + goFastTable.TimeBar})
            local randomIndex = math.random(1, #goFastTable.Gofast.Information)
            local randomTable = goFastTable.Gofast.Information[randomIndex]
            RequestModel(randomTable.nameVehi)
            while not HasModelLoaded(randomTable.nameVehi) do 
                Wait(10)
            end
            car = CreateVehicle(randomTable.nameVehi, goFastTable.SpawnVehi, true, false)
        SetVehicleNumberPlateText(car, "")
        TaskWarpPedIntoVehicle(PlayerPedId(), car, -1)
        DrawBlipGoFast(randomTable.price)



        -- Customizations
        SetVehicleModKit(car, 0)
        SetVehicleMod(car, 14, 0, true)
        SetVehicleNumberPlateTextIndex(car, 5)
        ToggleVehicleMod(car, 18, true)
        SetVehicleColours(car, 0, 0)
        SetVehicleCustomPrimaryColour(car, 0, 0, 0)
        SetVehicleModColor_2(car, 5, 0)
        SetVehicleExtraColours(car, 111, 111)
        SetVehicleWindowTint(car, 2)
        ToggleVehicleMod(car, 22, true)
        SetVehicleMod(car, 23, 11, false)
        SetVehicleMod(car, 24, 11, false)
        SetVehicleWheelType(car, 120)
        SetVehicleWindowTint(car, 3)
        ToggleVehicleMod(car, 20, true)
        SetVehicleTyreSmokeColor(car, 0, 0, 0)
        LowerConvertibleRoof(car, true)
        SetVehicleDirtLevel(car, 0)

        -- Performance Upgrades
        SetVehicleMod(car, 11, 2)
        SetVehicleMod(car, 12, 2)
        SetVehicleMod(car, 13, 3)
        SetVehicleMod(car, 0, 1)
        ToggleVehicleMod(car, 22, true)
        SetVehicleMod(car, 23, 11, false)
        SetVehicleMod(car, 24, 11, false)

        -- Miscellaneous adjustments
        SetVehicleIsStolen(car, false)
        SetVehicleIsWanted(car, false)
        SetVehicleHasBeenOwnedByPlayer(car, true)
        SetVehicleNeedsToBeHotwired(car, false)
        SetCanResprayVehicle(car, true)
        SetPlayersLastVehicle(car)
        SetVehicleFixed(car)
        SetVehicleDeformationFixed(car)
        SetVehicleTyresCanBurst(car, false)
        SetVehicleWheelsCanBreak(car, false)
        SetVehicleCanBeTargetted(car, false)
        SetVehicleExplodesOnHighExplosionDamage(car, false)
        SetVehicleHasStrongAxles(car, true)
        SetVehicleCanBeVisiblyDamaged(car, false)
        SetVehicleEngineOn(car, true, true)
        SetVehicleStrong(car, true)
        RollDownWindow(car, 0)
        RollDownWindow(car, 1)
        SetPedCanBeDraggedOut(PlayerPedId(), false)
        SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
        SetPedRagdollOnCollision(PlayerPedId(), false)
        ResetPedVisibleDamage(PlayerPedId())
        ClearPedDecorations(PlayerPedId())
        SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)

        elseif result then 
            cNotification("Il n'y a pas assez de policiers")
        end
    end)
end


function DrawBlipGoFast(price)
    local inGofast = true
    local randomIndex = math.random(1, #PosLivery)
    local randomTable = PosLivery[randomIndex]
    local blip = AddBlipForCoord(randomTable)
    SetBlipScale(blip, goFastTable.Scale)
    SetBlipSprite(blip, tonumber(goFastTable.Type))
    SetBlipDisplay(blip, 4)
    SetBlipColour(blip, tonumber(goFastTable.Color)) 
    SetBlipAsShortRange(blip, true) 
    BeginTextCommandSetBlipName("STRING") 
    AddTextComponentSubstringPlayerName(tostring(goFastTable.Label))
    EndTextCommandSetBlipName(blip)
    SetBlipRoute(blip, true)
    CreateThread(function()
        SetTimeout(30000,function()
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local model = GetEntityModel(vehicle)
            local displayName = GetDisplayNameFromVehicleModel(model)
            TriggerServerEvent("fCore:Gofast:NotifPolice", GetEntityCoords(PlayerPedId()), vehicleType, displayName)
        end)
        SetTimeout(600000,function()
            inGofast = false
            RemoveTimerBar()
            RemoveBlip(blip)
            DeleteVehicle(car)
            cNotification("Mission échouée ! Vous avez mis trop de temps.", "Action", 'rouge')
        end)
        while inGofast do 
            local interval = 2000
            local posPlayer = GetEntityCoords(PlayerPedId())
            local dest = randomTable
            local dist = #(dest - posPlayer)
            if dist <= 20 then
                interval = 0
                ESX.ShowHelpNotification("E", "Pour livrer le véhicule", "Information", {97, 32, 32})
                if IsControlJustPressed(1, 51) then
                    RemoveBlip(blip)
                    inGofast = false
                    RemoveTimerBar()
                    DeleteVehicle(car)
                    TriggerServerEvent("fCore:goFast:GiveMoney", price)
                end
            end
            Wait(interval)
        end
    end)
end



RegisterNetEvent("fCore:Gofast:InformationBlip")
AddEventHandler("fCore:Gofast:InformationBlip", function(xPlayer, coords, displayName)
    cNotification("Gofast \n\nAppuyer sur ~b~E~s~ pour prend l'alerte \nAppuyer sur ~r~Y~s~ pour refuser l'alerte", "Action", "vert")
    AcceptCallGofast(xPlayer, coords, displayName)
end)

function AcceptCallGofast(xPlayer, coords, displayName)
    CreateThread(function()
        local keyPressed = false 
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then 
                if xPlayer then 
                    cNotification("Vous avez accepté l'alerte", "Action", "vert")
                    TriggerEvent("fCore:Gofast:AddBlipAlert", xPlayer, coords, displayName)
                    keyPressed = true
                end
            elseif IsControlJustPressed(1, 246) then 
                if xPlayer then 
                    cNotification("~r~Vous avez refuser l'alerte")
                    keyPressed = true
                end
            end
            Wait(0)
        end
    end)
end

RegisterNetEvent("fCore:Gofast:AddBlipAlert")
AddEventHandler("fCore:Gofast:AddBlipAlert", function(xPlayer, coords, displayName)
    blip = AddBlipForRadius(coords.x, coords.y, coords.z, 30)
    SetBlipSprite(blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 4)
    SetBlipAsShortRange(blip, true) 
    BeginTextCommandSetBlipName("STRING") 
    AddTextComponentSubstringPlayerName("GoFast")
    EndTextCommandSetBlipName(blip)
    cNotification("Véhicule Noir, marque :"..displayName )
end)