ESX = nil
ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem("bmx", function(source)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local bmxCount = xPlayer.getInventoryItem("bmx").count
    if bmxCount > 0 then
        xPlayer.removeInventoryItem("bmx", 1)
        sNotification(_src, Translation.VehicleItem["sNotif_spawn_bmx"], "Action", "vert")
        TriggerClientEvent("SpawnVehicle", _src, "bmx")
    end
end)


RegisterNetEvent("fCore:RemoveVehicleFromServer")
AddEventHandler("fCore:RemoveVehicleFromServer", function(vehicleNetId)
    local _src = source 
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getWeight = xPlayer.getWeight()
    if not xPlayer then return end
    if DoesEntityExist(vehicle) then
        checkPos(GetEntityCoords(vehicle), _src)
        local seat = GetPedInVehicleSeat(vehicle, -1)
        if seat == 0 then
            if getWeight < Cfg.maxWeight then 
                DeleteEntity(vehicle)
                xPlayer.addInventoryItem("bmx", 1)
                sNotification(_src, Translation.VehicleItem["sNotif_collect_vehicle"], "Action", "vert")
            else
                sNotification(_src, "Vous n'avez pas assez de place sur vous") 
            end
        else
            sNotification(_src, Translation.VehicleItem["sNotif_vehicle_occupied"])
        end
    end
end)