local openGav = false 
menuGav = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuGav.Closed = function()
    openGav = false 
end

function openMenuGav()
    if openGav then 
        openGav = false 
        RageUI.Visible(menuGav, false)
        return
    else
        openGav = true 
        RageUI.Visible(menuGav, true)
        CreateThread(function()
            while true do
                RageUI.IsVisible(menuGav, function()
                    RageUI.Button(TranslationJob.Police["putInGav"], nil, {}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end
                            if targetT then 
                                local input = lib.inputDialog(TranslationJob.Police["TimeGav"], {TranslationJob.Police["descTimeGav"]})
                                if input then 
                                    TriggerServerEvent("fCore:Gav:AddInGav", GetPlayerServerId(targetT), tonumber(input[1]))
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



AddEventHandler("esx:onPlayerSpawn", function()
    getPlayerSpawnGav()
end)

local inGav = false
local expirationFormat = nil
local expiration = nil
local timeReal = nil
local TimeLoad = false

function getPlayerSpawnGav()
    ESX.TriggerServerCallback("fCore:Gav:getPlayerSpawnGav", function(stats, expiFormat, expi)
        inGav = stats
        expirationFormat = expiFormat
        expiration = expi
    end)
end

RegisterNetEvent("fCore:Gav:AddExpiration")
AddEventHandler("fCore:Gav:AddExpiration", function(expiFormat, expi)
    inGav = true
    expirationFormat = expiFormat
    expiration = expi
end)

RegisterNetEvent("fCore:Gav:GetTime")
AddEventHandler("fCore:Gav:GetTime", function(time)
    timeReal = time
    TimeLoad = true
end)

function updateExpirationText()
    while inGav do
        RageUI.Text({message = (TranslationJob.Police["inJailDuring"]):format(expirationFormat)})
        Wait(0)
    end
end

function checkExpiration()
    while inGav do
        TriggerServerEvent("fCore:Gav:GetTime")
        if TimeLoad and timeReal >= expiration then
            inGav = false
            TriggerEvent("fCore:Gav:LeaveJail")
        end
        Wait(10000)
    end
end

CreateThread(function()
    while true do 
        checkExpiration()
        Wait(5000)
    end
end)

CreateThread(function()
    while true do 
        updateExpirationText()
        Wait(5000)
    end
end)

RegisterNetEvent("fCore:Gav:LeaveJail")
AddEventHandler("fCore:Gav:LeaveJail", function()
    local posPlayer = GetEntityCoords(PlayerPedId())
    local closestDistance = -1
    local closestPos = nil
    local heading = nil
    for _,v in pairs(JobPolice.Gav) do
        local dist = #(v.posSortie - posPlayer) 
        if closestPos == nil or dist < closestDistance then 
            closestDistance = dist
            closestPos = v.posSortie
            heading = v.heading
        end 
    end
    SetEntityCoords(PlayerPedId(), closestPos)
    SetEntityHeading(PlayerPedId(), heading)
    ExecuteCommand("e sitchair")
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
    TriggerServerEvent("fCore:Gav:DeleteInBdd")
end)