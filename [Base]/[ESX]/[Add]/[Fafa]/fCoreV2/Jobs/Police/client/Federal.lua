

local openFederale = false 
menuFederale = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuFederale.Closed = function()
    openFederale = false 
end

function openMenuFederale()
    if openFederale then 
        openFederale = false 
        RageUI.Visible(menuFederale, false)
        return
    else
        openFederale = true 
        RageUI.Visible(menuFederale, true)
        CreateThread(function()
            while true do
                RageUI.IsVisible(menuFederale, function()
                    RageUI.Button(TranslationJob.Police["PutPlayerInFederal"], nil, {}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end
                            if targetT then 
                                local input = lib.inputDialog(TranslationJob.Police["TimeToFedederal"], {TranslationJob.Police["TimeToFedederalDescription"]})
                                if input then 
                                    TriggerServerEvent("fCore:Federale:AddInFederale", GetPlayerServerId(targetT), tonumber(input[1]))
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
    getPlayerSpawnFederale()
end)

local inFederale = false
local expirationFormat = nil
local expiration = nil
local timeReal = nil
local TimeLoad = false

function getPlayerSpawnFederale()
    ESX.TriggerServerCallback("fCore:Federale:getPlayerSpawnFederale", function(stats, expiFormat, expi)
        inFederale = stats
        expirationFormat = expiFormat
        expiration = expi
    end)
end

RegisterNetEvent("fCore:Federale:AddExpiration")
AddEventHandler("fCore:Federale:AddExpiration", function(expiFormat, expi)
    inFederale = true
    expirationFormat = expiFormat
    expiration = expi
end)

RegisterNetEvent("fCore:Federale:GetTime")
AddEventHandler("fCore:Federale:GetTime", function(time)
    timeReal = time
    TimeLoad = true
end)

function updateExpirationText()
    while inFederale do
        RageUI.Text({message = (TranslationJob.Police["InJailBetween"]):format(expirationFormat)})
        Wait(0)
    end
end

function checkExpiration()
    while inFederale do
        TriggerServerEvent("fCore:Federale:GetTime")
        if TimeLoad and timeReal >= expiration then
            inFederale = false
            TriggerEvent("fCore:Federale:LeaveJail")
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

RegisterNetEvent("fCore:Federale:LeaveJail")
AddEventHandler("fCore:Federale:LeaveJail", function()
    local posPlayer = GetEntityCoords(PlayerPedId())
    local closestDistance = -1
    local closestPos = nil
    local heading = nil
    for _,v in pairs(JobPolice.Federale) do
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
    TriggerServerEvent("fCore:Federale:DeleteInBdd")
end)



