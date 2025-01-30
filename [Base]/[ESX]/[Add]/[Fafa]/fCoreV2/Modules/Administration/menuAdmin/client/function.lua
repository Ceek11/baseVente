ESX = exports["es_extended"]:getSharedObject()

function cNotification(message)
    ESX.ShowNotification(message)
end

function SpawnVehicle(name, pos, heading, TaskWarp)
    RequestModel(name)
    while not HasModelLoaded(name) do
        Citizen.Wait(10)
    end
    vehi = CreateVehicle(name, pos, heading, true, false)
    if TaskWarp then 
        TaskWarpPedIntoVehicle(PlayerPedId(), vehi, -1)
    end
end


-- Crocheter le véhicule 
function CrochetVehicle()
    local playerPed = PlayerPedId()
    local vehicle = ESX.Game.GetVehicleInDirection()
    local coords = GetEntityCoords(playerPed)
    if IsPedSittingInAnyVehicle(playerPed) then
        cNotification(Translation.Function["leave_vehicle"])
        return
    end
    if DoesEntityExist(vehicle) then
        isBusy = true
        TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
        Citizen.CreateThread(function()
            Citizen.Wait(10000)
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            ClearPedTasksImmediately(playerPed)
            cNotification(Translation.Function["unlocked_vehicle"])
            isBusy = false
        end)
    else
        cNotification(Translation.Function["no_vehicle_nearby"])
    end
end


function ImpoundVehicle()
    local playerPed = PlayerPedId()
    if IsPedSittingInAnyVehicle(playerPed) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if GetPedInVehicleSeat(vehicle, -1) == playerPed then
            TriggerServerEvent("fCore:Police:AddInFourriere", GetVehicleNumberPlateText(vehicle))
            ESX.Game.DeleteVehicle(vehicle)
            cNotification(Translation.Function["car_has_been_impounded"])
        else
            cNotification(Translation.Function["driver_seat"])
        end
    else
        local vehicle = ESX.Game.GetVehicleInDirection()
        if DoesEntityExist(vehicle) then
            TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 0, true)
            Citizen.Wait(5000)
            ClearPedTasks(playerPed)
            TriggerServerEvent("fCore:Police:AddInFourriere", GetVehicleNumberPlateText(vehicle))
            ESX.Game.DeleteVehicle(vehicle)
            cNotification(Translation.Function["car_has_been_impounded"])
        else
            cNotification(Translation.Function["no_vehicle_nearby"])
        end
    end
end


function repairVehicle()
    local playerPed = PlayerPedId()
    local vehicle   = ESX.Game.GetVehicleInDirection()
    local coords    = GetEntityCoords(playerPed)

    if DoesEntityExist(vehicle) then
        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
        Citizen.CreateThread(function()
            Citizen.Wait(20000)
            SetVehicleFixed(vehicle)
            SetVehicleDeformationFixed(vehicle)
            SetVehicleUndriveable(vehicle, false)
            SetVehicleEngineOn(vehicle, true, true)
            ClearPedTasksImmediately(playerPed)
            cNotification(TranslationAdministration.MenuAdmin["CNotif_vehicleFix"] )
        end)
    else 
        cNotification(TranslationAdministration.MenuAdmin["CNotif_NothingVehicle"])
    end
end

function getCategorieVehicule()
    listCategorie = {}
    ESX.TriggerServerCallback("fCore:Boss:searchCategoriVehicle", function(listCategorieBdd) 
        for i = 1, #listCategorieBdd do 
            table.insert(listCategorie, listCategorieBdd[i])
        end
    end)
end

function getVehicleBdd()
    listVehicleConcess = {}
    ESX.TriggerServerCallback("fCore:Boss:searchVehicle", function(listVehicleConcessBdd) 
        for i = 1, #listVehicleConcessBdd do 
            table.insert(listVehicleConcess, listVehicleConcessBdd[i])
        end
    end)
end


function setMaxFuel()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleFuelLevel(vehicle, 100.0)
end

function cleanVehicle()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleDirtLevel(vehicle, 0)
end

