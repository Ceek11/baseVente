RegisterNetEvent("fCore:Boss:resignation")
AddEventHandler("fCore:Boss:resignation", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
    sendToDiscord(12975872,"Logs Job",("Le joueur **%s** viens de quitter son métier\n\n**Id:** %s \n**License: **%s\n**Discord: **<@%s>\n**Job: ** %s"):format(xPlayer.name, xPlayer.playerId, xPlayer.identifier, discordPlayer, xPlayer.getJob().name), "", webhooks.LogsJob)
    xPlayer.setJob(Cfg.NoJob, 0)
end)
