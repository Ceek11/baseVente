RegisterNetEvent("fCore:Fleeca:getCops")
AddEventHandler("fCore:Fleeca:getCops", function()
    local _src = source
    local countCops = getCops()
    TriggerClientEvent("fCore:Fleeca:giveInformation", _src, countCops)
end)


RegisterServerEvent("fCore:Fleeca:GetObject")
AddEventHandler("fCore:Fleeca:GetObject", function(pedIndex)
    local info = Fleeca.Info[pedIndex]
    if info then
        info.robbed = true
        TriggerClientEvent("fCore:Fleeca:UpdateObject", -1, pedIndex, true)
    end
end)


RegisterNetEvent("fCore:Fleeca:rewardCash")
AddEventHandler("fCore:Fleeca:rewardCash", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local moneyReward = math.random(500,1000)
    xPlayer.addAccountMoney('black_money', moneyReward)
    sNotification(_src, (TranslationIllegal.Fleeca["ReceivedMoney"]):format(moneyReward))
end)


ESX.RegisterServerCallback("fCore:Fleeca:GetItemPiratage", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local getItem = xPlayer.getInventoryItem("cle_piratage").count
    if getItem >= 1 then 
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback("fCore:Fleeca:GetItemPerceuse", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local getItem = xPlayer.getInventoryItem("drill").count
    if getItem >= 1 then 
        cb(true)
    else
        cb(false)
    end
end)