function returnVehicleOnWheels()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleOnGroundProperly(vehicle)
    -- SetEntityHeading(vehicle, GetEntityHeading(vehicle)+180)
end

function returnVehicle()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetEntityHeading(vehicle, GetEntityHeading(vehicle)+180)
end

function deleteVehicle()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    DeleteVehicle(vehicle)
end

function changePlateVehicle(plate)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleNumberPlateText(vehicle, plate)
end

function freezeUnfreezeVehicle(status)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    FreezeEntityPosition(vehicle, status)
end

--showname
local showNames = false
function ShowNames(status)
    if status ~= nil then
        showNames = false
        return
    end
    showNames = not showNames
    if showNames then
        CreateThread(function()
            while showNames do
                
                local pCoords = GetEntityCoords(PlayerPedId(), false)
                for _, v in ipairs(GetActivePlayers()) do
                    local otherPed = GetPlayerPed(v)
                    local heal = GetEntityHealth(otherPed)
                    if otherPed ~= pPed then
                        if #(pCoords - GetEntityCoords(otherPed, false)) < 250.0 then
                            Administration.TableConfig.GamerTagsPlayer[v] = CreateFakeMpGamerTag(otherPed, (TranslationAdministration.MenuAdmin["InfosJoueurTags"]):format(GetPlayerServerId(v), idUnique, GetPlayerName(v), heal, ESX.PlayerData.job.label, ESX.PlayerData.job2.label), false, false, "", 0)
                            SetMpGamerTagVisibility(Administration.TableConfig.GamerTagsPlayer[v], 4, 1)
                        else
                            RemoveMpGamerTag(Administration.TableConfig.GamerTagsPlayer[v])
                            Administration.TableConfig.GamerTagsPlayer[v] = nil
                        end
                    end
                end
                for _,v in ipairs(GetActivePlayers()) do
                    if NetworkIsPlayerTalking(v) then
                        local pPed = GetPlayerPed(v)
                        local pCoords = GetEntityCoords(pPed)
                        DrawMarker(32, pCoords.x, pCoords.y, pCoords.z+1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                    end
                end
                Wait(0)
            end
            for _, v in pairs(GetActivePlayers()) do
                RemoveMpGamerTag(Administration.TableConfig.GamerTagsPlayer[v])
            end
        end)
    end
end


--godmode
local godmodeopti = false
function ShowGodMod(status)
    if status ~= nil then
        godmodeopti = false
        return
    end
    godmodeopti = not godmodeopti
    if godmodeopti then    
        Citizen.CreateThread(function()
            while godmodeopti do
                SetEntityInvincible(PlayerPedId(), true)
                Wait(1)
            end
            SetEntityInvincible(PlayerPedId(), false)
        end)
    end
end


RegisterNetEvent("fCore:revive")
AddEventHandler("fCore:revive", function(id)
    local playerPed = GetPlayerPed(GetPlayerFromServerId(id))
    if DoesEntityExist(playerPed) then
        isDead = false
        TriggerServerEvent("fCore:heal", id)
        TriggerServerEvent("esx:playerIsDead", 0)
        StopScreenEffect('DeathFailOut')
        SetEntityHealth(playerPed, 200)
        ClearPedTasksImmediately(playerPed)
        local coords = GetEntityCoords(playerPed)
        SetEntityCoords(playerPed, coords.x, coords.y, coords.z + 0.5, false, false, false, false)
        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z + 0.5, 0, true, false)
        SetPlayerInvincible(GetPlayerFromServerId(id), false)
        SetEntityInvincible(playerPed, false)
        SetEntityVisible(playerPed, true)
    end
end)

