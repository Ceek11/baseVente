function getVehicleInOccasion()
    infoVehicleOccasion = {}
    ESX.TriggerServerCallback("fCore:VenteOccasion:inResell", function(infoVehicle) 
        for k,v in pairs(infoVehicle) do 
            table.insert(infoVehicleOccasion, v)
        end
        isVehicleInfoLoaded = true -- toutes les informations des véhicules ont été chargées
    end)
end
