RegisterNetEvent("fCore:AgentImmo:CreateHouse")
AddEventHandler("fCore:AgentImmo:CreateHouse", function(InformationProperty, Information, properties, TypeProperty, typePropertyLabel)
    if Information == "Maison" then 
        for k,v in pairs(properties) do
            if TypeProperty == v.TypeHouse and v.label == typePropertyLabel then
                MySQL.Async.execute("INSERT INTO houseimmo (TypeHouse, vip, posHouseExt, posCoffre, weightCoffre, weightCoffreVIP, posManage, priceVente, priceLocation, positionProperty) VALUES (@TypeHouse, @vip, @posHouseExt, @posCoffre, @weightCoffre, @weightCoffreVIP, @posManage, @priceVente, @priceLocation, @positionProperty)", {
                    ["@TypeHouse"] = v.TypeHouse,
                    ["@vip"] = v.vip,
                    ["@posHouseExt"] = json.encode(InformationProperty.posExtProperty),
                    ["@posCoffre"] = json.encode(v.positionCoffre),
                    ["@weightCoffre"] = v.coffre,
                    ["@weightCoffreVIP"] = v.coffreVip,
                    ["@posManage"] = json.encode(v.positionManage),
                    ["@priceLocation"] = InformationProperty.priceLocation,
                    ["@priceVente"] = InformationProperty.priceVente,
                    ["@positionProperty"] = json.encode(v.positionProperty)
                })
                TriggerEvent("fCore:AgentImmo:ShowHouse")
            end
        end
    elseif Information == "Garage" then 
        for k,v in pairs(properties) do
            if TypeProperty == v.TypeGarage then 
                MySQL.Async.execute("INSERT INTO garageimmo (TypeGarage, posGarageExt, priceVente, priceLocation, positionGarage, placeGarage) VALUES (@TypeGarage, @posGarageExt, @priceVente, @priceLocation, @positionGarage, @placeGarage)", {
                    ["@TypeGarage"] = v.TypeGarage,
                    ["@posGarageExt"] = json.encode(InformationProperty.posExtGarage),
                    ["@priceVente"] = InformationProperty.priceVente,
                    ["@priceLocation"] = InformationProperty.priceLocation,
                    ["@positionGarage"] = json.encode(v.positionGarage),
                    ["@placeGarage"] = v.place
                })
            end
        end
    end
end)


RegisterNetEvent("fCore:AgentImmo:InventoryDepo")
AddEventHandler("fCore:AgentImmo:InventoryDepo", function(QuantityDepo, name, weightChest, weightChestMax, label, idHouse)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local weight = xPlayer.getInventoryItem(name).weight 
    newWeigt = weightChest + (weight*QuantityDepo)
    if newWeigt >= weightChestMax then 
        sNotification(_src, "ça dépasse la capacité du coffre !")
    else
        local count = 0
        local found = false
        MySQL.Async.fetchAll("SELECT name, count FROM CoffreHouse WHERE identifier = @identifier AND idHouse = @idHouse", {
            ["@identifier"] = xPlayer.identifier,
            ["@idHouse"] = idHouse,
        }, function(result)
            if result and #result > 0 then 
                for _, v in ipairs(result) do 
                    if name == v.name then 
                        count = v.count + QuantityDepo
                        MySQL.Async.execute("UPDATE CoffreHouse SET count = @count WHERE identifier = @identifier AND name = @name AND idHouse = @idHouse", {
                            ["@count"] = count, 
                            ["@identifier"] = xPlayer.identifier, 
                            ["@name"] = name,
                            ["@idHouse"] = idHouse,
                        }, function(rowsChanged)
                            if rowsChanged > 0 then
                                xPlayer.removeInventoryItem(name, QuantityDepo)
                            end
                        end)
                        found = true
                        break
                    end
                end
            end
            if not found then
                MySQL.Async.execute("INSERT INTO CoffreHouse (identifier, name, count, label, idHouse) VALUES (@identifier, @name, @count, @label, @idHouse)", {
                    ["@identifier"] = xPlayer.identifier, 
                    ["@name"] = name,
                    ["@count"] = QuantityDepo, 
                    ["@label"] = label,
                    ["@idHouse"] = idHouse,
                }, function(rowsChanged)
                    if rowsChanged > 0 then
                        xPlayer.removeInventoryItem(name, QuantityDepo)
                    end
                end)
            end
        end)
    end
end)

