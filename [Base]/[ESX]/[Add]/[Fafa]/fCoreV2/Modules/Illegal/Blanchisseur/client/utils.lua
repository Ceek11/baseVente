function getInformationPlayer()
    informationPlayer = {}
    ESX.TriggerServerCallback("fCore:Blanchisseur:GetInformation", function(infoBlanchiment)
        for i = 1, #infoBlanchiment do 
            table.insert(informationPlayer, infoBlanchiment[i])
        end
    end)
end