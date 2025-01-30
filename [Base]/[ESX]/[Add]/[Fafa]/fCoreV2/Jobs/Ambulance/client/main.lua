AddEventHandler('playerSpawned', function()
    ESX.TriggerServerCallback("fCore:Ambulance:GetStatusDead", function(result) 
        for k,v in pairs(result) do 
            if v.is_dead then 
                SetEntityHealth(PlayerPedId(), 0)
                TriggerEvent("esx:onPlayerDeath")
            end
        end
    end)
end)

isDead = false

AddEventHandler('esx:onPlayerDeath', function()
    isDead = true
    StartDistressSignal()
    ShowTimer()
    StartScreenEffect('DeathFailOut', 0, false)
end)


function StartDistressSignal()
    Citizen.CreateThread(function()
        local timer = 10 * 60 * 1000
        while timer > 0 and isDead do
            Citizen.Wait(0)
            timer = timer - 30
            TextAmbulanceCall(TranslationJob.Ambulance["TextCallAmbulance"])
            if IsControlPressed(0, 47) then
                SendDistressSignal()
                break
            end
        end
    end)
end

function ShowTimer()
    local TimerActive = true
    local timer = 1 * 300 * 1000
    Citizen.CreateThread(function()
        while TimerActive and isDead do
            Citizen.Wait(0)
            if timer > 0 then 
                minutes = math.floor(timer / 60000)
                seconds = math.floor((timer % 60000) / 1000)
                timer = timer - 15
                TextAmbulance((TranslationJob.Ambulance["TextAmbulance"]):format(minutes, seconds))
            else
                TextAmbulance(TranslationJob.Ambulance["TextAmbulance2"])
                UniteX = true
            end

            if UniteX then 
                if IsControlJustPressed(1, 73) then
                    uniteX()
                end
            end
        end
    end)
end


local posHopital = {
    vec3(-96.041314, 6505.596680, 31.462648),
    vec3(-1871.661254, -321.708618, 49.446816),
    vec3(4948.850586, -5098.140136, 4.062036),
    vec3(1733.370728, 3638.256836, 34.852584)
}

function uniteX()
    local playerPos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("fCore:Ems:SendPointUniteX", playerPos, PlayerId())
    TriggerEvent("fCore:revive")
    StopScreenEffect('DeathFailOut', 0, false)
    TimerActive = false
    local closestDistance = -1
    local closestPos = nil
    for _, v in ipairs(posHopital) do 
        local dist = #(v - playerPos) 
        if closestPos == nil or dist < closestDistance then 
            closestDistance = dist
            closestPos = v
        end 
    end
    if closestPos then
        SetEntityCoords(PlayerPedId(), closestPos.x, closestPos.y, closestPos.z)
    end
end






local Dropped = {}
local DroppedTimeouts = {}

RegisterNetEvent("fCore:Ems:PointUniteX")
AddEventHandler("fCore:Ems:PointUniteX", function(coords, id)
    Dropped[id] = true
    if DroppedTimeouts[id] then
        ClearTimeout(DroppedTimeouts[id])
    end

    DroppedTimeouts[id] = SetTimeout(10000, function()
        Dropped[id] = false
        DroppedTimeouts[id] = nil
    end)

    CreateThread(function()
        while Dropped[id] or DroppedTimeouts[id] do
            local interval = 1000
            local posPlayer = GetEntityCoords(PlayerPedId())
            local dist = #(coords - posPlayer) 
            if dist <= 10 then 
                interval = 0
                DrawName3D(coords.x, coords.y, coords.z, (TranslationJob.Ambulance["UniterX"]):format(id), 255, 255, 255)
            end
            Wait(interval)
        end
    end)
end)


function SendDistressSignal()
    cNotification(TranslationJob.Ambulance["NotifSendEMS"])
    TriggerServerEvent("fCore:EMS:DistressSignal", GetEntityCoords(PlayerPedId()), GetPlayerName(PlayerId()))
end

function TextAmbulanceCall(text)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(0.45, 0.45)
    SetTextColour(185, 185, 185, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.405, 0.805)
end

function TextAmbulance(text)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(0.45, 0.45)
    SetTextColour(185, 185, 185, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.370, 0.845)
end