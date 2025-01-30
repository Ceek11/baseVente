ESX = nil
ESX = exports["es_extended"]:getSharedObject()

function sNotification(src, message)
    TriggerClientEvent("esx:showNotification", src, message)
end

function sendToDiscord(color, name, message, footer,webhook)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function formatExpiration(time)
    local t = os.date("*t", time)
    return t.day.."/"..t.month.."/"..t.year.." à "..t.hour..":"..t.min
end


discordPlayer  = nil
AddEventHandler('playerConnecting', function(playerName, setKickReason)
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            discordPlayer = string.sub(v, string.len("discord:") + 1)
        end
    end
end)