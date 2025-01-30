ESX.RegisterServerCallback("fCore:Keys:getPropertycar", function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        cb(false)
        return
    end

    MySQL.Async.fetchAll("SELECT identifier, other_users FROM keysvehi WHERE plate = @plate", {
        ["@plate"] = plate,
    }, function(result)
        if result and #result > 0 then
            local data = {}
            for _, v in ipairs(result) do
                if v.identifier == xPlayer.identifier then
                    cb(true)
                    return
                else
                    local otherUsers = json.decode(v.other_users)
                    if otherUsers and #otherUsers > 0 then
                        for _, user in ipairs(otherUsers) do
                            if user.identifier == xPlayer.identifier then
                                table.insert(data, user)
                                break
                            end
                        end
                    end
                end
            end

            if #data > 0 then
                cb(true, data)
            else
                cb(false)
            end
        else
            cb(false)
        end
    end)
end)

RegisterNetEvent("fCore:Keys:DuplicateKeysCar")
AddEventHandler("fCore:Keys:DuplicateKeysCar", function(target, plate, maxKeys)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(target)
    MySQL.Async.fetchAll("SELECT other_users, job FROM keysvehi WHERE plate = @plate", {
        ["@plate"] = plate,
    }, function(result)
        local job = nil
        for k,v in pairs(result) do 
            job = v.job
            break
        end
        if not job then 
            if #result >= 1 then 
                local data = json.decode(result[1].other_users)
                if #data >= maxKeys then
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
                        table.insert(data, {identifier = xTarget.identifier, name = xTarget.getName()})

                        MySQL.Async.execute("UPDATE keysvehi SET other_users = @other_users WHERE plate = @plate", {
                            ["@other_users"] = json.encode(data),
                            ["@plate"] = plate
                        }, function(result2)
                            if result2 ~= nil then
                                sNotification(target, ("(~y~Information~s~)\nVous avez reçu un double des clés du véhicule ~r~%s~s~."):format(plate), "Action", "vert")
                                sNotification(_src, ("(~g~Succès~s~)\nVous avez donné un double des clés du véhicule ~r~%s~s~ à ~r~%s~s~."):format(plate, xTarget.getName()), "Action", "vert")
                            end
                        end)
                    end
                end
            else
                sNotification(_src, "La plaque d'immatriculation n'héxiste pas ")
            end
        else
            sNotification(_src, "Vous ne pouvez pas donner le véhicule d'entreprise")
        end
    end)

end)


RegisterNetEvent("fCore:Keys:AddKeys")
AddEventHandler("fCore:Keys:AddKeys", function(plate, target)
    local xTarget = ESX.GetPlayerFromId(target)
    MySQL.Async.execute("INSERT INTO keysvehi (identifier, plate) VALUES (@identifier, @plate)",{
        ["@identifier"] = xTarget.identifier,
        ["@plate"] = plate,
    })
end)

RegisterNetEvent("fCore:Keys:AddKeysJob")
AddEventHandler("fCore:Keys:AddKeysJob", function(plate)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    MySQL.Async.execute("INSERT INTO keysvehi (identifier, plate, job) VALUES (@identifier, @plate, @job)",{
        ["@identifier"] = xPlayer.identifier,
        ["@plate"] = plate,
        ["@job"] = 1,
    })
end)


RegisterNetEvent("fCore:Keys:RemoveKeysJob")
AddEventHandler("fCore:Keys:RemoveKeysJob", function(plate)
    MySQL.Async.execute("DELETE FROM keysvehi WHERE plate = @plate", {
        ["@plate"] = plate
    })
end)

CreateThread(function()
    MySQL.Async.fetchAll("SELECT job, plate FROM keysvehi", function(result)
        for k,v in pairs(result) do 
            if v.job then 
                MySQL.Async.execute("DELETE FROM keysvehi WHERE plate = @plate", {
                    ["@plate"] = v.plate
                })
            end
        end
    end)
end)

