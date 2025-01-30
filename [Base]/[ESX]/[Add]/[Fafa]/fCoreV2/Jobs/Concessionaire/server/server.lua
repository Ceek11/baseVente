ESX = nil
ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback("fCore:Boss:searchCategoriVehicle", function(source, cb)
    local listCategorieBdd = {}
    local query = "SELECT * FROM vehicle_categories"
    MySQL.Async.fetchAll(query, function(result)
        for k,v in pairs(result) do 
            table.insert(listCategorieBdd, v)
        end
        cb(listCategorieBdd)
    end)
end)

ESX.RegisterServerCallback("fCore:Boss:searchVehicle", function(source, cb)
    local listVehicleConcessBdd = {}
    local query = "SELECT * FROM vehicles"
    MySQL.Async.fetchAll(query, function(result)
        for k,v in pairs(result) do 
            table.insert(listVehicleConcessBdd, v)
        end
        cb(listVehicleConcessBdd)
    end)
end)

RegisterNetEvent("fCore:Boss:Concess:giveInfoPaimentVehicle")
AddEventHandler("fCore:Boss:Concess:giveInfoPaimentVehicle", function(targetT, model, price, name, SocietyConcess, Type, pos)
    local _src = source
    TriggerClientEvent("fCore:Concess:giveInfoPaiment", targetT, targetT, model, price, _src, name, SocietyConcess, Type, pos)
end)

RegisterNetEvent("fCore:Concess:sendMessageEmploye")
AddEventHandler("fCore:Concess:sendMessageEmploye", function(src)
    sNotification(src, Translation.ConcessVehi["person_refuse_invoice"])
end)

ESX.RegisterServerCallback('fCore:Boss:isPlateTaken', function (source, cb, plate)
    local query = 'SELECT * FROM owned_vehicles WHERE plate = @plate'
    local param = {['@plate'] = plate}
	MySQL.Async.fetchAll(query, param, function (result)
		cb(result[1] ~= nil)
	end)
end)

RegisterNetEvent("fCore:Concess:GiveBilling")
AddEventHandler("fCore:Concess:GiveBilling", function(src, price, name, SocietyConcess, Type, pos)
    local target = source
    local xTarget = ESX.GetPlayerFromId(target)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end 
    local getMoney = xPlayer.getMoney()
    local getBankMoney = xTarget.getAccount('bank').money
    local AddMoneySociety = math.ceil(price*percentSociety)
    local AddMoneyDealer = math.ceil(price*percentVendeur)
    local AddMoneySuplier = math.ceil(price*percentsupplier)
    if getMoney >= price then 
        TriggerEvent('esx_addonaccount:getSharedAccount', SocietyConcess, function(account)
            sNotification(target, Translation.ConcessVehi["You_paid_bill"])
            sNotification(src, (Translation.ConcessVehi["paye_billing"]):format(AddMoneySociety, AddMoneySuplier, AddMoneyDealer))
            xTarget.removeAccountMoney('money', price)
            account.addMoney(AddMoneySociety)
            xPlayer.addAccountMoney('money', AddMoneyDealer)
            TriggerClientEvent("fCore:Concess:SpawnVehicle", src, name, target, Type)
            for k,v in pairs(GetPlayerIdentifiers(source))do
                if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                    discordPlayer = string.sub(v, string.len("discord:") + 1)
                end
            end
            sendToDiscord(12975872,"Logs Job",("Le joueur **%s** viens de vendre un véhicule au joueur **%s** son métier\n\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job: ** %s\nPrix: **%s**\n**Vehicule:**%s"):format(xPlayer.name, xPlayer.name, xPlayer.playerId, xPlayer.identifier, discordPlayer, xPlayer.getJob().name, price, name), "", webhooks.LogsJob)            
        end)
    else
        if getBankMoney >= price then 
            TriggerEvent('esx_addonaccount:getSharedAccount', SocietyConcess, function(account)
                sNotification(target, Translation.ConcessVehi["You_paid_bill"])
                sNotification(src, (Translation.ConcessVehi["paye_billing"]):format(AddMoneySociety, AddMoneySuplier, AddMoneyDealer))
                xTarget.removeAccountMoney('bank', price)
                account.addMoney(AddMoneySociety)
                xPlayer.addAccountMoney('money', AddMoneyDealer)
                TriggerClientEvent("fCore:Concess:SpawnVehicle", src, name, target, Type)
                for k,v in pairs(GetPlayerIdentifiers(source))do
                    if string.sub(v, 1, string.len("discord:")) == "discord:" then 
                        discordPlayer = string.sub(v, string.len("discord:") + 1)
                    end
                end
                sendToDiscord(12975872,"Logs Job",("Le joueur **%s** viens de vendre un véhicule au joueur **%s** son métier\n\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job: ** %s\nPrix: **%s**\n**Vehicule:**%s"):format(xPlayer.name, xTarget.name, xPlayer.playerId, xPlayer.identifier, discordPlayer, xPlayer.getJob().name, price, name), "", webhooks.LogsJob)            
            end)
        else
            sNotification(target, Translation.ConcessVehi["person_no_money"])
            sNotification(src, Translation.ConcessVehi["no_have_money"])
        end
    end
end)

RegisterServerEvent('fCore:Boss:setVehicleOwnedPlayerId')
AddEventHandler('fCore:Boss:setVehicleOwnedPlayerId', function(playerId, vehicleProps, Type)
	local xPlayer = ESX.GetPlayerFromId(playerId)
    if not xPlayer then return end 
    local query = 'INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)'
    local param = {['@owner'] = xPlayer.identifier, ['@plate']   = vehicleProps.plate, ['@vehicle'] = json.encode(vehicleProps), ["@type"] = Type}
	MySQL.Async.execute(query, param, function (rowsChanged)
		sNotification(playerId, (Translation.ConcessVehi["vehicle_with_plate"]):format(vehicleProps.plate))
	end)
end)


RegisterNetEvent("SendAnnouncePersonalized")
AddEventHandler("SendAnnouncePersonalized", function(AnnouncePerso, JobLabel)
    local xPlayers = GetPlayers()
    for i = 1, #xPlayers, 1 do 
        TriggerClientEvent("esx:showAdvancedNotification", xPlayers[i], nil, 'Annonce '..JobLabel, AnnouncePerso, "CHAR_CONCESSIONNAIRE")
    end
end)

RegisterNetEvent("fCore:Concess:GetInformationTable")
AddEventHandler("fCore:Concess:GetInformationTable",function() 
    TriggerClientEvent("fCore:Concess:SetInformationTable", -1, Concess.Visualisation)
end)

RegisterNetEvent("fCore:Concess:CantVisualisation")
AddEventHandler("fCore:Concess:CantVisualisation",function(indexBraquage)
    Concess.Visualisation[indexBraquage].menuOpen = true
    TriggerClientEvent("fCore:Concess:SetInformationTable",-1, Concess.Visualisation)
end)

RegisterNetEvent("fCore:Concess:CanVisualisation")
AddEventHandler("fCore:Concess:CanVisualisation",function(indexBraquage)
    Concess.Visualisation[indexBraquage].menuOpen = false
    TriggerClientEvent("fCore:Concess:SetInformationTable",-1, Concess.Visualisation)
end)
