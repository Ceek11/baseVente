ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem('radio', function(source) 
    local xPlayer = ESX.GetPlayerFromId(source) 
    TriggerClientEvent('Radio.Set', source, true) 
    TriggerClientEvent('Radio.Toggle', source) 
end)

ESX.RegisterServerCallback("getRadio", function(source, cb)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getItem = xPlayer.getInventoryItem("radio").count
    if getItem >= 1 then 
        cb(true)
    else
        cb(false)
    end
end)