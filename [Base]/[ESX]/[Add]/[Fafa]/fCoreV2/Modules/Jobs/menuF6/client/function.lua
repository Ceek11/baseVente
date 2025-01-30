RegisterNetEvent("fCore:ambulance:heal")
AddEventHandler("fCore:ambulance:heal", function(heal)
    local getHeal = GetEntityHealth(PlayerPedId())
    local newHeal = getHeal + heal
    SetEntityHealth(PlayerPedId(), newHeal)
end)

function GetDistressSignal()
    SignalEms = {}
    loadSignalEms = false
    ESX.TriggerServerCallback("fCore:Ems:GetDistressSignal", function(result) 
        for k,v in pairs(result) do 
            table.insert(SignalEms, v)
        end
        loadSignalEms = true
    end)
end

RegisterNetEvent("fCore:EMS:SendNotification")
AddEventHandler("fCore:EMS:SendNotification", function(coords)
    cNotification("Appuyer sur ~b~E~s~ pour accepter l'appel \nAppuyer sur ~r~Y~s~ pour refuser l'appel", "Action", "vert")
    SendPointDistressSignal(coords)
end)

function SendPointDistressSignal(coords)
    CreateThread(function()
        local keyPressed = false 
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then
                SetNewWaypoint(coords.x, coords.y)
                cNotification("Vous avez accepté l'appel", "Action", "vert")
                keyPressed = true
            elseif IsControlJustPressed(1, 246) then 
                cNotification("~r~Vous n'avez pas accepté l'appel", "Action", "rouge")
                keyPressed = true
            end
            Wait(0)
        end
    end)
end


function getItem(target)
    inventory = {}
    inventoryLoad = false
    ESX.TriggerServerCallback("fCore:Police:getInventory", function(valeur) 
        for _,v in pairs(valeur) do 
            table.insert(inventory, v)
        end
        inventoryLoad = true
    end, target)
end