local openTig = false
menuTig = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuTig.Closed = function()
    openTig = false 
end

function openMenuTig()
    if openTig then 
        openTig = false 
        RageUI.Visible(menuTig, false)
        return
    else
        openTig = true 
        RageUI.Visible(menuTig, true)
        CreateThread(function()
            while openTig do
                RageUI.IsVisible(menuTig, function()
                    RageUI.Button(TranslationJob.Police["putInTig"], nil, {}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end
                            if targetT then 
                                local input = lib.inputDialog(TranslationJob.Police["nbrInMission"], {TranslationJob.Police["nbrInMission"]})
                                if input then 
                                    TriggerServerEvent("fCore:Tig:AddInTig", GetPlayerServerId(targetT), tonumber(input[1]))
                                end
                            end
                        end
                    })
                end)
                Wait(0) 
            end
        end)
    end
end


RegisterNetEvent("fCore:Tig:AddInMisson")
AddEventHandler("fCore:Tig:AddInMisson", function(count)
    inMissionTig(count)
    SetEntityCoords(PlayerPedId(), posTig)
end)

inTig = false
local newCount = 0
local countBdd = 0
function inMissionTig(count)
    inTig = true
    local valeur = nil
    for _, v in pairs(JobPolice.SpawnTig) do 
        valeur = v 
    end
    local inMissionStart = true    
    local randomPos = math.random(#valeur.posMission)
    local dest = valeur.posMission[randomPos]
    SetNewWaypoint(dest.x, dest.y)
    CreateThread(function()
        while inMissionStart do
            local interval = 1500 
            local playerPos = GetEntityCoords(PlayerPedId())
            local dist = #(dest - playerPos)
            local distMax = #(posTig - playerPos)
            if distMax >= distanceMax then 
                SetEntityCoords(PlayerPedId(), posTig)
                cNotification(TranslationJob.Police["finishYourTig"])
            end
            if dist <= 15 then 
                interval = 0
                DrawMarker(22, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255, 0, 0, 255, 55555, false, true, 2, false, false, false, false)
                if dist <= 3 then 
                    DrawName3D(dest.x, dest.y, dest.z, TranslationJob.Police["toPassBroom"], 255, 255, 255)
                    if IsControlJustPressed(1, 51) then
                        inMissionStart = false
                        startMission(count)
                    end
                end
            end
            Wait(interval)
        end
    end)
end


function startMission(count)
    ExecuteCommand("e broom3")
    lib.progressCircle({
        duration = 2000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
    })
    Wait(2000)
    ClearPedTasks(PlayerPedId())
    newCount = newCount + 1
    countBdd = countBdd + 1
    if countBdd >= 5 then 
        TriggerServerEvent("fCore:Tig:updateCacheTig", countBdd)
        countBdd = 0
    end
    if newCount < count then 
        inMissionTig(count)
    else
        countBdd = 0
        newCount = 0
        cNotification(TranslationJob.Police["dontHaveTig"])
        TriggerServerEvent("fCore:Tig:DeleteInBdd")
    end
end

AddEventHandler("esx:onPlayerSpawn", function()
    getPlayerSpawnTig()
end)

function getPlayerSpawnTig()
    ESX.TriggerServerCallback("fCore:Tig:getPlayerSpawnTig", function(stats, count)
        if stats then 
            inMissionTig(count)
        end
    end)
end



