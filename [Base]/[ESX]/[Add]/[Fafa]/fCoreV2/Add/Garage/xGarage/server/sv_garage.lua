RegisterNetEvent("xGarage:setStats")
AddEventHandler("xGarage:setStats", function(plate, stored, properties)
    local xPlayer = ESX.GetPlayerFromId(source)
    if (not xPlayer) then return end
    MySQL.Async.fetchAll("UPDATE owned_vehicles SET stored = @stored, vehicle = @vehicle WHERE plate = @plate", { ["@stored"] = stored, ["@vehicle"] = json.encode(properties), ["@plate"] = plate }, function()end)
end)

ESX.RegisterServerCallback("xGarage:getVehicles", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local car = {}
    if (not xPlayer) then return end
    MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE stored = 1", {}, function(result)
        if (result) then
            for _,v in pairs(result) do
                if v.owner == xPlayer.getIdentifier() then
                    table.insert(car, {owner = v.owner, plate = v.plate, vehicle = v.vehicle, stored = v.stored, Type = v.type})
                end
            end
            cb(car)
        end
    end)
end)

ESX.RegisterServerCallback("xGarage:stockCar", function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)
    if (not xPlayer) then return end
    MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE plate = @plate", { ["@plate"] = plate }, function(result)
        if #result > 0 then
            for _,v in pairs(result) do
                if v.owner == xPlayer.getIdentifier() then 
                    cb(true) 
                else
                    cb(false)
                end
            end
        else
            cb(false)
        end
    end)
end)

ESX.RegisterServerCallback("xGarage:getMaxCar", function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    local identifier = xPlayer.identifier
    MySQL.Async.fetchAll("SELECT vip FROM uniqueid WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    }, function(result)
        for k,v in pairs(result) do 
            if v.vip then 
                MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @owner AND stored = @stored", {
                    ["@owner"] = identifier,
                    ["@stored"] = 1
                }, function(result)
                    cb(#result, 3)
                end)
            else
                MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @owner AND stored = @stored", {
                    ["@owner"] = identifier,
                    ["@stored"] = 1
                }, function(result)
                    cb(#result, 1)
                end)
            end
        end
    end)
end)


CreateThread(function()
    MySQL.Async.fetchAll("SELECT stored,plate FROM owned_vehicles", function(result)
        for k,v in pairs(result) do 
            if v.stored == 2 then 
                MySQL.Async.execute("UPDATE owned_vehicles SET stored = @stored WHERE plate = @plate", {
                    ["@stored"] = 1,
                    ["plate"] = v.plate,
                })
            end
        end
    end)
end)


ESX.RegisterServerCallback("fCore:Garage:GetKeysGive", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    MySQL.Async.fetchAll("SELECT other_users, plate FROM keysvehi WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    }, function(result)
        if result then 
            local tableKeys = {}
            for k,v in pairs(result) do 
                table.insert(tableKeys, v)
            end
            cb(tableKeys)
        end
    end)
end)


RegisterNetEvent("fCore:Keys:DeleteKeysGive")
AddEventHandler("fCore:Keys:DeleteKeysGive", function(plate, identifier)
    MySQL.Async.fetchAll("SELECT other_users FROM keysvehi WHERE plate = @plate", {
        ["@plate"] = plate
    }, function(result)
        if result and result[1] then 
            local data = json.decode(result[1].other_users)
            local newData = {}
            
            for _, user in ipairs(data) do
                if user.identifier ~= identifier then
                    table.insert(newData, user)
                end
            end

            MySQL.Async.execute("UPDATE keysvehi SET other_users = @other_users WHERE plate = @plate", {
                ["@other_users"] = json.encode(newData),
                ["@plate"] = plate
            })
        end
    end)
end)


