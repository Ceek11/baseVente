RegisterNetEvent("fCore:Admin:CreateGradeAdmin")
AddEventHandler("fCore:Admin:CreateGradeAdmin", function(createGradeAdminTable, TablegestionGrade)
    local _src = source
    MySQL.Async.execute("INSERT INTO gestionadmin (idgrade, namegrade, color, permissions) VALUES (@idgrade, @namegrade, @color, @permissions)", {
        ["@idgrade"] = createGradeAdminTable.idGarde,
        ["@namegrade"] = createGradeAdminTable.nameGrade,
        ["@color"] = createGradeAdminTable.color,
        ["@permissions"] = json.encode(TablegestionGrade),
    })
    sNotification(_src, "~g~Vous venez de crée un grade")
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de crée un grade"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer), "", webhooks.LogsAdmin)
end)


ESX.RegisterServerCallback("fCore:Admin:manageGrade", function(source, cb)
    local gestionAdmin = {}
    MySQL.Async.fetchAll("SELECT * FROM gestionadmin", {}, function(result)
        for k,v in pairs(result) do 
            table.insert(gestionAdmin, v)
        end
        cb(gestionAdmin)
    end)
end)


RegisterNetEvent("fCore:Admin:deleteGrade")
AddEventHandler("fCore:Admin:deleteGrade", function(id)
    local _src = source
    MySQL.Async.execute("DELETE FROM gestionadmin WHERE id = @id", {
        ["@id"] = id
    })
    sNotification(_src, "~g~Vous venez de supprimer un grade")
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de supprimer un grade"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer), "", webhooks.LogsAdmin)
end)

RegisterNetEvent("fCore:Admin:UpdatePermission")
AddEventHandler("fCore:Admin:UpdatePermission", function(TablegestionGrade, IdGrade)
    MySQL.Async.execute("UPDATE gestionadmin SET permissions = @permissions WHERE id = @id", {
        ["@id"] = IdGrade,
        ["@permissions"] = json.encode(TablegestionGrade)
    })
    sNotification(_src, "~g~Vous venez de d'update un grade")
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de changer un grade"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer), "", webhooks.LogsAdmin)
end)

RegisterNetEvent("fCore:Admin:UpdateInfoJob")
AddEventHandler("fCore:Admin:UpdateInfoJob", function(createGradeAdminTable, id)
    MySQL.Async.execute("UPDATE gestionadmin SET color = @color, namegrade = @namegrade, idgrade = @idgrade WHERE id = @id", {
        ["@id"] = id,
        ["@idgrade"] = createGradeAdminTable.idGarde,
        ["@namegrade"] = createGradeAdminTable.nameGrade,
        ["@color"] = createGradeAdminTable.color,
    })
    sNotification(_src, "~g~Vous venez de d'update un grade")
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de changer un grade"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer), "", webhooks.LogsAdmin)
end)

ESX.RegisterServerCallback("fCore:Admin:getPlayerAdmin", function(source, cb)
    MySQL.Async.fetchAll("SELECT * FROM users", {}, function(usersResult)
        local isAdmin = {}
        if usersResult and #usersResult > 0 then
            MySQL.Async.fetchAll("SELECT idgrade, color FROM gestionadmin", {}, function(adminResult)
                if adminResult and #adminResult > 0 then
                    for _,v in pairs(adminResult) do 
                        for _, user in ipairs(usersResult) do
                            local userGroup = user.groupA
                            if userGroup == v.idgrade then
                                table.insert(isAdmin, {identifier = user.identifier, lastname = user.lastname, firstname = user.firstname, group = user.groupA, color = v.color})
                            end
                        end
                    end
                    cb(isAdmin)
                end
            end)
        else
            cb(isAdmin) 
        end
    end)
end)


RegisterNetEvent("fCore:Admin:AddAdmin")
AddEventHandler("fCore:Admin:AddAdmin", function(id, group)
    local target = ESX.GetPlayerFromId(id)
    MySQL.Async.execute("UPDATE users SET groupA = @groupA WHERE identifier = @identifier", {
        ["@identifier"] = target.identifier,
        ["@groupA"] = group,
    })
    sNotification(_src, "~g~Vous venez de d'ajout en admin")
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n viens d'ajout un admin"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer), "", webhooks.LogsAdmin)
end)



RegisterNetEvent("fCore:Admin:deleteAdminPlayer")
AddEventHandler("fCore:Admin:deleteAdminPlayer", function(identifier)
    local _src = source 
    MySQL.Async.execute("UPDATE users SET groupA = NULL WHERE identifier = @identifier", {
        ["@identifier"] = identifier
    }, function(rowsChanged)
        sNotification(_src, TranslationAdministration.MenuAdmin["S_removeGradeAdmin"])
    end)
    sNotification(_src, "~g~Vous venez de de surpprimer un admin")
    sendToDiscord(12975872, "Logs Admin", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de surpprimer un admin"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer), "", webhooks.LogsAdmin)
end)

RegisterNetEvent("fCore:Admin:getPermsAdmin")
AddEventHandler("fCore:Admin:getPermsAdmin", function()
    local _src = source
    local permsAdmin = {}
    MySQL.Async.fetchAll("SELECT * FROM gestionadmin", {}, function(result)
        for k,v in pairs(result) do 
            table.insert(permsAdmin, v)
        end
        TriggerClientEvent("fCore:Admin:PermsAdmin", _src, permsAdmin)
    end)
end)


RegisterNetEvent("fCore:Admin:getGroupAdmin")
AddEventHandler("fCore:Admin:getGroupAdmin", function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local groupA = nil
    MySQL.Async.fetchAll("SELECT groupA FROM users WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    }, function(result)
        for k,v in pairs(result) do 
            groupA = v.groupA
        end
        TriggerClientEvent("fCore:Admin:GroupAdmin", _src, groupA)
    end)
end)