blipsActive = false
function ShowBlips(status)
    if status then 
        blipsActive = true
        CreateThread(function()
            while blipsActive do 
                for _, player in pairs(GetActivePlayers()) do
                    local found = false
                    if player ~= PlayerId() then
                        local ped = GetPlayerPed(player)
                        local blip = GetBlipFromEntity( ped )
                        if not DoesBlipExist( blip ) then
                            blip = AddBlipForEntity(ped)
                            SetBlipCategory(blip, 7)
                            SetBlipScale( blip,  0.85 )
                            ShowHeadingIndicatorOnBlip(blip, true)
                            SetBlipSprite(blip, 1)
                            SetBlipColour(blip, 0)
                        end
                        SetBlipNameToPlayerName(blip, player)
                        local veh = GetVehiclePedIsIn(ped, false)
                        local blipSprite = GetBlipSprite(blip)
                        if IsEntityDead(ped) then
                            if blipSprite ~= 303 then
                                SetBlipSprite( blip, 303 )
                                SetBlipColour(blip, 1)
                                ShowHeadingIndicatorOnBlip( blip, false )
                            end
                        elseif veh ~= nil then
                            if IsPedInAnyBoat( ped ) then
                                if blipSprite ~= 427 then
                                    SetBlipSprite( blip, 427 )
                                    SetBlipColour(blip, 0)
                                    ShowHeadingIndicatorOnBlip( blip, false )
                                end
                            elseif IsPedInAnyHeli( ped ) then
                                if blipSprite ~= 43 then
                                    SetBlipSprite( blip, 43 )
                                    SetBlipColour(blip, 0)
                                    ShowHeadingIndicatorOnBlip( blip, false )
                                end
                            elseif IsPedInAnyPlane( ped ) then
                                if blipSprite ~= 423 then
                                    SetBlipSprite( blip, 423 )
                                    SetBlipColour(blip, 0)
                                    ShowHeadingIndicatorOnBlip( blip, false )
                                end
                            elseif IsPedInAnyPoliceVehicle( ped ) then
                                if blipSprite ~= 137 then
                                    SetBlipSprite( blip, 137 )
                                    SetBlipColour(blip, 0)
                                    ShowHeadingIndicatorOnBlip( blip, false )
                                end
                            elseif IsPedInAnySub( ped ) then
                                if blipSprite ~= 308 then
                                    SetBlipSprite( blip, 308 )
                                    SetBlipColour(blip, 0)
                                    ShowHeadingIndicatorOnBlip( blip, false )
                                end
                            elseif IsPedInAnyVehicle( ped ) then
                                if blipSprite ~= 225 then
                                    SetBlipSprite( blip, 225 )
                                    SetBlipColour(blip, 0)
                                    ShowHeadingIndicatorOnBlip( blip, false )
                                end
                            else
                                if blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    SetBlipColour(blip, 0)
                                    ShowHeadingIndicatorOnBlip( blip, true )
                                end
                            end
                        else
                            if blipSprite ~= 1 then
                                SetBlipSprite( blip, 1 )
                                SetBlipColour(blip, 0)
                                ShowHeadingIndicatorOnBlip( blip, true )
                            end
                        end
                        if veh then
                            SetBlipRotation( blip, math.ceil( GetEntityHeading( veh ) ) )
                        else
                            SetBlipRotation( blip, math.ceil( GetEntityHeading( ped ) ) )
                        end
                    end
                end
            Wait(0)
            end
        end)
    else
        blipsActive = false
        for _, player in pairs(GetActivePlayers()) do
            local blip = GetBlipFromEntity(GetPlayerPed(player) )
            if blip ~= nil then
                RemoveBlip(blip)
            end
        end
    end
end

function updateExpiration()
    SetTimeout(60000, function()
        TriggerServerEvent("fCore:Admin:UpdateJail", fastTimer)
        updateExpiration()
    end)
end

function GetItemInBDD()
    GetItemMenuAdmin = {}
    ESX.TriggerServerCallback("fCore:MenuAdmin:GetItemInBDD", function(result) 
        for _,v in pairs(result) do 
            table.insert(GetItemMenuAdmin, v)
            finishToLoadTable = true
        end
    end)
end

function GetJobInBDD()
    GetJobMenuAdmin = {}
    ESX.TriggerServerCallback("fCore:MenuAdmin:GetJobInBDD", function(result) 
        for _,v in pairs(result) do 
            table.insert(GetJobMenuAdmin, v)
            finishToLoadJob = true
        end
    end)
