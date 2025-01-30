RegisterNetEvent("xGarage:getFourriere")
AddEventHandler("xGarage:getFourriere", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end 
    local car = {}
    MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE stored = 0", {}, function(result)
        if #result > 0 then
            for _,v in pairs(result) do
                if v.owner == xPlayer.getIdentifier() then 
                    table.insert(car, {owner = v.owner, plate = v.plate, vehicle = v.vehicle, stored = v.stored, Type = v.type})
                end
            end
            TriggerClientEvent("xGarage:receiveFourriere", xPlayer.source, car)
        end
    end)
end)

RegisterNetEvent("xGarage:setFourriere")
AddEventHandler("xGarage:setFourriere", function(plate)
    MySQL.Async.execute("UPDATE owned_vehicles SET stored = 0 WHERE plate = @plate", { ["@plate"] = plate }, function(result)end)
end)

ESX.RegisterServerCallback("xGarage:payFourriere", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if (not xPlayer) then return end
    if xPlayer.getMoney() >= GaragePublic.PriceFourriere then
        xPlayer.removeMoney(GaragePublic.PriceFourriere)
        sNotification(source, '(~g~Succès~s~)\nFourrière payé.', "Action", "vert")
        cb(true)
    else
        cb(false)
    end
end)

