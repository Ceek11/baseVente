ESX = nil
ESX = exports["es_extended"]:getSharedObject()

local cautionAccount = nil
RegisterNetEvent("fCore:Location:BuyRental")
AddEventHandler("fCore:Location:BuyRental", function(price, label, spawn, name, caution, heading)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local GetMoney = xPlayer.getMoney()
    newPrice = price + caution
    checkPos(spawn, _src)
    if GetMoney >= newPrice then 
        cautionAccount = "money"
        xPlayer.removeAccountMoney('money', newPrice)
        TriggerClientEvent("fCore:location:SpawnVehicule", _src, spawn, name, caution, heading)
    else
        local getBankMoney = xPlayer.getAccount('bank').money
        if getBankMoney >= newPrice then 
            cautionAccount = "bank"
            xPlayer.removeAccountMoney('bank', newPrice)
            TriggerClientEvent("fCore:location:SpawnVehicule", _src, spawn, name, caution, heading)
        else
            sNotification(_src, TranslationUtils.Location["cNotif_no_money"])
        end
    end
end)

RegisterNetEvent("fCore:Location:Caution")
AddEventHandler("fCore:Location:Caution", function(caution, plate)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getMo
    if not xPlayer then return end 
    if Type == 2 then  
        xPlayer.addAccountMoney(cautionAccount, caution)
        sNotification(_src, ("Vous venez de récupérer la caution du véhicule"):format(caution), "Action", "vert")
    end
end)