end

function setPed(name)
    local hash = GetHashKey(name)
    RequestModel(hash)
    while not HasModelLoaded(hash) do 
        Wait(0)
    end
    SetPlayerModel(PlayerId(), hash)
    SetModelAsNoLongerNeeded(hash)
end

function setNormalPed()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        local isMale = skin.sex == 0
        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
            TriggerEvent('esx:restoreLoadout')
            end)
        end)
    end)
end

local statusGodmodeVehi = false
function godmodVehicle(status)
    statusGodmodeVehi = status    
    CreateThread(function()
        while statusGodmodeVehi do
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if IsPedInAnyVehicle(PlayerPedId(), -1) then 
                SetEntityInvincible(vehicle, true)
                SetVehicleFixed(vehicle)
                SetVehicleDeformationFixed(vehicle)
                SetVehicleUndriveable(vehicle, false)
                SetVehicleEngineOn(vehicle, true, true)
            else
                SetEntityInvincible(vehicle, false)
                statusGodmodeVehi = false
                godmodAdmin = false
            end
            SetEntityInvincible(vehicle, false)
            Wait(0)
        end
    end)
end

serversIdSession = {}
CreateThread(function()
    while true do 
        for _,v in pairs(GetActivePlayers()) do 
            local found = false 
            for _, j in pairs(serversIdSession) do 
                if GetPlayerServerId(v) == j then 
                    found = true
                end
            end
            if not found then 
                table.insert(serversIdSession, GetPlayerServerId(v))
            end
        end
        Wait(2000)
    end
end)

function getPlayerOffline()
    allUsers = {}
    allUsersLoad = false
    ESX.TriggerServerCallback("fCore:Admin:PlayerOffline", function(result) 
        for _,v in pairs(result) do 
            table.insert(allUsers, v)
        end
        allUsersLoad = true
    end)
end

playerInSession = {}
local isNewPlayer = false 
AddEventHandler("playerSpawned", function()
    if not isNewPlayer then 
        TriggerServerEvent("fCore:Admin:addNewPlayer")
        isNewPlayer = true
    end
end)


CreateThread(function()        
    TriggerServerEvent("fCore:Admin:addNewPlayer")
end)


RegisterNetEvent("fCore:Admin:addNewPlayerOnServer")
AddEventHandler("fCore:Admin:addNewPlayerOnServer", function(playerInServer)
    playerInSession = playerInServer 
end)


RegisterNetEvent("fCore:Admin:refreshPlayerOnServer")
AddEventHandler("fCore:Admin:refreshPlayerOnServer", function(playerInServer)
    playerInSession = playerInServer 
end)



RegisterNetEvent("fCore:Admin:messageAll")
AddEventHandler("fCore:Admin:messageAll", function(message)
    local scaleform = RequestScaleformMovie("mp_big_message_freemode")
    while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end
    BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieMethodParameterString("~y~WARNING")
    PushScaleformMovieMethodParameterString(message)
    PushScaleformMovieMethodParameterInt(5)
    EndScaleformMovieMethod()
    PlaySoundFrontend(-1, "LOSER", "HUD_AWARDS")
    local drawing = true
    Citizen.SetTimeout((8 * 1000),function() drawing = false end)
    while drawing do
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
    SetScaleformMovieAsNoLongerNeeded(scaleform)
end)

RegisterNetEvent("fCore:admin:PlayerWarn")
AddEventHandler("fCore:admin:PlayerWarn", function(message)
    local scaleform = RequestScaleformMovie("mp_big_message_freemode")
    while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end
    BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieMethodParameterString("~y~WARNING")
    PushScaleformMovieMethodParameterString(message)
    PushScaleformMovieMethodParameterInt(5)
    EndScaleformMovieMethod()
    PlaySoundFrontend(-1, "LOSER", "HUD_AWARDS")
    local drawing = true
    Citizen.SetTimeout((8 * 1000),function() drawing = false end)
    while drawing do
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
    SetScaleformMovieAsNoLongerNeeded(scaleform)
end)



