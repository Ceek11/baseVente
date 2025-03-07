
local time
local rentTime
RegisterNetEvent("fCore:VenteOccasion:resell")
AddEventHandler("fCore:VenteOccasion:resell", function(price, vehicleLabel, vehicleCustom, vehicleModel, pos)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local identifier = xPlayer.identifier 
    MySQL.Async.fetchScalar("SELECT COUNT(*) FROM venteoccasion WHERE identifier = @identifier", {["@identifier"] = identifier}, function(count)
        if count >= 1 then 
            sNotification(_src, "Vous avez déjà mis en vente un véhicule")
        else
            local plate = vehicleCustom.plate
            MySQL.Async.fetchScalar("SELECT COUNT(*) FROM owned_vehicles WHERE owner = @identifier AND plate = @plate", {["@identifier"] = identifier, ["@plate"] = plate}, function(ownedCount)
                if ownedCount == 0 then
                    sNotification(_src, "Vous ne possédez pas ce véhicule")
                else
                    MySQL.Async.execute("DELETE FROM owned_vehicles WHERE owner = @identifier AND plate = @plate", {["@identifier"] = identifier, ["@plate"] = plate}, function(rowsAffected)
                        if rowsAffected > 0 then
                            local pointParking = nil
                            local placeDisponible = false
                            for i, coords in ipairs(venteOccasion.PointParking) do
                                local jsonCoords = json.encode(coords)
                                local result = MySQL.Sync.fetchScalar("SELECT COUNT(*) FROM venteoccasion WHERE pointParking = @jsonCoords", {["@jsonCoords"] = jsonCoords})
                                if result == 0 then
                                    pointParking = coords
                                    placeDisponible = true
                                    time = os.time()
                                    rentTime = time + 86400
                                    break
                                end
                            end

                            if not placeDisponible then
                                sNotification(_src, "Tous les parkings sont occupés")
                                return
                            end
                            MySQL.Async.execute("INSERT INTO venteoccasion (price, identifier, model, vehicleCustom, pointParking, label, time) VALUES (@price, @identifier, @model, @vehicleCustom, @pointParking, @label, @time)",
                                {
                                    ["@price"] = price,
                                    ["@identifier"] = identifier,
                                    ["@model"] = vehicleModel,
                                    ["label"] = vehicleLabel,
                                    ["@vehicleCustom"] = json.encode(vehicleCustom),
                                    ["@pointParking"] = json.encode(pointParking),
                                    ["@time"] = rentTime

                                },
                                function(rowsAffected)
                                    if rowsAffected > 0 then 
                                        sNotification(_src, "Véhicule mis en vente avec succès")
                                        TriggerClientEvent("fCore:VenteOccasion:NewVehicle", -1, json.encode(pointParking), json.encode(vehicleCustom), vehicleLabel, price, vehicleModel)
                                        TriggerClientEvent("fCore:VenteOccasion:DeleteVehicle", _src)
                                    end
                                end
                            )
                        else
                            sNotification(_src, "Impossible de mettre en vente ce véhicule")
                        end
                    end)
                end
            end)
        end
    end)
end)

ESX.RegisterServerCallback("fCore:VenteOccasion:inResell", function(source, cb)
    local infoVehicle = {}
    MySQL.Async.fetchAll("SELECT * FROM venteoccasion", function(result)
        for k,v in pairs(result) do 
            table.insert(infoVehicle, {
                id = v.id,
                price = v.price,
                model = v.model, 
                label = v.label,
                vehicleCustom = v.vehicleCustom,
                pointParking = v.pointParking
            })
        end
        cb(infoVehicle)
    end)
end)

RegisterNetEvent("fCore:VenteOccasion:CheckTime")
AddEventHandler("fCore:VenteOccasion:CheckTime", function()
    time = os.time()
    MySQL.Async.fetchAll("SELECT * FROM venteoccasion", function(result)
        for _, row in ipairs(result) do
            if time >= row.time then 
                local identifier = row.identifier
                local data = json.decode(row.vehicleCustom)
                TriggerClientEvent("fCore:VenteOccasion:DeleteVehicleOnOccasion", -1, data.plate)
                MySQL.Async.execute("DELETE FROM venteoccasion WHERE id = @id", {["@id"] = row.id})
                MySQL.Async.execute("INSERT INTO owned_vehicles (owner, plate, vehicle, stored, type) VALUES (@owner, @plate, @vehicle, @stored, @type)", {
                    ['@owner'] = identifier,
                    ['@plate'] = data.plate,
                    ['@vehicle'] = json.encode(data),
                    ['@stored'] = 1,
                    ['@type'] = 'vehicle',
                })
            end
        end
    end)
end)

RegisterNetEvent("fCore:VenteOccasion:BuyVehicle")
AddEventHandler("fCore:VenteOccasion:BuyVehicle", function(price, custom, id, parkingCoords)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local getMoney = xPlayer.getMoney()
    local getMoneyBank = xPlayer.getAccount('bank').money
    if getMoney >= price then
        TriggerClientEvent("fCore:VenteOccasion:DeleteVehicleOnOccasion", -1, custom.plate)
        MySQL.Async.execute("DELETE FROM venteoccasion WHERE id = @id", {["@id"] = id})
        MySQL.Async.execute("INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored) VALUES (@owner, @plate, @vehicle, @type, @stored)", {
            ["owner"] = xPlayer.identifier,
            ["plate"] = custom.plate,
            ["vehicle"] = json.encode(custom),
            ["type"] = "vehicle",
            ["stored"] = 1
        })
        sNotification(_src, "Vous venez d'acheter un le véhicule")
    else
        if getMoneyBank >= price then 
            TriggerClientEvent("fCore:VenteOccasion:DeleteVehicleOnOccasion", -1, custom.plate)
            MySQL.Async.execute("DELETE FROM venteoccasion WHERE id = @id", {["@id"] = id})    
            MySQL.Async.execute("INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored) VALUES (@owner, @plate, @vehicle, @type, @stored)", {
                ["owner"] = xPlayer.identifier,
                ["plate"] = custom.plate,
                ["vehicle"] = json.encode(custom),
                ["type"] = "vehicle",
                ["stored"] = 1,
            })
            sNotification(_src, "Vous venez d'acheter un le véhicule")
        else
            sNotification(_src, "Vous n'avez pas assez d'argent")
        end
    end
end)