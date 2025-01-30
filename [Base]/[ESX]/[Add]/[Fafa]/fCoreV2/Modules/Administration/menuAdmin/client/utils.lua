reportTable = {}
getPermsAdmin = {}
getGroupA = nil
groupLoad = false
fastTimer = 0
local jailTime = 0

RegisterNetEvent("fCore:MenuAdmin:ReviveAll")
AddEventHandler("fCore:MenuAdmin:ReviveAll", function(id)
    RevivePlayer(id)
end)

RegisterNetEvent("fCore:Admin:RepairVehicle")
AddEventHandler("fCore:Admin:RepairVehicle", function(id)
    reparerVehicle()
end)

RegisterNetEvent("fCore:Admin:PermsAdmin")
AddEventHandler("fCore:Admin:PermsAdmin", function(permsAdmin)
    getPermsAdmin = permsAdmin
end)

RegisterNetEvent("fCore:Admin:GroupAdmin")
AddEventHandler("fCore:Admin:GroupAdmin", function(groupA)
    getGroupA = groupA
    groupLoad = true
end)

RegisterNetEvent("fCore:MenuAdmin:healAll")
AddEventHandler("fCore:MenuAdmin:healAll", function(id)
    healPlayer(id)
end)

RegisterNetEvent("fCore:freezePlayer")
AddEventHandler("fCore:freezePlayer", function(entity)
    local statsFreeze = not statsFreeze
    FreezeEntityPosition(entity, statsFreeze)
end)



RegisterNetEvent("fCore:Admin:AddToJail")
AddEventHandler("fCore:Admin:AddToJail", function(raison, newTime)
    updateExpiration()
    local playerPed = PlayerPedId() 
    local dest = vector3(1645.853028, 2531.900634, 45.564858)
    SetEntityCoords(playerPed, dest)
    fastTimer = newTime
    local lastUpdateTime = GetGameTimer()
    
    while fastTimer > 0 do 
        local posPlayer = GetEntityCoords(PlayerPedId())
        local dist = #(posPlayer-dest)
        local currentTime = GetGameTimer() 
        local elapsedTime = (currentTime - lastUpdateTime) / 1000 
        lastUpdateTime = currentTime
        
        fastTimer = fastTimer - elapsedTime
        
        Visual.Text({message = (TranslationAdministration.MenuAdmin["CText_timeExpirate"]):format(math.floor((fastTimer/60)), raison)})
        if dist > 50 then 
            SetEntityCoords(playerPed, dest)
        end
        
        Wait(0)
        DisableControlAction(2, 37, true) -- Select Weapon
        DisableControlAction(0, 25, true) -- Input Aim
        DisableControlAction(0, 24, true) -- Input Attack
        DisableControlAction(0, 257, true) -- Disable melee
        DisableControlAction(0, 140, true) -- Disable melee
        DisableControlAction(0, 142, true) -- Disable melee
        DisableControlAction(0, 143, true) -- Disable melee
    end
    SetEntityCoords(PlayerPedId(), Administration.posUnJail)
end)


RegisterNetEvent("fCore:Admin:unJailPlayer")
AddEventHandler("fCore:Admin:unJailPlayer", function()
    fastTimer = 0
end)

AddEventHandler('esx:playerLoaded', function()
    ESX.TriggerServerCallback("fCore:Admin:getIsJail", function(result) 
        if result then 
            for k,v in pairs(result) do 
                local reason = v.reason
                local expiration = v.expiration
                TriggerEvent("fCore:Admin:AddToJail", reason, expiration)
            end
        end
    end)
    TriggerServerEvent("fCore:Admin:getPermsAdmin")
    TriggerServerEvent("fCore:Admin:getGroupAdmin")
end)
