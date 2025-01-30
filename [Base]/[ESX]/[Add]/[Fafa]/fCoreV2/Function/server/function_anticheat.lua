function checkPos(point, _src)
    local license, steamID, liveid, xblid, discord, playerip = "n/a", "n/a", "n/a", "n/a", "n/a", "n/a"
    local identifiers = GetPlayerIdentifiers(_src)
    for _, v in ipairs(identifiers) do
        if string.find(v, "license:") then
            license = v
        elseif string.find(v, "steam:") then
            steamID = v
        elseif string.find(v, "live:") then
            liveid = v
        elseif string.find(v, "xbl:") then
            xblid = v
        elseif string.find(v, "discord:") then
            discord = v
        elseif string.find(v, "ip:") then
            playerip = v
        end
    end
    local PlayerPos = GetEntityCoords(GetPlayerPed(_src))
    local dist = #(point-PlayerPos) 
    if dist >= Cfg.DistMaxAnticheat then
        sendToDiscord(12975872,Translation.Anticheat["name_webhooks"],(Translation.Anticheat["webhooks_security_anti_cheater_point"]):format(GetPlayerName(_src),steamID, license, discord), "", webhooks.logsAnticheat)
        DropPlayer(_src, Translation.Anticheat["drop_player_cheat"])   
    end
end

function checkJobGrade(xPlayer, jobName, gradeBoss, _src)
    local license, steamID, liveid, xblid, discord, playerip = "n/a", "n/a", "n/a", "n/a", "n/a", "n/a"
    local identifiers = GetPlayerIdentifiers(_src)
    for _, v in ipairs(identifiers) do
        if string.find(v, "license:") then
            license = v
        elseif string.find(v, "steam:") then
            steamID = v
        elseif string.find(v, "live:") then
            liveid = v
        elseif string.find(v, "xbl:") then
            xblid = v
        elseif string.find(v, "discord:") then
            discord = v
        elseif string.find(v, "ip:") then
            playerip = v
        end
    end
    if xPlayer.job.name ~= jobName or xPlayer.job.grade_name ~= gradeBoss then
        sendToDiscord(12975872,Translation.Anticheat["name_webhooks"], (Translation.Anticheat["webhooks_security_anti_cheater"]):format(GetPlayerName(_src),steamID, license, discord, jobName, gradeBoss, xPlayer.job.name, xPlayer.job.grade_name), "", webhooks.logsAnticheat)
        DropPlayer(_src, Translation.Anticheat["drop_player_cheat"])
    end
end

function checkJob2Grade(xPlayer, jobName, gradeBoss, _src)
    local license, steamID, liveid, xblid, discord, playerip = "n/a", "n/a", "n/a", "n/a", "n/a", "n/a"
    local identifiers = GetPlayerIdentifiers(_src)
    for _, v in ipairs(identifiers) do
        if string.find(v, "license:") then
            license = v
        elseif string.find(v, "steam:") then
            steamID = v
        elseif string.find(v, "live:") then
            liveid = v
        elseif string.find(v, "xbl:") then
            xblid = v
        elseif string.find(v, "discord:") then
            discord = v
        elseif string.find(v, "ip:") then
            playerip = v
        end
    end
    if xPlayer.job2.name ~= jobName or xPlayer.job2.grade_name ~= gradeBoss then
        sendToDiscord(12975872,Translation.Anticheat["name_webhooks"], (Translation.Anticheat["webhooks_security_anti_cheater"]):format(GetPlayerName(_src), steamID, license, discord, jobName, gradeBoss, xPlayer.job2.name, xPlayer.job2.grade_name), "", webhooks.logsAnticheat)
        DropPlayer(_src, Translation.Anticheat["drop_player_cheat"])
    end
end

function checkGradeAdmin(xPlayer, group)
    local grade = xPlayer.getGroup()
    for k,v in pairs(groupe) do 
        if not grade == v then 
            sendToDiscord(12975872,Translation.Anticheat["name_webhooks"], (Translation.Anticheat["webhooks_security_anti_cheater"]):format(GetPlayerName(_src),steam, license, discord, jobName, gradeBoss, xPlayer.job2.name, xPlayer.job2.grade_name), "", webhooks.logsAnticheat)
            DropPlayer(_src, Translation.Anticheat["drop_player_cheat"])
        end
    end
end
