RegisterNetEvent("fCore:Weapon:Giveinformation")
AddEventHandler("fCore:Weapon:Giveinformation", function(targetT, _src, price, name, label, Index, society, pos)
    cNotification(TranslationJob.Armurerier["AcceptOrCancelPaiement"])
    verifWeaponLtd(targetT, _src, price, name, label, Index, society, pos)
end)

function verifWeaponLtd(targetT, _src, price, name, label, Index, society,pos)
    CreateThread(function()
        local keyPressed = false 
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then 
                if targetT then 
                    FactureVenteLtd = {}
                    ESX.TriggerServerCallback("esx_license:checkLicense", function(hasLicense)
                        if hasLicense then 
                            cNotification(TranslationJob.Armurerier["AcceptPaiment"])
                            TriggerServerEvent("fCore:Weapon:giveItem", targetT, price, name, label, Index, _src, society, pos)
                            keyPressed = true
                        else
                            cNotification(TranslationJob.Armurerier["NoLicense"])
                        end
                    end, targetT, "weapon")
                end
            elseif IsControlJustPressed(1, 246) then 
                if targetT then 
                    TriggerServerEvent("fCore:Weapon:customerRefuse", _src)
                    cNotification(TranslationJob.Armurerier["CancelPaiment"])
                    keyPressed = true
                end
            end
            Wait(0)
        end
    end)
end