RegisterNetEvent("fCore:Admin:showReport")
AddEventHandler("fCore:Admin:showReport", function(status)
    showReport(status)
end)


local reportEnCharge = 0
local reportEnAttente = 0
function updateStatusReport()
    reportEnCharge = 0
    reportEnAttente = 0

    for k, v in pairs(reportTable) do 
        if v.prisEnCharge then 
            reportEnCharge = reportEnCharge + 1
        else
            reportEnAttente = reportEnAttente + 1
        end
    end
end

local reportInProgress = false
function showReport(status)
    if status then 
        reportInProgress = true
        updateStatusReport()

        while reportInProgress do 
            Visual.Text({message = (TranslationAdministration.MenuAdmin["InfosReport"]):format(#reportTable, reportEnAttente, reportEnCharge)})   
            Wait(0)
        end
    else
        ClearPrints() 
        reportInProgress = false
    end
end

function markReportAsHandled(nbr)
    if reportTable[nbr] then
        reportTable[nbr].prisEnCharge = true
        updateStatusReport()
    end
end


function getWarn(id)
    warnList = {}
    warnListLoad = false
    ESX.TriggerServerCallback("fCore:Admin:getWarnList", function(result) 
        for k,v in pairs(result) do
            table.insert(warnList, v)
        end
        warnListLoad = true
    end, id)
end

function getBanPlayer(id)
    BanList = {}
    BanListLoad = false
    ESX.TriggerServerCallback("fCore:Admin:getBanList", function(result) 
        for k,v in pairs(result) do
            table.insert(BanList, v)
        end
        BanListLoad = true
    end, id)
end

local freezePlayer = false 
RegisterNetEvent("fCore:Admin:FreezePlayer")
AddEventHandler("fCore:Admin:FreezePlayer", function()
    if not freezePlayer then 
        FreezeEntityPosition(PlayerPedId(), true)
        freezePlayer = true
    else
        FreezeEntityPosition(PlayerPedId(), false)
        freezePlayer = false
    end
end)


function reparerVehicle()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleFixed(vehicle)
    SetVehicleDeformationFixed(vehicle)
    SetVehicleUndriveable(vehicle, false)
    SetVehicleEngineOn(vehicle, true, true)
end

local drawInfo = false
local drawTarget = 0

function DrawPlayerInfo(target)
    drawTarget = target
    drawInfo = true
end

function StopDrawPlayerInfo()
    drawInfo = false
    drawTarget = 0
end

Citizen.CreateThread(function()
    while true do
        local interval = 2000
        if drawInfo then
            interval = 0
            local targetPed = GetPlayerPed(drawTarget)
            Visual.Text({ message = TranslationAdministration.MenuAdmin["ArreterSpectateur"]})
            if IsControlJustPressed(0, 51) then
                NetworkSetInSpectatorMode(false, PlayerPedId())
                StopDrawPlayerInfo()
                cNotification(TranslationAdministration.MenuAdmin["SpectateurArrete"])
            end
        end
        Citizen.Wait(interval)
    end
end)

function SpectatePlayer(id)
    local targetPed = GetPlayerPed(GetPlayerFromServerId(id))
    local playerPed = PlayerPedId()
    local enable = targetPed ~= playerPed

    local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))
    RequestCollisionAtCoord(targetx, targety, targetz)
    NetworkSetInSpectatorMode(enable, targetPed)

    if enable then
        DrawPlayerInfo(GetPlayerFromServerId(id))
        cNotification(TranslationAdministration.MenuAdmin["SpectateurEnCours"])
    else
        StopDrawPlayerInfo()
        cNotification(TranslationAdministration.MenuAdmin["SpectateurArrete"])
    end
end

function FullVehicleBoost()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleModKit(vehicle, 0)
		SetVehicleMod(vehicle, 14, 0, true)
		SetVehicleNumberPlateTextIndex(vehicle, 5)
		ToggleVehicleMod(vehicle, 18, true)
		SetVehicleColours(vehicle, 0, 0)
		SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
		SetVehicleModColor_2(vehicle, 5, 0)
		SetVehicleExtraColours(vehicle, 111, 111)
		SetVehicleWindowTint(vehicle, 2)
		ToggleVehicleMod(vehicle, 22, true)
		SetVehicleMod(vehicle, 23, 11, false)
		SetVehicleMod(vehicle, 24, 11, false)
		SetVehicleWheelType(vehicle, 120)
		SetVehicleWindowTint(vehicle, 3)
		ToggleVehicleMod(vehicle, 20, true)
		SetVehicleTyreSmokeColor(vehicle, 0, 0, 0)
		LowerConvertibleRoof(vehicle, true)
		SetVehicleIsStolen(vehicle, false)
		SetVehicleIsWanted(vehicle, false)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetCanResprayVehicle(vehicle, true)
		SetPlayersLastVehicle(vehicle)
		SetVehicleFixed(vehicle)
		SetVehicleDeformationFixed(vehicle)
		SetVehicleTyresCanBurst(vehicle, false)
		SetVehicleWheelsCanBreak(vehicle, false)
		SetVehicleCanBeTargetted(vehicle, false)
		SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
		SetVehicleHasStrongAxles(vehicle, true)
		SetVehicleDirtLevel(vehicle, 0)
		SetVehicleCanBeVisiblyDamaged(vehicle, false)
		IsVehicleDriveable(vehicle, true)
		SetVehicleEngineOn(vehicle, true, true)
		SetVehicleStrong(vehicle, true)
		RollDownWindow(vehicle, 0)
		RollDownWindow(vehicle, 1)
		SetVehicleNeonLightEnabled(vehicle, 0, true)
		SetVehicleNeonLightEnabled(vehicle, 1, true)
		SetVehicleNeonLightEnabled(vehicle, 2, true)
		SetVehicleNeonLightEnabled(vehicle, 3, true)
		SetVehicleNeonLightsColour(vehicle, 0, 0, 255)
		
		SetPedCanBeDraggedOut(PlayerPedId(), false)
		SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
		SetPedRagdollOnCollision(PlayerPedId(), false)
		ResetPedVisibleDamage(PlayerPedId())
		ClearPedDecorations(PlayerPedId())
		SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)
	end
