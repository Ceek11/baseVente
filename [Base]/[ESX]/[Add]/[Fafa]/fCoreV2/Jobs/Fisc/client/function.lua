function getSocietyFisc()
    infoSociety = {}
    ESX.TriggerServerCallback("fCore:fisc:getSociety", function(result) 
        for i = 1, #result do
            table.insert(infoSociety, result[i])
        end
    end)
end

function getHistoryBoss()
    infoAction = {}
    ESX.TriggerServerCallback("fCore:fisc:getHistoryBoss", function(result) 
        for i = 1, #result do
            table.insert(infoAction, result[i])
        end
    end)
end

