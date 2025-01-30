RegisterNetEvent("poleEmploi:setjob")
AddEventHandler("poleEmploi:setjob", function(name, grade)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    xPlayer.setJob(name, grade)
end)