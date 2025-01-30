idUnique  = nil
ESX.RegisterServerCallback("fCore:Echap:CheckIdUnique", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    MySQL.Async.fetchAll("SELECT id FROM uniqueid WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function(result)
        for k,v in pairs(result) do 
            idUnique = v.id
        end
        print(idUnique)
        cb(idUnique)
    end)
end)




RegisterNetEvent("fCore:oxTarget:getId")
AddEventHandler("fCore:oxTarget:getId", function(id)
    local _src = source
    local xTarget = ESX.GetPlayerFromId(id)
    local idUnique
    MySQL.Async.fetchAll("SELECT id FROM uniqueid WHERE identifier = @identifier", {["@identifier"] = xTarget.identifier}, function(result)
        for k,v in pairs(result) do 
            idUnique = v.id
            print(json.encode(idUnique))
        end
        sNotification(_src, ("Id unique : %s<br>Id server %s"):format(idUnique, id), "Action", "vert")
    end)
end)

AddEventHandler('playerDropped', function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local playerPed = GetPlayerPed(_src) 
    local playerCoords = GetEntityCoords(playerPed) 
    MySQL.Async.fetchAll("SELECT id FROM uniqueid WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    }, function(result)
        for k,v in pairs(result) do 
            TriggerClientEvent("fCore:Utils:MeDropped", -1, v.id, playerCoords)
        end
    end)
end)

