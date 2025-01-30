local robStats = false
local showPointCash = false
local showPointCash2 = false

function MarkerRobCash(v)
    robStats = true
    showPointCash = true
    showPointCash2 = true
    while robStats do 
        local interval = 1500
        local posPlayer = GetEntityCoords(PlayerPedId())
        local dest = v.takeCashTrolley 
        local dist = #(dest-posPlayer)
        if dist >= 40 then 
            robStats = false
            showPointCash = false
            showPointCash2 = false
            cNotification(TranslationIllegal.Fleeca["TooFar"])
            TriggerEvent("fCore:Fleeca:openDoors", 2)
            TriggerEvent("fCore:Fleeca:openDoors", 3)
        end
        if dist <= 15 and showPointCash then 
            interval = 0
            DrawMarker(20, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.2, 249,130, 42, 55555, false, true, 2, false, false, false, false)
            if dist <= 1.5 then 
                ESX.ShowHelpNotification("E", TranslationIllegal.Fleeca["CollectMoney"], "Information", {97, 32, 32})
                if IsControlJustPressed(1, 51) then 
                    showPointCash = false
                    StartGrab()
                end
            end
        end
        local destTroley2 = v.takeCashTrolley2 
        local dist = #(destTroley2-posPlayer)
        if dist <= 15 and showPointCash2 then 
            interval = 0
            DrawMarker(20, destTroley2.x, destTroley2.y, destTroley2.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.2, 249,130, 42, 55555, false, true, 2, false, false, false, false)
            if dist <= 1.5 then 
                ESX.ShowHelpNotification("E", TranslationIllegal.Fleeca["CollectMoney"], "Information", {97, 32, 32})
                if IsControlJustPressed(1, 51) then 
                    showPointCash2 = false
                    StartGrab()
                end
            end
        end
        Wait(interval)
    end
end


function StartGrab()
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"

    Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.0, GetHashKey("hei_prop_hei_cash_trolly_01"), false, false, false)
    local CashAppear = function()
	    local pedCoords = GetEntityCoords(ped)
        local grabmodel = GetHashKey(model)

        RequestModel(grabmodel)
        while not HasModelLoaded(grabmodel) do
            Citizen.Wait(100)
        end
	    local grabobj = CreateObject(grabmodel, pedCoords, true)

	    FreezeEntityPosition(grabobj, true)
	    SetEntityInvincible(grabobj, true)
	    SetEntityNoCollisionEntity(grabobj, ped)
	    SetEntityVisible(grabobj, false, false)
	    AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
	    local startedGrabbing = GetGameTimer()

	    Citizen.CreateThread(function()
		    while GetGameTimer() - startedGrabbing < 37000 do
			    Citizen.Wait(1)
			    DisableControlAction(0, 73, true)
			    if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
				    if not IsEntityVisible(grabobj) then
					    SetEntityVisible(grabobj, true, false)
				    end
			    end
			    if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
				    if IsEntityVisible(grabobj) then
                        SetEntityVisible(grabobj, false, false)
                        TriggerServerEvent("fCore:Fleeca:rewardCash")
				    end
			    end
		    end
		    DeleteObject(grabobj)
	    end)
    end
	local trollyobj = Trolley
    local emptyobj = GetHashKey("hei_prop_hei_cash_trolly_03")

	if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
		return
    end
    local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")

    RequestAnimDict("anim@heists@ornate_bank@grab_cash")
    RequestModel(baghash)
    RequestModel(emptyobj)
    while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
        Citizen.Wait(100)
    end
	while not NetworkHasControlOfEntity(trollyobj) do
		Citizen.Wait(1)
		NetworkRequestControlOfEntity(trollyobj)
	end
	local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
    local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
	NetworkStartSynchronisedScene(scene1)
	Citizen.Wait(1500)
	CashAppear()
	local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(scene2)
	Citizen.Wait(37000)
	local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(scene3)
    NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
    SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
	while not NetworkHasControlOfEntity(trollyobj) do
		Citizen.Wait(1)
		NetworkRequestControlOfEntity(trollyobj)
	end
	DeleteObject(trollyobj)
    PlaceObjectOnGroundProperly(NewTrolley)
	Citizen.Wait(1800)
	DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
	RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
	SetModelAsNoLongerNeeded(emptyobj)
    SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(50)
    end
