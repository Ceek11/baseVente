local test = nil
RegisterNetEvent("fCore:Abatoire:Caution")
AddEventHandler("fCore:Abatoire:Caution", function(caution, Type, name, spawn, heading)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getMoney = xPlayer.getMoney()
    local getBankMoney = xPlayer.getAccount('bank').money
    if not xPlayer then return end 
    if Type == 1 then 
        if getMoney >= caution then 
            test = "money"
            xPlayer.removeAccountMoney('money', caution)
            sNotification(_src, (Translation.Abatoire["DepositWithdraw"]):format(caution))
            TriggerClientEvent("fCore:Abatoire:SpawnVehi", _src, name, spawn, heading)
        else
            if getBankMoney >= caution then 
                test = "bank"
                xPlayer.removeAccountMoney('bank', caution)
                sNotification(_src, (Translation.Abatoire["DepositWithdraw"]):format(caution))
                TriggerClientEvent("fCore:Abatoire:SpawnVehi", _src, name, spawn, heading)
            else
                sNotification(_src,Translation.Abatoire["NoMunchMoney"])
            end
        end
    elseif Type == 2 then  
        print(test)
        xPlayer.addAccountMoney(test, caution)
        sNotification(_src, (Translation.Abatoire["depositRefunded"]):format(caution))
    end
end)