RegisterNetEvent("fCore:AgentImmo:ChestRetirer")
AddEventHandler("fCore:AgentImmo:ChestRetirer", function(QuantityRetirer, name, idHouse)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local count = 0
    MySQL.Async.fetchAll("SELECT name, count FROM CoffreHouse WHERE identifier = @identifier AND idHouse = @idHouse", {
        ["@identifier"] = xPlayer.identifier, 
        ["@idHouse"] = idHouse
    }, function(result)
        if result and #result > 0 then 
            for _, v in ipairs(result) do 
                if name == v.name then 
                    if v.count >= QuantityRetirer then 
                        count = v.count - QuantityRetirer
                        MySQL.Async.execute("UPDATE CoffreHouse SET count = @count WHERE identifier = @identifier AND name = @name AND idHouse = @idHouse", {
                            ["@count"] = count, 
                            ["@identifier"] = xPlayer.identifier, 
                            ["@name"] = name, 
                            ["@idHouse"] = idHouse
                        }, function(rowsChanged)
                            if rowsChanged > 0 then
                                xPlayer.addInventoryItem(name, QuantityRetirer)
                            end
                        end)
                    end
                end
            end
        end
    end)
end)


ESX.RegisterServerCallback("fCore:AgentImmo:getChestHouse", function(source, cb, idHouse)
    local weightCount = 0
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local chestHouse = {}
    MySQL.Async.fetchAll("SELECT name, count, label FROM CoffreHouse WHERE identifier = @identifier AND idHouse = @idHouse", {
        ["@identifier"] = xPlayer.identifier,
        ["@idHouse"] = idHouse
    }, function(result)
        for _,v in pairs(result) do 
            local weight = xPlayer.getInventoryItem(v.name).weight
            weightCount = weightCount + weight * v.count
            table.insert(chestHouse, {name = v.name, count = v.count, label = v.label})
        end
        cb(chestHouse, weightCount)
    end)
end)

ESX.RegisterServerCallback("fCore:AgentImmo:displayGarage", function(source, cb)
    local getGarage = {}
    MySQL.Async.fetchAll("SELECT * FROM garageimmo", function(result)
        for _,v in pairs(result) do 
            table.insert(getGarage, v)
        end
        cb(getGarage)
    end)
end)


local getHouse = {}
RegisterNetEvent("fCore:AgentImmo:ShowHouse")
AddEventHandler("fCore:AgentImmo:ShowHouse", function()
    getHouse = {}
    local _src = source
    MySQL.Async.fetchAll("SELECT * FROM houseimmo", function(result)
        for _,v in pairs(result) do     
            if v.expiration ~= nil then 
                expiration = formatExpiration(v.expiration)
            else
                expiration = false
            end        
            table.insert(getHouse, {
                expiration = expiration,
                vip = v.vip,
                posHouseExt = v.posHouseExt,
                statusBuy = v.statusBuy,
                id = v.id,
                positionProperty = v.positionProperty,
                posCoffre = v.posCoffre,
                weightCoffre = v.weightCoffre,
                weightCoffreVIP = v.weightCoffreVIP,
                posManage = v.posManage,
                priceVente = v.priceVente,
                priceLocation = v.priceLocation,
                identifier = v.identifier,
                other_users = v.other_users,
                jobaccess = v.jobaccess,
                gangaccess = v.gangaccess,
            })
        end
        TriggerClientEvent("fCore:AgentImmo:displayHouse", -1, getHouse)
    end)
end)

RegisterNetEvent('fCore:AgentImmo:rentalHouse')
AddEventHandler("fCore:AgentImmo:rentalHouse", function(target, priceLocation, id)
    local _src = source
    TriggerClientEvent("fCore:AgentImmo:GiveInformationRentalHouse", target, target, priceLocation, _src, id)
end)

