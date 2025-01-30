RegisterNetEvent("fCore:Bijouterie:getCops")
AddEventHandler("fCore:Bijouterie:getCops", function()
    local _src = source
    local countCops = getCops()
    TriggerClientEvent("fCore:Bijouterie:giveInformation", _src, countCops)
end)

local Inbraquage = {}
RegisterNetEvent("fCore:Bijouterie:giveItem")
AddEventHandler("fCore:Bijouterie:giveItem", function(itemName, count)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getWeight = xPlayer.getWeight()
    if Inbraquage[_src] then 
        if getWeight < Cfg.maxWeight then     
            xPlayer.addInventoryItem(itemName, count)
        else
            sNotification(_src, TranslationIllegal.Bijouterie["NoSpace"]) 
        end
    end
end)

RegisterNetEvent("fCore:Bijouterie:GetObject")
AddEventHandler("fCore:Bijouterie:GetObject", function()
    local _src = source 
    Inbraquage[_src] = true
    TriggerClientEvent("fCore:Bijouterie:giveInformationRob", _src, true)
end)

ESX.RegisterServerCallback("fCore:Bijouterie:getBreakglass", function(source, cb)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getItem = xPlayer.getInventoryItem("casse_vitre").count
    if getItem >= 1 then 
        cb(true)
    else
        cb(false)
    end
end)