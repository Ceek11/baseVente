function getKeysGive()
    KeysGive = {}
    canOpen = false
    ESX.TriggerServerCallback("fCore:Garage:GetKeysGive", function(result) 
        for k,v in pairs(result) do 
            table.insert(KeysGive, v)
        end
        canOpen = true
    end)
end