RegisterNetEvent("fCore:Chasse:ButcherAnimal")
AddEventHandler("fCore:Chasse:ButcherAnimal", function(item)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getWeight = xPlayer.getWeight()
    if getWeight < Cfg.maxWeight then 
        xPlayer.addInventoryItem(item, 1)
        sNotification(_src, "Vous venez de recevoir x1 viande")
    else
        sNotification(_src, "Vous n'avez pas assez de place sur vous") 
    end
end)