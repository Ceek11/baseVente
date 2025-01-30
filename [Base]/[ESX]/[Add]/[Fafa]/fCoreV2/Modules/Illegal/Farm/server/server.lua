RegisterNetEvent("fCore:FarmIllegal:Recolte")
AddEventHandler("fCore:FarmIllegal:Recolte", function(item, itemLabel, itemReward, weightMax, minimumCops, point)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    checkPos(point, _src)
    local PoliceInService = getCops()
    if PoliceInService < minimumCops then 
        sNotification(_src, TranslationIllegal.Farm["NotEnoughPolice"])
        return 
    end
        xPlayer.addInventoryItem(item, itemReward)
end)

RegisterNetEvent("fCore:FarmIllegal:Traitement")
AddEventHandler("fCore:FarmIllegal:Traitement", function(itemNeed, itemNeedLabel, itemRemove, itemNameReward, itemRewardLabel, itemReward, minimumCops, itemMini, deuxItem, troisItem, item2Need, item2NeedLabel, item2Remove, item2NameReward, item2RewardLabel, item2Reward, item3Need, item3NeedLabel, item3Remove, item3NameReward, item3RewardLabel, item3Reward, item2Mini, item3Mini, point)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    checkPos(point, _src)
    local getItem = xPlayer.getInventoryItem(itemNeed).count
    local PoliceInService = getCops()
    if PoliceInService < minimumCops then 
        sNotification(_src, TranslationIllegal.Farm["NotEnoughPolice"])
        return 
    end

    if deuxItem then
        local get2Item = xPlayer.getInventoryItem(item2Need).count  
        if  getItem >= itemMini and get2Item >= item2Mini then 
            xPlayer.removeInventoryItem(itemNeed, itemRemove)
            xPlayer.removeInventoryItem(item2Need, item2Remove)
            xPlayer.addInventoryItem(itemNameReward, itemReward)
        else
            sNotification(_src, TranslationIllegal.Farm["cantProcess"])
        end
    elseif troisItem then 
        local get2Item = xPlayer.getInventoryItem(item2Need).count  
        local get3Item = xPlayer.getInventoryItem(item3Need).count  
        if getItem >= itemMini and get2Item >= item2Mini and get3Item >= item3Mini then 
            xPlayer.removeInventoryItem(itemNeed, itemRemove)
            xPlayer.removeInventoryItem(item2Need, item2Remove)
            xPlayer.removeInventoryItem(item3Need, item3Remove)

            xPlayer.addInventoryItem(itemNameReward, itemReward)
        else
            sNotification(_src, TranslationIllegal.Farm["cantProcess"])
        end
    else
        if getItem >= itemMini then 
            xPlayer.removeInventoryItem(itemNeed, itemRemove)
            xPlayer.addInventoryItem(itemNameReward, itemReward)
        else
            sNotification(_src, TranslationIllegal.Farm["cantProcess"])
        end
    end
end)