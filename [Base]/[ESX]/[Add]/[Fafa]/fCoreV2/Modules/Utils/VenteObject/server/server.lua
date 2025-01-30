RegisterNetEvent("fCore:resellObject:Resell")
AddEventHandler("fCore:resellObject:Resell", function(name, price, typeMoney, label, Index)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local getItem = xPlayer.getInventoryItem(name).count 
    if getItem >= 1 then 
        xPlayer.removeInventoryItem(name, Index)
        xPlayer.addAccountMoney(typeMoney, price)
        sNotification(_src, ("Vous venez de vendre x%s %s pour %s$"):format(Index, label, price), "Action", "vert")
    else
        sNotification(_src, ("Il vous manque x%s %s"):format(Index-getItem, label))
    end
end)