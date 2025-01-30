ESX = exports["es_extended"]:getSharedObject()

function sNotification(src, message)
    TriggerClientEvent("esx:showNotification", src, message)
end

ESX.RegisterServerCallback("fCore:MenuAdmin:GetItemInBDD", function(source, cb)
    local getItemInBdd = {}
    if weightSysteme then
        MySQL.Async.fetchAll("SELECT * FROM items", {}, function(result)
            for k,v in pairs(result) do 
                table.insert(getItemInBdd, {name = v.name, label = v.label, weight = v.weight})
            end
            cb(getItemInBdd)
        end)
    else
        MySQL.Async.fetchAll("SELECT * FROM items", {}, function(result)
            for k,v in pairs(result) do 
                table.insert(getItemInBdd, {name = v.name, label = v.label, weight = v.limite})
            end
            cb(getItemInBdd)
        end)
    end
end)

ESX.RegisterServerCallback("fCore:MenuAdmin:GetJobInBDD", function(source, cb)
    local getJobInBdd = {}
    MySQL.Async.fetchAll("SELECT job_name, grade, name, label FROM job_grades", {}, function(result)
        for k,v in pairs(result) do 
            table.insert(getJobInBdd, {jobName = v.job_name, grade = v.grade, label = v.label, name = v.name})
        end
        cb(getJobInBdd)
    end)
end)

local nbrAdmin = 0
local AdminService = {}
RegisterNetEvent("fCore:Admin:nbrAdmin")
AddEventHandler("fCore:Admin:nbrAdmin", function(status)
    local _src = source
    if status then 
        nbrAdmin = nbrAdmin + 1 
        AdminService[_src] = true
    else
        nbrAdmin = nbrAdmin - 1 
        AdminService[_src] = false
    end
    TriggerClientEvent("fCore:Admin:nbrAdmin", _src, nbrAdmin)
end)


RegisterNetEvent("fCoreV2:MenuAdmin:giveitem")
AddEventHandler("fCoreV2:MenuAdmin:giveitem", function(name, nbrItemGive)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    xPlayer.addInventoryItem(name, nbrItemGive)
    sNotification(_src, (TranslationAdministration.MenuAdmin["S_giveitem"]):format(nbrItemGive, name))
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de se give un item (%s %s)"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, nbrItemGive, name), "", webhooks.LogsAdmin)
end)

RegisterNetEvent("fCoreV2:MenuAdmin:giveiteReport")
AddEventHandler("fCoreV2:MenuAdmin:giveiteReport", function(name, nbrItemGive, id)
    local xTarget = ESX.GetPlayerFromId(id)
    xTarget.addInventoryItem(name, nbrItemGive)
    sNotification(_src, (TranslationAdministration.MenuAdmin["S_giveitem"]):format(nbrItemGive, name))
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de give un item (%s %s) à %s"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, nbrItemGive, name, xTarget.name), "", webhooks.LogsAdmin)
end)



RegisterNetEvent("fCore:MenuAdmin:setjob")
AddEventHandler("fCore:MenuAdmin:setjob", function(grade, name, setjobAdmin)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if tonumber(setjobAdmin) == 1 then 
        xPlayer.setJob(name, grade)
    elseif tonumber(setjobAdmin) == 2 then 
        xPlayer.setJob2(name, grade)
    end
    sNotification(_src, "~g~Vous venez de se setjob")
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de se mettre une job %s %s"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, name, grade), "", webhooks.LogsAdmin)
end)

RegisterNetEvent("fCore:MenuAdmin:setjobReport")
AddEventHandler("fCore:MenuAdmin:setjobReport", function(grade, name, setjobAdmin, id)
    local xTarget = ESX.GetPlayerFromId(id)
    if setjobAdmin == 1 then 
        xTarget.setJob(name, grade)
    elseif setjobAdmin == 2 then 
        xTarget.setJob2(name, grade)
    end
    sNotification(_src, "~g~Vous venez de se setjob")
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de se mettre une job %s %s à %s"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, name, grade, xTarget.name), "", webhooks.LogsAdmin)
end)