end


function infoPlayerAdmin(id)
    infoPlayer = {}
    loadInfoPlayer = false
    ESX.TriggerServerCallback("fCore:Admin:getInfoPlayer", function(result) 
        for k,v in pairs(result) do 
            table.insert(infoPlayer, v)
        end
        loadInfoPlayer = true
    end, id)
end


function getInventoryPlayer(id)
    infoInventoryPlayer = nil 
    infoBankPlayer = nil 
    loadInfoInventoryPlayer = false
    moneyPlayer = nil 
    blackmoneyPlayer = nil
    bankPlayer = nil
    ESX.TriggerServerCallback("fCore:Admin:getInventoryPlayer", function(inventory, money, blackmoney, bank)
        moneyPlayer = money
        blackmoneyPlayer = blackmoney
        bankPlayer = bank
        infoInventoryPlayer = inventory
        loadInfoInventoryPlayer = true
    end, id)
end


function getManageGrade()
    gestionAdmin = {}
    loadGestionAdmin = false
    ESX.TriggerServerCallback("fCore:Admin:manageGrade", function(result) 
        for k,v in pairs(result) do 
            table.insert(gestionAdmin, v)
        end
        loadGestionAdmin = true
    end)
end

function getPlayerAdmin()
    isAdmin = {} 
    loadIsAdmin = false
    ESX.TriggerServerCallback("fCore:Admin:getPlayerAdmin", function(result) 
        for k,v in pairs(result) do 
            table.insert(isAdmin, v)
        end
        loadIsAdmin = true
    end)
end

function checkPerms(labelPerms)
    for _,v in pairs(getPermsAdmin) do 
        
        if v.idgrade == getGroupA then

            permissions = json.decode(v.permissions)
            for _, perms in pairs(permissions) do 
                if perms.name == labelPerms then
                    if perms.status then 
                        return perms.status
                    end
                end
            end
        end
    end
end
