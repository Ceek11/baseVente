
local openFarmLegal = false 
menuFarmLegal = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuFarmLegal.Closed = function()
    openFarmLegal = false
    PercentStatsRecolte = false
    Percent = 0
    FreezeEntityPosition(PlayerPedId(), false)
end

PercentStatsRecolte = false
PercentStatsTraitement = false
PercentStatsRevente = false
Percent = 0

function openMenuFarmLegal(v)
    if openFarmLegal then 
        openFarmLegal = false 
        RageUI.Visible(menuFarmLegal, false)
        return
    else
        openFarmLegal = true 
        RageUI.Visible(menuFarmLegal, true)
        CreateThread(function()
            while openFarmLegal do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuFarmLegal, function()
                    RageUI.Separator("↓ ~b~Récolte~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(v.Button, v.description, {RightLabel = "→"}, true, {
                        onSelected = function()
                            PercentStatsRecolte = true
                        end
                    })
                    if PercentStatsRecolte then 
                        RageUI.PercentagePanel(Percent, "Récolte en cours ~b~"..math.floor(Percent*100).."%", ' ', ' ', {})
                        if Percent < 1.0 then 
                            Percent = Percent + v.speedFarm
                        else
                            Percent = 100
                            TriggerServerEvent("fCore:FarmLegal:Recolte", v.item, v.itemLabel, v.itemReward, v.weightMax, v.point)
                            anim(PlayerPedId(), 'random@domestic', 'pickup_low')
                            Percent  = 0
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end


local openTraitementLegal = false 
menuTraitementLegal = RageUI.CreateMenu(" ", " ")
menuTraitementLegal.Closed = function()
    openTraitementLegal = false 
    PercentStatsTraitement = false
    Percent  = 0
    FreezeEntityPosition(PlayerPedId(), false)
end

function openMenuTraitementLegal(v)
    if openTraitementLegal then
        openTraitementLegal = false 
        RageUI.Visible(menuTraitementLegal, false)
    else
        openTraitementLegal = true 
        RageUI.Visible(menuTraitementLegal, true)
        CreateThread(function()
            while openTraitementLegal do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuTraitementLegal, function()
                    RageUI.Separator("↓ ~b~Traitement~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(v.Button, v.description, {RightLabel = "→"}, true, {
                        onSelected = function()
                            PercentStatsTraitement = true
                        end
                    })
                    if PercentStatsTraitement then 
                        RageUI.PercentagePanel(Percent, "Traitement en cours ~b~"..math.floor(Percent*100).."%", ' ', ' ', {})
                        if Percent < 1.0 then 
                            Percent = Percent + v.speedFarm
                        else
                            Percent = 100
                            print(v.itemNeed)
                            TriggerServerEvent("fCore:FarmLegal:Traitement", v.itemNeed, v.itemNeedLabel, v.itemRemove, v.itemNameReward, v.itemRewardLabel, v.itemReward, v.itemMini, v.point)
                            anim(PlayerPedId(), 'random@domestic', 'pickup_low')
                            Percent  = 0
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end


local openReventeLegal = false 
menuReventeLegal = RageUI.CreateMenu(" ", " ")
menuReventeLegal.Closed = function()
    openReventeLegal = false 
    PercentStatsRevente = false
    Percent  = 0
    FreezeEntityPosition(PlayerPedId(), false)
end

function openMenuReventeLegal(v)
    if openReventeLegal then
        openReventeLegal = false 
        RageUI.Visible(menuReventeLegal, false)
    else
        openReventeLegal = true 
        RageUI.Visible(menuReventeLegal, true)
        CreateThread(function()
            while openReventeLegal do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuReventeLegal, function()
                    RageUI.Separator("↓ ~b~Revente~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(v.Button, v.description, {RightLabel = "→"}, true, {
                        onSelected = function()
                            PercentStatsRevente = true
                        end
                    })
                    if PercentStatsRevente then 
                        RageUI.PercentagePanel(Percent, "Revente en cours ~b~"..math.floor(Percent*100).."%", ' ', ' ', {})
                        if Percent < 1.0 then 
                            Percent = Percent + v.speedFarm
                        else
                            Percent = 100
                            TriggerServerEvent("fCore:FarmLegal:Revente", v.itemNeed, v.itemNeedLabel, v.itemRemove, v.moneyReward, v.itemMini, v.society, v.point)
                            anim(PlayerPedId(), 'random@domestic', 'pickup_low')
                            Percent  = 0
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end