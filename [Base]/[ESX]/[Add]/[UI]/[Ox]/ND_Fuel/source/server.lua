ESX = nil
ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("ND_Fuel:jerryCan")
AddEventHandler("ND_Fuel:jerryCan", function(amount)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local GetMoney = xPlayer.getMoney()
    if GetMoney >= amount then
        xPlayer.addInventoryItem("weapon_petrolcan", 1)
        xPlayer.removeMoney(amount)
        TriggerClientEvent("esx:showNotification", _src, "Vous venez de payer un jerrican d'essence pour ~g~"..amount.."$", "Action", "vert")
    else
        TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas assez d'argent sur vous !", "Action", "rouge")
    end
end)


RegisterNetEvent("ND_Fuel:pay")
AddEventHandler("ND_Fuel:pay", function(amount)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getMoney = xPlayer.getMoney()
    local GetBank = xPlayer.getAccount('bank').money
    if getMoney >= amount then 
        xPlayer.removeMoney(amount)
        TriggerClientEvent("esx:showNotification", _src, "Vous venez de payer  ~g~"..math.ceil(amount).."$ ~s~ d'essence en liquide", "Action", "vert")
    else
        xPlayer.removeAccountMoney('bank', amount)
        TriggerClientEvent("esx:showNotification", _src, "Vous venez de payer ~g~"..math.ceil(amount).."$ ~s~ d'essence en CB", "Action", "rouge")
    end
end)