RegisterNetEvent("fCore:revive")
AddEventHandler("fCore:revive", function()
    TriggerClientEvent('fCore:revive')
end)

RegisterCommand("report", function(source, args)
    local _src = source
    local xPlayers = ESX.GetPlayers()
    local name = GetPlayerName(_src)
    local reportMessage = table.concat(args, " ")
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.getGroup() ~= "user" then 
            TriggerClientEvent("fCore:Admin:report", xPlayers[i], source, reportMessage, name)
            sNotification(_src, TranslationAdministration.MenuAdmin["S_reportSendToStaff"])
        end
    end
end)


local playerInServer = {}
RegisterNetEvent("fCore:Admin:addNewPlayer")
AddEventHandler("fCore:Admin:addNewPlayer", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    table.insert(playerInServer, {identifier = xPlayer.identifier, name = xPlayer.getName(), id = _src, coords = GetEntityCoords(GetPlayerPed(_src))})
    TriggerClientEvent("fCore:Admin:addNewPlayerOnServer", -1, playerInServer)
end)

RegisterNetEvent("fCore:Admin:PlayerDeconnected")
AddEventHandler("fCore:Admin:PlayerDeconnected", function()
    for k,v in pairs(playerInServer) do
        if v.id == id then 
            table.remove(playerInServer, k)
        end
    end
end)

RegisterNetEvent("fCore:Admin:refreshPlayer")
AddEventHandler("fCore:Admin:refreshPlayer", function()
    TriggerClientEvent("fCore:Admin:refreshPlayerOnServer", -1, playerInServer)
end)


AddEventHandler("playerDropped", function()
    local _src = source 
    for k,v in pairs(playerInServer) do
        if v.id == _src then 
            table.remove(playerInServer, k)
        end
    end
    if AdminService[_src] then
        TriggerEvent("fCore:Admin:nbrAdmin", false)
    end
end)


local coordsPlayer = {}

RegisterNetEvent("fCore:Admin:bringPlayer")
AddEventHandler("fCore:Admin:bringPlayer", function(id)
    local _src = source
    local target = ESX.GetPlayerFromId(id)
    local xPlayer = ESX.GetPlayerFromId(_src)
    if target and xPlayer then
        local targetCoords = GetEntityCoords(GetPlayerPed(id))
        coordsPlayer[id] = targetCoords -- Store target's coords in the table
        target.setCoords(xPlayer.getCoords())
    end
end)

RegisterNetEvent("fCore:Admin:BackCoordsPlayer")
AddEventHandler("fCore:Admin:BackCoordsPlayer", function(id)
    local target = ESX.GetPlayerFromId(id)
    if target and coordsPlayer[id] then
        local targetCoords = coordsPlayer[id]
        SetEntityCoords(GetPlayerPed(id), targetCoords.x, targetCoords.y, targetCoords.z)
    end
end)



RegisterNetEvent("fCore:Admin:GotoPlayer")
AddEventHandler("fCore:Admin:GotoPlayer", function(id)
    local _src = source
    local target = ESX.GetPlayerFromId(id)
    local xPlayer = ESX.GetPlayerFromId(_src)
    xPlayer.setCoords(target.getCoords())
end)


RegisterNetEvent("fCore:Admin:SendMessagePlayer")
AddEventHandler("fCore:Admin:SendMessagePlayer", function(id, message)
    sNotification(id, (TranslationAdministration.MenuAdmin["S_MessagePrivate"]):format(message))
end)

RegisterNetEvent("fCore:heal")
AddEventHandler("fCore:heal", function(id)
    TriggerClientEvent('esx_basicneeds:healPlayer', id)
end)

RegisterNetEvent("fCore:MenuAdmin:GiveMoney")
AddEventHandler("fCore:MenuAdmin:GiveMoney", function(IndexChange, giveMoney, id)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(id)
    if not tonumber(giveMoney) then return end
    if IndexChange == 1 then 
        xTarget.addAccountMoney('money', tonumber(giveMoney))
        sNotification(id, (TranslationAdministration.MenuAdmin["S_giveMoneyToMoney"]):format(giveMoney, GetPlayerName(id)))
    elseif IndexChange == 2 then 
        xTarget.addAccountMoney('bank', tonumber(giveMoney))
        sNotification(id, (TranslationAdministration.MenuAdmin["S_giveMoneyToBank"]):format(giveMoney, GetPlayerName(id)))
    elseif IndexChange == 3 then
        xTarget.addAccountMoney('black_money', tonumber(giveMoney))
        sNotification(id, (TranslationAdministration.MenuAdmin["S_giveBackMoney"]):format(giveMoney, GetPlayerName(id)))
    end
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de give de l'argent (%s$) à %s"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, giveMoney, xPlayer.name), "", webhooks.LogsAdmin)
end)

