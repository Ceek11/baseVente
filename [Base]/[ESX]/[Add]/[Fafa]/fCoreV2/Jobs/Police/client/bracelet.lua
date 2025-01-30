
local openBracelet = false 
menuBracelet = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuShowBracelet = RageUI.CreateSubMenu(menuBracelet, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuBracelet.Closed = function()
    openBracelet = false 
end

function openMenuBracelet()
    if openBracelet then 
        openBracelet = false 
        RageUI.Visible(menuBracelet, false)
        return
    else
        openBracelet = true 
        RageUI.Visible(menuBracelet, true)
        CreateThread(function()
            while openBracelet do 
                RageUI.IsVisible(menuBracelet, function()
                    RageUI.Button(TranslationJob.Police["PutBracelet"], nil, {}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end
                            if targetT then 
                                TriggerServerEvent("fCore:Bracelet:GiveBracelet", GetPlayerServerId(targetT))
                            end
                        end
                    })
                    RageUI.Button(TranslationJob.Police["RemoveBracelet"], nil, {}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end
                            if targetT then 
                                TriggerServerEvent("fCore:Bracelet:RemoveBracelet", GetPlayerServerId(targetT))
                                Wait(500)
                                getPlayerWithBracelet()
                            end
                        end
                    })
                    RageUI.Button(TranslationJob.Police["ShowPlayerWithBracelet"], nil, {}, true, {
                        onSelected = function()
                            getPlayerWithBracelet()
                        end
                    }, subMenuShowBracelet)
                end)
                RageUI.IsVisible(subMenuShowBracelet, function()
                    if loadBracelet then 
                        for _,v in pairs(PlayerWithBracelet) do 
                            RageUI.Button(v.name, nil, {}, not v.see, {
                                onSelected = function()
                                    TriggerServerEvent("fCore:Bracelet:addBlipPlayer", v.id)
                                    Wait(500)
                                    getPlayerWithBracelet()
                                end
                            })
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end

RegisterNetEvent("fCore:Bracelet:addBlipPlayer")
AddEventHandler("fCore:Bracelet:addBlipPlayer", function(coords)
    SetNewWaypoint(coords.x, coords.y)
end)

AddEventHandler('esx:playerLoaded', function()
    TriggerServerEvent("fCore:Bracelet:getPlayerWithBraceletSpawn")
end)

function getPlayerWithBracelet()
    PlayerWithBracelet = {}
    loadBracelet = false
    ESX.TriggerServerCallback("fCore:Bracelet:getPlayerWithBracelet", function(result) 
        for _,v in pairs(result) do 
            table.insert(PlayerWithBracelet, v)
        end
        loadBracelet = true
    end)
end

