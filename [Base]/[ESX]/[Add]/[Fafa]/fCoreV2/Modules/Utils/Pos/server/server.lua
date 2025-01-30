RegisterNetEvent("fCore:sendpos")
AddEventHandler("fCore:sendpos",function(posPlayer,Heading)
    local _src = source
    local steamhex = GetPlayerIdentifiers(source)[1]
    sendToDiscord(12975872,"Position","**".."Votre Position est : ".."**"..posPlayer.." ".."**".."\n Heading : ".."**"..Heading, "Fait par Ceek", webhooks.LogsPos)
end)