local banListPlayer = {}
CreateThread(function()
    MySQL.Async.fetchAll("SELECT * FROM bansql", {}, function(result)
        for k,v in pairs(result) do 
            table.insert(banListPlayer, v)
        end
    end)
end)


RegisterNetEvent("fCore:Admin:announceServeur")
AddEventHandler("fCore:Admin:announceServeur", function(text)
    TriggerClientEvent("fCore:Admin:messageAll", -1, text)
end)

RegisterNetEvent("fCore:AdminkickPlayer")
AddEventHandler("fCore:AdminkickPlayer", function(id, raison)
    DropPlayer(id, raison)
end)

RegisterNetEvent("fCore:Admin:Warn")
AddEventHandler("fCore:Admin:Warn", function(id, message)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(id)

    local identifiers = GetPlayerIdentifiers(id)
    local identifier, steam, liveid, xblid, discord, playerip

    for _, v in ipairs(identifiers) do
        if string.find(v, "steam:") then
            steam = v
        elseif string.find(v, "live:") then
            liveid = v
        elseif string.find(v, "xbl:") then
            xblid = v
        elseif string.find(v, "discord:") then
            discord = v
        elseif string.find(v, "ip:") then
            playerip = v
        end
    end

    TriggerClientEvent("fCore:admin:PlayerWarn", id, message)

    local insertQuery = [[
        INSERT INTO warn (identifier, steam, liveid, xblid, discord, ip, nameplayer, nameadmin, reason)
        VALUES (@identifier, @steam, @liveid, @xblid, @discord, @ip, @nameplayer, @nameadmin, @reason)
    ]]

    MySQL.Async.execute(insertQuery, {
        ["@identifier"] = xTarget.identifier,
        ["@steam"] = steam,
        ["@liveid"] = liveid,
        ["@xblid"] = xblid,
        ["@discord"] = discord,
        ["@ip"] = playerip,
        ["@nameplayer"] = xTarget.getName(),
        ["@nameadmin"] = xPlayer.getName(),
        ["@reason"] = message,
    })
    sNotification(_src, "~g~Vous venez de warn le joueur")
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de warn le joueur"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, giveMoney, xTarget.name), "", webhooks.LogsAdmin)

end)



ESX.RegisterServerCallback("fCore:Admin:getWarnList", function(source, cb, id)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(id)
    local warnList = {}
    MySQL.Async.fetchAll("SELECT id, nameplayer, nameadmin, reason FROM warn WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier,
    }, function(result)
        for k, v in pairs(result) do 
            table.insert(warnList, {
                id = v.id,
                nameplayer = v.nameplayer,
                nameadmin = v.nameadmin,
                reason = v.reason
            })
        end
        cb(warnList)
    end)
end)

ESX.RegisterServerCallback("fCore:Admin:getBanList", function(source, cb, id)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(id)
    local BanList = {}
    MySQL.Async.fetchAll("SELECT id, nameplayer, nameadmin, reason FROM banlist WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier,
    }, function(result)
        for k, v in pairs(result) do 
            table.insert(BanList, {
                id = v.id,
                nameplayer = v.nameplayer,
                nameadmin = v.nameadmin,
                reason = v.reason
            })
        end
        cb(BanList)
    end)
end)



