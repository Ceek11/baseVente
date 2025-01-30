function getCops()
    Jobs = {"police", "sheriff"}
    local xPlayers = ESX.GetPlayers()
    local copsConnected = 0
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if (xPlayer.getJob().name) == Jobs then
            copsConnected = copsConnected + 1
        end
    end
    return copsConnected
end

RegisterNetEvent("fCore:setPlayerToBucket")
AddEventHandler("fCore:setPlayerToBucket", function(id)
    local _src = source 
    SetPlayerRoutingBucket(_src, id)
end)

RegisterServerEvent("fCore:setPlayerToNormalBucket")
AddEventHandler("fCore:setPlayerToNormalBucket", function()
    local _src = source 
    SetPlayerRoutingBucket(source, 0)
end)
