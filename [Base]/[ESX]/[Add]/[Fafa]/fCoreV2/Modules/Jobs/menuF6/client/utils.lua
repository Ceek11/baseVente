Keys.Register('F6', "menuF6", 'Ouvrir le menuF6 job', function()
    for k,v in pairs(MenuF6.PoleEmploi.job) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == v then  
            if openF6PoleEmploi == false then
                openMenuF6PoleEmploi(v)
            end
        end
    end
    for k,v in pairs(MenuF6.Global.job) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == v then  
            if openF6Global == false then
                openMenuF6Global(v)
            end
        end
    end
    for k,v in pairs(MenuF6.Mecano.job) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == v then  
            if openF6Global == false then
                openMenuF6Mecano(v)
            end
        end
    end
    for k,v in pairs(MenuF6.Police.job) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == v then  
            if openMenuF6Police == false then
                MenuF6openPolice(v)
            end
        end
    end
    for k,v in pairs(MenuF6.Ambulance.job) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == v then  
            if openAmbulance == false then
                MenuF6openAmbulance(v)
            end
        end
    end
end)