RegisterNetEvent("fCore:Admin:BanPlayer")
AddEventHandler("fCore:Admin:BanPlayer", function(id, permanant, message, expiration, Type)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(id)
    local identifier, steam, liveid, xblid, discord, playerip
	for k,v in ipairs(GetPlayerIdentifiers(id))do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		elseif string.sub(v, 1, string.len("live:")) == "live:" then
			liveid = v
		elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
			xblid  = v
		elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
		elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
			playerip = v
		end
	end

    if Type == 1 then 
        local time = os.time()
        local timeHoure = 3600 * expiration
        local newTime = time + timeHoure
        local insertQuery = [[
            INSERT INTO bansql (identifier, liveid, xblid, discord, playerip, nameplayer, nameadmin, reason, expiration, permanant)
            VALUES (@identifier, @liveid, @xblid, @discord, @playerip, @nameplayer, @nameadmin, @reason, @expiration, @permanant)
        ]]
        MySQL.Async.execute(insertQuery, {
            ["@identifier"] = license,
            ["@steamID"] = steamID, 
            ["@liveid"] = liveid,
            ["@xblid"] = xblid,
            ["@discord"] = discord,
            ["@playerip"] = playerip,
            ["@nameplayer"] = xTarget.getName(),
            ["@nameadmin"] = xPlayer.getName(),
            ["@reason"] = message,
            ["@expiration"] = newTime,
            ["@permanant"] = permanant,
        })
        table.insert(banListPlayer, {identifier = license, liveid = liveid, xblid = xblid, discord = discord, playerip = playerip, nameplayer = xTarget.getName(), nameadmin = xPlayer.getName(), reason= message, expiration = newTime, permanant= permanant})
    elseif Type == 2 then 
        local insertQuery = [[
            INSERT INTO bansql (identifier, steamID, liveid, xblid, discord, playerip, nameplayer, nameadmin, reason, expiration, permanant)
            VALUES (@identifier, @steamID, @liveid, @xblid, @discord, @playerip, @nameplayer, @nameadmin, @reason, @expiration, @permanant)
        ]]
        MySQL.Async.execute(insertQuery, {
            ["@identifier"] = license,
            ["@steamID"] = steamID, 
            ["@liveid"] = liveid,
            ["@xblid"] = xblid,
            ["@discord"] = discord,
            ["@playerip"] = playerip,
            ["@nameplayer"] = xTarget.getName(),
            ["@nameadmin"] = xPlayer.getName(),
            ["@reason"] = message,
            ["@expiration"] = expiration,
            ["@permanant"] = permanant,
        })
        table.insert(banListPlayer, {identifier = license, liveid = liveid, xblid = xblid, discord = discord, playerip = playerip, nameplayer = xTarget.getName(), nameadmin = xPlayer.getName(), reason= message, expiration = newTime, permanant= permanant})
    end
    sNotification(_src, "~g~Vous venez de ban le joueur")
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de ban le joueur"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, giveMoney, xTarget.name), "", webhooks.LogsAdmin)
    DropPlayer(id, message)
end)





RegisterNetEvent("fCore:Admin:sendMessageToClose")
AddEventHandler("fCore:Admin:sendMessageToClose", function(id)
    sNotification(id, TranslationAdministration.MenuAdmin["S_reportCloseByStaff"])
end)



RegisterNetEvent("fCore:Admin:listBan")
AddEventHandler("fCore:Admin:listBan", function(id, message)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(id)
    MySQL.Async.execute("INSERT INTO banlist (identifier, nameplayer, nameadmin, reason) VALUES (@identifier,@nameplayer, @nameadmin, @reason)", {
        ["@identifier"] = xTarget.identifier,
        ["@nameplayer"] = xTarget.getName(),
        ["@nameadmin"] = xPlayer.getName(),
        ["@reason"] = message,
    })
end)




RegisterNetEvent("fCore:Admin:FreezePlayer")
AddEventHandler("fCore:Admin:FreezePlayer", function(id)
    TriggerClientEvent("fCore:Admin:FreezePlayer", id)
end)


ESX.RegisterServerCallback("fCore:Admin:getInfoPlayer", function(source, cb, id)
    local xTarget = ESX.GetPlayerFromId(id)
    local informationJoueur = {}

    table.insert(informationJoueur, {id = id, name = xTarget.getName(), Job = xTarget.getJob().label, Job2 = xTarget.getJob2().label, getMoney = xTarget.getAccounts().money, Inventory = xTarget.getInventory()})
    cb(informationJoueur)
end)


