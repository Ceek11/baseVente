RegisterNetEvent("fCore:Weapon:SellWeapon")
AddEventHandler("fCore:Weapon:SellWeapon", function(name, label, price, GetItem, Index, targetT, society, pos)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    checkPos(pos, _src)
    if GetItem then
        local nbrItem = xPlayer.getInventoryItem(name).count
        if nbrItem >= Index then
            TriggerClientEvent("fCore:Weapon:Giveinformation", targetT, targetT, _src, price, name, label, Index, society, pos)
        else
            sNotification(_src, TranslationJob.Armurerier["DontHaveEnoughtItem"])
        end
    else
        TriggerClientEvent("fCore:Weapon:Giveinformation", targetT, targetT, _src, price, name, label, Index, society, pos)
    end
end)


RegisterNetEvent("fCore:Weapon:giveItem")
AddEventHandler("fCore:Weapon:giveItem", function(targetT, price, name, label, Index, _src, society, pos)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(targetT)
    if not xPlayer then return end 
    checkPos(pos, _src)
    local Target = ESX.GetPlayerFromId(targetT)
    local getMoney = Target.getMoney()
    if getMoney >= price then 
        Target.addInventoryItem(name, Index)
        Target.removeAccountMoney('money', price)
        TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
            account.addMoney((price)*PercentageResellWeapon.percentSociety)
        end)
        xPlayer.addAccountMoney('money', math.ceil((price)*PercentageResellWeapon.percentReseller))
        sNotification(_src, (TranslationJob.Armurerier["InformationPaiement"]):format(Index, label, price, math.ceil(price*PercentageResellWeapon.percentReseller), math.ceil(price*PercentageResellWeapon.percentSociety), math.ceil(price*PercentageResellWeapon.percentProvider)))
        sNotification(targetT, (TranslationJob.Armurerier["InformationPaiementReceive"]):format(Index, label, price))
        for k,v in pairs(GetPlayerIdentifiers(source))do
            if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                discordPlayer = string.sub(v, string.len("discord:") + 1)
            end
        end
        sendToDiscord(12975872,"Logs Job", ("Le joueur **%s** viens de vendre une arme à **%s**\n\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job: ** %s"):format(xPlayer.name, xTarget.name, xPlayer.playerId, xPlayer.identifier, discordPlayer, xPlayer.getJob().name), "", webhooks.LogsJob)
    else
        sNotification(targetT, (TranslationJob.Armurerier["DontHaveEnoughtMoney"]):format(price-getMoney))
        sNotification(_src, TranslationJob.Armurerier["PlayerDontHaveEnoughtMoney"])
    end
end)



RegisterNetEvent("fCore:Weapon:customerRefuse")
AddEventHandler("fCore:Weapon:customerRefuse", function(_src)
    sNotification(_src, TranslationJob.Armurerier["ClientCancelPaiement"])
end)