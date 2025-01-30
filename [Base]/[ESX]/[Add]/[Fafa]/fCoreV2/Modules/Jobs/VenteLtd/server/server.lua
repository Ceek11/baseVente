RegisterNetEvent("fCore:Vente:SellProduit")
AddEventHandler("fCore:Vente:SellProduit", function(name, label, price, GetItem, Index, targetT, society, point)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    checkPos(point, _src)
    if GetItem then
        local nbrItem = xPlayer.getInventoryItem(name).count
        if nbrItem >= Index then
            TriggerClientEvent("fCore:Vente:Giveinformation", targetT, targetT, _src, price, name, label, Index, society)
        else
            sNotification(_src, "Vous n'avez pas assez d'item sur vous")
        end
    else
        TriggerClientEvent("fCore:Vente:Giveinformation", targetT, targetT, _src, price, name, label, Index, society)
    end
end)


RegisterNetEvent("fCore:Vente:giveItem")
AddEventHandler("fCore:Vente:giveItem", function(targetT, price, name, label, Index, _src, society)
    local xPlayer = ESX.GetPlayerFromId(_src)
    local targetPlayer = ESX.GetPlayerFromId(targetT)

    if not xPlayer or not targetPlayer then return end
    local getMoney = targetPlayer.getMoney()
    local getBankMoney = xPlayer.getAccount('bank').money
    local getWeight = xPlayer.getWeight()
    if getMoney >= price or getBankMoney >= price then
        if getWeight < Cfg.maxWeight then
            targetPlayer.addInventoryItem(name, Index)
            if getMoney >= price then
                targetPlayer.removeAccountMoney('money', price)
            else
                xPlayer.removeAccountMoney('bank', price)
            end
            xPlayer.addAccountMoney('money', math.ceil(price * PercentageResell.percentReseller))
            TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
                account.addMoney(math.ceil(price * PercentageResell.percentSociety))
            end)

            xPlayer.removeInventoryItem(name, Index)

            local resellerAmount = math.ceil(price * PercentageResell.percentReseller)
            local societyAmount = math.ceil(price * PercentageResell.percentSociety)

            sNotification(_src, ("Vous venez de donner x%s %s pour le prix de : ~g~%s$~s~ \n\nVous avez reçu ~g~%s$~s~ \nL'entreprise à reçu ~g~%s$~s~\nLe fournisseur à reçu ~g~%s$~s~"):format(Index, label, price, resellerAmount, societyAmount, societyAmount))
            sNotification(targetT, ("Vous venez de recevoir x%s %s pour le prix de : ~g~%s$~s~"):format(Index, label, price))
        else
            sNotification(_src, "Vous n'avez pas assez de place sur vous")
        end
    else
        local neededMoney = price - getMoney
        sNotification(targetT, ("~r~Vous n'avez pas assez d'argent sur vous il vous manque %s"):format(neededMoney))
        sNotification(_src, "~r~La personne n'a pas assez d'argent lui")
    end
end)


RegisterNetEvent("fCore:Vente:customerRefuse")
AddEventHandler("fCore:Vente:customerRefuse", function(_src)
    sNotification(_src, "~r~Le client à refuser le paiement")
end)