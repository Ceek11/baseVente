_Concess =  {}
function _Concess:getCategorieVehicule()
    listCategorie = {}
    ESX.TriggerServerCallback("fCore:Boss:searchCategoriVehicle", function(listCategorieBdd) 
        for i = 1, #listCategorieBdd do 
            table.insert(listCategorie, listCategorieBdd[i])
        end
    end)
end

function _Concess:getVehicleBdd()
    listVehicleConcess = {}
    ESX.TriggerServerCallback("fCore:Boss:searchVehicle", function(listVehicleConcessBdd) 
        for i = 1, #listVehicleConcessBdd do 
            table.insert(listVehicleConcess, listVehicleConcessBdd[i])
        end
    end)
end

function updateRotationVehicle(heading)
    while isMenuVehicleOpened do
        if IsControlPressed(1, 174) then 
            heading = heading - 0.70
            if heading < 0 then
                heading = 360
            end
        elseif IsControlPressed(1, 175) then 
            heading = heading + 0.70
            if heading > 360 then
                heading = 0
            end
        end
        if DoesEntityExist(vehicule) then SetEntityHeading(vehicule, heading) end
        Wait(0)
    end
end