ESX.RegisterServerCallback("fCore:Admin:getInventoryPlayer", function(source, cb, id)
    local xTarget = ESX.GetPlayerFromId(id)
    local money = xTarget.getAccount('money').money
    local black_money = xTarget.getAccount('black_money').money
    local bank = xTarget.getAccount('bank').money    
    cb(xTarget.getInventory(), money, black_money, bank)
end)

ESX.RegisterServerCallback("fCore:Boss:searchCategoriVehicle", function(source, cb)
    local listCategorieBdd = {}
    local query = "SELECT * FROM vehicle_categories"
    MySQL.Async.fetchAll(query, {}, function(result)
        for k,v in pairs(result) do 
            table.insert(listCategorieBdd, v)
        end
        cb(listCategorieBdd)
    end)
end)

ESX.RegisterServerCallback("fCore:Boss:searchVehicle", function(source, cb)
    local listVehicleConcessBdd = {}
    local query = "SELECT * FROM vehicles"
    MySQL.Async.fetchAll(query, {}, function(result)
        for k,v in pairs(result) do 
            table.insert(listVehicleConcessBdd, v)
        end
        cb(listVehicleConcessBdd)
    end)
end)


AddEventHandler('playerConnecting', function(playerName, setKickReason)
    local _src = source
    local time = os.time()
    local license, steamID, liveid, xblid, discord, playerip = "n/a", "n/a", "n/a", "n/a", "n/a", "n/a"
    
    local identifiers = GetPlayerIdentifiers(_src)
    for _, v in ipairs(identifiers) do
        if string.find(v, "license:") then
            license = v
        elseif string.find(v, "steam:") then
            steamID = v
        elseif string.find(v, "live:") then
            liveid = v
        elseif string.find(v, "xbl:") then
            xblid = v
        elseif string.find(v, "discord:") then
            discord = v
        elseif string.find(v, "ip:") then
            playerip = v
        end
    end

    for _, v in pairs(banListPlayer) do
        if v.identifier == license then
            if time < v.expiration then
                setKickReason(v.reason)
                CancelEvent()
                return
            end
        end
    end
end)


RegisterNetEvent("fCore:Admin:JailPlayer")
AddEventHandler("fCore:Admin:JailPlayer", function(id, expiration, raison)
    local timeHoure = 60*expiration
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(id)    
    MySQL.Async.execute("INSERT INTO jail (identifier, expiration, reason) VALUES (@identifier, @expiration, @reason)", {
        ["@identifier"] = xTarget.identifier,
        ["@expiration"] = timeHoure,
        ["@reason"] = raison,
    })
    TriggerClientEvent("fCore:Admin:AddToJail", id, raison, timeHoure)
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de jail le joueur"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, giveMoney, xTarget.name), "", webhooks.LogsAdmin)
end)



RegisterNetEvent("fCore:Admin:UpdateJail")
AddEventHandler("fCore:Admin:UpdateJail", function(fastTimer)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    MySQL.Async.execute("UPDATE jail SET expiration = @expiration WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier,
        ["@expiration"] = fastTimer-60,
    })
end)


ESX.RegisterServerCallback("fCore:Admin:getIsJail", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local infoJail = {}
    MySQL.Async.fetchAll("SELECT * FROM jail WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier,
    }, function(result)
        if #result > 0 then 
            for k,v in pairs(result) do 
                if v.expiration > 0 then 
                    table.insert(infoJail, v)
                else
                    MySQL.Async.execute("DELETE FROM jail WHERE identifier = @identifier", {
                        ["@identifier"] = xPlayer.identifier,
                    })
                    cb(false)
                end
            end
            cb(infoJail)
        else
            cb(false)
        end
    end)
end)


RegisterNetEvent("fCore:Admin:withdrawItem")
AddEventHandler("fCore:Admin:withdrawItem", function(Type, count, name, target)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(target)
    if Type == 'retirer' then
        xTarget.removeInventoryItem(name, count)
    elseif Type == 'prendre' then
        xTarget.removeInventoryItem(name, count)
        xPlayer.addInventoryItem(name, count)
    end
    sNotification(_src, ("~g~Vous venez de (%s) un item sur le joueurle joueur"):format(Type))
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de faire une action sur le joueur (%s) (x%s %s)"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, Type, count, name), "", webhooks.LogsAdmin)
end)


