ESX = nil
ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("fCore:Pharmacie:BuyHeal")
AddEventHandler('fCore:Pharmacie:BuyHeal', function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    if xPlayer.getMoney() >= Cfg.PriceHeal then
        xPlayer.removeAccountMoney('money', Cfg.PriceHeal)
        sNotification(_src, Translation.Pharmacie["cNotif_buy_heal"], "Action", "vert")
    else
        sNotification(_src, Translation.Pharmacie["cNotif_no_money"])
    end 
end)