local openTp = false 
menuTp = RageUI.CreateMenu("TP", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuTp.Closed = function()
    openTp = false 
end

function openMenuTp(Etage)
    if openTp then 
        openTp = false 
        RageUI.Visible(menuTp, false)
    else
        openTp = true 
        RageUI.Visible(menuTp, true)
        CreateThread(function()
            while openTp do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuTp, function()
                    for k,v in pairs(Etage) do 
                        RageUI.Button(v.EtageName, nil, {}, true, {
                            onSelected = function()
                                SetEntityCoords(GetPlayerPed(-1), v.Point.x, v.Point.y, v.Point.z)
                            end
                        })
                    end
                end)
                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end