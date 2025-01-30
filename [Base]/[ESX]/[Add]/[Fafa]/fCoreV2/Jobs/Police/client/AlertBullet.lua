local notifyforballistic = true
local CooldownShoot = false
CreateThread(function()
    while true do
        local interval = 1000
        local ped = PlayerPedId()
        local isarmed = IsPedArmed(ped, 7)
        if isarmed then
            interval = 0
            if notifyforballistic == true then
                if IsPedShooting(ped) and not CooldownShoot then
                    CooldownShoot = true
                    TriggerServerEvent("addNotification:Shoot:Police", GetEntityCoords(PlayerPedId()))
                    ESX.SetTimeout(120000,function()
                        CooldownShoot = false
                    end)
                end
            end
        end
        Wait(interval)
    end
end)


RegisterNetEvent("Notification:Shoot:CallPolice")
AddEventHandler("Notification:Shoot:CallPolice", function(coords)
    cNotification(TranslationJob.Police["CallFireAcceptOrCancel"])
    SendAppelPoliceShoot(coords)
end)


function SendAppelPoliceShoot(coords)
    CreateThread(function()
        local keyPressed = false 
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then 
                SetNewWaypoint(coords.x, coords.y)
                cNotification(TranslationJob.Police["AcceptCall"])
                keyPressed = true
            elseif IsControlJustPressed(1, 246) then 
                cNotification(TranslationJob.Police["CancellCall"])
                keyPressed = true
            end
            Wait(0)
        end
    end)
end