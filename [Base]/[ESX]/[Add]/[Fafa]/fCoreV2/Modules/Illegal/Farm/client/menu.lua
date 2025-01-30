local openRecolteIllegal = false 
menuRecolteIllegal = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuRecolteIllegal.Closed = function()
    openRecolteIllegal = false
    Cfg.PercentStatsRecolte = false
    Cfg.Percent = 0
end



function openMenuRecolteIllegal(v)
    if openRecolteIllegal then 
        openRecolteIllegal = false 
        RageUI.Visible(menuRecolteIllegal, false)
    else
        openRecolteIllegal = true 
        RageUI.Visible(menuRecolteIllegal, true)
        CreateThread(function()
            while openRecolteIllegal do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuRecolteIllegal, function()
                    RageUI.Separator(TranslationIllegal.Farm["HarvestTitle"])
                    RageUI.Separator((TranslationIllegal.Farm["MinPoliceRequired"]):format(v.minimumCops))
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(v.Button, v.description, {RightLabel = "→"}, true, {
                        onSelected = function()
                            Cfg.PercentStatsRecolte = true
                        end
                    })
                    if Cfg.PercentStatsRecolte then 
                        RageUI.PercentagePanel(Cfg.Percent, (TranslationIllegal.Farm["HarvestInProgress"]):format(math.floor(Cfg.Percent*100)), ' ', ' ', {})
                        if Cfg.Percent < 1.0 then 
                            Cfg.Percent = Cfg.Percent + v.speedFarm
                        else
                            Cfg.Percent = 100
                            TriggerServerEvent("fCore:FarmIllegal:Recolte", v.item, v.itemLabel, v.itemReward, v.weightMax, v.minimumCops, v.point)
                            anim(PlayerPedId(), 'random@domestic', 'pickup_low')
                            Cfg.Percent  = 0
                        end
                    end
                end)
                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end


local openTraitementIllegal = false 
menuTraitementIllegal = RageUI.CreateMenu(" ", " ")
menuTraitementIllegal.Closed = function()
    openTraitementIllegal = false 
    Cfg.PercentStatsTraitement = false
    Cfg.Percent  = 0
end

function openMenuTraitementIllegal(v)
    if openTraitementIllegal then
        openTraitementIllegal = false 
        RageUI.Visible(menuTraitementIllegal, false)
    else
        openTraitementIllegal = true 
        RageUI.Visible(menuTraitementIllegal, true)
        CreateThread(function()
            while openTraitementIllegal do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuTraitementIllegal, function()
                    RageUI.Separator(TranslationIllegal.Farm["ProcessTitle"])
                    RageUI.Separator((TranslationIllegal.Farm["MinPoliceRequired"]):format(v.minimumCops))
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(v.Button, v.description, {RightLabel = "→"}, true, {
                        onSelected = function()
                            Cfg.PercentStatsTraitement = true
                        end
                    })
                    if Cfg.PercentStatsTraitement then 
                        RageUI.PercentagePanel(Cfg.Percent, (TranslationIllegal.Farm["ProcessInProgress"]):format(math.floor(Cfg.Percent*100)), ' ', ' ', {})
                        if Cfg.Percent < 1.0 then 
                            Cfg.Percent = Cfg.Percent + v.speedFarm
                        else
                            Cfg.Percent = 100
                            TriggerServerEvent("fCore:FarmIllegal:Traitement", v.itemNeed, v.itemNeedLabel, v.itemRemove, v.itemNameReward, v.itemRewardLabel, v.itemReward, v.minimumCops, v.itemMini, v.deuxItem, v.troisItem, v.item2Need, v.item2NeedLabel, v.item2Remove, v.item2NameReward, v.item2RewardLabel, v.item2Reward, v.item3Need, v.item3NeedLabel, v.item3Remove, v.item3NameReward, v.item3RewardLabel, v.item3Reward, v.item2Mini, v.item3Mini, v.point)
                            anim(PlayerPedId(), 'random@domestic', 'pickup_low')
                            Cfg.Percent  = 0
                        end
                    end
                end)
                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end
