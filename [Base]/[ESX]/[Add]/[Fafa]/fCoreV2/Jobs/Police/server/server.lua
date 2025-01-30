ESX = nil
ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback("Police:GetSalaryMember", function(source, cb)
    InfoSalary = {}
    local _src = source 
    local query = "SELECT * FROM job_grades"
    MySQL.Async.fetchAll(query, {}, function(result)
        for i = 1, #result, 1 do            
            table.insert(InfoSalary, {
                name = result[i].name,
                job_name = result[i].job_name,
                grade = result[i].grade,
                salary = result[i].salary,
                label = result[i].label,
                coffre = result[i].coffre,
                armurerie = result[i].armurerie,
                amende = result[i].amende,
                menuf6 = result[i].menuf6,
                garage = result[i].garage,
                vestiaire = result[i].vestiaire,
                id = result[i].id,
            })
        end
        cb(InfoSalary)
    end)
end)

ESX.RegisterServerCallback("Police:GetInfoFillType", function(source, cb)
    local fillType = {}
    local query = "SELECT * FROM fill_type"
    MySQL.Async.fetchAll(query, {}, function(result)
        for k,v in pairs(result) do 
            table.insert(fillType, {
                id = v.id,
                label = v.label,
                description = v.description,
                amount = v.amount,
                category = v.category,
                job = v.job,
            })
        end
        cb(fillType)
    end)
end)


local GavCache = {}
RegisterNetEvent("fCore:Gav:AddInGav")
AddEventHandler("fCore:Gav:AddInGav", function(target, minutes)
    local _src = source
    local xTarget = ESX.GetPlayerFromId(target)
    local time = os.time()
    local rentTime = time + 60 * minutes
    if #GavCache > 0 then
        for k,v in pairs(GavCache) do
            if v.identifier == xTarget.identifier then
                sNotification(_src, TranslationJob.Police["PlayerAlreadyPrison"])
            else
                MySQL.Async.execute("INSERT INTO gav (identifier, expiration) VALUES (@identifier, @expiration)", {
                    ["@identifier"] = xTarget.identifier,
                    ["@expiration"] = rentTime,
                })
                table.insert(GavCache, {expiration = v.expiration, identifier = v.identifier})
                TriggerClientEvent("fCore:Gav:AddExpiration", target, formatExpiration(rentTime), rentTime)
                sNotification(target, TranslationJob.Police["YouReceveidTimeToGav"])
                for k,v in pairs(GetPlayerIdentifiers(target))do
                    if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                        discordPlayerInGav = string.sub(v, string.len("discord:") + 1)
                    end
                end
                sendToDiscord(12975872,"Logs Job",("Le joueur **%s** viens de mettre le joueur **%s** en GAV \n\n **Policier:**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s\n**Joueur**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s"):format(xPlayer.name, xTarget.name, xPlayer.playerId, xPlayer.identifier, discordPlayer, xPlayer.getJob().name, target, xTarget.identifier, discordPlayerInGav,xTarget.getJob().name), "", webhooks.LogsJob)            
            end
        end
    else
        MySQL.Async.execute("INSERT INTO gav (identifier, expiration) VALUES (@identifier, @expiration)", {
            ["@identifier"] = xTarget.identifier,
            ["@expiration"] = rentTime,
        })
        table.insert(GavCache, {expiration = rentTime, identifier = xTarget.identifier})
        TriggerClientEvent("fCore:Gav:AddExpiration", target, formatExpiration(rentTime), rentTime)
        sNotification(target,TranslationJob.Police["YouReceveidTimeToGav"])
        for k,v in pairs(GetPlayerIdentifiers(target))do
            if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                discordPlayerInGav = string.sub(v, string.len("discord:") + 1)
                break
            end
        end
        sendToDiscord(12975872,"Logs Job",("Le joueur **%s** viens de mettre le joueur **%s** en GAV \n\n **Policier:**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s\n**Joueur**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s"):format(xPlayer.name, xTarget.name, xPlayer.playerId, xPlayer.identifier, discordPlayer, xPlayer.getJob().name, target, xTarget.identifier, discordPlayerInGav,xTarget.getJob().name), "", webhooks.LogsJob)            

    end
end)

CreateThread(function()
    local time = os.time()
    MySQL.Async.fetchAll("SELECT expiration, identifier FROM gav", {}, function(result)
        for k,v in pairs(result) do
            if time <= v.expiration then
                table.insert(GavCache, {expiration = v.expiration, identifier = v.identifier})
            else
                MySQL.Async.execute("DELETE FROM gav WHERE identifier = @identifier", {
                    ["@identifier"] = v.identifier
                })
            end
        end
    end)
end)


