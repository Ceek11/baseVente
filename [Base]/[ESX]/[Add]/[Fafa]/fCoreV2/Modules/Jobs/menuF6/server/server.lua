RegisterNetEvent("fCore:Billing:HistoryBilling")
AddEventHandler("fCore:Billing:HistoryBilling", function(target, raison, bill, JobName, society)
    local _src = source 
    local NameClient = GetPlayerName(target)
    local NameEmploye = GetPlayerName(_src)
    local query = "INSERT INTO billing_entreprise (employe, client, facture, raison, job, society) VALUES (@employe, @client, @facture, @raison, @job, @society)"
    local param = {["employe"] = NameEmploye, ["@client"] = NameClient, ["@facture"] = bill, ["@raison"] = json.encode(raison), ["@job"] = JobName, ["@society"] = society}
    MySQL.Async.insert(query, param)
end)

RegisterNetEvent("fCore:menuF6:Annonce")
AddEventHandler("fCore:menuF6:Annonce", function(message, jobName)
    local xPlayers = GetPlayers()
    for i = 1, #xPlayers, 1 do 
		sNotification(xPlayers[i], (message):format(jobName))
	end
end)

RegisterNetEvent("fCore:MenuF6:SendAnnouncePersonalized")
AddEventHandler("fCore:MenuF6:SendAnnouncePersonalized", function(message, jobName)
    local xPlayers = GetPlayers()
    for i = 1, #xPlayers, 1 do 
		sNotification(xPlayers[i], jobName..":\n\n"..message)
	end
end)

RegisterNetEvent("fCore:MenuF6:Mecano:repairkit")
AddEventHandler("fCore:MenuF6:Mecano:repairkit", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local getItem = xPlayer.getInventoryItem("kit_reparation").count
    if getItem >= 1 then 
        TriggerClientEvent("startRepairVehicle", _src)
        xPlayer.removeInventoryItem("kit_reparation", 1)
    else
        sNotification(_src, "~r~Vous n'avez pas assez d'item sur vous")
    end
end)

RegisterNetEvent("fCore:MenuF6:Mecano:crocheter")
AddEventHandler("fCore:MenuF6:Mecano:crocheter", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local getItem = xPlayer.getInventoryItem("kit_crochetage").count
    if getItem >= 1 then 
        TriggerClientEvent("startCrocheterVehicle", _src)
        xPlayer.removeInventoryItem("kit_crochetage", 1)
    else
        sNotification(_src, "~r~Vous n'avez pas assez d'item sur vous")
    end
end)




-- Fouille
ESX.RegisterServerCallback("ceek:getInventort", function(source,cb,player)
    local _src = source
    local target = ESX.GetPlayerFromId(player)
    local inventory = target.getInventory()

    cb(inventory)
end)

ESX.RegisterServerCallback("Ceek:getWeapon", function(source,cb,player)
    local _src = source
    local target = ESX.GetPlayerFromId(player)
    local weapon = target.getLoadout()

    cb(weapon)
end)


-- MenU f6
RegisterNetEvent("fCore:Police:AddInFourriere")
AddEventHandler("fCore:Police:AddInFourriere", function(plate)
    MySQL.Async.execute("UPDATE owned_vehicles SET stored = @stored WHERE plate = @plate", {
        ["@plate"] = plate,
        ["@stored"] = 0,
    })
end)

RegisterNetEvent("fCore:Police:CodeRadio")
AddEventHandler("fCore:Police:CodeRadio", function(Type, Code, Secteur, job)
    local _src = source
    local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == job then
			sNotification(xPlayers[i], ("Agent : %s \nCode : %s \nSecteur : %s"):format(GetPlayerName(_src), Code, Secteur), Type, "vert")
		end
	end
end)

RegisterNetEvent("fCore:Police:searchPlateInBdd")
AddEventHandler("fCore:Police:searchPlateInBdd", function(plate)
    local _src = source
    local query = "SELECT plate, owner, firstname, lastname FROM owned_vehicles INNER JOIN users ON owned_vehicles.owner = users.identifier WHERE owned_vehicles.plate = @plate"
    local param = {["@plate"] = plate}
    MySQL.Async.fetchAll(query, param, function(result)
        if #result > 0 then
            sNotification(_src, ("Le véhicule appartient à %s %s"):format(result[1].firstname, result[1].lastname))
        else
            sNotification(_src, "Véhicule volé !")
        end
    end)
end)


RegisterServerEvent('fCore:Police:handcuff')
AddEventHandler('fCore:Police:handcuff', function(target)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getItem = xPlayer.getInventoryItem("menotte").count
    if getItem >= 1 then
        TriggerClientEvent('fCore:Police:handcuff', target)
    else
        sNotification(_src, "Vous n'avez pas de menotte sur vous")
    end
end)


