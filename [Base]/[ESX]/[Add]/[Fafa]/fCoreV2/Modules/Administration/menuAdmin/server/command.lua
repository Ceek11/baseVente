RegisterCommand("revive", function(source, args)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getGroup = xPlayer.getGroup() 
    local hasPerms = false
    for _,v in pairs(PermsCommannd) do 
        if getGroup == v then
            hasPerms = true
        end
    end
    if hasPerms then 
        if args[1] ~= nil and args[1] ~= "me" then
            TriggerClientEvent('fCore:revive', tonumber(args[1]))
        else
            TriggerClientEvent('fCore:revive', source)
        end
    end
end)

RegisterCommand("repair", function(source, args)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getGroup = xPlayer.getGroup() 
    local hasPerms = false
    for _,v in pairs(PermsCommannd) do 
        if getGroup == v then
            hasPerms = true
        end
    end
    if hasPerms then 
        TriggerClientEvent("fCore:Admin:RepairVehicle", source)
    end
end)


RegisterCommand("kick", function(source, args)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getGroup = xPlayer.getGroup() 
    local hasPerms = false
    for _,v in pairs(PermsCommannd) do 
        if getGroup == v then
            hasPerms = true
        end
    end
    if hasPerms then 
        TriggerEvent("fCore:AdminkickPlayer", args[1], args[2])
    end
end)


RegisterCommand("reviveall", function(source, args)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getGroup = xPlayer.getGroup() 
    local hasPerms = false
    for _,v in pairs(PermsCommannd) do 
        if getGroup == v then
            hasPerms = true
        end
    end
    if hasPerms then 
        local xPlayers = ESX.GetPlayers()
        if tonumber(args[1]) then
            local myPos = GetEntityCoords(GetPlayerPed(source))
            for i = 1, #xPlayers do
                local playerPed = GetPlayerPed(xPlayers[i])
                local posPlayer = GetEntityCoords(playerPed)
                local distance = #(myPos - posPlayer)
                
                if distance <= tonumber(args[1]) then
                    TriggerClientEvent('fCore:revive', xPlayers[i])
                    sNotification(source, TranslationAdministration.MenuAdmin["ReanimerZone"])
                end
            end
        else
            sNotification(source, TranslationAdministration.MenuAdmin["MauvaisArgument"])
        end
    end
end)


RegisterCommand("healAll", function(source, args)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getGroup = xPlayer.getGroup() 
    local hasPerms = false
    for _,v in pairs(PermsCommannd) do 
        if getGroup == v then
            hasPerms = true
        end
    end
    if hasPerms then 
        local xPlayers = ESX.GetPlayers()
        if tonumber(args[1]) then
            local myPos = GetEntityCoords(GetPlayerPed(source))
            for i = 1, #xPlayers do
                local playerPed = GetPlayerPed(xPlayers[i])
                local posPlayer = GetEntityCoords(playerPed)
                local distance = #(myPos - posPlayer)
                
                if distance <= tonumber(args[1]) then
                    TriggerClientEvent("fCore:MenuAdmin:healAll", xPlayers[i])
                    sNotification(source, TranslationAdministration.MenuAdmin["HealZone"])
                end
            end
        else
            sNotification(source, TranslationAdministration.MenuAdmin["MauvaisArgument"])
        end
    end
end)