ESX.RegisterServerCallback("fCore:Gav:getPlayerSpawnGav", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    for k,v in pairs(GavCache) do 
        if v.identifier == xPlayer.identifier then 
            cb(true, formatExpiration(v.expiration), v.expiration)
        else
            cb(false)
        end
    end
end)

RegisterNetEvent("fCore:Gav:GetTime")
AddEventHandler("fCore:Gav:GetTime", function()
    local _src = source
    TriggerClientEvent("fCore:Gav:GetTime", _src, os.time())
end)

RegisterNetEvent("fCore:Gav:DeleteInBdd")
AddEventHandler("fCore:Gav:DeleteInBdd", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    MySQL.Async.execute("DELETE FROM gav WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    })

    local indexToRemove = nil
    for index, value in ipairs(GavCache) do
        if value.identifier == xPlayer.identifier then
            indexToRemove = index
            break
        end
    end

    if indexToRemove then
        table.remove(GavCache, indexToRemove)
    end
end)


-- Tig 
local inTig = false
local TigCache = {}
RegisterNetEvent("fCore:Tig:AddInTig")
AddEventHandler("fCore:Tig:AddInTig", function(target, count)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(target)
    MySQL.Async.execute("INSERT INTO tig (nbrMission, identifier) VALUES (@nbrMission, @identifier)", {
        ["@nbrMission"] = count,
        ["@identifier"] = xTarget.identifier
    })
    table.insert(TigCache, {nbrMission = count, identifier = xTarget.identifier})
    TriggerClientEvent("fCore:Tig:AddInMisson", target, count)
    inTig = true
    for k,v in pairs(GetPlayerIdentifiers(target))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayerInGav = string.sub(v, string.len("discord:") + 1)
            break
        end
    end
    sendToDiscord(12975872,"Logs Job",("Le joueur **%s** viens de mettre le joueur **%s** en TIG \n\n **Policier:**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s\n**Joueur**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s"):format(xPlayer.name, xTarget.name, xPlayer.playerId, xPlayer.identifier, discordPlayer, xPlayer.getJob().name, target, xTarget.identifier, discordPlayerInGav, xTarget.getJob().name), "", webhooks.LogsJob)            

end)


CreateThread(function()
    MySQL.Async.fetchAll("SELECT nbrMission, identifier FROM tig", {}, function(result)
        for k,v in pairs(result) do
            table.insert(TigCache, {nbrMission = v.nbrMission, identifier = v.identifier})
        end
    end)
end)

RegisterNetEvent("fCore:Tig:DeleteInBdd")
AddEventHandler("fCore:Tig:DeleteInBdd", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    MySQL.Async.execute("DELETE FROM tig WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    })

    local indexToRemove = nil
    for index, value in ipairs(TigCache) do
        if value.identifier == xPlayer.identifier then
            indexToRemove = index
            break
        end
    end

    if indexToRemove then
        table.remove(TigCache, indexToRemove)
    end
end)

ESX.RegisterServerCallback("fCore:Tig:getPlayerSpawnTig", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    for k,v in pairs(TigCache) do 
        if v.identifier == xPlayer.identifier then 
            cb(true, v.nbrMission)
            inTig = true
        else
            cb(false)
        end
    end
end)

AddEventHandler('playerDropped', function (reason)
    if inTig then 
        local _src = source 
        local xPlayer = ESX.GetPlayerFromId(_src)
        for k,v in pairs(TigCache) do 
            if v.identifier == xPlayer.identifier then 
                TriggerEvent("fCore:Tig:updateTig", v.nbrMission, xPlayer.identifier)
            end
        end 
    end
end)

RegisterNetEvent("fCore:Tig:updateCacheTig")
AddEventHandler("fCore:Tig:updateCacheTig", function(count)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    for k,v in pairs(TigCache) do 
        if v.identifier == xPlayer.identifier then 
            v.nbrMission = v.nbrMission - count
        end
    end 
end)

RegisterNetEvent("fCore:Tig:updateTig")
AddEventHandler("fCore:Tig:updateTig", function(count, identifier)
    for k,v in pairs(TigCache) do 
        if v.identifier == identifier then 
            MySQL.Async.execute("UPDATE tig SET nbrMission = @nbrMission WHERE identifier = @identifier", {
                ["@nbrMission"] = count,
                ["@identifier"] = identifier,
            })
        end
    end
end)

-- Bracelet
local playerWithBracelet = {}
RegisterNetEvent("fCore:Bracelet:GiveBracelet")
AddEventHandler("fCore:Bracelet:GiveBracelet", function(targetT)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(targetT)
    local getInventory = xTarget.getInventoryItem("bracelet_electronique").count 
    if getInventory < 1 then 
        xTarget.addInventoryItem("bracelet_electronique", 1)
        sNotification(targetT, TranslationJob.Police["YouReceveidBracelet"])
        table.insert(playerWithBracelet, {id = targetT, name = GetPlayerName(targetT), see = false})
        for k,v in pairs(GetPlayerIdentifiers(target))do
            if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                discordPlayerInGav = string.sub(v, string.len("discord:") + 1)
                break
            end
        end
        sendToDiscord(12975872,"Logs Job",("Le joueur **%s** viens de mettre un bracelet electronique au joueur **%s** en TIG \n\n **Policier:**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s\n**Joueur**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s"):format(xPlayer.name, xTarget.name, xPlayer.playerId, xPlayer.identifier, discordPlayer, xPlayer.getJob().name, target, xTarget.identifier, discordPlayerInGav, xTarget.getJob().name), "", webhooks.LogsJob)            
    
    else
        sNotification(_src, TranslationJob.Police["PlayerAlreadyBracelet"])
    end
end)

RegisterNetEvent("fCore:Bracelet:RemoveBracelet")
AddEventHandler("fCore:Bracelet:RemoveBracelet", function(targetT)
    local _src = source
    local xTarget = ESX.GetPlayerFromId(targetT)
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getInventory = xTarget.getInventoryItem("bracelet_electronique").count 
    if getInventory >= 1 then 
        xTarget.removeInventoryItem("bracelet_electronique", getInventory)
        sNotification(targetT, TranslationJob.Police["RemoveYourBracelet"])
        sNotification(_src, TranslationJob.Police["YouHaveRemoveBracelet"])
        for k,v in pairs(playerWithBracelet) do 
            if v.id == targetT then 
                table.remove(playerWithBracelet, k)
            end
        end
        for k,v in pairs(GetPlayerIdentifiers(target))do
            if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                discordPlayerInGav = string.sub(v, string.len("discord:") + 1)
                break
            end
        end
        sendToDiscord(12975872,"Logs Job",("Le joueur **%s** viens de d'enlever un bracelet electronique au joueur **%s** en TIG \n\n **Policier:**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s\n**Joueur**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s"):format(xPlayer.name, xTarget.name, xPlayer.playerId, xPlayer.identifier, discordPlayer, xPlayer.getJob().name, target, xTarget.identifier, discordPlayerInGav, xTarget.getJob().name), "", webhooks.LogsJob)            
    
    else
        sNotification(_src, TranslationJob.Police["YouReceveidTimeToFederal"])
    end
end)


RegisterNetEvent("fCore:Bracelet:getPlayerWithBraceletSpawn")
AddEventHandler("fCore:Bracelet:getPlayerWithBraceletSpawn", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getItem = xPlayer.getInventoryItem("bracelet_electronique").count 
    if getItem >= 1 then 
        table.insert(playerWithBracelet, {id = _src, name = GetPlayerName(_src), see = false})
    end
end)



AddEventHandler('playerDropped', function()
    local _src = source 
    for k,v in pairs(playerWithBracelet) do 
        if v.id == _src then 
            table.remove(playerWithBracelet, k)
        end
    end
end)



ESX.RegisterServerCallback("fCore:Bracelet:getPlayerWithBracelet", function(source, cb)
    cb(playerWithBracelet)
end)


RegisterNetEvent("fCore:Bracelet:addBlipPlayer")
AddEventHandler("fCore:Bracelet:addBlipPlayer", function(id)
    local _src = source
    for k,v in pairs(playerWithBracelet) do 
        if v.id == id then 
            v.see = true
            ESX.SetTimeout(5000,function()
                v.see = false
            end)
        end
    end
    TriggerClientEvent("fCore:Bracelet:addBlipPlayer", _src, GetEntityCoords(GetPlayerPed(id)))
end)

-- Shoot
RegisterNetEvent("addNotification:Shoot:Police")
AddEventHandler("addNotification:Shoot:Police", function(coords)
    local xPlayers = ESX.GetPlayers()
    local copsConnected = 0
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if (xPlayer.getJob().name) == "police" then
            TriggerClientEvent("Notification:Shoot:CallPolice", xPlayers[i], coords)
        end
    end
end)


-- Federal 
local FederaleCache = {}
RegisterNetEvent("fCore:Federale:AddInFederale")
AddEventHandler("fCore:Federale:AddInFederale", function(target, minutes)
    local _src = source
    local xTarget = ESX.GetPlayerFromId(target)
    local time = os.time()
    local rentTime = time + 60 * minutes
    if #FederaleCache > 0 then
        for k,v in pairs(FederaleCache) do
            if v.identifier == xTarget.identifier then
                sNotification(_src, TranslationJob.Police["playerInJail"])
            else
                MySQL.Async.execute("INSERT INTO federale (identifier, expiration) VALUES (@identifier, @expiration)", {
                    ["@identifier"] = xTarget.identifier,
                    ["@expiration"] = rentTime,
                })
                table.insert(FederaleCache, {expiration = v.expiration, identifier = v.identifier})
                TriggerClientEvent("fCore:Federale:AddExpiration", target, formatExpiration(rentTime), rentTime)
                sNotification(target, TranslationJob.Police["receiveTimePrison"])
                for k,v in pairs(GetPlayerIdentifiers(target))do
                    if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                        discordPlayerInGav = string.sub(v, string.len("discord:") + 1)
                        break
                    end
                end
                sendToDiscord(12975872,"Logs Job",("Le joueur **%s** viens de mettre un en Fédéral lejoueur **%s** en TIG \n\n **Policier:**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s\n**Joueur**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s"):format(xPlayer.name, xTarget.name, xPlayer.playerId, xPlayer.identifier, discordPlayer, xPlayer.getJob().name, target, xTarget.identifier, discordPlayerInGav, xTarget.getJob().name), "", webhooks.LogsJob)            
            end
        end
    else
        MySQL.Async.execute("INSERT INTO federale (identifier, expiration) VALUES (@identifier, @expiration)", {
            ["@identifier"] = xTarget.identifier,
            ["@expiration"] = rentTime,
        })
        table.insert(FederaleCache, {expiration = rentTime, identifier = xTarget.identifier})
        TriggerClientEvent("fCore:Federale:AddExpiration", target, formatExpiration(rentTime), rentTime)
        sNotification(target, TranslationJob.Police["receiveTimePrison"])
        for k,v in pairs(GetPlayerIdentifiers(target))do
            if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                discordPlayerInGav = string.sub(v, string.len("discord:") + 1)
                break
            end
        end
        sendToDiscord(12975872,"Logs Job",("Le joueur **%s** viens de mettre un en Fédéral lejoueur **%s** en TIG \n\n **Policier:**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s\n**Joueur**\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job:%s"):format(xPlayer.name, xTarget.name, xPlayer.playerId, xPlayer.identifier, discordPlayer, xPlayer.getJob().name, target, xTarget.identifier, discordPlayerInGav, xTarget.getJob().name), "", webhooks.LogsJob)            
    end
end)

CreateThread(function()
    local time = os.time()
    MySQL.Async.fetchAll("SELECT expiration, identifier FROM federale", {}, function(result)
        for k,v in pairs(result) do
            if time <= v.expiration then
                table.insert(FederaleCache, {expiration = v.expiration, identifier = v.identifier})
            else
                MySQL.Async.execute("DELETE FROM federale WHERE identifier = @identifier", {
                    ["@identifier"] = v.identifier
                })
            end
        end
    end)
end)


ESX.RegisterServerCallback("fCore:Federale:getPlayerSpawnFederale", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    for k,v in pairs(FederaleCache) do 
        if v.identifier == xPlayer.identifier then 
            cb(true, formatExpiration(v.expiration), v.expiration)
        else
            cb(false)
        end
    end
end)

RegisterNetEvent("fCore:Federale:GetTime")
AddEventHandler("fCore:Federale:GetTime", function()
    local _src = source
    TriggerClientEvent("fCore:Federale:GetTime", _src, os.time())
end)

RegisterNetEvent("fCore:Federale:DeleteInBdd")
AddEventHandler("fCore:Federale:DeleteInBdd", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    MySQL.Async.execute("DELETE FROM federale WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    })

    local indexToRemove = nil
    for index, value in ipairs(FederaleCache) do
        if value.identifier == xPlayer.identifier then
            indexToRemove = index
            break
        end
    end

    if indexToRemove then
        table.remove(FederaleCache, indexToRemove)
    end
end)
