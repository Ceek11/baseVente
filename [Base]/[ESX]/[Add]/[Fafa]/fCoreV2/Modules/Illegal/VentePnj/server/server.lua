ESX = exports["es_extended"]:getSharedObject()

function getCops()
    Jobs = {"police", "sheriff"}
    local xPlayers = ESX.GetPlayers()
    local copsConnected = 0
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if (xPlayer.getJob().name) == Jobs then
            copsConnected = copsConnected + 1
        end
    end
    return copsConnected
end

ESX.RegisterServerCallback("fCore:SellDrugs:CheckItemAndCops", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local countCops = getCops()
    local getItem = xPlayer.getInventoryItem(SellDrugs.itemPhone).count
    if getItem >= 1 then 
        if countCops >= SellDrugs.PoliceRequiert then 
            cb(true)
        else
            TriggerClientEvent("esx:showNotification",_src, TranslationIllegal.VentePnj["NotEnoughPolice"])
            cb(false)
        end
    else
        TriggerClientEvent("esx:showNotification",_src, TranslationIllegal.VentePnj["PasDeTelephone"])
        cb(false)
    end
end)

ESX.RegisterServerCallback("fCore:SellDrugs:GetInventory", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local infoInv = {}
    for k,v in pairs(SellDrugs.Drugs) do 
        getItem = xPlayer.getInventoryItem(v.name).count 
        if getItem >= 1 then 
            table.insert(infoInv, {getItem = getItem, label = v.label, name = v.name, price = v.price, minItem = v.minItem, maxResell = v.maxResell})
        end
    end
    cb(infoInv)
end)

RegisterNetEvent("fCore:Illegal:VenteDrugs")
AddEventHandler("fCore:Illegal:VenteDrugs", function(name, minItem, price, label, maxResell)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local getItem = xPlayer.getInventoryItem(name).count 
    if getItem >= minItem then 
        xPlayer.removeInventoryItem(name, maxResell)
        xPlayer.addAccountMoney('black_money', price)
        TriggerClientEvent("esx:showNotification",_src, (TranslationIllegal.VentePnj["VenteEffectuee"]):format(minItem, label, price))
    end
end)

RegisterNetEvent("NotifPolice")
AddEventHandler("NotifPolice", function(coords)
    local Jobs = {"police", "sheriff"}
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        for _,v in pairs(Jobs) do 
            if (xPlayer.getJob().name) == v then
                TriggerClientEvent("AfficherNotifPolice", xPlayers[i], coords)
            end
        end
    end
end)