RegisterNetEvent("fCore:AgentImmo:customerRefuse")
AddEventHandler("fCore:AgentImmo:customerRefuse", function(_src)
    sNotification(_src, "Le client à refuser la facture")
end)

RegisterNetEvent("fCore:agentImmo:AddHouseInBdd")
AddEventHandler("fCore:agentImmo:AddHouseInBdd", function(id, price, Type)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local time = os.time()
    local getMoney = xPlayer.getAccount('money').money
    local getBank = xPlayer.getAccount('bank').money
    if Type == "location" then 
        expiration =time + 86400
    else
        expiration = nil
    end
    if getMoney >= price or getBank >= price then
        MySQL.Async.execute("UPDATE houseimmo SET identifier = @identifier, expiration = @expiration, statusBuy = @statusBuy WHERE id = @id", {
            ["@id"] = id,
            ["@identifier"] = xPlayer.identifier,
            ["@expiration"] = expiration,
            ['@statusBuy'] = 1
        })
        if getMoney >= price then
            xPlayer.removeAccountMoney('money', price)
        else
            xPlayer.removeAccountMoney('bank', price)
        end
        TriggerClientEvent("fCore:AgentImmo:ActualiseHouse", -1)
    else
        sNotification(_src, "Vous n'avez pas assez d'argent sur vous")
    end    
end)

RegisterNetEvent("fCore:AgentImmo:resellHouse")
AddEventHandler("fCore:AgentImmo:resellHouse", function(target, priceVente, id)
   local _src = source 
   TriggerClientEvent("fCore:AgentImmo:GiveInformationResellHouse", target, target, priceVente, _src, id)
end)



ESX.RegisterServerCallback("fCore:AgenImmo:GetOwnerHouse", function(source, cb, id)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    
    if not xPlayer then return end
    
    local getJob = xPlayer.job.name 
    local getJob2 = xPlayer.job2.name 
    MySQL.Async.fetchAll("SELECT identifier, other_users, jobaccess, gangaccess FROM houseimmo WHERE id = @id", {
        ["@id"] = id
    }, function(result)
        local OwnerHouse = false
        local ColocHouse = {}
        local JobHouse = {}
        local GangHouse = {}
        
        for _, v in pairs(result) do 
            other_users = json.decode(v.other_users)
            jobaccess = json.decode(v.jobaccess)
            gangaccess = json.decode(v.gangaccess)

            if v.identifier == xPlayer.identifier then 
                OwnerHouse = true
            else
                if #other_users > 0 then 
                    for _, coloc in pairs(other_users) do 
                        if coloc.identifier == xPlayer.identifier then 
                            table.insert(ColocHouse, coloc)
                            break
                        end
                    end
                end

                for _, job in pairs(jobaccess) do 
                    if job.name == getJob then 
                        table.insert(JobHouse, job)
                        break
                    end
                end
                
                for _, gang in pairs(gangaccess) do 
                    if gang.name == getJob2 then 
                        table.insert(GangHouse, gang)
                        break
                    end
                end
            end   
        end
        
        cb(OwnerHouse, ColocHouse, JobHouse, GangHouse)
    end)
end)







ESX.RegisterServerCallback("fCore:AgentImmo:getInventory", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local getInventory = xPlayer.getInventory()
    cb(getInventory)
end)

RegisterNetEvent("fCore:AgentImmo:AddColoc")
AddEventHandler("fCore:AgentImmo:AddColoc", function(target, id, maxKeysHouse)
    local _src = source
    local xTarget = ESX.GetPlayerFromId(target)
    MySQL.Async.fetchAll("SELECT other_users FROM houseimmo WHERE id = @id", {
        ["@id"] = id,
    }, function(result)
        local data = json.decode(result[1].other_users)
        if #data >= maxKeysHouse then
            sNotification(_src, "Vous avez déjà donné le maximum de doubles de clés.")
        else
            local found = false
            for _, entry in ipairs(data) do
                if entry.identifier == xTarget.identifier then
                    found = true
                    break
                end
            end
            
            if found then
                sNotification(_src, "Vous avez déjà donné les clés à cette personne.")
            else
                table.insert(data, {identifier = xTarget.identifier, name = xTarget.getName(), coffre = false, manage = false})
                MySQL.Async.execute("UPDATE houseimmo SET other_users = @other_users WHERE id = @id", {
                    ["@other_users"] = json.encode(data),
                    ["@id"] = id
                }, function(result2)
                    if result2 ~= nil then
                        sNotification(target, "(~y~Information~s~)\nVous venez de recevoir un double de clés ~r~%s~s~.", "Action", "vert")
                        sNotification(_src, ("(~g~Succès~s~)\nVous avez donné un double des clés à ~r~%s~s~."):format(xTarget.getName()), "Action", "vert")
                    end
                end)
            end
        end
    end)
end)