RegisterNetEvent("fCore:Admin:CreateItem")
AddEventHandler("fCore:Admin:CreateItem", function(label, name, limwei, var)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    MySQL.Async.execute("INSERT INTO items (label, name, "..var..") VALUES (@label, @name, @"..var..")", {
        ["@"..var] = limwei,
        ["name"] = name,
        ["label"] = label,
    })
    sNotification(_src, TranslationAdministration.MenuAdmin["S_YouHaveCreateItem"])    
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de crée un item %s"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, label), "", webhooks.LogsAdmin)
end)


RegisterNetEvent("fCore:Admin:Delete")
AddEventHandler("fCore:Admin:DeleteItem", function(name)
    local _src = source 
    MySQL.Async.execute("DELETE FROM items WHERE name = @name", {
        ["name"] = name,
    })
    sNotification(_src, TranslationAdministration.MenuAdmin["S_YouHaveDeleteItem"] )    
end)

RegisterNetEvent("fcore:admin:modification")
AddEventHandler("fcore:admin:modification", function(nameA, newvalue, param, where)
    local _src = source 
    local lastvalue = nameA
    MySQL.Async.execute(("UPDATE items SET %s = @%s WHERE %s = @%s"):format(param, param, where, where), {
        [("@%s"):format(where)] = lastvalue,
        [("@%s"):format(param)] = newvalue,
    })
    sNotification(_src, (TranslationAdministration.MenuAdmin["S_haveModifyItem"]):format(param))    
end)


RegisterNetEvent("fCore:Admin:unJailPlayer")
AddEventHandler("fCore:Admin:unJailPlayer", function(id)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local target = id
    local xTarget = ESX.GetPlayerFromId(target)
    if xTarget then
        MySQL.Async.execute("DELETE FROM jail WHERE identifier = @identifier", {
            ["@identifier"] = xTarget.identifier
        }, function(rowsChanged)
            if rowsChanged > 0 then
                sNotification(_src, TranslationAdministration.MenuAdmin["S_toReleasedPrison"])
                TriggerClientEvent("fCore:Admin:unJailPlayer", target)
                for k,v in pairs(GetPlayerIdentifiers(source))do
                    if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                        discordPlayer = string.sub(v, string.len("discord:") + 1)
                    end
                end
                sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de unJail le joueur %s"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, label, xTarget.name), "", webhooks.LogsAdmin)
            else
                sNotification(_src, TranslationAdministration.MenuAdmin["S_personNotFoundInDatabase"])
            end
        end)
    else
        sNotification(_src, TranslationAdministration.MenuAdmin["S_PlayerNotOnline"])
    end
end)


RegisterNetEvent("fcore:Admin:deleteWarn")
AddEventHandler("fcore:Admin:deleteWarn", function(id)
    local _src = source 
    MySQL.Async.execute("DELETE FROM warn WHERE id = @id", {
        ["@id"] = id
    })
    sNotification(_src, TranslationAdministration.MenuAdmin["S_deleteWarn"])
end)

RegisterNetEvent("fcore:Admin:modifRaison")
AddEventHandler("fcore:Admin:modifRaison", function(id, reason)
    local _src = source 
    MySQL.Async.execute("UPDATE warn SET reason = @reason WHERE id = @id", {
        ["@id"] = id,
        ["@reason"] = reason
    })
    sNotification(_src, TranslationAdministration.MenuAdmin["S_changeReasonWanr"])
end)


RegisterNetEvent("fCore:wipeLicense")
AddEventHandler("fCore:wipeLicense", function(id, Type)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local target = id
    local xTarget = ESX.GetPlayerFromId(target)

    if xTarget then
        MySQL.Async.execute("DELETE FROM user_licenses WHERE owner = @owner AND type = @type", {
            ["@owner"] = xTarget.identifier,
            ["@type"] = Type
        }, function(rowsChanged)
            if rowsChanged > 0 then 
                sNotification(_src, "Vous venez de supprimer les licences du joueur")
                for k,v in pairs(GetPlayerIdentifiers(source))do
                    if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                        discordPlayer = string.sub(v, string.len("discord:") + 1)
                    end
                end
                sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de suppirmer les licenses du joueur %s"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, label, xTarget.name), "", webhooks.LogsAdmin)
            else
                sNotification(_src, "Le joueur n'avait pas cette licence")
            end
        end)
    end
end)


