RegisterNetEvent("fCore:Plonge:BuyClothing")
AddEventHandler("fCore:Plonge:BuyClothing", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getMoney = xPlayer.getAccount('money').money
    if getMoney >= 500 then 
        xPlayer.removeAccountMoney('money', 500)
        sNotification(_src, "Vous venez de payer 325$ + 175$ de caution")
    else
        sNotification(_src, "Vous n'avez pas assez d'argent sur vous")
    end
end)

RegisterNetEvent("fCore:Plonge:renderCaution")
AddEventHandler("fCore:Plonge:renderCaution", function(haveTenuePlonge)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if haveTenuePlonge then 
        xPlayer.addAccountMoney('money', 175)
        sNotification(_src, "Vous avez reçu votre caution de 175$")
    end
end)