Citizen.CreateThread(function()
    local previousEngineOn = false
    local previousLightsState = false
    local previousHighBeamsOn = false
    
    while true do
        local playerPed = PlayerPedId()
        local isInVehicle = IsPedInAnyVehicle(playerPed, false)
        local interval = 1000
        
        if IsPauseMenuActive() then
            SendNUIMessage({
                action = 'hideHud'
            })
        else
            if isInVehicle then
                interval = 0
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                local speed = GetEntitySpeed(vehicle) * 3.6  -- Convertir la vitesse en km/h
                local fuelLevel = GetVehicleFuelLevel(vehicle)
                local isEngineOn = GetIsVehicleEngineRunning(vehicle)

                local _, lightsOne, lightsTwo = GetVehicleLightsState(vehicle)
                local lightsState
                local highBeamsOn = (lightsTwo == 1)
                
                if lightsOne == 1 and lightsTwo == 0 then
                    lightsState = true
                elseif (lightsOne == 1 and lightsTwo == 1) or (lightsOne == 0 and lightsTwo == 1) then
                    lightsState = true
                else
                    lightsState = false
                end

                -- Update engine and lights only if there is a change
                if isEngineOn ~= previousEngineOn or lightsState ~= previousLightsState or highBeamsOn ~= previousHighBeamsOn then
                    SendNUIMessage({
                        action = 'updateEngineAndLights',
                        engineOn = isEngineOn,
                        lightsOn = lightsState,
                        highBeamsOn = highBeamsOn
                    })
                    previousEngineOn = isEngineOn
                    previousLightsState = lightsState
                    previousHighBeamsOn = highBeamsOn
                end

                -- Always update speedometer and fuel level
                SendNUIMessage({
                    action = 'updateSpeedometer',
                    speed = speed
                })

                SendNUIMessage({
                    action = 'updateFuel',
                    fuelLevel = fuelLevel
                })

                SendNUIMessage({
                    action = 'showHud'
                })
            else
                SendNUIMessage({
                    action = 'hideHud'
                })
            end
        end
        Citizen.Wait(interval) 
    end
end)

CreateThread(function()
    while true do 
        if not IsPauseMenuActive() then
            TriggerEvent('esx_status:getStatus', 'hunger', function(status)
                SendNUIMessage({
                    action = 'updateHunger',
                    hungerLevel = status.getPercent()
                })
            end)
            
            TriggerEvent('esx_status:getStatus', 'thirst', function(status)
                SendNUIMessage({
                    action = 'updateThirst',
                    thirstLevel = status.getPercent()
                })
            end)
        else
            SendNUIMessage({
                action = 'hideHud'
            })
        end
        Citizen.Wait(1000)
    end
end)
