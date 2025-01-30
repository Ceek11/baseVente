local test = nil
RegisterNetEvent("fCore:Couture:Caution")
AddEventHandler("fCore:Couture:Caution", function(caution, Type, name, spawn, heading)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getMoney = xPlayer.getMoney()
    local getBankMoney = xPlayer.getAccount('bank').money
    if not xPlayer then return end 
    if Type == 1 then 
        if getMoney >= caution then 
            test = "money"
            xPlayer.removeAccountMoney('money', caution)
            sNotification(_src, (Translation.Couture["DepositWithdraw"]):format(caution))
            TriggerClientEvent("fCore:Couture:SpawnVehi", _src, name, spawn, heading)
        else
            if getBankMoney >= caution then 
                test = "bank"
                xPlayer.removeAccountMoney('bank', caution)
                sNotification(_src, (Translation.Couture["DepositWithdraw"]):format(caution))
                TriggerClientEvent("fCore:Couture:SpawnVehi", _src, name, spawn, heading)
            else
                sNotification(_src, Translation.Couture["NoMunchMoney"])
            end
        end
    elseif Type == 2 then  
        print(test)
        xPlayer.addAccountMoney(test, caution)
        sNotification(_src, (Translation.Couture["depositRefunded"]):format(caution))
    end
end)