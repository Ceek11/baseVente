RegisterNetEvent("fCore:AgentImmo:GiveInformationRentalHouse")
AddEventHandler("fCore:AgentImmo:GiveInformationRentalHouse", function(target, priceLocation, _src, id)
    cNotification("Appuyer sur ~b~E~s~ pour accepter le paiement \nAppuyer sur ~r~Y~s~ pour refuser le paiement", "Action", "vert")
    verifRentalHouse(target, priceLocation, _src, id)
end)

RegisterNetEvent("fCore:AgentImmo:GiveInformationResellHouse")
AddEventHandler("fCore:AgentImmo:GiveInformationResellHouse", function(target, priceVente, _src, id)
    cNotification("Appuyer sur ~b~E~s~ pour accepter le paiement \nAppuyer sur ~r~Y~s~ pour refuser le paiement", "Action", "vert")
    verifResellHouse(target, priceVente, _src, id)
end)

function verifResellHouse(target, priceVente, _src, id)
    CreateThread(function()
        local keyPressed = false 
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then 
                if target then 
                    cNotification("Vous avez accepté le paiement", "Action", "vert")
                    TriggerServerEvent("fCore:agentImmo:AddHouseInBdd", id, priceVente, "vente")
                    getInformationHouse()
                    keyPressed = true
                end
            elseif IsControlJustPressed(1, 246) then 
                if target then 
                    TriggerServerEvent("fCore:AgentImmo:customerRefuse", _src)
                    cNotification("~r~Vous n'avez pas accepté le paiement", "Action", "rouge")
                    keyPressed = true
                end
            end
            Wait(0)
        end
    end)
end

function verifRentalHouse(target, priceLocation, _src, id)
    CreateThread(function()
        local keyPressed = false 
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then 
                if target then 
                    cNotification("Vous avez accepté le paiement", "Action", "vert")
                    TriggerServerEvent("fCore:agentImmo:AddHouseInBdd", id, priceLocation, "location")
                    keyPressed = true
                end
            elseif IsControlJustPressed(1, 246) then 
                if target then 
                    TriggerServerEvent("fCore:AgentImmo:customerRefuse", _src)
                    cNotification("~r~Vous n'avez pas accepté le paiement", "Action", "rouge")
                    keyPressed = true
                end
            end
            Wait(0)
        end
    end)
end


RegisterNetEvent("fCore:AgentImmo:ActualiseHouse")
AddEventHandler("fCore:AgentImmo:ActualiseHouse", function()
    getInformationHouse()
end)