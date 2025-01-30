ESX.RegisterServerCallback("fCore:goFast:getTime", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local time = os.time()
    MySQL.Async.fetchAll("SELECT * FROM gofast WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    }, function(result)
        if result and #result > 0 then 
            for _, data in ipairs(result) do
                if time >= data.expiration then 
                    MySQL.Async.execute("UPDATES goFast SET expiration = @expiration WHERE identifier = @identifier", {
                        ["@identifier"] = xPlayer.identifier,
                        ["@expiration"] = time + 86400,
                    })
                    cb(true, getCops())
                else
                    sNotification(_src, ("Vous pouvez refaire un gofast le %s"):format(formatExpiration(data.expiration)))
                    cb(false, getCops())
                end
            end
        else
            MySQL.Async.execute("INSERT INTO gofast (identifier, expiration) VALUES (@identifier, @expiration)", {
                ["@identifier"] = xPlayer.identifier,
                ["@expiration"] = time + 86400
            })
            cb(true, getCops())
        end
    end)
end)


RegisterNetEvent("fCore:goFast:GiveMoney")
AddEventHandler("fCore:goFast:GiveMoney", function(price)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    xPlayer.addAccountMoney('black_money', price)
    sNotification(_src, ("Vous venez de recevoir %s$ d'argent sale"):format(price), "Action", "vert")
end)

RegisterNetEvent("fCore:Gofast:NotifPolice")
AddEventHandler("fCore:Gofast:NotifPolice", function(coords, displayName)
    Jobs = {"police", "sheriff"}
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.getJob().name == Jobs[1] or xPlayer.getJob().name == Jobs[2] then
            TriggerClientEvent("fCore:Gofast:InformationBlip", xPlayers[i], xPlayers[i], coords, displayName)
        end
    end
end)
