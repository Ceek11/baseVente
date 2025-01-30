local openTattouage = false 
menuTattouage = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuTattouage = RageUI.CreateSubMenu(menuTattouage, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuDeleteTattouage = RageUI.CreateSubMenu(menuTattouage, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuDeleteTattouageValide = RageUI.CreateSubMenu(subMenuDeleteTattouage, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuTattouage.Closed = function()
    openTattouage = false 
    ResetSkin()
end

subMenuDeleteTattouageValide.Closed = function()
    ResetSkin()
end

function openMenuTattouage()
    GetNaked()
    if openTattouage then 
        openTattouage = false 
        RageUI.Visible(menuTattouage, false)
        return
    else
        openTattouage = true 
        RageUI.Visible(menuTattouage, true)
        CreateThread(function()
            while openTattouage do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuTattouage, function()
                    RageUI.Separator("↓ ~b~Tatoueur~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    for _,v in pairs(Tattoo.TattooCats) do 
                        RageUI.Button(v[2], nil, {}, true, {
                            onSelected = function()
                                valeur = v[1]
                                Name = v[2]
                            end
                        }, subMenuTattouage)
                    end
                    RageUI.Button("~r~Enlever un Tattouage", nil, {}, true, {
                        onSelected = function()
                            GetPlayerTattoos()
                        end
                    }, subMenuDeleteTattouage)
                end)

                RageUI.IsVisible(subMenuDeleteTattouage, function()
                    if loadTattoo then 
                        local playerModel = GetEntityModel(PlayerPedId())
                
                        for _, tattoo in pairs(Tattoo.AllTattooList) do
                            local hashToCheck = (playerModel == `mp_m_freemode_01`) and tattoo.HashNameMale or tattoo.HashNameFemale
                            
                            for k,v in pairs(PlayerTattoos) do 
                                if hashToCheck == v.nameHash then 
                                    RageUI.Button(GetLabelText(tattoo.Name), nil, {}, true, {
                                        onSelected = function()
                                            name = v.nameHash
                                            label = GetLabelText(tattoo.Name)
                                            collection = tattoo.Collection
                                            ClearPedDecorations(PlayerPedId())
                                            GetNaked()
                                            SetPedDecoration(PlayerPedId(), tattoo.Collection, hashToCheck)
                                        end,
                                    }, subMenuDeleteTattouageValide)
                                end
                            end
                        end
                    end
                end)
                RageUI.IsVisible(subMenuDeleteTattouageValide, function()
                    RageUI.Button("Supprimer la tattouage", nil, {}, true, {
                        onSelected = function()
                            RemoveTattoo(name, label)
                            Wait(100)
                            GetPlayerTattoos()
                        end
                    }, subMenuDeleteTattouage)
                end)


                RageUI.IsVisible(subMenuTattouage, function()
                    RageUI.Separator(("↓ ~b~Tatouage : %s~s~ ↓"):format(Name))
                    RageUI.Line("color", 19, 107, 190)
                    for _, tattoo in pairs(Tattoo.AllTattooList) do
                        if tattoo.Zone == valeur then
                            if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
                                if tattoo.HashNameMale ~= '' then
                                    local found = false
                                    for k, v in pairs(currentTattoos) do
                                        if v.nameHash == tattoo.HashNameMale then
                                            found = true
                                            break
                                        end
                                    end
                                    if not found then
                                        RageUI.Button(GetLabelText(tattoo.Name), nil, {RightLabel = "~g~"..tattoo.Price.."$"}, true, {
                                            onActive = function()
                                                DrawTattoo(tattoo.Collection, tattoo.HashNameMale)
                                            end,
                                            onSelected = function()
                                                BuyTattoo(tattoo.Collection, tattoo.HashNameMale, tattoo.Name, tattoo.Price)
                                            end
                                        })
                                    end
                                end
                            else
                                if tattoo.HashNameFemale ~= '' then
                                    local found = false
                                    for k, v in pairs(currentTattoos) do
                                        if v.nameHash == tattoo.HashNameFemale then
                                            found = true
                                            break
                                        end
                                    end
                                    if not found then
                                        RageUI.Button(GetLabelText(tattoo.Name), nil, {RightLabel = "~g~"..tattoo.Price.."$"}, true, {
                                            onActive = function()
                                                DrawTattoo(tattoo.Collection, tattoo.HashNameFemale)
                                            end,
                                            onSelected = function()
                                                BuyTattoo(tattoo.Collection, tattoo.HashNameFemale, tattoo.Name, tattoo.Price)
                                            end
                                        })
                                    end
                                end
                            end
                        end
                    end
                end)
            Wait(0)
            FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end