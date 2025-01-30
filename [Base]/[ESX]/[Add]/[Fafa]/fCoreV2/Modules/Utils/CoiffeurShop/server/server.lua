
RegisterNetEvent('fCore:Coiffeur:Payer')
AddEventHandler('fCore:Coiffeur:Payer', function(price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local xMoney = xPlayer.getMoney()
    if xMoney >= price then
        print("couououuo")
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', _src, "~g~Tu as payé le Coiffeur")
        TriggerClientEvent("fCore:Coiffeur:saveSkin", _src)
    else
        TriggerClientEvent('esx:showNotification', _src, "Il vous ~r~manque~g~ "..price-xMoney.."$~w~ !")
    end
end)
