local DragStatus = {}
DragStatus.isDragged = false
DragStatus.dragger = tonumber(draggerId)


RegisterNetEvent('fCore:Police:handcuff')
AddEventHandler('fCore:Police:handcuff', function(target)
    IsHandcuffed    = not IsHandcuffed;
    local playerPed = PlayerPedId()
    Citizen.CreateThread(function()
        if IsHandcuffed then
            RequestAnimDict('mp_arresting')
            while not HasAnimDictLoaded('mp_arresting') do
                Citizen.Wait(100)
            end
            TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
            while IsHandcuffed do 
                DisableControlAction(2, 37, true)
                SetEnableHandcuffs(playerPed, true)
                SetPedCanPlayGestureAnims(playerPed, false)
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 25, true) -- Aim
                DisableControlAction(0, 37, true) -- Select Weapon
                DisableControlAction(0, 47, true) -- Disable weapon
                Wait(0)
            end
            DisplayRadar(false)
        else
            ClearPedSecondaryTask(playerPed)
            SetEnableHandcuffs(playerPed, false)
            SetPedCanPlayGestureAnims(playerPed, true)
            DisplayRadar(true)
        end
    end)
end)

RegisterNetEvent('fCore:Police:drag')
AddEventHandler('fCore:Police:drag', function(draggerId)
    DragStatus.isDragged = not DragStatus.isDragged
    DragStatus.dragger = tonumber(draggerId)
    if not DragStatus.isDragged then
        DetachEntity(PlayerPedId(), true, false)
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        local plyPed = PlayerPedId()
        if DragStatus.isDragged then
            local target = GetPlayerFromServerId(DragStatus.dragger)
            if target ~= PlayerId() and target > 0 then
                local targetPed = GetPlayerPed(target)
                if not IsPedSittingInAnyVehicle(targetPed) then
                    AttachEntityToEntity(plyPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                else
                    DragStatus.isDragged = false
                    DetachEntity(plyPed, true, false)
                end
            else
                Wait(500)
            end
        else
            Wait(500)
        end
    end
end)

RegisterNetEvent('fCore:Police:putInVehicle')
AddEventHandler('fCore:Police:putInVehicle', function()
    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)
    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
        local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  5.0,  0,  71)
        if DoesEntityExist(vehicle) then
            local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
            local freeSeat = nil
            for i=maxSeats - 1, 0, -1 do
                if IsVehicleSeatFree(vehicle,  i) then
                freeSeat = i
                break
                end
            end
            if freeSeat ~= nil then
                TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
            end
        end
    end
end)

RegisterNetEvent('fCore:Police:OutVehicle')
AddEventHandler('fCore:Police:OutVehicle', function(t)
    local ped = GetPlayerPed(t)
    ClearPedTasksImmediately(ped)
    plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
    local xnew = plyPos.x+2
    local ynew = plyPos.y+2
    SetEntityCoords(GetPlayerPed(-1), xnew, ynew, plyPos.z)
end)

RegisterNetEvent('fCore:Police:radarPolice')
AddEventHandler('fCore:Police:radarPolice', function (data)
    radarPolice()
end)


RegisterNetEvent('renfort:setBlip')
AddEventHandler('renfort:setBlip', function(coords, raison)
	if raison == 'Control en cours' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        cNotification(TranslationJob.Police["RequestLightRenfort"], TranslationJob.Police["RequestRenfort"], "vert")
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 2
	elseif raison == 'Fusillade en cours' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        cNotification(TranslationJob.Police["RequestImportantRenfort"], TranslationJob.Police["RequestRenfort"], "vert")
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 47
	elseif raison == 'Demande de renfort' or raison == "Refus d'optempérer" then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
        cNotification(TranslationJob.Police["RequestUrgenteRenfort"], TranslationJob.Police["RequestRenfort"], "vert")
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
		color = 1
	end
	local blipId = AddBlipForCoord(coords)
	SetBlipSprite(blipId, 161)
	SetBlipScale(blipId, 1.2)
	SetBlipColour(blipId, color)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(TranslationJob.Police["RequestRenfort"])
	EndTextCommandSetBlipName(blipId)
	Wait(80 * 1000)
	RemoveBlip(blipId)
end)


CreateThread(function()
    local trackedEntities = {
        `p_ld_stinger_s`,
    }
    while true do
        local Sleep = 1500
        local playerCoords = GetEntityCoords(PlayerPedId())
        local closestDistance = -1
        local closestEntity = nil
        for i = 1, #trackedEntities do
            local object = GetClosestObjectOfType(playerCoords, 3.0, trackedEntities[i], false, false, false)
            if DoesEntityExist(object) then
                Sleep = 500
                local objCoords = GetEntityCoords(object)
                local distance = #(playerCoords - objCoords)

                if closestDistance == -1 or closestDistance > distance then
                    closestDistance = distance
                    closestEntity = object
                end
            end
        end
        if closestDistance ~= -1 and closestDistance <= 3.0 then
            if LastEntity ~= closestEntity then
                TriggerEvent('esx_policejob:hasEnteredEntityZone', closestEntity)
                LastEntity = closestEntity
            end
        else
            if LastEntity then
                TriggerEvent('esx_policejob:hasExitedEntityZone', LastEntity)
                LastEntity = nil
            end
        end
        Wait(Sleep)
    end
end)

AddEventHandler('esx_policejob:hasEnteredEntityZone', function(entity)
    local playerPed = PlayerPedId()
    if GetEntityModel(entity) == `p_ld_stinger_s` and IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed)
        for i = 0, 7 do
            SetVehicleTyreBurst(vehicle, i, true, 1000)
        end
    end
end)
