RegisterNetEvent("fCore:Shop:buy")
AddEventHandler('fCore:Shop:buy', function(name, label, price, count, pos, typeMoney)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local GetMoney = xPlayer.getAccount(typeMoney).money
    local getWeight = xPlayer.getWeight()
    local priceTotal = price*count
    if not xPlayer then return end
    checkPos(pos, _src)
    if GetMoney >= priceTotal then
        if getWeight < Cfg.maxWeight then 
            xPlayer.addInventoryItem(name, count)
            xPlayer.removeAccountMoney(typeMoney, priceTotal)
            sNotification(_src, (Translation.Shop["sNotif_buy_item"]):format(count, label,priceTotal), "Action", "vert")
        else
            sNotification(_src, "Vous n'avez pas assez de place sur vous")
        end
    else
        sNotification(_src, Translation.Shop["sNotif_no_money"])
    end
end)