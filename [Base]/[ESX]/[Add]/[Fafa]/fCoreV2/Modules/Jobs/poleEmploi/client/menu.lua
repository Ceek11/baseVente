local openPoleEmploi = false 
menuPoleEmploi = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuPoleEmploi.Closed = function()
    openPoleEmploi = false
    FreezeEntityPosition(PlayerPedId(), false)
end

function openMenuPoleEmploi()
    if openPoleEmploi then 
        openPoleEmploi = false 
        RageUI.Visible(menuPoleEmploi, false)
        return
    else
        openPoleEmploi = true
        RageUI.Visible(menuPoleEmploi, true)
        CreateThread(function()
            while openPoleEmploi do 
                RageUI.IsVisible(menuPoleEmploi, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    RageUI.Separator(Translation.PoleEmploi["jobDisponible"])
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(PoleEmploi.Emploi) do 
                        RageUI.Button(v.label, nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                TriggerServerEvent("poleEmploi:setjob", v.name, v.grade)
                            end
                        })
                    end
                end)
                Wait(0)
            end
        end)
    end
end