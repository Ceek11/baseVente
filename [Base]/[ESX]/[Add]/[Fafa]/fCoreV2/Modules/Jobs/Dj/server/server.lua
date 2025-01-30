local xSound = exports.xsound

RegisterNetEvent('fCore:DJ:playMusic', function(YoutubeURL)
    for k, v in pairs(Dj.Pos) do
        local defaultVolume = Dj.DefaultVolume
        local src = source
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(ped)
        local dist = #(coords - v.coords)
        if dist < 3 then
            xSound:PlayUrlPos(-1, v.name, YoutubeURL, defaultVolume, coords)
            xSound:Distance(-1, v.name, v.radius)
            v.isPlaying = true
        end
    end
end)

RegisterNetEvent('fCore:DJ:pauseMusic', function()
    for k, v in pairs(Dj.Pos) do
        local src = source
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(ped)
        local dist = #(coords - v.coords)
        if dist < 3 then
            if v.isPlaying then
                v.isPlaying = false
                xSound:Pause(-1, v.name)
            end
        end
    end
end)

RegisterNetEvent('fCore:DJ:resumeMusic', function()
    for k, v in pairs(Dj.Pos) do
        local src = source
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(ped)
        local dist = #(coords - v.coords)
        if dist < 3 then
            if not v.isPlaying then
                v.isPlaying = true
                xSound:Resume(-1, v.name)
            end
        end
    end
end)

RegisterNetEvent('fCore:DJ:stopMusic', function()
    for k, v in pairs(Dj.Pos) do
        local src = source
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(ped)
        local dist = #(coords - v.coords)
        if dist < 3 then
            if v.isPlaying then
                v.isPlaying = false
                xSound:Destroy(-1, v.name)
            end
        end
    end
end)


RegisterNetEvent('fCore:DJ:changeVolume', function(volume)
    for k, v in pairs(Dj.Pos) do
        local src = source
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(ped)
        local dist = #(coords - v.coords)
        if dist < 3 then
            if not tonumber(volume) then return end
            if v.isPlaying then 
                xSound:setVolume(-1, v.name, volume)
            end
        end
    end
end)

RegisterNetEvent('fCore:DJ:changeVolumePlayer')
AddEventHandler('fCore:DJ:changeVolumePlayer', function(volume)
    local _src = source 
    for k, v in pairs(Dj.Pos) do
        local src = source
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(ped)
        local dist = #(coords - v.coords)
        if dist < v.radius then
            if not tonumber(volume) then return end
            xSound:setVolume(_src, v.name, volume)
        end
    end
end)


RegisterNetEvent("fCore:DJ:Playlist")
AddEventHandler("fCore:DJ:Playlist", function(nameMusic, UrlMusic, jobName)
    local query = "INSERT INTO playlist (job,nom,url) VALUES (@job, @nom, @url)"
    local param = {["@job"] = jobName, ["@nom"] = nameMusic, ["@url"] = UrlMusic}
    MySQL.Async.execute(query, param)
end)

ESX.RegisterServerCallback("fCore:DJ:GetPlaylist", function(source, cb, jobName)
    local query = "SELECT * FROM playlist WHERE job = @job"
    local param = {["@job"] = jobName}
    MySQL.Async.fetchAll(query, param, function(result)
        local infoPlaylist = {}
        for i = 1, #result do
            table.insert(infoPlaylist, {
                nom = result[i].nom, 
                url = result[i].url,
                id = result[i].id
            })
        end
        cb(infoPlaylist)
    end)
end)

RegisterNetEvent("fCore:DJ:DeleteMusicPlaylist")
AddEventHandler("fCore:DJ:DeleteMusicPlaylist", function(id)
    local query = "DELETE FROM playlist WHERE id = @id"
    local param = {["@id"] = id}
    MySQL.Async.execute(query, param)
end)