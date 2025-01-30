ESX = nil
Citizen.CreateThread(function()
    ESX = exports["es_extended"]:getSharedObject()
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

function cNotification(message)
    ESX.ShowNotification(message)
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	Citizen.Wait(5000)
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    ESX.PlayerLoaded = true
end)



function DrawText2(av, aw, ax, ay, az, aA, aB, aC, aD)
    SetTextFont(av)
    SetTextScale(ax, ax)
    if aB then
        SetTextDropShadow(0, 0, 0, 0, 0)
        SetTextEdge(0, 0, 0, 0, 0)
    end
    SetTextColour(aA[1], aA[2], aA[3], 255)
    if aC == 0 then
        SetTextCentre(true)
    else
        SetTextJustification(aC or 1)
        if aC == 2 then
            SetTextWrap(.0, aD or ay)
        end
    end
    SetTextEntry("STRING")
    AddTextComponentString(aw)
    DrawText(ay, az)
end

local aE = {
    baseX = 0.918,
    baseY = 0.984,
    titleOffsetX = 0.012,
    titleOffsetY = -0.012,
    valueOffsetX = 0.0785,
    valueOffsetY = -0.0165,
    pbarOffsetX = 0.047,
    pbarOffsetY = 0.0015
}
local aF = {
    timerBarWidth = 0.165,
    timerBarHeight = 0.035,
    timerBarMargin = 0.038,
    pbarWidth = 0.0616,
    pbarHeight = 0.0105
}
local aG = {}



function AddTimerBar(aH, aI)
    if not aI then
        return
    end
    RequestStreamedTextureDict("timerbars", true)
    local aJ = #aG + 1;
    aG[aJ] = {
        title = aH,
        text = aI.text,
        textColor = aI.color or {255, 255, 255, 255},
        percentage = aI.percentage,
        endTime = aI.endTime,
        pbarBgColor = aI.bg or {155, 155, 155, 255},
        pbarFgColor = aI.fg or {255, 255, 255, 255}
    }
    return aJ
end



function RemoveTimerBar()
    aG = {}
    SetStreamedTextureDictAsNoLongerNeeded("timerbars")
end
local aK = {200, 100, 100}
local math = math;
function SecondsToClock(aL)
    aL = tonumber(aL)
    if aL <= 0 then
        return "00:00"
    else
        mins = string.format("%02.f", math.floor(aL / 60))
        secs = string.format("%02.f", math.floor(aL - mins * 60))
        return string.format("%s:%s", mins, secs)
    end
end


Citizen.CreateThread(function()
    while true do
        local attente = 500;
        local aM = GetSafeZoneSize()
        local aN = (1.0 - aM) * 0.5;
        local aO = (1.0 - aM) * 0.5;
        if #aG > 0 then
            attente = 1;
            HideHudComponentThisFrame(6)
            HideHudComponentThisFrame(7)
            HideHudComponentThisFrame(8)
            HideHudComponentThisFrame(9)
            for n, y in pairs(aG) do
                local aP = aE.baseY - aO - n * aF.timerBarMargin;
                DrawSprite("timerbars", "all_black_bg", aE.baseX - aN, aP, aF.timerBarWidth, aF.timerBarHeight, 0.0,
                    255, 255, 255, 160)
                DrawText2(0, y.title, 0.3, aE.baseX - aN + aE.titleOffsetX, aP + aE.titleOffsetY, y.textColor,
                    false, 2)
                if y.percentage then
                    local aQ = aE.baseX - aN + aE.pbarOffsetX;
                    local aR = aP + aE.pbarOffsetY;
                    local aS = aF.pbarWidth * y.percentage;
                    DrawRect(aQ, aR, aF.pbarWidth, aF.pbarHeight, y.pbarBgColor[1], y.pbarBgColor[2], y.pbarBgColor[3],
                        y.pbarBgColor[4])
                    DrawRect(aQ - aF.pbarWidth / 2 + aS / 2, aR, aS, aF.pbarHeight, y.pbarFgColor[1], y.pbarFgColor[2],
                        y.pbarFgColor[3], y.pbarFgColor[4])
                elseif y.text then
                    DrawText2(0, y.text, 0.425, aE.baseX - aN + aE.valueOffsetX, aP + aE.valueOffsetY,
                        y.textColor, false, 2)
                elseif y.endTime then
                    local aT = math.floor(y.endTime - GetGameTimer())
                    DrawText2(0, SecondsToClock(aT / 1000), 0.425, aE.baseX - aN + aE.valueOffsetX,
                        aP + aE.valueOffsetY, aT <= 0 and aK or y.textColor, false, 2)
                end
            end
        end
        Wait(attente)
    end
end)


