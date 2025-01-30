CreateThread(function()
    while true do 
        local interval = 1500
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        if IsPedInVehicle(PlayerPedId(), vehicle, true) then
            local vehicleClass = GetVehicleClass(vehicle)    
            if vehicleClass == 8 or vehicleClass == 9 then
                interval = 0
                if casqueState then 
                    SetPedHelmet(PlayerPedId(), false)
                else
                    SetPedHelmet(PlayerPedId(), true)
                end
            end
        end
        Wait(interval) 
    end
end)

Keys.Register('f5', "MenuF5", 'Ouvrir le menu MenuF5', function()
    if openPersonel == false then
        openMenuPersonel()
    end
end)

function StatsVehicle()
    local vehicle = GetVehiclePedIsIn(PlayerPedId()) 
    local engineState = GetIsVehicleEngineRunning(vehicle)
    if engineState then 
        SetVehicleEngineOn(vehicle, false)
        SetVehicleUndriveable(vehicle, true)
    else
        SetVehicleEngineOn(vehicle, true) 
    end
end

function statDoors()
    local SwitchVehicle = SwitchVehicle -1 
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    if openBeforeDoorLeft then 
        openBeforeDoorLeft = false
        SetVehicleDoorShut(vehicle, SwitchVehicle, false)
    else
        openBeforeDoorLeft = true
        SetVehicleDoorOpen(vehicle, SwitchVehicle, false)
    end
end