ESX.RegisterServerCallback("fCore:agentImmo:getColocataire", function(source, cb, id)
    local colocataireHouse = {}
    MySQL.Async.fetchAll("SELECT other_users FROM houseimmo WHERE id = @id", {
         ["@id"] = id,
    }, function(result)
        for _,v in pairs(result) do 
            local otherUsers = json.decode(v.other_users)
            for _, valeur in pairs(otherUsers) do 
                table.insert(colocataireHouse, valeur)
            end
        end
        cb(colocataireHouse)
    end)
end)


RegisterNetEvent("fCore:AgentImmo:AddGangColocataire")
AddEventHandler("fCore:AgentImmo:AddGangColocataire", function(Type, id)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local gangAccess = {} 
    if Type == 1 then 
        table.insert(gangAccess, {name = xPlayer.getJob2().name, label = xPlayer.getJob2().label, coffre = false, manage = false})
        MySQL.Async.execute("UPDATE houseimmo SET gangaccess = @gangaccess WHERE id = @id", {
            ["@gangaccess"] = json.encode(gangAccess), 
            ["@id"] = id
        })
    elseif Type == 2 then 
        table.insert(gangAccess, {name = "personne", label = "Personne", coffre = false, manage = false})
        MySQL.Async.execute("UPDATE houseimmo SET gangaccess = @gangaccess WHERE id = @id", {
            ["@gangaccess"] = json.encode(gangAccess), 
            ["@id"] = id
        })
    end
end)


RegisterNetEvent("fCore:AgentImmo:AddJobColocataire")
AddEventHandler("fCore:AgentImmo:AddJobColocataire", function(Type, id)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local jobAccess = {} 
    if Type == 1 then 
        table.insert(jobAccess, {name = xPlayer.getJob().name, label = xPlayer.getJob().label, coffre = false, manage = false})
        MySQL.Async.execute("UPDATE houseimmo SET jobaccess = @jobaccess WHERE id = @id", {
            ["@jobaccess"] = json.encode(jobAccess), 
            ["@id"] = id
        })
    elseif Type == 2 then 
        table.insert(jobAccess, {name = "personne", label = "Personne", coffre = false, manage = false})
        MySQL.Async.execute("UPDATE houseimmo SET jobaccess = @jobaccess WHERE id = @id", {
            ["@jobaccess"] = json.encode(jobAccess), 
            ["@id"] = id
        })
    end
end)

RegisterNetEvent("fCore:AgentImmo:DeleteColoc")
AddEventHandler("fCore:AgentImmo:DeleteColoc", function(colocataireHouse, id, Type)
    if Type == 1 then 
        MySQL.Async.execute("UPDATE houseimmo SET other_users = @other_users WHERE id = @id", {
            ["@other_users"] = colocataireHouse,
            ["@id"] = id, 
        })
    elseif Type == 2 then 
        MySQL.Async.execute("UPDATE houseimmo SET other_users = @other_users WHERE id = @id", {
            ["@other_users"] = "{}",
            ["@id"] = id, 
        })
    end
end)

ESX.RegisterServerCallback("fCore:AgentImmo:GetJobColacation", function(source, cb, id)
    local jobColocation = {}
    MySQL.Async.fetchAll("SELECT jobaccess, gangaccess FROM houseimmo WHERE id = @id", {
        ["@id"] = id
    }, function(result)
        for _,v in pairs(result) do 
            local jobaccess = json.decode(v.jobaccess)
            local gangaccess = json.decode(v.gangaccess)
            table.insert(jobColocation, {jobaccess = jobaccess, gangaccess = gangaccess})
        end
        cb(jobColocation)
    end)
end)



