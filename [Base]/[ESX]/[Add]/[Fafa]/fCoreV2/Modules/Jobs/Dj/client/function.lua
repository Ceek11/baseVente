function getPlaylist(jobName)
    infoPlaylistInBdd = {}
    ESX.TriggerServerCallback("fCore:DJ:GetPlaylist", function(infoPlaylist) 
        for i = 1, #infoPlaylist do 
            table.insert(infoPlaylistInBdd, infoPlaylist[i])
        end
    end, jobName)
end