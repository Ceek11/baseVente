RegisterServerEvent("fCore:setPlayerToNormalBucket")
AddEventHandler("fCore:setPlayerToNormalBucket", function()
    local _src = source 
    SetPlayerRoutingBucket(source, 0)
end)