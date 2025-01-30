ESX = exports["es_extended"]:getSharedObject()

local openSellDrugs = false 
menuSellDrugs = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuSellDrugs.Closed = function()
    openSellDrugs = false 
    sellingIn = true
    FreezeEntityPosition(PlayerPedId(), false)
end

function openMenuSellDrugs(outEntity,pPos)
    sellingIn = false
    getInventoryItemSellDrugs()
    if openSellDrugs then 
        openSellDrugs = false 
        RageUI.Visible(menuSellDrugs, false)
    else
        openSellDrugs = true 
        RageUI.Visible(menuSellDrugs, true)
        CreateThread(function()
            while openSellDrugs do 
                RageUI.IsVisible(menuSellDrugs, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    FreezeEntityPosition(outEntity, true)
                    if #infoInventaire > 0 then 
                        RageUI.Separator(TranslationIllegal.VentePnj["DroguesVendre"])
                        RageUI.Line("color", 19, 107, 190)
                        for k,v in pairs(infoInventaire) do 
                            if v.getItem >= 1 then
                                RageUI.Button(v.label, nil, {RightLabel = "~r~"..v.price.."$/u"}, true, {
                                    onActive = function()
                                        local coord = GetEntityCoords(outEntity)
                                        DrawMarker(0, coord.x, coord.y, coord.z + 1.1, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.2, 0.2, 0.2, 249, 130, 42, 55555, false, true, false, false)
                                    end,
                                    onSelected = function()
                                        local chance = math.random(1,100)
                                        if chance  < SellDrugs.percentageRefuse then
                                            openSellDrugs = false 
                                            RageUI.CloseAll()
                                            Wait(1)
                                            FreezeEntityPosition(PlayerPedId(), true)
                                            FreezeEntityPosition(outEntity, true)
                                            ESX.ShowNotification(TranslationIllegal.VentePnj["AttenteReflexion"])
                                            local pCreate = CreateObject(GetHashKey('prop_phone_cs_frank'), 0, 0, 0, true)
                                            AttachEntityToEntity(pCreate, outEntity, GetPedBoneIndex(outEntity, 57005), 0.13, 0.02, 0.0, 90.0, 0, 0, 1, 1, 0, 1, 0, 1)
                                            animsAction({ lib = "cellphone@", anim = "cellphone_text_read_base" }, outEntity)
                                            Wait(4000)
                                            FreezeEntityPosition(PlayerPedId(), false)
                                            FreezeEntityPosition(outEntity, false)
                                            ESX.ShowNotification(TranslationIllegal.VentePnj["PasInteresse"])
                                            TriggerServerEvent("NotifPolice", GetEntityCoords(PlayerPedId()))
                                            SetEntityAsMissionEntity(outEntity, true, true)
                                            DeleteObject(pCreate)
                                        else
                                            openSellDrugs = false 
                                            RageUI.CloseAll()
                                            Wait(1)
                                            FreezeEntityPosition(PlayerPedId(), true)
                                            FreezeEntityPosition(outEntity, true)
                                            RequestAndWaitDict("mp_common")
                                            RequestAndWaitModel("prop_meth_bag_01")                
                                            SetPedTalk(outEntity)
                                            PlayAmbientSpeech1(outEntity, 'GENERIC_HI', 'SPEECH_PARAMS_STANDARD')                     
                                            local cCreate = CreateObject(GetHashKey("prop_meth_bag_01"), 0, 0, 0, true)
                                            AttachEntityToEntity(cCreate, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)
                                            ESX.ShowNotification(TranslationIllegal.VentePnj["AttenteReflexion"])                                            Wait(4000)
                                            FreezeEntityPosition(PlayerPedId(), false)
                                            FreezeEntityPosition(outEntity, false)
                                            ESX.ShowNotification(TranslationIllegal.VentePnj["Merci"])
                                            FreezeEntityPosition(PlayerPedId(), false)
                                            FreezeEntityPosition(outEntity, false)
                                            TriggerServerEvent("fCore:Illegal:VenteDrugs", v.name, v.minItem, v.price, v.label, v.maxResell)
                                            TaskPlayAnim(PlayerPedId(), 'mp_common', 'givetake1_a', 8.0, 8.0, -1, 0, 1, false, false, false)
                                            TaskPlayAnim(outEntity, 'mp_common', 'givetake1_a', 8.0, 8.0, -1, 0, 1, false, false, false)
                                            Wait(1000)
                                            PlaySoundFrontend(-1, "Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset", 0)
                                            TaskWanderStandard(outEntity, 10.0, 10)
                                            PlayAmbientSpeech1(outEntity, 'GENERIC_THANKS', 'SPEECH_PARAMS_STANDARD')
                                            SetEntityAsMissionEntity(outEntity, true, true)
                                            SetPedCanRagdollFromPlayerImpact(outEntity, true)
                                            DeleteObject(cCreate)
                                        end
                                        sellingIn = true
                                    end
                                })
                            end
                        end
                    else
                        RageUI.Separator(" ")
                        RageUI.Separator(TranslationIllegal.VentePnj["RienAVendre"])
                        RageUI.Separator(" ")
                    end
                end)
                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
                FreezeEntityPosition(outEntity, false)
            end
        end)
    end
end


RegisterNetEvent("AfficherNotifPolice")
AddEventHandler("AfficherNotifPolice", function(coords)
    ESX.ShowNotification("Appel Drogue : \nAppuyer sur ~b~E~s~ pour accepter l'appel \nAppuyer sur ~r~Y~s~ pour refuser l'appel")
    SendAppelPoliceDrugs(coords)
end)


function SendAppelPoliceDrugs(coords)
    CreateThread(function()
        local keyPressed = false 
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then 
                SetNewWaypoint(coords.x, coords.y)
                ESX.ShowNotification("Vous venez d'accepter l'appel")
                keyPressed = true
            elseif IsControlJustPressed(1, 246) then 
                ESX.ShowNotification("Vous avez refuser l'appel")
                keyPressed = true
            end
            Wait(0)
        end
    end)
end