ESX = nil 
local player = PlayerPedId()
local coords = GetEntityCoords(player)

Citizen.CreateThread(function()
    local interval = 3000
    while true do
        local playerId = PlayerId()
        local playerPed = GetPlayerPed(playerId)

        local isInVehicle = IsPedInAnyVehicle(playerPed, false)
        if isInVehicle then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            if IsEntityAVehicle(vehicle) then -- Vérifie si l'entité est un véhicule
                local model = GetEntityModel(vehicle)
                local displayName = GetDisplayNameFromVehicleModel(model)
                if displayName == "bumpercar" then 
                    interval = 0
                    SetVehicleFuelLevel(vehicle, 100.0)
                    SetEntityInvincible(vehicle, true)
                else
                    interval = 3000
                end
            end
        else
            interval = 3000
        end
        Wait(interval)
    end
end)



---- Désactiver les roulades 
Citizen.CreateThread(function()
    while true do
        local interval = 2000
        local playerPed = PlayerPedId()
        local isAiming = IsPlayerFreeAiming(PlayerId())
        
        if isAiming then
            interval = 0
            if IsControlPressed(0, 25) then 
                DisableControlAction(0, 22, true)
            end
        end
        Citizen.Wait(interval)
    end
end)



---- DESACTIVER COUPS DE CROSS 
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            interval = 0
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
        Wait(interval)
    end
end)

WeaponNoHeadShop = {
    "weapon_gusenberg", 
    "weapon_machinepistol",
    "weapon_bat",
}

------- No drop arme pnj  and no headshot
Citizen.CreateThread(function()
    local playerPed = PlayerPedId() -- Stocker l'ID du joueur
    while true do
        local weapon = GetSelectedPedWeapon(PlayerPedId())
        for k,v in pairs(WeaponNoHeadShop) do
            if weapon == GetHashKey(v) then
                SetPedSuffersCriticalHits(PlayerPedId(), false)
            end
        end
        SetPedSuffersCriticalHits(playerPed, false) -- Désactiver les coups critiques
        RemoveAllPickupsOfType(0xDF711959) -- Supprimer les carabines
        RemoveAllPickupsOfType(0xF9AFB48F) -- Supprimer les pistolets
        RemoveAllPickupsOfType(0xA9355DCD) -- Supprimer les pompes à canon scié
        Wait(200) -- Attente de 1 seconde entre chaque itération
    end
end)

-- -- Remove Police NPC
Citizen.CreateThread(function() 
    while true do
        local playerPed = PlayerPedId()
        local playerLocalisation = GetEntityCoords(playerPed)
        ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
        DisablePlayerVehicleRewards(PlayerId()) -- No drop weapon in car
        Citizen.Wait(200)
    end
end)



-------- Changement de place 1 2 3 4
Citizen.CreateThread(function()
    while true do
        local interval = 2000
        local plyPed = PlayerPedId()
        if IsPedSittingInAnyVehicle(plyPed) then
            local plyVehicle = GetVehiclePedIsIn(plyPed, false)
            CarSpeed = GetEntitySpeed(plyVehicle) * 3.6 
            if CarSpeed <= 5.0 then
                interval = 0
                if IsControlJustReleased(0, 157) then -- conducteur : 1
                    SetPedIntoVehicle(plyPed, plyVehicle, -1)
                    Citizen.Wait(10)
                end
                if IsControlJustReleased(0, 158) then -- avant droit : 2
                    SetPedIntoVehicle(plyPed, plyVehicle, 0)
                    Citizen.Wait(10)
                end
                if IsControlJustReleased(0, 160) then -- arriere gauche : 3
                    SetPedIntoVehicle(plyPed, plyVehicle, 1)
                    Citizen.Wait(10)
                end
                if IsControlJustReleased(0, 164) then -- arriere droite : 4
                    SetPedIntoVehicle(plyPed, plyVehicle, 2)
                    Citizen.Wait(10)
                end
            end
        end
    Wait(interval)
    end
end)


idUnique = nil

AddEventHandler('esx:playerLoaded', function()
    ESX.TriggerServerCallback("fCore:Echap:CheckIdUnique", function(result) 
        idUnique = result
        SetData(idUnique)
    end)
end)

CreateThread(function()
    ESX.TriggerServerCallback("fCore:Echap:CheckIdUnique", function(result) 
        idUnique = result
        SetData(idUnique)
    end)
end)


players = {}
CreateThread(function()
    while true do 
        for _, player in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(player)
            table.insert(players, player)
        end
        Wait(60000)
    end
end)

function SetData(idUnique)
    local name = GetPlayerName(PlayerId())
    local id = GetPlayerServerId(PlayerId())
    Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', ("~b~FafaDev FA •  ~b~Id Unique: ~s~%s ~b~•~b~  Id: ~s~%s ~b~•~b~ Joueurs: ~s~%s/850"):format(idUnique,id, #players))
end


RegisterCommand("id", function()
    ESX.ShowNotification(("Votre id est : %s | Id unique : %s"):format(GetPlayerServerId(PlayerId()), idUnique))
end)


