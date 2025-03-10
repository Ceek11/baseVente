isVehicleInfoLoaded = false
local vehiclesSpawned = false -- variable pour garder la trace de l'état du spawn de véhicule
local spawnedVehicles = {} -- variable pour stocker les véhicules créés
local drawMarkerActive = false
Citizen.CreateThread(function()
    getVehicleInOccasion()
    while not isVehicleInfoLoaded do 
        Wait(100) -- mettre en pause l'exécution du code pendant 100 millisecondes
    end
    while true do 
        if drawMarkerActive then 
            getVehicleInOccasion()
            drawMarkerActive = false
        end
        local interval = 1000
        local playerPos = GetEntityCoords(PlayerPedId())
        for _,v in pairs(venteOccasion.PointVente) do 
            local dest = v.pos
            local dist = #(playerPos-dest)
            if IsPedInAnyVehicle(PlayerPedId(), false) and dist <= 3 then
                interval = 0
                ESX.ShowHelpNotification("E", v.texte, "Information", {97, 32, 32})
                if IsControlJustPressed(1, 51) then 
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    local vehicleModel = GetEntityModel(vehicle)
                    local vehicleLabel = GetLabelText(GetDisplayNameFromVehicleModel(vehicleModel))
                    local vehicleCustom = ESX.Game.GetVehicleProperties(vehicle)
                    local input = lib.inputDialog("Choisir le prix", {" "})
                    if input then
                        local price = input[1]
                        if tonumber(price) then 
                            TriggerServerEvent("fCore:VenteOccasion:resell", price, vehicleLabel, vehicleCustom, vehicleModel, vehicle, v.pos)
                        else
                            cNotification("Vous n'avez pas mis de prix")
                        end
                    end  
                end
            end
            if dist <= 400 then 
                if not vehiclesSpawned then
                    vehiclesSpawned = true 
                    spawnVehicle()
                    DrawMarker3d()
                end
            else 
                if vehiclesSpawned then
                    vehiclesSpawned = false 
                    despawnVehicles()
                end
            end
        end
        Wait(interval)
    end
end)

function spawnVehicle()
    for k,v in pairs(infoVehicleOccasion) do
        local parkingCoords = json.decode(v.pointParking)
        local custom = json.decode(v.vehicleCustom)
        RequestModel(v.model)
        while not HasModelLoaded(v.model) do
            Citizen.Wait(10)
        end
        local car = CreateVehicle(v.model, parkingCoords.x, parkingCoords.y, parkingCoords.z, parkingCoords.w, false, false)
        FreezeEntityPosition(car, true)
        ESX.Game.SetVehicleProperties(car, json.decode(v.vehicleCustom))
        table.insert(spawnedVehicles, {vehicle = car, plate = custom.plate})
    end
end

function DrawMarker3d()
    getVehicleInOccasion()
    CreateThread(function()
        while true do 
            for k,v in pairs(infoVehicleOccasion) do
                local parkingCoords = json.decode(v.pointParking)
                local custom = json.decode(v.vehicleCustom)
                local turbo = custom.modTurbo
                local modTubo = 0
                if turbo then 
                    modTubo = 1
                end
                local playerPos = GetEntityCoords(PlayerPedId())
                local dist = Vdist2(playerPos, parkingCoords.x, parkingCoords.y, parkingCoords.z)
                if dist <= 5 then 
                    DrawName3D(parkingCoords.x, parkingCoords.y, parkingCoords.z+2, "Appuyez sur ~b~E~s~ pour confirmer l'achat", 255,255,255)
                    DrawName3D(parkingCoords.x, parkingCoords.y, parkingCoords.z+1.8, ("Modèle: ~b~%s~s~\nPrix: ~b~%s$~s~\nmoteur ~b~%s~s~, freins ~b~%s~s~, trans. ~b~%s~s~, turbo ~b~%s~s~"):format(v.label, v.price, custom.modEngine+1,custom.modBrakes+1,custom.modTransmission+1, modTubo), 255,255,255)
                    if IsControlJustPressed(1, 51) then 
                        TriggerServerEvent("fCore:VenteOccasion:BuyVehicle", v.price, custom, v.id, parkingCoords)
                    end
                end
            end
            Wait(0)
        end
    end)
end

function despawnVehicles()
    for k,v in pairs(spawnedVehicles) do -- pour chaque véhicule spawné
        if DoesEntityExist(v.vehicle) then -- vérifier si l'entité existe toujours (pour éviter une erreur)
            DeleteEntity(v.vehicle) -- supprimer le véhicule
        end
    end
    spawnedVehicles = {} -- vider le tableau des véhicules spawnés
end

RegisterNetEvent("fCore:VenteOccasion:DeleteVehicleOnOccasion")
AddEventHandler("fCore:VenteOccasion:DeleteVehicleOnOccasion", function(plateDelete)
    for i = #spawnedVehicles, 1, -1 do
        local v = spawnedVehicles[i]
        if v.plate == plateDelete then
            table.remove(spawnedVehicles, i)
            if DoesEntityExist(v.vehicle) then -- vérifier si l'entité existe toujours (pour éviter une erreur)
                DeleteEntity(v.vehicle) -- supprimer le véhicule
                DrawMarker3d()
            end
        end
    end    
end)

RegisterNetEvent("fCore:VenteOccasion:NewVehicle")
AddEventHandler("fCore:VenteOccasion:NewVehicle", function(pointParking, vehicleCustom, vehicleLabel, price, vehicleModel)
    drawMarkerActive = true
    local parkingCoords = json.decode(pointParking)
    local custom = json.decode(vehicleCustom)
    local turbo = custom.modTurbo
    local modTubo = 0
    if turbo then 
        modTubo = 1
    end
    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do
        Citizen.Wait(10)
    end
    local car = CreateVehicle(vehicleModel, parkingCoords.x, parkingCoords.y, parkingCoords.z, parkingCoords.w, false, false)
    FreezeEntityPosition(car, true)
    ESX.Game.SetVehicleProperties(car, json.decode(vehicleCustom))
    table.insert(spawnedVehicles, {vehicle = car, plate = custom.plate})
end)

RegisterNetEvent("fCore:VenteOccasion:DeleteVehicle")
AddEventHandler("fCore:VenteOccasion:DeleteVehicle", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    ESX.Game.DeleteVehicle(vehicle)
end)

CreateThread(function()
    while true do 
        TriggerServerEvent("fCore:VenteOccasion:CheckTime")
        Wait(15*1000)
    end
end)