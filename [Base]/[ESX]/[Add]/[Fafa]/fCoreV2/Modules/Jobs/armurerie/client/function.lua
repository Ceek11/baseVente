function GetWeaponInSociety()
    WeaponInSocietyInBdd = {}
    ESX.TriggerServerCallback('Police:GetWeaponInSociety', function(WeaponInSociety) 
        for i = 1, #WeaponInSociety do 
            table.insert(WeaponInSocietyInBdd, WeaponInSociety[i])
        end
    end)
end

