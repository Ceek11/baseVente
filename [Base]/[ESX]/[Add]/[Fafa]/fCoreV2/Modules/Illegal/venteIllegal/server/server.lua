RegisterNetEvent("fCore:venteIllegal:addItem")
AddEventHandler("fCore:venteIllegal:addItem", function(name, price, typeMoney)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getItem = xPlayer.getInventoryItem(name).count
    if getItem >= 1 then 
        xPlayer.removeInventoryItem(name, 1)
        xPlayer.addAccountMoney(typeMoney, price)
        sNotification(_src, (TranslationIllegal.VenteIllegal["VenteEffectuee"]):format(name, price))
    else
        sNotification(_src, (TranslationIllegal.VenteIllegal["PasDeDrogue"]):format(name))
    end 
end)