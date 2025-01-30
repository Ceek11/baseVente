RegisterNetEvent("fCore:FarmLegal:Recolte")
AddEventHandler("fCore:FarmLegal:Recolte", function(item, itemLabel, itemReward, weightMax, point)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    checkPos(point, _src)
    local Getweight = xPlayer.getWeight()
    if Getweight < xPlayer.maxWeight then 
        xPlayer.addInventoryItem(item, itemReward)
    else
        sNotification(_src, "Vous avez plus assez de place sur vous")
    end
end)

RegisterNetEvent("fCore:FarmLegal:Traitement")
AddEventHandler("fCore:FarmLegal:Traitement", function(itemNeed, itemNeedLabel, itemRemove, itemNameReward, itemRewardLabel, itemReward, itemMini, point)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    checkPos(point, _src)
    local getItem = xPlayer.getInventoryItem(itemNeed).count
    local Getweight = xPlayer.getWeight()
    if Getweight < xPlayer.maxWeight and getItem >= itemMini then 
        xPlayer.removeInventoryItem(itemNeed, itemRemove)
        xPlayer.addInventoryItem(itemNameReward, itemReward)
    else
        sNotification(_src, "Vous ne pouvez plus traiter")
    end
end)

RegisterNetEvent("fCore:FarmLegal:Revente")
AddEventHandler("fCore:FarmLegal:Revente", function(itemNeed, itemNeedLabel, itemRemove, moneyReward, itemMini, society, point)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    checkPos(point, _src)
    local getItem = xPlayer.getInventoryItem(itemNeed).count
    local Getweight = xPlayer.getWeight()
    TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
        if getItem >= itemMini then
            account.addMoney(moneyReward/2)
            xPlayer.removeInventoryItem(itemNeed, itemRemove)
            xPlayer.addAccountMoney('money', moneyReward/2)
            sNotification(_src, "Vous venez de vendre")
        else
            sNotification(_src, "Vous ne pouvez plus revendre")
        end
    end)
end)