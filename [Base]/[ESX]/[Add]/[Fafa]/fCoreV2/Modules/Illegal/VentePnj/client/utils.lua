local drugsell = false
sellingIn = true
RegisterCommand("Drugs", function()
    if not drugsell then 
        ESX.TriggerServerCallback("fCore:SellDrugs:CheckItemAndCops", function(can) 
            if can then
                drugsell = true
                ESX.ShowNotification(TranslationIllegal.VentePnj["ActiverVenteDrogue"])
            end
        end)
    else
        drugsell = false
        ESX.ShowNotification(TranslationIllegal.VentePnj["DesactiverVenteDrogue"])
    end
end)

local function CanSellToPed(ped)
	if not IsPedAPlayer(ped) and not IsEntityAMissionEntity(ped) and not IsPedInAnyVehicle(ped, false) and not IsEntityDead(ped) and IsPedHuman(ped) and GetEntityModel(ped) ~= GetHashKey("s_m_y_cop_01") and GetEntityModel(ped) ~= GetHashKey("s_m_y_dealer_01") and GetEntityModel(ped) ~= GetHashKey("mp_m_shopkeep_01") and ped ~= PlayerPedId() then 
		return true
	end
	return false
end

local function MakeEntityFaceEntity(entity1, entity2)
    local p1 = GetEntityCoords(entity1, true)
    local p2 = GetEntityCoords(entity2, true)
    local dx = p2.x - p1.x
    local dy = p2.y - p1.y
    local heading = GetHeadingFromVector_2d(dx, dy)
    SetEntityHeading( entity1, heading )
end

function animsAction(animObj, player)
    Citizen.CreateThread(function()
        if not playAnim then
            local playerPed = player
            if DoesEntityExist(playerPed) then -- Check if ped exist
                dataAnim = animObj
                RequestAnimDict(dataAnim.lib)
                while not HasAnimDictLoaded(dataAnim.lib) do
                    Citizen.Wait(0)
                end
                if HasAnimDictLoaded(dataAnim.lib) then
                    local flag = 0
                    if dataAnim.loop ~= nil and dataAnim.loop then
                        flag = 1
                    elseif dataAnim.move ~= nil and dataAnim.move then
                        flag = 49
                    end
                    TaskPlayAnim(playerPed, dataAnim.lib, dataAnim.anim, 8.0, -8.0, -1, flag, 0, 0, 0, 0)
                    playAnimation = true
                end
            end 
        end
    end)
end

function RequestAndWaitDict(dictName) -- Request une animation (dict)
	if dictName and DoesAnimDictExist(dictName) and not HasAnimDictLoaded(dictName) then
		RequestAnimDict(dictName)
		while not HasAnimDictLoaded(dictName) do Citizen.Wait(100) end
	end
end

function RequestAndWaitModel(modelName) -- Request un modèle de véhicule
	if modelName and IsModelInCdimage(modelName) and not HasModelLoaded(modelName) then
		RequestModel(modelName)
		while not HasModelLoaded(modelName) do Citizen.Wait(100) end
	end
end


CreateThread(function()
    while true do 
        local interval = 1500
        local pPos = GetEntityCoords(PlayerPedId())
        if drugsell and not IsPedInAnyVehicle(PlayerPedId()) then
            local retval, outEntity = FindFirstPed()
            local succesPed = nil 
            repeat
                pPos = GetEntityCoords(PlayerPedId())
                succesPed, outEntity = FindNextPed(retval)
                local cPos = GetEntityCoords(outEntity)
                local dst = Vdist(pPos.x, pPos.y, pPos.z, cPos.x, cPos.y, cPos.z)
                if dst <= 5.0 and CanSellToPed(outEntity) then
                    interval = 0
                    SetBlockingOfNonTemporaryEvents(outEntity, true)
					PlayAmbientSpeech2(outEntity, "GENERIC_HI", "SPEECH_PARAMS_FORCE")
					SetPedCanRagdollFromPlayerImpact(outEntity, false)
                    if dst <= 2.0 then 
                        if sellingIn then
                            ESX.ShowHelpNotification(TranslationIllegal.VentePnj["AppuyerPourVendre"])
                            if IsControlJustPressed(1, 51) then
                                ClearPedTasksImmediately(outEntity)
                                MakeEntityFaceEntity(PlayerPedId(), outEntity)
                                MakeEntityFaceEntity(outEntity, PlayerPedId())
                                openMenuSellDrugs(outEntity, cPos)
                            end
                        end
                    end
                end
            until not succesPed
            EndFindPed(retval)
        end
        Wait(interval)
    end
end)

function getInventoryItemSellDrugs()
    infoInventaire = {}
    ESX.TriggerServerCallback("fCore:SellDrugs:GetInventory", function(infoInv) 
        for i = 1, #infoInv do 
            table.insert(infoInventaire, infoInv[i])
        end
    end)
end