RegisterNetEvent("fCore:agentImmo:sonnerAppart")
AddEventHandler("fCore:agentImmo:sonnerAppart", function(id)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local indentifierOwner = nil
    local loadIndentifierOwner = false
    local ownerInCity = false
    local positionProperty = nil
    MySQL.Async.fetchAll("SELECT identifier, positionProperty FROM houseimmo WHERE id = @id", {
        ["@id"] = id
    }, function(result)
        for _,v in pairs(result) do 
            indentifierOwner = v.identifier
            positionProperty = v.positionProperty
            loadIndentifierOwner = true
        end
    end)
    while not loadIndentifierOwner do 
        Wait(10)
    end
    if loadIndentifierOwner then 
        local xPlayers = ESX.GetPlayers()
        for i = 1, #xPlayers, 1 do
            local xTarget = ESX.GetPlayerFromId(xPlayers[i])
            if xTarget.identifier == indentifierOwner then
                TriggerClientEvent("fCore:agentImmo:sonnerAppartOwner", xPlayers[i], xPlayer.getName(), _src, positionProperty)
                ownerInCity = true
                break
            end
        end
        if not ownerInCity then
            sNotification(_src, "Le propriétaire n'est pas en ville")
        end
    end
end)


RegisterNetEvent("fCore:agentImmo:AddInAppart")
AddEventHandler("fCore:agentImmo:AddInAppart", function(idPlayer, coords)
    local playerPed = GetPlayerPed(idPlayer)
    if playerPed ~= -1 then
        local coordsTable = json.decode(coords) 
        SetEntityCoords(playerPed, coordsTable.x, coordsTable.y, coordsTable.z, false, false, false, false)
    end
end)


RegisterNetEvent("fCore:agentImmo:updatePermission")
AddEventHandler("fCore:agentImmo:updatePermission", function(Type, status, id, colocataireHouse, identifier)
    for _, colocataire in pairs(colocataireHouse) do
        if colocataire.identifier == identifier then
            if Type == "coffre" then
                colocataire["coffre"] = status
                break
            elseif Type == "manage" then 
                colocataire["manage"] = status
                break
            end
        end
    end
    local colocataireHouseJSON = json.encode(colocataireHouse)
    MySQL.Async.execute("UPDATE houseimmo SET other_users = @other_users WHERE id = @id", {
        ["@other_users"] = colocataireHouseJSON,
        ["@id"] = id
    })
end)

RegisterNetEvent("fCore:agentImmo:updatePermissionJob")
AddEventHandler("fCore:agentImmo:updatePermissionJob", function(Type, status, id, colocataireHouse, identifier)
    for _, colocataire in pairs(colocataireHouse) do
        if Type == "coffre" then
            colocataire["coffre"] = status
            break
        elseif Type == "manage" then 
            colocataire["manage"] = status
            break
        end
    end
    local colocataireHouseJSON = json.encode(colocataireHouse)
    MySQL.Async.execute("UPDATE houseimmo SET jobaccess = @jobaccess WHERE id = @id", {
        ["@jobaccess"] = colocataireHouseJSON,
        ["@id"] = id
    })
end)


RegisterNetEvent("fCore:agentImmo:updatePermissionGang")
AddEventHandler("fCore:agentImmo:updatePermissionGang", function(Type, status, id, colocataireHouse, identifier)
    for _, colocataire in pairs(colocataireHouse) do
        if Type == "coffre" then
            colocataire["coffre"] = status
            break
        elseif Type == "manage" then 
            colocataire["manage"] = status
            break
        end
    end
    local colocataireHouseJSON = json.encode(colocataireHouse)
    MySQL.Async.execute("UPDATE houseimmo SET gangaccess = @gangaccess WHERE id = @id", {
        ["@gangaccess"] = colocataireHouseJSON,
        ["@id"] = id
    })
end)
