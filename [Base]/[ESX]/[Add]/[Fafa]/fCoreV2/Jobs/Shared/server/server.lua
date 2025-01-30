ESX = nil
ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback("fCore:Boss:GetInfoSocietyAccount", function(source, cb)
    local InfoSociety = {}
    local query = "SELECT * FROM addon_account_data"
    MySQL.Async.fetchAll(query, function(result)
        for k,v in pairs(result) do 
            table.insert(InfoSociety, {
                account_name = v.account_name,
                money = v.money
            })
        end
        cb(InfoSociety)
    end)
end)


RegisterNetEvent("fCore:Boss:ActionBossMoney")
AddEventHandler("fCore:Boss:ActionBossMoney", function(ChangeActionMoney, quantityMoney, jobName, gradeBoss, societyName, Webhooks, point)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local money = xPlayer.getMoney()
    checkJobGrade(xPlayer, jobName, gradeBoss, _src)
    checkPos(point, _src)

    TriggerEvent("esx_addonaccount:getSharedAccount", societyName, function(account)
        if ChangeActionMoney == 1 then
            if money >= quantityMoney then
                xPlayer.removeMoney(quantityMoney)
                account.addMoney(quantityMoney)
                sNotification(_src, TranslationJob.AllJob['Snotif_deposited_money'])
                sendToDiscord(12975872, "Entreprise", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s**| **Job:** %s \nLicense: **%s**\nDiscord: <@%s>\n\nAjoute de **x%s$**\nEntreprise: **%s**"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, quantityMoney, societyName), "", Webhooks.LogsJob) -- Correction de la variable 'webhooks' à 'Webhooks'
            else
                sNotification(_src, TranslationJob.AllJob['Snotif_not_have_money'])
            end
        elseif ChangeActionMoney == 2 then
            if account.money >= tonumber(quantityMoney) then 
                account.removeMoney(quantityMoney)
                xPlayer.addMoney(quantityMoney)
                sNotification(_src, TranslationJob.AllJob['Snotif_withdraw_money'])
                sendToDiscord(12975872, "Entreprise", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** | **Job:** %s \nLicense: **%s**\nDiscord: <@%s>\n\nRetrait de **x%s$**\nEntreprise: **%s**"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, quantityMoney, societyName), "", Webhooks.LogsJob) -- Correction de la variable 'webhooks' à 'Webhooks'
            else
                sNotification(_src, TranslationJob.AllJob['Snotif_not_have_money'])
            end
        end
    end)
end)

RegisterNetEvent("fCore:Boss:sendInfoActionBoss")
AddEventHandler("fCore:Boss:sendInfoActionBoss", function(ChangeActionMoney, quantityMoney, societyName)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local action = (ChangeActionMoney == 1) and "Dépôt" or "Retrait"
    MySQL.Async.execute("INSERT INTO historyBoss (action, price, society) VALUES (@action, @price, @society)", {
        ["@action"] = action,
        ["@price"] = quantityMoney,
        ["@society"] = societyName
    })
end)


RegisterNetEvent("fCore:Boss:MakeFakeMoney")
AddEventHandler("fCore:Boss:MakeFakeMoney", function(MakeFakeMoney, percentageMoney, jobName, gradeBoss, point, Webhooks)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local BlackMoney = xPlayer.getAccount('black_money').money
    checkJobGrade(xPlayer, jobName, gradeBoss, _src)
    checkPos(point, _src)

    if BlackMoney >= MakeFakeMoney then
        local time = os.time()
        local rentTime = (time+(60*60*24))
        MySQL.Async.insert("INSERT INTO blanchiment_entreprise (expiration, society) VALUES (@expiration, @society)", {
            ["@society"] = jobName,
            ["@expiration"] = rentTime,
        })
        xPlayer.removeAccountMoney('black_money', MakeFakeMoney)
        TriggerEvent("esx_addonaccount:getSharedAccount", "society_"..jobName, function(account)
            account.addMoney(MakeFakeMoney*percentageMoney/100)
        end)
        sendToDiscord(12975872, "Entreprise", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** | **Job:** %s \nLicense: **%s**\nDiscord: <@%s>\n\nBlanchiment de **x%s$**\nEntreprise: **%s**"):format(xPlayer.name, _src, idUnique,xPlayer.getJob().name, xPlayer.identifier, discordPlayer, (MakeFakeMoney*percentageMoney/100), "society_"..jobName), "", webhooks.LogsJob)
        sNotification(_src, (TranslationJob.AllJob['Snotif_whiten_money']):format(MakeFakeMoney, MakeFakeMoney*percentageMoney/100))
    else
        sNotification(_src, TranslationJob.AllJob['Snotif_no_fake_money'])
    end
end)

ESX.RegisterServerCallback("fCore:Boss:Blanchiment", function(source, cb, society)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local time = os.time() 
    MySQL.Async.fetchAll("SELECT * FROM blanchiment_entreprise WHERE society = @society", {["@society"] = society}, function(result)
        local infoBlanchiment = {}
        if result and #result > 0 then
            for k,v in pairs(result) do
                if time > v.expiration then
                    MySQL.Async.execute("DELETE FROM blanchiment_entreprise WHERE society = @society", {
                        ["@society"] = society,
                    })
                else
                    table.insert(infoBlanchiment, {
                        society = v.society,
                        expiration = formatExpiration(v.expiration)
                    })
                end
            end
        end
        cb(infoBlanchiment)
    end)  
end)

local Jobs = {}
MySQL.ready(function()
    local query = "SELECT * FROM jobs"
	local result = MySQL.Sync.fetchAll(query, {})
	for i=1, #result, 1 do
		Jobs[result[i].name] = result[i]
		Jobs[result[i].name].grades = {}
	end
    local query2 = "SELECT * FROM job_grades"
	local result2 = MySQL.Sync.fetchAll(query2, {})
	for i=1, #result2, 1 do
		Jobs[result2[i].job_name].grades[tostring(result2[i].grade)] = result2[i]
	end
end)

ESX.RegisterServerCallback("fCore:Boss:GetInfoMember", function(source, cb, jobName)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local query = "SELECT firstname, lastname, identifier, job, job_grade FROM users WHERE job = @job ORDER BY job_grade DESC"
    local param = {['@job'] = jobName}
    MySQL.Async.fetchAll(query, param, function(result)
        InfoMember = {}
        local xPlayer = ESX.GetPlayerFromId(_src) 
        for i = 1, #result, 1 do
            table.insert(InfoMember, {
                identifier = result[i].identifier,
                firstname = result[i].firstname,
                lastname = result[i].lastname,
                job = result[i].job,
                job_grade = result[i].job_grade,
                grade_label = Jobs[result[i].job].grades[tostring(result[i].job_grade)].label,
                Name = xPlayer.getName()
            })
        end
        cb(InfoMember)
    end)
end)       

RegisterNetEvent("fCore:Boss:RecruitEmployee")
AddEventHandler("fCore:Boss:RecruitEmployee", function(Target, jobName, gradeBoss, point, src)
    local xPlayer = ESX.GetPlayerFromId(src)    
    local TargetX = ESX.GetPlayerFromId(Target)
    if not TargetX then return end 
    if not xPlayer then return end 
    TargetX.setJob(jobName, 0)
    MySQL.Async.execute("UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @identifier", {
        ["@job"] = jobName, 
        ["@job_grade"] = 0, 
        ["@identifier"] = TargetX.identifier
    })
    sNotification(src, TranslationJob.AllJob['Snotif_recruiter'].. TargetX.name .. '~w~.')
    sNotification(Target, TranslationJob.AllJob['Snotif_been_hired'].. xPlayer.name .. '~w~.')
    sendToDiscord(12975872, "Logs Job", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** | **Job:** %s \nLicense: **%s**\nDiscord: <@%s>\n\nRecrutement de **x%s$**\nEntreprise: **%s**"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, TargetX.name, societyName), "", webhooks.LogsJob)
end)

ESX.RegisterServerCallback("fCore:Boss:GetSalaryMember", function(source, cb)
    InfoSalary = {}
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local query = "SELECT * FROM job_grades"
    MySQL.Async.fetchAll(query, {}, function(result)
        for i = 1, #result, 1 do            
            table.insert(InfoSalary, {
                id = result[i].id,
                name = result[i].name,
                job_name = result[i].job_name,
                grade = result[i].grade,
                salary = result[i].salary,
                label = result[i].label,

                armurerie = result[i].armurerie,
                coffre = result[i].coffre,
                garage = result[i].garage,
                fisc = result[i].fisc,
                saisie = result[i].saisie
            })
        end
        cb(InfoSalary)
    end)
end)


RegisterNetEvent("fCore:Boss:changePermission")
AddEventHandler("fCore:Boss:changePermission", function(Type, permission, grade, job_name, jobName, gradeBoss, point)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local query = "UPDATE job_grades SET "..Type.." = @permission WHERE job_name = @job_name AND grade = @grade"
    MySQL.Async.execute(query, {["@grade"] = grade, ["@job_name"] = job_name, ["@permission"] = permission})
end)

RegisterNetEvent("fCore:Boss:createGrade")
AddEventHandler("fCore:Boss:createGrade", function(CreateGrade, jobName, gradeBoss, point)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end 
    MySQL.Async.fetchScalar("SELECT COUNT(*) FROM job_grades WHERE job_name = @job_name AND grade = @grade", {
        ["@job_name"] = jobName,
        ["@grade"] = CreateGrade.grade
    }, function(existingCount)
        if existingCount > 0 then 
            sNotification(_src, "Le grade existe déjà")
        else
            local query = "INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (@job_name, @grade, @name, @label, @salary)"
            local param = {
                ['@job_name'] = jobName,
                ["@grade"] = CreateGrade.grade,
                ["@name"] = CreateGrade.name,
                ["@label"] = CreateGrade.label,
                ["@salary"] = CreateGrade.salary
            }

            MySQL.Async.insert(query, param, function(rowsInserted)
                if rowsInserted > 0 then
                    sNotification(_src, TranslationJob.AllJob["Snotif_wait_reboot_to_setjob"])
                else
                    sNotification(_src, "Erreur lors de l'insertion du grade")
                end
            end)
            sendToDiscord(12975872, "Logs Job", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** | **Job:** %s \nLicense: **%s**\nDiscord: <@%s>\n\nCréation d'un grade:%s "):format(xPlayer.name, _src, idUnique,xPlayer.getJob().name, xPlayer.identifier, discordPlayer, CreateGrade.name), "", webhooks.LogsJob)
        end
    end)
end)


RegisterNetEvent("fCore:Boss:setSalary")
AddEventHandler("fCore:Boss:setSalary", function(SalaryNumber, grade, job_name, jobName, gradeBoss, point)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local query = "UPDATE job_grades SET salary = @salary WHERE job_name = @job_name AND grade = @grade"
    local param = {["grade"] = grade,["job_name"] = job_name, ["salary"] = SalaryNumber}
    MySQL.Async.execute(query, param)
    sNotification(_src, TranslationJob.AllJob["Snotif_change_salary"])
    sendToDiscord(12975872, "Logs Job", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** | **Job:** %s \nLicense: **%s**\nDiscord: <@%s>\n\nChagement de salaire du job :%s avec comme salaire:"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, jobName, SalaryNumber), "", webhooks.LogsJob)
end)

ESX.RegisterServerCallback("fCore:Boss:GetHistoryBilling", function(source, cb)
    local HistoryBilling = {}
    local query = "SELECT * FROM billing_entreprise"
    MySQL.Async.fetchAll(query, function(result)
        for k,v in pairs(result) do
            table.insert(HistoryBilling, {
                id = v.id,
                employe = v.employe,
                client = v.client,
                facture = v.facture,
                raison = v.raison,
                job = v.job, 
                society = v.society
            }) 
        end
        cb(HistoryBilling)
    end)
end)

RegisterNetEvent("fCore:Boss:DeleteAllBilling")
AddEventHandler("fCore:Boss:DeleteAllBilling", function(jobName, gradeBoss, point)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local query = "DELETE FROM billing_entreprise WHERE job = @job"
    local param = {["@job"] = jobName}
    MySQL.Async.execute(query, param)
end)

RegisterNetEvent("fCore:Boss:DeleteBilling")
AddEventHandler("fCore:Boss:DeleteBilling", function(id, jobName, gradeBoss, point)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local query = "DELETE FROM billing_entreprise WHERE id = @id"
    local param = {["@id"] = id}
    MySQL.Async.execute(query,param)
end)

ESX.RegisterServerCallback("fCore:Boss:GetNumberEmployee", function(source, cb, JobName)
    local _src = source 
    local xPlayers = ESX.GetPlayers()
    local NbrEmployeeBoss = 0
    local BossInService = 0
    for i=1, #xPlayers, 1 do
        local xPlayer1 = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer1.job.name == JobName then
            BossInService = BossInService + 1
        end
    end
    MySQL.Async.fetchAll("SELECT job FROM users", function(result)
        for k,v in pairs(result) do 
            if v.job == JobName then 
                NbrEmployeeBoss = NbrEmployeeBoss +1
            end
        end
        cb(NbrEmployeeBoss, BossInService)
    end)
end)

RegisterNetEvent('fCore:Boss:BuyVehicleForSociety')
AddEventHandler('fCore:Boss:BuyVehicleForSociety', function(job, name, label, price, grade, custom, societyName, jobName, gradeBoss, price, Type)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    TriggerEvent("esx_addonaccount:getSharedAccount", societyName, function(account)
        MoneySociety = account
    end)
    if MoneySociety.money >= price then
        MoneySociety.removeMoney(price)
        local query = "INSERT INTO vehicule_entreprise (job, grade, name, label, number, custom, plate, price, type) VALUES (@job, @grade, @name, @label, @number, @custom, @plate, @price, @type)"
        local param = {["@job"] = job, ["@grade"] = grade, ["@type"] = Type, ["@name"] = name, ['@label'] = label, ["@number"] = 1, ["@custom"] = json.encode(custom),["@plate"] = custom.plate, ["@price"] = price}
        MySQL.Async.insert(query, param)
        sendToDiscord(12975872, "Logs Job", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens d'acheter un véhicule d'enreprise :%s "):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, jobName, SalaryNumber), "", webhooks.LogsJob)

    else
        sNotification(_src, TranslationJob.AllJob["Snotif_no_money"])
    end
end)


ESX.RegisterServerCallback('fCore:Boss:GetInventory', function(source, cb)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local items = xPlayer.getInventory()
    cb(items)
end)

ESX.RegisterServerCallback("fCore:Boss:GetChestInventory", function(source, cb, Society)
    TriggerEvent('esx_addoninventory:getSharedInventory', Society, function(inventory)
        cb(inventory.items)
    end)
end)

RegisterNetEvent('fCore:Boss:InventoryDepo')
AddEventHandler("fCore:Boss:InventoryDepo", function(Society, QuantityDepo, name, label, Webhooks)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    TriggerEvent('esx_addoninventory:getSharedInventory', Society, function(inventory)
        local item = inventory.getItem()
        local PlayerItemCount = xPlayer.getInventoryItem(name).count
        if item.count >= 0 and QuantityDepo <= PlayerItemCount then
            xPlayer.removeInventoryItem(name, QuantityDepo)
            inventory.addItem(name, QuantityDepo)
            sNotification(_src, (TranslationJob.AllJob["Snotif_deposit_item"]):format(QuantityDepo, label))
            sendToDiscord(12975872, "Logs Job", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de ranger dans sont coffre : x%s %s "):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, QuantityDepo, label), "", webhooks.LogsJob)
        else
            sNotification(_src, TranslationJob.AllJob["Snotif_invalid_quantity"])
        end
    end)
end)

RegisterNetEvent("fCore:Boss:AddKitMecano")
AddEventHandler('fCore:Boss:AddKitMecano', function(societyName, kitRepation,PriceKitRepa)
    local _src = source
    local price = kitRepation*PriceKitRepa
    TriggerEvent("esx_addonaccount:getSharedAccount", societyName, function(account)
        MoneySociety = account
    end)
    if MoneySociety.money >= price then
        TriggerEvent('esx_addoninventory:getSharedInventory', societyName, function(inventory)
            inventory.addItem("kit_reparation", tonumber(kitRepation))
        end)
        MoneySociety.removeMoney(price)
        sNotification(_src, ("Vous venez d'acheter x%s pour %s$"):format(kitRepation, price))
        sendToDiscord(12975872, "Logs Job", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens d'acheter : x%s kit de réparation"):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, kitRepation), "", webhooks.LogsJob)
    else
        sNotification(_src, "Vous n'avez pas assez d'argent dans la société")
    end
end)

RegisterNetEvent('fCore:Boss:TakeObject')
AddEventHandler('fCore:Boss:TakeObject', function(Society, QuantityTake, name, label, Webhooks)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getWeight = xPlayer.getWeight()
    if not xPlayer then return end 
    if getWeight < Cfg.maxWeight then 
        TriggerEvent('esx_addoninventory:getSharedInventory', Society, function(inventory)
            local item = inventory.getItem(name)
            if item.count >= QuantityTake then 
                inventory.removeItem(name, QuantityTake)
                xPlayer.addInventoryItem(name, QuantityTake)
                sNotification(_src, (TranslationJob.AllJob["Snotif_take_item"]):format(QuantityTake, label))
                sendToDiscord(12975872, "Logs Job", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de prendre dans sont coffre : x%s %s "):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, QuantityTake, label), "", webhooks.LogsJob)

            else 
                sNotification(_src, TranslationJob.AllJob["Snotif_invalid_quantity"])
            end
        end)
    else 
        sNotification(_src, "Vous n'avez pas assez de place sur vous")
    end
end)

ESX.RegisterServerCallback("fCore:Boss:GetVehiculeInGarage", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local query = "SELECT * FROM vehicule_entreprise WHERE job = @job"
    MySQL.Async.fetchAll(query, {["@job"] = xPlayer.getJob().name}, function(result)
        CountVehicule = {}
        for i = 1, #result do 
            table.insert(CountVehicule, {
                job = result[i].job, 
                name = result[i].name, 
                label = result[i].label,
                number = result[i].number,
                grade = result[i].grade,
                custom = json.decode(result[i].custom),
                plate = result[i].plate,
                type = result[i].type
            })
        end
        cb(CountVehicule)
    end)
end)

ESX.RegisterServerCallback("fCore:Boss:GetOutfit", function(source, cb, Job)
    local OutfitInBdd = {}
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end 
    local id = xPlayer.getIdentifier()
    local query = "SELECT * FROM vestiaire WHERE job = @job"
    local param = {["@job"]= Job}
    MySQL.Async.fetchAll(query, param, function(result)
            for i = 1, #result, 1 do
                table.insert(OutfitInBdd, {
                    grade = result[i].grade,
                    NameOutfit = result[i].nom,
                    tenue = json.decode(result[i].tenue),
                    idOutfit = result[i].id,
                })
            end 
        cb(OutfitInBdd)
    end)
end)


RegisterServerEvent("fCore:Boss:addnewvetement")
AddEventHandler("fCore:Boss:addnewvetement", function(MaTenu, NameTenu, Job, GradeTenu, jobName, gradeBoss, Webhooks, point)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local query = "INSERT INTO vestiaire (identifier, job, nom, tenue, grade) VALUES (@identifier, @job, @nom, @tenue, @grade)"
    local param = {['@identifier'] = xPlayer.identifier,  ['@job'] = Job, ['@nom'] = NameTenu, ["@grade"] = GradeTenu, ['@tenue'] = json.encode(MaTenu)}
    MySQL.Async.insert(query, param)
end)

RegisterNetEvent('fCore:Boss:DeleteOutif')
AddEventHandler('fCore:Boss:DeleteOutif', function(idOutfit, jobName, gradeBoss, Webhooks, point)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local query = "DELETE FROM vestiaire WHERE id = @id"
    local param = {["@id"] = idOutfit}
    MySQL.Async.execute(query, param)
end)

RegisterNetEvent("fCore:Boss:ChangeInfoClothe")
AddEventHandler("fCore:Boss:ChangeInfoClothe", function(Type, Info, id, jobName, gradeBoss, point)
    local _src = source
    if Type == "label" then 
        local query = "UPDATE vestiaire set nom = @nom WHERE id = @id"
        local param = {["nom"] = Info, ["id"] = id}
        MySQL.Async.execute(query, param)
        sNotification(_src, TranslationJob.AllJob['Snotif_change_label'])
    elseif Type == "grade" then 
        local query2 = "UPDATE vestiaire set grade = @grade WHERE id = @id"
        local param2 = {["grade"] = Info, ["id"] = id}
        MySQL.Async.execute(query2, param2)
        sNotification(_src, TranslationJob.AllJob['Snotif_change_grade'])
    end
end)


local AppelsCentral = {}
RegisterNetEvent('fCore:Pnj:CallJobs')
AddEventHandler("fCore:Pnj:CallJobs", function(job, name, raison, pos)
    local _src = source     
    local xPlayers = ESX.GetPlayers()
    table.insert(AppelsCentral, {name = name, raison = raison, pos = pos})
    for i=1, #xPlayers, 1 do
        local xPlayer1 = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer1.job.name == job then
            TriggerClientEvent("fCore:Pnj:VerifStatusCall", xPlayers[i], xPlayers[i], name, raison, GetEntityCoords(GetPlayerPed(_src)), _src)
            TriggerClientEvent("SendAppelCentral", _src, AppelsCentral)
        end
    end
end)

RegisterNetEvent("DeleteAppelsCentral")
AddEventHandler("DeleteAppelsCentral", function(id)
    table.remove(AppelsCentral, id)
end)

RegisterNetEvent("fCore:Pnj:AcceptAppel")
AddEventHandler("fCore:Pnj:AcceptAppel", function(_src)
    sNotification(_src, TranslationJob.AllJob["call_has_been_answered"])
end)



RegisterNetEvent("fCore:Pnj:SendPlainte")
AddEventHandler("fCore:Pnj:SendPlainte", function(CreatePlainte, sendInfoWebhooks)
    local _src = source
    sendToDiscord(12975872, "Plainte : ", ("La raison de la plainte : **%s** \n\n Numéro de téléphone : **%s** \nNom / Prénoms : **%s** \n Accusé : **%s** \nEmail discord : **%s**"):format(CreatePlainte.raison, CreatePlainte.nomberPhone, CreatePlainte.name, CreatePlainte.nameOfResponsable, CreatePlainte.emailDiscord), "", sendInfowebhooks.LogsJob)
    sNotification(_src, TranslationJob.AllJob["sent_your_complaint"])
end)


function getMaximumGrade(jobname)
	local queryDone, queryResult = false, nil
	MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @jobname ORDER BY `grade` DESC ;', {
		['@jobname'] = jobname
	}, function(result)
		queryDone, queryResult = true, result
	end)
	while not queryDone do
		Citizen.Wait(10)
	end
	if queryResult[1] then
		return queryResult[1].grade
	end
	return nil
end


RegisterNetEvent("fCore:Boss:AddSetjobEmployee")
AddEventHandler("fCore:Boss:AddSetjobEmployee", function(identifier, job_name, grade, firstname, lastname)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromIdentifier(identifier)
    if grade ~= tonumber(getMaximumGrade(job_name)) or job_name == Cfg.NoJob then
        if xTarget then
            xTarget.setJob(job_name, grade)
            MySQL.Async.execute('UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @identifier', {
                ['@job']        = job_name,
                ['@job_grade']  = grade,
                ['@identifier'] = identifier
            }, function(rowsChanged)
                sNotification(_src, "Vous venez de changer de grade")
            end)
            sNotification(_src, ("Vous venez de changer le grade de %s %s"):format(firstname, lastname))
            sNotification(xTarget, "Vous venez de changer de grade")
            sendToDiscord(12975872, "Logs Job", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens de changer le grade de son employé x%s "):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, xTarget.name), "", webhooks.LogsJob)
        end
    else
        sNotification(_src, TranslationJob.AllJob["Snotif_not_promot_boss"])
    end
end)

RegisterNetEvent("fCore:Boss:AcceptRecruitement")
AddEventHandler("fCore:Boss:AcceptRecruitement", function(targetT, jobName, gradeBoss, point)
    local _src = source 
    MySQL.Async.fetchAll("SELECT job FROM users WHERE job = @job", {
        ["@job"] = jobName
    }, function(result)
        if #result < maxEmployee then 
            TriggerClientEvent("fCore:Boss:GiveInformationOfRecruitement", targetT, targetT, jobName, gradeBoss, point, _src)
        else
            sNotification(_src, "Vous avez déjà la somme maximal d'employé !")
        end
    end)
end)

RegisterNetEvent("fCore:Boss:sendMessageEmploye")
AddEventHandler("fCore:Boss:sendMessageEmploye", function(src)
    sNotification(src, "La personne à refuser le recrutement")
end)


RegisterNetEvent('fCore:Boss:ExitVehicule')
AddEventHandler('fCore:Boss:ExitVehicule', function(plate, label)
    local _src = source 
    MySQL.Async.execute("UPDATE vehicule_entreprise SET number = @number WHERE plate = @plate", {
        ["@plate"] = plate,
        ["@number"] = 2
    })
end)

RegisterNetEvent('fCore:Boss:enterVehicleInGarage')
AddEventHandler("fCore:Boss:enterVehicleInGarage", function(plate, custom)
    MySQL.Async.execute("UPDATE vehicule_entreprise SET number = @number, custom = @custom WHERE plate = @plate", {
        ["plate"] = plate,
        ["@number"] = 1,
        ["@custom"] = json.encode(custom)
    })
end)


CreateThread(function()
    MySQL.Async.fetchAll("SELECT number, plate FROM vehicule_entreprise", function(result)
        for k,v in pairs(result) do 
            if v.number == 2 then 
                MySQL.Async.execute("UPDATE vehicule_entreprise SET number = @number WHERE plate = @plate", {
                    ["@number"] = 0,
                    ["plate"] = v.plate
                })
            end
        end
    end)
end)

RegisterNetEvent("fCore:Boss:ChangeInfoVehicle")
AddEventHandler("fCore:Boss:ChangeInfoVehicle", function(Type, Info, VehiculePlate)
    local _src = source
    if Type == "Label" then 
        MySQL.Async.execute("UPDATE vehicule_entreprise SET label = @label WHERE plate = @plate", {
            ["label"] = Info,
            ["plate"] = VehiculePlate
        })
        sNotification(_src, TranslationJob.AllJob['Snotif_change_label'])
    elseif Type == "Grade" then 
        MySQL.Async.execute("UPDATE vehicule_entreprise SET grade = @grade WHERE plate = @plate", {
            ["grade"] = Info,
            ["plate"] = VehiculePlate
        })
        sNotification(_src, TranslationJob.AllJob['Snotif_change_grade'])
    end
end)


RegisterNetEvent('fCore:Boss:removeVehiculeToFound')
AddEventHandler('fCore:Boss:removeVehiculeToFound', function(plate, societyName)
    local _src = source
    TriggerEvent("esx_addonaccount:getSharedAccount", societyName, function(account)
        MoneySociety = account
    end)
    if MoneySociety.money >= Cfg.PriceFoundEntreprise then 
        MoneySociety.removeMoney(Cfg.PriceFoundEntreprise)
        MySQL.Async.execute("UPDATE vehicule_entreprise SET number = @number WHERE plate = @plate", {
            ["@plate"] = plate,
            ["@number"] = 1
        })
    else
        sNotification(_src, TranslationJob.AllJob["Snotif_no_money"])
    end
end)

RegisterNetEvent("fCore:Boss:ChangeInfoJob")
AddEventHandler("fCore:Boss:ChangeInfoJob", function(Type, Info, idJob)
    local _src = source
    if Type == "Label" then 
        MySQL.Async.execute("UPDATE job_grades set label = @label WHERE id = @id", {
            ["label"] = Info,
            ["id"] = idJob
        })
        MySQL.Async.execute("UPDATE job_grades set label = @label WHERE id = @id", {
            ["label"] = "Hors - Service "..Info,
            ["id"] = idJob+1
        })
        sNotification(_src, TranslationJob.AllJob['Snotif_change_label'])
    elseif Type == "Grade" then 
        MySQL.Async.execute("UPDATE job_grades set grade = @grade WHERE id = @id", {
            ["grade"] = Info,
            ["id"] = idJob
        })
        MySQL.Async.execute("UPDATE job_grades set grade = @grade WHERE id = @id", {
            ["grade"] = Info,
            ["id"] = idJob+1
        })
        sNotification(_src, TranslationJob.AllJob['Snotif_change_grade'])
    end
end)






RegisterNetEvent("fCore:Boss:ResellVehicule")
AddEventHandler("fCore:Boss:ResellVehicule", function(VehiculePlate, societyName)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local price = nil
    MySQL.Async.fetchAll("SELECT price FROM vehicule_entreprise WHERE plate = @plate", {["@plate"] = VehiculePlate}, function(result)
        for _,v in pairs(result) do 
            price = v.price
        end
        TriggerEvent("esx_addonaccount:getSharedAccount", societyName, function(account)
            account.addMoney(price)
        end)
        sNotification(_src, ("Vous venez de revendre votre véhicule pour %s$"):format(price/2))
    end)
    MySQL.Async.execute("DELETE FROM vehicule_entreprise WHERE plate = @plate", {
        ["@plate"] = VehiculePlate
    })
end)



RegisterNetEvent("fCore:Boss:addCountService")
AddEventHandler("fCore:Boss:addCountService", function(Type, jobName)
    local _src = source
    for _, v in pairs(Patron) do
        if v.jobName == jobName then
            if Type == "add" then
                v.EmployeeInService = v.EmployeeInService + 1
            elseif Type == "remove" then
                v.EmployeeInService = v.EmployeeInService - 1
            elseif Type == "test" then
                TriggerClientEvent("fCore:Boss:GiveInformationCountService", _src, v.EmployeeInService)
            end
            TriggerClientEvent("fCore:Boss:GiveInformationCountService", _src, v.EmployeeInService)
            break
        end
    end
end)


RegisterNetEvent("Police:BuyWeaponForSociety")
AddEventHandler("Police:BuyWeaponForSociety", function(job, name, price, ChooseGrade, label, SocietyName)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    TriggerEvent("esx_addonaccount:getSharedAccount", SocietyName, function(account)
        MoneySociety = account
    end)
    if MoneySociety.money >= price then
        MoneySociety.removeMoney(price)
        MySQL.Async.insert("INSERT INTO weapon_society (job, label, name, grade) VALUES (@job, @label, @name, @grade)", {
            ["@job"] = job,
            ["@label"] = label,
            ['@name'] = name,
            ["@grade"] = ChooseGrade,
        })
        sendToDiscord(12975872, "Logs Job", ("Joueur : **%s** | Id: **%s** | Id Unique: **%s** |**Job:** %s\nLicense: **%s**\nDiscord: <@%s>\n\n Viens d'acheter des arms pour son entreprise x%s "):format(xPlayer.name, _src, idUnique, xPlayer.getJob().name, xPlayer.identifier, discordPlayer, SocietyName), "", webhooks.LogsJob)
    else
        sNotification(_src, "Tu n'a pas assez d'argent dans la société")
    end
end)


RegisterNetEvent("fCore:Boss:DeleteJob")
AddEventHandler("fCore:Boss:DeleteJob", function(id)
    MySQL.Async.execute("DELETE FROM job_grades WHERE id = @id", {
        ["@id"] = id
    })
end)
