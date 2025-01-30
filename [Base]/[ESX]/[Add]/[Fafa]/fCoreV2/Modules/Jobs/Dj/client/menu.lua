local openDJ = false 
menuDJ = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuDJPlaylist = RageUI.CreateSubMenu(menuDJ, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuDJPlaylist = RageUI.CreateSubMenu(menuDJPlaylist, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuDJ.Closed = function()
    openDJ = false 
end

function openMenuDJ(valeur)
    getPlaylist(valeur.jobName)
    if openDJ then
        openDJ = false 
        RageUI.Visible(menuDJ, false)
        return
    else
        openDJ = true
        RageUI.Visible(menuDJ, true)
        CreateThread(function()
            while openDJ do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuDJ, function()
                    RageUI.Separator(TranslationJob.Dj["DjPlatine"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationJob.Dj["PutOnMusic"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationJob.Dj["PutOnMusic"], {TranslationJob.Dj["UrlYoutube"]})
                            if input then
                                local YoutubeURL = input[1]
                                TriggerServerEvent("fCore:DJ:playMusic", YoutubeURL)
                            end
                        end
                    })
                    RageUI.Button(TranslationJob.Dj["showPlaylist"], nil, {RightLabel = "→→"}, true, {},menuDJPlaylist)
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationJob.Dj["PauseMusic"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            TriggerServerEvent("fCore:DJ:pauseMusic")
                        end
                    })
                    RageUI.Button(TranslationJob.Dj["RestartMusic"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            TriggerServerEvent("fCore:DJ:resumeMusic")
                        end
                    })
                    RageUI.Button(TranslationJob.Dj["StopMusic"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            TriggerServerEvent("fCore:DJ:stopMusic")
                        end
                    })
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationJob.Dj["ChangeVolum"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationJob.Dj["ChangeVolum"], {TranslationJob.Dj["MinMaxVolum"]})
                            if input then
                                local volume = input[1]
                                TriggerServerEvent('fCore:DJ:changeVolume', volume)
                            end  
                        end
                    })
                end)
                RageUI.IsVisible(menuDJPlaylist, function()
                    RageUI.Button(TranslationJob.Dj["AddInPlaylist"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationJob.Dj["Playlist"], {TranslationJob.Dj["NamePlaylist"], TranslationJob.Dj["UrlMusic"]})
                            if input then
                                local nameMusic = input[1]
                                local UrlMusic = input[2]
                                TriggerServerEvent("fCore:DJ:Playlist", nameMusic, UrlMusic, valeur.jobName)
                                ESX.SetTimeout(100,function()
                                    getPlaylist(valeur.jobName)
                                end)
                            end  
                        end
                    })
                    RageUI.Line("color", 249, 130,42)
                    for k,v in pairs(infoPlaylistInBdd) do
                        RageUI.Button(v.nom, nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                url = v.url
                                id = v.id
                            end
                        }, subMenuDJPlaylist)
                    end
                end)
                RageUI.IsVisible(subMenuDJPlaylist, function()
                    RageUI.Button(TranslationJob.Dj["StartMusic"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            TriggerServerEvent("fCore:DJ:playMusic", url)
                        end
                    })
                    RageUI.Button(TranslationJob.Dj["DeleteMusic"] , nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            TriggerServerEvent("fCore:DJ:DeleteMusicPlaylist", id)
                            ESX.SetTimeout(100,function()
                                getPlaylist(valeur.jobName)
                            end)
                        end
                    },menuDJPlaylist)
                end)
                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end

local openSon = false 
menuSon = RageUI.CreateMenu(" ", " ")
menuSon.Closed = function()
    openSon = false 
end

function openMenuSon()
    if openSon then 
        openSon = false 
        RageUI.Visible(menuSon, false)
        return
    else
        openSon = true 
        RageUI.Visible(menuSon, true)
        CreateThread(function()
            while openSon do
            RageUI.IsVisible(menuSon, function()
                RageUI.Button(TranslationJob.Dj["ChangeVolum"], nil, {RightLabel = "→→"}, true, {
                    onSelected = function()
                        local input = lib.inputDialog(TranslationJob.Dj["VolumMusic"], {TranslationJob.Dj["MinMaxVolum"]})
                        if input then
                            local volume = input[1]
                            TriggerServerEvent("fCore:DJ:changeVolumePlayer", volume)
                        end  
                    end
                })
            end)
            Wait(0)
            end
        end)
    end
end

RegisterCommand("DJ", function()
    openMenuSon()
end)