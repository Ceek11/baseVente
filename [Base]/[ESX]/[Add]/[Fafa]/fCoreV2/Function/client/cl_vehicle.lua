function SpawnVehicle(name, pos, heading, TaskWarp)
    RequestModel(name)
    while not HasModelLoaded(name) do
        Citizen.Wait(10)
    end
    vehi = CreateVehicle(name, pos, heading, true, false)
    if TaskWarp then 
        TaskWarpPedIntoVehicle(PlayerPedId(), vehi, -1)
    end
end


-- Crocheter le véhicule 
function CrochetVehicle()
    local playerPed = PlayerPedId()
    local vehicle = ESX.Game.GetVehicleInDirection()
    local coords = GetEntityCoords(playerPed)
    if IsPedSittingInAnyVehicle(playerPed) then
        cNotification(Translation.Function["leave_vehicle"], "Action", "rouge")
        return
    end
    if DoesEntityExist(vehicle) then
        isBusy = true
        TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
        Citizen.CreateThread(function()
            Citizen.Wait(10000)
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            ClearPedTasksImmediately(playerPed)
            cNotification(Translation.Function["unlocked_vehicle"], "Action", "rouge")
            isBusy = false
        end)
    else
        cNotification(Translation.Function["no_vehicle_nearby"], "Action", "rouge")
    end
end


function ImpoundVehicle()
    local playerPed = PlayerPedId()
    if IsPedSittingInAnyVehicle(playerPed) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if GetPedInVehicleSeat(vehicle, -1) == playerPed then
            TriggerServerEvent("fCore:Police:AddInFourriere", GetVehicleNumberPlateText(vehicle))
            ESX.Game.DeleteVehicle(vehicle)
            cNotification(Translation.Function["car_has_been_impounded"], "Action", "vert")
        else
            cNotification(Translation.Function["driver_seat"], "Action", "rouge")
        end
    else
        local vehicle = ESX.Game.GetVehicleInDirection()
        if DoesEntityExist(vehicle) then
            TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 0, true)
            Citizen.Wait(5000)
            ClearPedTasks(playerPed)
            TriggerServerEvent("fCore:Police:AddInFourriere", GetVehicleNumberPlateText(vehicle))
            ESX.Game.DeleteVehicle(vehicle)
            cNotification(Translation.Function["car_has_been_impounded"], "Action", "vert")
        else
            cNotification(Translation.Function["no_vehicle_nearby"], "Action", "rouge")
        end
    end
end


function repairVehicle()
    local playerPed = PlayerPedId()
    local vehicle   = ESX.Game.GetVehicleInDirection()
    local coords    = GetEntityCoords(playerPed)

    if DoesEntityExist(vehicle) then
        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
        Citizen.CreateThread(function()
            Citizen.Wait(20000)
            SetVehicleFixed(vehicle)
            SetVehicleDeformationFixed(vehicle)
            SetVehicleUndriveable(vehicle, false)
            SetVehicleEngineOn(vehicle, true, true)
            ClearPedTasksImmediately(playerPed)
            cNotification('~g~Voiture Reparée', "Action", "vert")
        end)
    else 
        cNotification("Aucun véhicule a proximiter", "Action", "rouge")
    end
end

function setMaxFuel()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleFuelLevel(vehicle, 100.0)
end

function cleanVehicle()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleDirtLevel(vehicle, 0)
end

function returnVehicleOnWheels()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleOnGroundProperly(vehicle)
    -- SetEntityHeading(vehicle, GetEntityHeading(vehicle)+180)
end

function returnVehicle()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetEntityHeading(vehicle, GetEntityHeading(vehicle)+180)
end

function deleteVehicle()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    DeleteVehicle(vehicle)
end

function changePlateVehicle(plate)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleNumberPlateText(vehicle, plate)
end

function freezeUnfreezeVehicle(status)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    FreezeEntityPosition(vehicle, status)
end