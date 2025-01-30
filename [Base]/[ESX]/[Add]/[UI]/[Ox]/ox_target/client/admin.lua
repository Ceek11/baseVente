local getGroup = nil

AddEventHandler('esx:playerLoaded', function()
    ESX.TriggerServerCallback("fCore:getGroup:Target", function(group)
        getGroup = group
    end)
end)

CreateThread(function()
    ESX.TriggerServerCallback("fCore:getGroup:Target", function(group)
        getGroup = group
    end)
end)

exports.ox_target:addGlobalVehicle({
    {
        name = 'namevehi',
        icon = 'fa-solid fa-car-rear',
        label = "<span style='color:#FF0000'>Réparer le véhicule</span>",
        canInteract = function(entity, distance, coords)
            if getGroup then
                if GetVehicleDoorLockStatus(entity) > 1 then
                    return false
                end
                local maxInteractionDistance = 5.0
                return #(coords - GetEntityCoords(entity)) < maxInteractionDistance
            end
        end,
        onSelect = function(data)
            SetVehicleFixed(data.entity)
            SetVehicleDeformationFixed(data.entity)
            SetVehicleUndriveable(data.entity, false)
            SetVehicleEngineOn(data.entity, true, true)        
        end
    },
    {
        name = 'namevehi',
        icon = 'fa-solid fa-car-rear',
        label = "<span style='color:#FF0000'>Retourner le véhicule (sur les roues)</span>",
        canInteract = function(entity, distance, coords)
            if getGroup then
                if GetVehicleDoorLockStatus(entity) > 1 then
                    return false
                end
                local maxInteractionDistance = 5.0
                return #(coords - GetEntityCoords(entity)) < maxInteractionDistance
            end
        end,
        onSelect = function(data)
            SetVehicleOnGroundProperly(data.entity)  
        end
    },
    {
        name = 'ownerVehicle',
        icon = 'fa-solid fa-car-rear',
        label = "<span style='color:#FF0000'>Le propriétaire</span>",
        canInteract = function(entity, distance, coords)
            if getGroup then
                if GetVehicleDoorLockStatus(entity) > 1 then
                    return false
                end
                local maxInteractionDistance = 5.0
                return #(coords - GetEntityCoords(entity)) < maxInteractionDistance
            end
        end,
        onSelect = function(data)
            local plate = GetVehicleNumberPlateText(data.entity)
            if DoesEntityExist(data.entity) then
                TriggerServerEvent("fCore:Police:searchPlateInBdd", plate)
            end
        end
    },
    {
        name = 'namevehi',
        icon = 'fa-solid fa-car-rear',
        label = "<span style='color:#FF0000'>Retourner le véhicule (180 degrès)</span>",
        canInteract = function(entity, distance, coords)
            if getGroup then
                if GetVehicleDoorLockStatus(entity) > 1 then
                    return false
                end
                local maxInteractionDistance = 5.0
                return #(coords - GetEntityCoords(entity)) < maxInteractionDistance
            end
        end,
        onSelect = function(data)
            SetEntityHeading(data.entity, GetEntityHeading(data.entity)+180)
        end
    },
    {
        name = 'deletevehi',
        icon = 'fa-solid fa-car-rear',
        label = "<span style='color:#FF0000'>Supprimer le véhicule</span>",
        canInteract = function(entity, distance, coords)
            if getGroup then
                if GetVehicleDoorLockStatus(entity) > 1 then
                    return false
                end
                local maxInteractionDistance = 5.0
                return #(coords - GetEntityCoords(entity)) < maxInteractionDistance
            end
        end,
        onSelect = function(data)
            if DoesEntityExist(data.entity) then
                ESX.Game.DeleteVehicle(data.entity)
            end
        end
    },
})


exports.ox_target:addGlobalPlayer({
    {
        name = 'Id',
        icon = "fa-solid fa-handcuffs",
        label = "<span style='color:#FF0000'>Heal la personne</span>",
        distance = 1.5,
        canInteract = function(entity, distance, coords)
            if getGroup then
                local maxInteractionDistance = 5.0
                return #(coords - GetEntityCoords(entity)) < maxInteractionDistance
            end
        end,
        onSelect = function(data)
            TriggerServerEvent("fCore:heal", GetPlayerIdFromPed(data.entity))
        end
    },
    {
        name = 'Id',
        icon = "fa-solid fa-handcuffs",
        label = "<span style='color:#FF0000'>Revive la personne</span>",
        distance = 1.5,
        canInteract = function(entity, distance, coords)
            if getGroup then
                local maxInteractionDistance = 5.0
                return #(coords - GetEntityCoords(entity)) < maxInteractionDistance
            end
        end,
        onSelect = function(data)
            TriggerServerEvent("fCore:revive", GetPlayerIdFromPed(data.entity))
        end
    },
    {
        name = 'Id',
        icon = "fa-solid fa-handcuffs",
        label = "<span style='color:#FF0000'>Freeze la personne</span>",
        distance = 1.5,
        canInteract = function(entity, distance, coords)
            if getGroup then
                local maxInteractionDistance = 5.0
                return #(coords - GetEntityCoords(entity)) < maxInteractionDistance
            end
        end,
        onSelect = function(data)
            TriggerServerEvent("fCore:freezePlayer", GetPlayerIdFromPed(data.entity))
        end
    },
})
