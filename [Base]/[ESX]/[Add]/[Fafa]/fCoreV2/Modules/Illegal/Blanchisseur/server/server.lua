ESX = nil
ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("fCore:Blanchisseur:makeFakeMoney")
AddEventHandler("fCore:Blanchisseur:makeFakeMoney", function(sumFakeMoney)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    checkPos(vector3(1117.926, -3194.214, -40.39698), _src)
    local getBlackMoney = xPlayer.getAccount('black_money').money 
    local cleanMoney = sumFakeMoney*0.75
    if getBlackMoney >= sumFakeMoney then
        local time = os.time()
        local rentTime = (time+(60*60*24))
        local query = "INSERT INTO blanchiment (expiration, identifier) VALUES (@expiration, @identifier)"
        local param = {["@identifier"] = xPlayer.identifier, ["@expiration"] = rentTime}
        MySQL.Async.insert(query, param)
        sNotification(_src, (TranslationIllegal.Blanchiment["WhitenedMoney"]):format(sumFakeMoney, cleanMoney))
        xPlayer.addAccountMoney('money', cleanMoney)
        xPlayer.removeAccountMoney('black_money', sumFakeMoney)
    else
        sNotification(_src, TranslationIllegal.Blanchiment["NotEnoughMoney"])
    end
end)

ESX.RegisterServerCallback("fCore:Blanchisseur:GetInformation", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local getBlackMoney = xPlayer.getAccount('black_money').money 
    local time = os.time() 
    local query = "SELECT * FROM blanchiment WHERE identifier = @identifier"
    local param = {["@identifier"] = xPlayer.identifier}
    MySQL.Async.fetchAll(query, param, function(result)
        local infoBlanchiment = {}
        if result and #result > 0 then
            for k,v in pairs(result) do
                if time > v.expiration then
                    local query = "DELETE FROM blanchiment WHERE identifier = @identifier"
                    local param = {["@identifier"] = xPlayer.identifier}
                    MySQL.Async.execute(query, param)
                    table.insert(infoBlanchiment, {black_money = getBlackMoney})
                else
                    table.insert(infoBlanchiment, {
                        identifier = v.identifier,
                        expiration = formatExpiration(v.expiration),
                        black_money = getBlackMoney,
                    })
                end
            end
        else
            table.insert(infoBlanchiment, {black_money = getBlackMoney})
        end
        cb(infoBlanchiment)
    end)  
end)