Citizen.CreateThread(function()
    while true do
        AddTextEntry('PM_SCR_MAP', '~b~Carte de Los Santos')
        AddTextEntry('PM_SCR_GAM', '~r~Prendre l\'avion')
        AddTextEntry('PM_SCR_INF', '~g~Logs')
        AddTextEntry('PM_SCR_SET', '~p~Configuration')
        AddTextEntry('PM_SCR_STA', '~b~Statistiques')
        AddTextEntry('PM_SCR_GAL', '~y~Galerie')
        AddTextEntry('PM_SCR_RPL', '~y~Éditeur ∑')
        AddTextEntry('PM_PANE_CFX', '~b~FafaDev') -- MEttre le nom de votre serveur
        AddTextEntry('PM_PANE_LEAVE', '~p~Se déconnecter de SERVEUR'); -- Mettre le nom de votre serveur
        AddTextEntry('PM_PANE_QUIT', '~r~Quitter FiveM');
        Citizen.Wait(5000)
    end
end)


-- --- Désactivation des pnj gang attaquent
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_LOST"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_SALVA"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_HILLBILLY"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_BALLAS"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MEXICAN"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_FAMILY"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MARABUNTE"), GetHashKey('PLAYER'))

SetRelationshipBetweenGroups(1, GetHashKey("GANG_1"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("GANG_2"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("GANG_9"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("GANG_10"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("FIREMAN"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("MEDIC"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("COP"), GetHashKey('PLAYER'))

-- -- ---Anti vol pnj
Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()
        local veh = GetVehiclePedIsTryingToEnter(player)
        local interval = 2000
        if veh and DoesEntityExist(veh) then
            interval = 0
            local lockStatus = GetVehicleDoorLockStatus(veh)
            if lockStatus == LOCKED then
                SetVehicleDoorsLocked(veh, LOCKED_FOR_PLAYER)
            end
            local ped = GetPedInVehicleSeat(veh, -1)
            if ped then
                SetPedCanBeDraggedOut(ped, false)
            end
        end
        Citizen.Wait(interval)
    end
end)



-- --- Désactivation des DriveBy
local passengerDriveBy = false
Citizen.CreateThread(function()
    while true do
        local interval = 2000
        playerPed = PlayerPedId()
        car = GetVehiclePedIsIn(playerPed, false)
        if IsPedInAnyVehicle(PlayerPedId(), false) then 
            if car then
                interval = 0
                if GetPedInVehicleSeat(car, -1) == playerPed then
                    SetPlayerCanDoDriveBy(PlayerId(), false)
                elseif passengerDriveBy then
                    SetPlayerCanDoDriveBy(PlayerId(), true)
                else
                    SetPlayerCanDoDriveBy(PlayerId(), true)
                end
            end
        end
        Wait(interval)
    end
end)

function checkFormatAffichage()
    local aspectRatio = GetAspectRatio(0)
    local tolerance = 0.02

    if math.abs(aspectRatio - (16/9)) <= tolerance then
        return
    end

    if math.abs(aspectRatio - (16/10)) <= tolerance then
        return
    end
end

CreateThread(function()
    checkFormatAffichage()
end)


local Dropped = {}
local DroppedTimeouts = {}

RegisterNetEvent("fCore:Utils:MeDropped")
AddEventHandler("fCore:Utils:MeDropped", function(id, coords)
    Dropped[id] = true

    if DroppedTimeouts[id] then
        ClearTimeout(DroppedTimeouts[id])
    end

    DroppedTimeouts[id] = SetTimeout(10000, function()
        Dropped[id] = false
        DroppedTimeouts[id] = nil
    end)

    CreateThread(function()
        while Dropped[id] or DroppedTimeouts[id] do
            local interval = 1000
            local posPlayer = GetEntityCoords(PlayerPedId())
            local dist = #(coords - posPlayer) 
            if dist <= 10 then 
                interval = 0
                DrawName3D(coords.x, coords.y, coords.z, ("Déconnexion de l'id : %s"):format(id), 255, 255, 255)
            end
            Wait(interval)
        end
    end)
end)



local knockedOut = false
local notificationSent = false
local wait = 15
local count = 60



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local myPed = PlayerPedId()

        if not knockedOut then
            if IsPedInMeleeCombat(myPed) and HasPedBeenDamagedByWeapon(myPed, GetHashKey("WEAPON_UNARMED"), 0) and GetEntityHealth(myPed) < 140 then
                SetEntityInvincible(myPed, false)
                SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 2.5)
                knockedOut = true
                notificationSent = false
            end
        else
            if not notificationSent then
                cNotification("Vous avez été mis k.o")
                notificationSent = true
            end

            SetEntityInvincible(myPed, true)
            DisablePlayerFiring(myPed, true)
            SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
            ResetPedRagdollTimer(myPed)
            SetTimecycleModifier("REDMIST")
            ShakeGameplayCam("VIBRATE_SHAKE", 1.0)

            count = count - 1
            if count == 0 then
                count = 60
                wait = wait - 1
                if wait >= 0 and GetEntityHealth(myPed) <= 160 then
                    SetEntityHealth(myPed, GetEntityHealth(myPed) + 2)
                else
                    knockedOut = false
                    wait = 15
                    count = 60
                    SetTimecycleModifier("")
                    SetTransitionTimecycleModifier("")
                    SetEntityInvincible(myPed, false)
                end
            end
        end
    end
end)