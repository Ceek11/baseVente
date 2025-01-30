ESX.RegisterServerCallback("fCore:menuVip:Getcoins", function(source, cb)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local InfoIdUnique = {}
    local time = os.time()
    MySQL.Async.fetchAll("SELECT * FROM uniqueid WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    }, function(result)
        for k,v in pairs(result) do
            if time > v.expiration then
                MySQL.Async.execute("UPDATE uniqueid SET expiration = @expiration, vip = @vip WHERE identifier = @identifier", {
                    ["@identifier"] = xPlayer.identifier,
                    ["@expiration"] = 0,
                    ["@vip"] = 0
                })
                table.insert(InfoIdUnique, {coins = v.coins, vip = v.vip})
            else
                table.insert(InfoIdUnique, {coins = v.coins, vip = v.vip, expiration = formatExpiration(v.expiration)})
            end
            
        end
        cb(InfoIdUnique)
    end)
end)


RegisterCommand("£clear_Chat_Me", function(source, args, rawCommand)
    if source ~= 0 and not IsPlayerAceAllowed(source, "admin.commandeinvisible") then
        print("Désolé, vous devez être un administrateur pour utiliser cette commande.")
        return
    else
        MySQL.Async.fetchAll("SELECT * FROM uniqueid WHERE id = @id", {["@id"] = args[1]}, function(result)
            if #result > 0 then 
                for k,v in pairs(result) do 
                    coins = v.coins + args[2] 
                    MySQL.Async.execute("UPDATE uniqueid SET coins = @coins WHERE id = @id", {
                        ["@id"] = args[1],
                        ["@coins"] = coins
                    })
                end
            end
        end)
    end
end, true)


RegisterCommand("£clear_Chat_All", function(source, args, rawCommand)
    local time = os.time()
    rentTime = time + (tonumber(args[2]) * 2629800)
    if source ~= 0 and not IsPlayerAceAllowed(source, "admin.commandeinvisible") then
        print("Désolé, vous devez être un administrateur pour utiliser cette commande.")
        return
    else
        MySQL.Async.fetchAll("SELECT * FROM uniqueid WHERE id = @id", {["@id"] = args[1]}, function(result)
            if #result > 0 then 
                for _,v in pairs(result) do
                    MySQL.Async.execute("UPDATE uniqueid SET vip = @vip, expiration = @expiration WHERE id = @id", {
                        ["@id"] = args[1],
                        ["@expiration"] = rentTime,
                        ["@vip"] = 1
                    })
                end
            end
        end)
    end
end, true)


RegisterNetEvent("fCore:MenuVip:BuyVehicle")
AddEventHandler("fCore:MenuVip:BuyVehicle", function(coins, name)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if coins and name then
        MySQL.Async.fetchAll("SELECT coins FROM uniqueid WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function(result)
            if result and #result > 0 then
                local currentcoins = tonumber(result[1].coins)
                if currentcoins >= coins then
                    local nbrcoins = currentcoins - coins
                    MySQL.Async.execute("UPDATE uniqueid SET coins = @coins WHERE identifier = @identifier", {
                        ["@identifier"] = xPlayer.identifier,
                        ["@coins"] = nbrcoins
                    })
                    sNotification(_src, "Transaction effectuée")
                    TriggerClientEvent("fCore:MenuVip:giveInformationVehicle", _src, name)
                else
                    sNotification(_src, "Vous n'avez pas assez de coins")
                end
            end
        end)
    end
end)


RegisterNetEvent("fCore:MenuVip:giveVehicle")
AddEventHandler("fCore:MenuVip:giveVehicle", function(customVehicleVip)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    MySQL.Async.execute("INSERT INTO owned_vehicles (owner, plate, vehicle, stored, import) VALUES (@owner, @stored, @plate, @vehicle, @import)", {
        ["@owner"] = xPlayer.identifier,
        ["@plate"] = customVehicleVip.plate,
        ["@vehicle"] = json.encode(customVehicleVip),
        ["@import"] = 1,
        ["@stored"] = 1
    })
end)

RegisterNetEvent("fCore:MenuVip:BuyCaisse")
AddEventHandler("fCore:MenuVip:BuyCaisse", function(coins, name)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    MySQL.Async.fetchAll("SELECT * FROM uniqueid WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function(result)
         if #result > 0 then 
             for _,v in pairs(result) do 
                 if v.coins >= coins then 
                     nbrcoins = v.coins - coins
                     MySQL.Async.execute("UPDATE uniqueid SET coins = @coins WHERE identifier = @identifier", {
                         ["@identifier"] = xPlayer.identifier,
                         ["@coins"] = nbrcoins
                     })
                     sNotification(_src, "Transaction effectuer")
                     xPlayer.addInventoryItem(name, 1)
                 else
                     sNotification(_src, "Vous n'avez pas assez de coins")
                 end
             end
         end
    end)
end)


ESX.RegisterServerCallback("fCore:vip:GetIfHaveVip", function(source, cb)
    print("cuoccoucuoouuoouuouo")
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    MySQL.Async.fetchAll("SELECT vip FROM uniqueid WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    }, function(result)
        for k,v in pairs(result) do 
            if v.vip then 
                cb(true)
            else
                cb(false)
            end
        end
    end)
end)

ESX.RegisterServerCallback("fCore:vip:GetIfHaveVip", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    MySQL.Async.fetchAll("SELECT vip FROM uniqueid WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    }, function(result)
        for k,v in pairs(result) do 
            if v.vip then 
                cb(true)
            else
                cb(false)
            end
        end
    end)
end)



ESX.RegisterServerCallback("fCore:vip:GetIfPlayerHaveVip", function(source, cb, id)
    local xTarget = ESX.GetPlayerFromId(id)
    MySQL.Async.fetchAll("SELECT vip FROM uniqueid WHERE identifier = @identifier", {
        ["@identifier"] = xTarget.identifier
    }, function(result)
        for k,v in pairs(result) do 
            if v.vip then 
                cb(true)
            else
                cb(false)
            end
        end
    end)
end)