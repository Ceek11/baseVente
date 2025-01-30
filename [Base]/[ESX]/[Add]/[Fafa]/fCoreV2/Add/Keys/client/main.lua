RegisterCommand("doorCar", function()
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
    local statsDoors = nil
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        statsDoors = GetVehiclePedIsIn(PlayerPedId(), false)
    else
        statsDoors = GetClosestVehicle(x, y, z, 4.0, 0, 71) 
    end
    ESX.TriggerServerCallback("fCore:Keys:getPropertycar", function(result) 
        if result then 
            if GetVehicleDoorLockStatus(statsDoors) == 1 or GetVehicleDoorLockStatus(statsDoors) == 0 then
                SetVehicleDoorsLocked(statsDoors, 2)
				PlayVehicleDoorCloseSound(statsDoors, 1)
                cNotification("(~g~Succès~s~)\nVous avez verouillé votre véhicule.", "Action", "vert")
            elseif 
                GetVehicleDoorLockStatus(statsDoors) == 2 then
				SetVehicleDoorsLocked(statsDoors, 1)
				PlayVehicleDoorOpenSound(statsDoors, 0)
                cNotification("(~g~Succès~s~)\nVous avez déverouillé votre véhicule.", "Action", "vert")
            end
        else
            cNotification("(~r~Erreur~s~)\nVous avez pas les clés de ce véhicule.")
        end
    end, GetVehicleNumberPlateText(statsDoors))
end)

RegisterKeyMapping("doorCar", "Touche pour ouvrir/fermer vos véhicules", "keyboard", "U")



