
RegisterNetEvent("fCore:MenuVip:giveInformationVehicle")
AddEventHandler("fCore:MenuVip:giveInformationVehicle", function(name)
    RequestModel(name)
    while not HasModelLoaded(name) do
        Citizen.Wait(10)
    end  
    local VehicleVipSpawn = CreateVehicle(name,  vec3(-6034.846680, -2180.933106, 97.000000), 40, false, false)
    local customVehicleVip = ESX.Game.GetVehicleProperties(VehicleVipSpawn)
    TriggerServerEvent("fCore:MenuVip:giveVehicle", customVehicleVip)
    DeleteEntity(VehicleVipSpawn)
end)