RegisterServerEvent('fCore:Police:drag')
AddEventHandler('fCore:Police:drag', function(target)
  local _source = source
  TriggerClientEvent('fCore:Police:drag', target, _source)
end)

RegisterServerEvent('fCore:Police:putInVehicle')
AddEventHandler('fCore:Police:putInVehicle', function(target)
  TriggerClientEvent('fCore:Police:putInVehicle', target)
end)

RegisterServerEvent('fCore:Police:OutVehicle')
AddEventHandler('fCore:Police:OutVehicle', function(target)
    TriggerClientEvent('fCore:Police:OutVehicle', target)
end)



RegisterServerEvent('fCore:Police:renfort')
AddEventHandler('fCore:Police:renfort', function(coords, raison, job)
	local _src = source
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local xPlayer1 = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer1.job.name == job then
			TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, raison)
		end
	end
end)

ESX.RegisterServerCallback("fCore:police:getAmendes", function(source, cb, targetT)
    local xPlayer = ESX.GetPlayerFromId(targetT)
    local getAmendes = {}
    MySQL.Async.fetchAll("SELECT label, amount FROM billing WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function(result)
        for k,v in pairs(result) do 
            table.insert(getAmendes, v)
        end
        cb(getAmendes)
    end)
end) 

RegisterNetEvent("fCore:Police:wipeLicense")
AddEventHandler("fCore:Police:wipeLicense", function(id, Type)
    local _src = source
    local target = id
    local xTarget = ESX.GetPlayerFromId(target)

    if xTarget then
        MySQL.Async.execute("DELETE FROM user_licenses WHERE owner = @owner AND type = @type", {
            ["@owner"] = xTarget.identifier,
            ["@type"] = Type
        }, function(rowsChanged)
            if rowsChanged > 0 then 
                sNotification(_src, "Vous venez de supprimer les licences du joueur")
            else
                sNotification(_src, "Le joueur n'avait pas cette licence")
            end
        end)
    end
end)

RegisterNetEvent("fCore:Police:givePpa")
AddEventHandler("fCore:Police:givePpa", function(id, license)
    local _src = source
    local target = id
    local xTarget = ESX.GetPlayerFromId(target)
    if xTarget then
        MySQL.Async.execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)",{}, {
            ["@owner"] = xTarget.identifier,
            ["@type"] = license
        })
        sNotification(_src, "Vous venez de donner la licences au joueur")
    end
end)

RegisterNetEvent("fCore:Police:AddAmende")
AddEventHandler("fCore:Police:AddAmende", function(target, jobName, label, price)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(target)
    MySQL.Async.execute("INSERT INTO billing (identifier, sender, target_type, target, label, amount, reason) VALUES (@identifier, @sender, @target_type, @target, @label, @amount, @reason)", {
        ["@identifier"] = xTarget.identifier,
        ["@sender"] = xPlayer.identifier,
        ["@target_type"] = "society",
        ["@target"] = "society_"..jobName,
        ["@label"] = jobName,
        ["@amount"] = price,
        ["@reason"] = label,
    })
    sNotification(_src, "L'amende à bien était envoyé")
    sNotification(target, "Vous venez de recevoir une amende")
end)



RegisterNetEvent("fCore:Police:withdrawItem")
AddEventHandler("fCore:Police:withdrawItem", function( count, name, target)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(target)
    xTarget.removeInventoryItem(name, count)
    xPlayer.addInventoryItem(name, count)
end)



-- Ems
local IdentifierPlayer = {}
RegisterNetEvent("fCore:Hopital_cayo:takeHumanBody")
AddEventHandler("fCore:Hopital_cayo:takeHumanBody", function(targetT, item, count, label)
    local _src = source 
    local xTarget = ESX.GetPlayerFromId(targetT)
    if not xTarget then
        return
    end
    local identifier = xTarget.identifier
    local alreadyRegistered = false
    for _, v in ipairs(IdentifierPlayer) do
        if v.identifier == identifier and v.item == item then
            alreadyRegistered = true
            break
        end
    end
    if not alreadyRegistered then
        table.insert(IdentifierPlayer, { identifier = identifier, item = item })
        sNotification(_src, ("Vous venez de récupérer le %s sur la personne."):format(label))
    else
        sNotification(_src, ("Vous avez déjà pris le %s sur cette personne."):format(label))
    end
end)


ESX.RegisterServerCallback("fCore:Police:getInventory", function(source, cb, id)
    local target = id
    local xTarget = ESX.GetPlayerFromId(target)
    local getInventory = xTarget.getInventory()
    local inventory = {}
    for k,v in pairs(getInventory) do 
        if v.count > 0 then 
            table.insert(inventory, v)
        end
    end
    cb(inventory)
end)