RegisterNetEvent("fCore:wipeVehicule")
AddEventHandler("fCore:wipeVehicule", function(id, Index, plate)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local target = id
    local xTarget = ESX.GetPlayerFromId(target)
    if xTarget then
        if Index == 1 then 
            MySQL.Async.execute("DELETE FROM owned_vehicles WHERE owner = @owner AND plate  = @plate ", {
                ["@owner"] = xTarget.identifier,
                ["@plate"] = plate
            }, function(rowsChanged)
                if rowsChanged > 0 then 
                    sNotification(_src, "Vous venez de supprimer le véhicule du joueur")
                    for k,v in pairs(GetPlayerIdentifiers(source))do
                        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                            discordPlayer = string.sub(v, string.len("discord:") + 1)
                        end
                    end
                    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de suppirmer les véhicules du joueur %s"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, label, xTarget.name), "", webhooks.LogsAdmin)
                else
                    sNotification(_src, "Le joueur n'avait pas ce véhicule")
                end
            end)
        elseif Index == 2 then 
            MySQL.Async.execute("DELETE FROM owned_vehicles WHERE owner = @owner ", {
                ["@owner"] = xTarget.identifier,
            }, function(rowsChanged)
                if rowsChanged > 0 then 
                    sNotification(_src, "Vous venez de supprimer les véhicules du joueur")
                else
                    sNotification(_src, "Le joueur n'avait pas de véhicule")
                end
            end)
        end
    end
end)


RegisterNetEvent("fCore:wipeTotal")
AddEventHandler("fCore:wipeTotal", function(id)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local target = id
    local xTarget = ESX.GetPlayerFromId(target)
    local getInventory = xTarget.getInventory()
    MySQL.Async.execute("DELETE FROM owned_vehicles WHERE owner = @owner ", {
        ["@owner"] = xTarget.identifier,
    })
    MySQL.Async.execute("DELETE FROM user_licenses WHERE owner = @owner", {
        ["@owner"] = xTarget.identifier,
    })
    MySQL.Async.execute("DELETE FROM users WHERE identifier = @identifier", {
        ["@identifier"] = xTarget.identifier,
    })
    for k,v in pairs(getInventory) do 
        if v.count > 0 then 
            xTarget.removeInventoryItem(v.name, v.count)
        end
    end
    sNotification(_src, "Vous venez de Wipe le joueur !")
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de wipe le joueur %s"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, label, xTarget.name), "", webhooks.LogsAdmin)
    DropPlayer(id, "Vous venez d'être Wipe !")
end)


RegisterNetEvent("fCore:wipeinventory")
AddEventHandler("fCore:wipeinventory", function(id)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local target = id
    local xTarget = ESX.GetPlayerFromId(target)
    local getInventory = xTarget.getInventory()
    MySQL.Async.execute("UPDATE users SET inventory = @inventory WHERE identifier = @identifier", {
        ["@identifier"] = xTarget.identifier,
        ["@inventory"] = "{}"
    })
    for k,v in pairs(getInventory) do 
        if v.count > 0 then 
            xTarget.removeInventoryItem(v.name, v.count)
        end
    end
    sNotification(_src, "Vous venez de supprimer l'inventaire du joueur")
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de wipe l'inventaire du joueur %s"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, label, xTarget.name), "", webhooks.LogsAdmin)
end)


ESX.RegisterServerCallback("fCore:Admin:PlayerOffline", function(source, cb)
    local allUsers = {}
    MySQL.Async.fetchAll("SELECT identifier, firstname, lastname FROM users", {}, function(result)
        for _,v in pairs(result) do 
            table.insert(allUsers, v)
        end
        cb(allUsers)
    end)
end)

