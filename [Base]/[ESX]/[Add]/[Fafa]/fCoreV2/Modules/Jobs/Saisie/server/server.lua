ESX.RegisterServerCallback('fCore:Saisie:GetInventory', function(source, cb)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local items = xPlayer.getInventory()
    cb(items)
end)


RegisterNetEvent('fCore:Saisie:InventoryDepo')
AddEventHandler("fCore:Saisie:InventoryDepo", function(Society, QuantityDepo, name, label)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    TriggerEvent('esx_addoninventory:getSharedInventory', Society, function(inventory)
        local item = inventory.getItem()
        local PlayerItemCount = xPlayer.getInventoryItem(name).count
        if item.count >= 0 and QuantityDepo <= PlayerItemCount then
            xPlayer.removeInventoryItem(name, QuantityDepo)
            inventory.addItem(name, QuantityDepo)
            sNotification(_src, ("Vous venez de déposer x%s %s"):format(QuantityDepo, label), "Action", "vert")
        else
            sNotification(_src, "C'est une quantité invalide")
        end
    end)
end)

ESX.RegisterServerCallback("fCore:Saisie:GetChestInventory", function(source, cb, Society)
    TriggerEvent('esx_addoninventory:getSharedInventory', Society, function(inventory)
        cb(inventory.items)
    end)
end)

RegisterNetEvent('fCore:Saisie:TakeObject')
AddEventHandler('fCore:Saisie:TakeObject', function(Society, QuantityTake, name, label)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getWeight = xPlayer.getWeight()
    if not xPlayer then return end 
    if getWeight < Cfg.maxWeight then 
        TriggerEvent('esx_addoninventory:getSharedInventory', Society, function(inventory)
            local item = inventory.getItem(name)
            if item.count >= QuantityTake then 
                inventory.removeItem(name, QuantityTake)
                xPlayer.addInventoryItem(name, QuantityTake)
                sNotification(_src, ("Vous venez de prendre x%s %s"):format(QuantityTake, label), "Action", "vert")
            else 
                sNotification(_src, "C'est une quantité invalide")
            end
        end)
    else 
        sNotification(_src, "Vous n'avez pas assez de place sur vous")
    end
end)
