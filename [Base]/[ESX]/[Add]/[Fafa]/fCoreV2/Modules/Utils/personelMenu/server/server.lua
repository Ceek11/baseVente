ESX = nil
ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("fCore:personelMenu:helmetAuto")
AddEventHandler("fCore:personelMenu:helmetAuto", function(state)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local query = "UPDATE users SET helmet = @helmet WHERE identifier = @identifier"
    if state then 
        MySQL.Async.execute(query, {["@helmet"] = 1,["@identifier"] = xPlayer.getIdentifier()})
    else 
        MySQL.Async.execute(query, {["@helmet"] = 0,["@identifier"] = xPlayer.getIdentifier()})
    end
end)

ESX.RegisterServerCallback("fCore:personelMenu:GetStatsHelmet", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local query = "SELECT helmet FROM users WHERE identifier = @identifier"
    local param = {["@identifier"] = xPlayer.getIdentifier()}
    MySQL.Async.fetchAll(query, param, function(result)
        cb(result)
    end)
end)

ESX.RegisterServerCallback("fCore:personelMenu:GetInformation", function(source, cb)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local job = xPlayer.job.label
    local job2 = xPlayer.job2.label
    local money = xPlayer.getAccount('money').money
    local bank = xPlayer.getAccount('bank').money
    local black_money = xPlayer.getAccount('black_money').money
    -- local query = "SELECT job2, label FROM users INNER JOIN jobs ON users.job2 = jobs.name WHERE users.identifier = @identifier"
    -- local param = {["@identifier"] = xPlayer.getIdentifier()}
    -- MySQL.Async.fetchAll(query, param, function(result)
        cb(job, money, bank, black_money, job2)
    -- end)
end)