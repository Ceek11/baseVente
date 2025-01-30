function getInformationVenteDarme(shop)
    InformationVenteDarme = {}
    ESX.TriggerServerCallback('fCore:ShopIllegal:GetInformation', function(infoVenteDarme)
        for i = 1, #infoVenteDarme do 
            table.insert(InformationVenteDarme, infoVenteDarme[i])
        end
    end,shop)
end