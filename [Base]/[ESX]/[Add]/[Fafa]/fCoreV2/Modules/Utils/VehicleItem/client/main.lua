RegisterNetEvent("SpawnVehicle")
AddEventHandler("SpawnVehicle", function(name)
    SpawnVehicle(name, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()))
    TaskWarpPedIntoVehicle(PlayerPedId(), vehi, -1)
end)

CreateThread(function()
    local models = {GetHashKey("bmx")}
    local options = {
        {
            name = 'ox:option1',
            event = 'RemoveVehicle',
            icon = 'fa-solid fa-road',
            label = 'Récupérer le bmx',
            distance = 5,
            onSelect = function(data)
                local vehicle = data.entity
                local vehicleNetId = NetworkGetNetworkIdFromEntity(vehicle)
                TriggerServerEvent("fCore:RemoveVehicleFromServer", vehicleNetId)
            end
        },
    }
    exports.ox_target:addModel(models, options)
end)

