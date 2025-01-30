local playerTime = {}

function LoadPlayerTime(player)
    local xPlayer = ESX.GetPlayerFromId(player)
    if not xPlayer then return end
    local identifier = xPlayer.getIdentifier()
    local query = "SELECT playtime FROM users WHERE identifier = @identifier"
    local param = {["@identifier"] = identifier}
    MySQL.Async.fetchScalar(query, param, function(playTime)
        if playTime then
            playerTime[player] = tonumber(playTime)
        else
            playerTime[player] = 0
        end
    end)
end

Citizen.CreateThread(function()
    while true do 
        Wait(500*60*5)
        for _, player in ipairs(GetPlayers()) do
            LoadPlayerTime(player)
            ESX.SetTimeout(1000,function()
                UpdatePlayerTime(player)
            end)
        end
    end
end)

function UpdatePlayerTime(player)
    local xPlayer = ESX.GetPlayerFromId(player)
    if not xPlayer then return end
    local identifier = xPlayer.getIdentifier()    
    local playTime = playerTime[player]
    if playTime then
        playTime = playTime + 5
        afficherHeure(playTime, player)
        MySQL.Async.execute("UPDATE users SET playtime = @playtime WHERE identifier = @identifier", {["@playtime"] = playTime, ["@identifier"] = identifier})
    end
end

function afficherHeure(n, player)
local heures = math.floor(n / 60)
local minutes = n % 60
    if minutes < 10 then
        minutes = "0"..minutes
    end
end

ESX.RegisterServerCallback("fCore:antiTroll:level", function(source, cb)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local identifier = xPlayer.getIdentifier()    
    local param = {["@identifier"] = identifier}
    local query = "SELECT playtime FROM users WHERE identifier = @identifier"
    local timeInfo = {}
    MySQL.Async.fetchAll(query, param, function(result)
        for k,v in pairs(result)do 
            table.insert(timeInfo, {time = v.playtime})
        end
        cb(timeInfo)
    end)
end)

RegisterServerEvent('checkPlayerTime')
AddEventHandler('checkPlayerTime', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then return end
    local identifier = xPlayer.getIdentifier()
    local query = 'SELECT playtime FROM users WHERE identifier = @identifier'
    local param = {['@identifier'] = identifier}
    MySQL.Async.fetchAll(query, param, function(result)
        if result[1].playtime < 30 then
            disableVehicleCollisions = true
            TriggerClientEvent('disableControlAction', _source, true)
        else
            disableVehicleCollisions = false
            TriggerClientEvent('disableControlAction', _source, false)
        end
    end)
end)