end

function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end


function Drill(v)
    local ped = PlayerPedId()
    local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
    local animDict = 'anim_heist@hs3f@ig9_vault_drill@laser_drill@'
    loadAnimDict(animDict)
    local bagModel = 'hei_p_m_bag_var22_arm_s'
    loadModel(bagModel)
    local laserDrillModel = 'hei_prop_heist_drill'
    loadModel(laserDrillModel)

    RequestAmbientAudioBank("DLC_HEIST_FLEECA_SOUNDSET", 0)
    RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL", 0)
    RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2", 0)

    soundId = GetSoundId()

    cam = CreateCam("DEFAULT_ANIMATED_CAMERA", true)
    SetCamActive(cam, true)
    RenderScriptCams(true, 0, 3000, 1, 0)

    bag = CreateObject(GetHashKey(bagModel), pedCo, 1, 0, 0)
    laserDrill = CreateObject(GetHashKey(laserDrillModel), pedCo, 1, 0, 0)
    
    vaultPos = v.posPerceuse
    vaultRot = v.heading

    for i = 1, #LaserDrill['animations'] do
        LaserDrill['scenes'][i] = NetworkCreateSynchronisedScene(vaultPos, vaultRot, 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, LaserDrill['scenes'][i], animDict, LaserDrill['animations'][i][1], 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(bag, LaserDrill['scenes'][i], animDict, LaserDrill['animations'][i][2], 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(laserDrill, LaserDrill['scenes'][i], animDict, LaserDrill['animations'][i][3], 1.0, -1.0, 1148846080)
    end

    NetworkStartSynchronisedScene(LaserDrill['scenes'][1])
    PlayCamAnim(cam, 'intro_cam', animDict, vaultPos, vaultRot, 0, 2)
    Wait(GetAnimDuration(animDict, 'intro') * 1000)
    
    NetworkStartSynchronisedScene(LaserDrill['scenes'][2])
    PlayCamAnim(cam, 'drill_straight_start_cam', animDict, vaultPos, vaultRot, 0, 2)
    Wait(GetAnimDuration(animDict, 'drill_straight_start') * 1000)
    
    NetworkStartSynchronisedScene(LaserDrill['scenes'][3])
    PlayCamAnim(cam, 'drill_straight_idle_cam', animDict, vaultPos, vaultRot, 0, 2)
    PlaySoundFromEntity(soundId, "Drill", laserDrill, "DLC_HEIST_FLEECA_SOUNDSET", 1, 0)
    Drilling.Start(function(status)
        if status then
            StopSound(soundId)
            NetworkStartSynchronisedScene(LaserDrill['scenes'][5])
            PlayCamAnim(cam, 'drill_straight_end_cam', animDict, vaultPos, vaultRot, 0, 2)
            Wait(GetAnimDuration(animDict, 'drill_straight_end') * 1000)
            NetworkStartSynchronisedScene(LaserDrill['scenes'][6])
            PlayCamAnim(cam, 'exit_cam', animDict, vaultPos, vaultRot, 0, 2)
            Wait(GetAnimDuration(animDict, 'exit') * 1000)
            RenderScriptCams(false, false, 0, 1, 0)
            DestroyCam(cam, false)
            ClearPedTasks(ped)
            DeleteObject(bag)
            DeleteObject(laserDrill)
            TriggerEvent("fCore:Fleeca:openDoors", 3)
        else
            showPointPerceuse = true
            StopSound(soundId)
            NetworkStartSynchronisedScene(LaserDrill['scenes'][4])
            PlayCamAnim(cam, 'drill_straight_fail_cam', animDict, vaultPos, vaultRot, 0, 2)
            Wait(GetAnimDuration(animDict, 'drill_straight_fail') * 1000 - 1500)
            RenderScriptCams(false, false, 0, 1, 0)
            DestroyCam(cam, false)
            ClearPedTasks(ped)
            DeleteObject(bag)
            DeleteObject(laserDrill)
        end
    end)  
end







