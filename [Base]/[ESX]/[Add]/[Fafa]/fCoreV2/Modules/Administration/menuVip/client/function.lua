function Getcoins() 
    getNumbercoins = {}
    ESX.TriggerServerCallback("fCore:menuVip:Getcoins", function(result) 
        for k,v in pairs(result) do 
            table.insert(getNumbercoins, v)
        end
    end)
end

