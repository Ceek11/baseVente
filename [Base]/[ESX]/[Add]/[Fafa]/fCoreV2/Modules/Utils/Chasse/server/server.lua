RegisterNetEvent("fCore:Chasse:ButcherAnimal")
AddEventHandler("fCore:Chasse:ButcherAnimal", function(item)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
        xPlayer.addInventoryItem(item, 1)
        sNotification(_src, "Vous venez de recevoir x1 viande")
    
end)