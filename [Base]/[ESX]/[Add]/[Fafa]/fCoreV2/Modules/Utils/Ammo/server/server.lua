ESX = nil
ESX = exports["es_extended"]:getSharedObject()
function UseAmmoBox(source, item, ammoType, ammoAmount)
    TriggerEvent("fCore:use_box_ammo", source, item, ammoType, ammoAmount)
end

ESX.RegisterUsableItem('boite_mun_pistol', function(source)
    UseAmmoBox(source, 'boite_mun_pistol', "pistol_ammo", 24)
end)

ESX.RegisterUsableItem('boite_mun_assault', function(source)
    UseAmmoBox(source, 'boite_mun_assault', "rifle_ammo", 60)
end)

ESX.RegisterUsableItem('boite_mun_mitraillette', function(source)
    UseAmmoBox(source, 'boite_mun_mitraillette', "smg_ammo", 42)
end)

ESX.RegisterUsableItem('boite_mun_pompe', function(source)
    UseAmmoBox(source, 'boite_mun_pompe', "shotgun_ammo", 8)
end)


RegisterNetEvent("fCore:use_box_ammo")
AddEventHandler("fCore:use_box_ammo", function(_src, boite, munition, nbrMunition)
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local getItem = xPlayer.getInventoryItem(boite).count
    local getWeight = xPlayer.getWeight()
    if getItem > 0 then 
        if getWeight < Cfg.maxWeight then 
            xPlayer.removeInventoryItem(boite, 1)
            xPlayer.addInventoryItem(munition, nbrMunition)
        else
            sNotification(_src, "Vous n'avez pas assez de place sur vous") 
        end
    end
end)