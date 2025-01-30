RegisterNetEvent("fCore:ShopIllegal:BuyWeapon")
AddEventHandler("fCore:ShopIllegal:BuyWeapon", function(Type, price, name, Index, number, shop, point)
    print(price)
    print(name)
    print(Index)
    print(number)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    checkPos(point, _src)
    local getBlackMoney = xPlayer.getAccount('black_money').money 
    local priceTotal = price*Index
    local getWeight = xPlayer.getWeight()
    if getBlackMoney >= price*Index then
        if Type == "first" then 
            local time = os.time()
            local rentTime = time + 86400 
            local query = "INSERT INTO vente_darme (expiration, identifier, number, shop) VALUES (@expiration, @identifier, @number, @shop)"
            local param = {["@identifier"] = xPlayer.identifier,["@expiration"] = rentTime, ["@number"] = Index, ["@shop"] = shop}
            MySQL.Async.insert(query,param)
        else
            local query = "UPDATE vente_darme SET number = @number WHERE identifier = @identifier AND shop = @shop"
            local param = {["@shop"] = shop, ["@identifier"] = xPlayer.identifier, ["@number"] = number + Index}
            MySQL.Async.execute(query, param)
        end
        if getWeight < Cfg.maxWeight then 
            print("oo11111111111111111111111111")
            xPlayer.addInventoryItem(name, Index)
            xPlayer.removeAccountMoney('black_money', priceTotal)
        else
            sNotification(_src, TranslationIllegal.ShopIllegal["PasAssezDePlace"]) 
        end    
    else
        sNotification(_src, TranslationIllegal.ShopIllegal["PasAssezDArgent"])
    end
end)


ESX.RegisterServerCallback("fCore:ShopIllegal:GetInformation", function(source, cb, shop)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local getBlackMoney = xPlayer.getAccount('black_money').money 
    local time = os.time() 
    MySQL.Async.fetchAll("SELECT * FROM vente_darme WHERE identifier = @identifier AND shop = @shop", {["@identifier"] = xPlayer.identifier, ["@shop"] = shop}, function(result)
        local infoVenteDarme = {}
        if result and #result > 0 then
            for k,v in pairs(result) do
                if time > v.expiration then
                    MySQL.Async.execute("DELETE FROM vente_darme WHERE identifier = @identifier", {
                        ["@identifier"] = xPlayer.identifier,
                    })
                    table.insert(infoVenteDarme, {black_money = getBlackMoney, number = v.number})
                else
                    table.insert(infoVenteDarme, {
                        shop = v.shop,
                        identifier = v.identifier,
                        expiration = formatExpiration(v.expiration),
                        number = v.number,
                        black_money = getBlackMoney,
                    })
                end
            end
        else
            table.insert(infoVenteDarme, {black_money = getBlackMoney})
        end
        cb(infoVenteDarme)
    end)
end)


RegisterNetEvent("fCore:ShopIllegal:BuyWeaponIllimited")
AddEventHandler("fCore:ShopIllegal:BuyWeaponIllimited", function(price, name, Index, label, point)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    checkPos(point, _src)
    local getBlackMoney = xPlayer.getAccount('black_money').money 
    local priceTotal = price*Index
    local getWeight = xPlayer.getWeight()

    if getBlackMoney > priceTotal then
        if getWeight < Cfg.maxWeight then  
            xPlayer.removeAccountMoney('black_money', priceTotal)
            xPlayer.addInventoryItem(name, Index)
            sNotification(_src, (TranslationIllegal.ShopIllegal["AchatEffectue"]):format(Index, label, priceTotal))
        else
            sNotification(_src, TranslationIllegal.ShopIllegal["PasAssezDePlace"]) 
        end
    else
        sNotification(_src, TranslationIllegal.ShopIllegal["PasAssezDArgent"])
    end
end)