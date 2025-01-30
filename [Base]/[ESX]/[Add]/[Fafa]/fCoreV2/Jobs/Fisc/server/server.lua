ESX.RegisterServerCallback("fCore:fisc:getSociety", function(source, cb)
    MySQL.Async.fetchAll("SELECT account_name, money, label FROM addon_account_data INNER JOIN addon_account ON addon_account_data.account_name = addon_account.name", function(result)
        cb(result)
    end)
end)

ESX.RegisterServerCallback("fCore:fisc:getHistoryBoss", function(source, cb)
    MySQL.Async.fetchAll("SELECT action, price, society FROM historyBoss", function(result)
        cb(result)
    end)
end)
    