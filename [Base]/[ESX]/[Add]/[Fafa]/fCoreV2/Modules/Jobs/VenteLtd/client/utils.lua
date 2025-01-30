RegisterNetEvent("fCore:Vente:Giveinformation")
AddEventHandler("fCore:Vente:Giveinformation", function(targetT, _src, price, name, label, Index, society)
    cNotification("Appuyer sur ~b~E~s~ pour accepter le paiement \nAppuyer sur ~r~Y~s~ pour refuser le paiement", "Action", "vert")
    verifVenteLtd(targetT, _src, price, name, label, Index, society)
end)

function verifVenteLtd(targetT, _src, price, name, label, Index, society)
    CreateThread(function()
        local keyPressed = false 
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then 
                if targetT then 
                    FactureVenteLtd = {}
                    TriggerServerEvent("fCore:Vente:giveItem", targetT, price, name, label, Index, _src, society)
                    cNotification("Vous avez accepté le paiement", "Action", "vert")
                    keyPressed = true
                end
            elseif IsControlJustPressed(1, 246) then 
                if targetT then 
                    TriggerServerEvent("fCore:Vente:customerRefuse", _src)
                    cNotification("~r~Vous n'avez pas accepté le paiement")
                    keyPressed = true
                end
            end
            Wait(0)
        end
    end)
end