function getInventoryGang()
    InventoryPlayer = {}
    loadCoffreGang = false
    ESX.TriggerServerCallback("fCore:Gang:getInventory", function(getInventory) 
        for k,v in pairs(getInventory) do 
            table.insert(InventoryPlayer, v)
        end
        loadCoffreGang = true
    end)
end


function getInventoryChestGang(society)
    chestGang = {}
    loadChestGang = false
    weightCount = 0
    ESX.TriggerServerCallback("fCore:Gang:getChestGang", function(result, weight) 
        for _,v in pairs(result) do 
            table.insert(chestGang, v)
        end
        weightCount = weight
        loadChestGang = true
    end, society)
end