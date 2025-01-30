-- Menu EMS
ESX.RegisterServerCallback("fCore:Ambulance:GetStatusDead", function(source, cb)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    MySQL.Async.fetchAll("SELECT is_dead from users WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    }, function(result)
        cb(result)
    end)
end)


RegisterNetEvent("fCore:ambulance:heal")
AddEventHandler("fCore:ambulance:heal", function(id, heal)
    TriggerClientEvent("fCore:ambulance:heal", id, heal)
end)

local SignalEms = {}
RegisterNetEvent("fCore:EMS:DistressSignal")
AddEventHandler("fCore:EMS:DistressSignal", function(coords, name)
    local xPlayers = ESX.GetPlayers()
    table.insert(SignalEms, {coords = coords, name = name})
    for i = 1, #xPlayers do 
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if (xPlayer.getJob().name) == "ems" then
            TriggerClientEvent("fCore:EMS:SendNotification", xPlayers[i], coords)
        end 
    end
end)

RegisterNetEvent("fCore:EMS:DeleteCall")
AddEventHandler("fCore:EMS:DeleteCall", function(id)
    table.remove(SignalEms, id)
end)

ESX.RegisterServerCallback("fCore:Ems:GetDistressSignal", function(source, cb)
    cb(SignalEms)
end)


RegisterNetEvent("fCore:Ems:SendPointUniteX")
AddEventHandler("fCore:Ems:SendPointUniteX", function(coords, id)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    MySQL.Async.fetchAll("SELECT id FROM uniqueid WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    }, function(result)
        for k,v in pairs(result) do 
            TriggerClientEvent("fCore:Ems:PointUniteX", -1, coords, v.id)
        end
    end)
end)
