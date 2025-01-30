
local inCombat = false

RegisterNetEvent('disableControlAction')
AddEventHandler('disableControlAction', function(can)
    if can then
        while true do 
            if not inCombat then 
                if IsControlJustPressed(1, 24) then 
                    cNotification("Vous ne pouvez pas taper pour l'instant")
                    inCombat = true 
                    SetTimeout(6000, function()
                        inCombat = false
                    end)
                end
            end
            DisableControlActions()
            DisableCollisionsWithOtherPlayers()
            DisableCollisionsWithOtherVehicles()
            Wait(0)
        end
    end
end)


function DisableControlActions()
    local disabledActions = {25, 263, 264, 257, 140, 141, 142, 143}
    for _, action in ipairs(disabledActions) do
        DisableControlAction(0, action, true)
    end
end

function DisableCollisionsWithOtherPlayers()
    for _, i in ipairs(GetActivePlayers()) do
        if i ~= PlayerId() then
            local closestPlayerPed = GetPlayerPed(i)
            local veh = GetVehiclePedIsIn(closestPlayerPed, false)
            SetEntityNoCollisionEntity(veh, GetPlayerPed(-1), false)
        end
    end
end

function DisableCollisionsWithOtherVehicles()
    for _, i in ipairs(GetActivePlayers()) do
        if i ~= PlayerId() then
            local closestPlayerPed = GetPlayerPed(i)
            local closestVehicle = GetVehiclePedIsIn(closestPlayerPed, false)
            if closestVehicle ~= nil and closestVehicle ~= 0 then
                local playerVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                if playerVehicle ~= nil and playerVehicle ~= 0 then
                    SetEntityNoCollisionEntity(closestVehicle, playerVehicle, true)
                end
            end
        end
    end
end


Citizen.CreateThread(function()
    while true do
        TriggerServerEvent('checkPlayerTime')
        Wait(50000)
    end
end)