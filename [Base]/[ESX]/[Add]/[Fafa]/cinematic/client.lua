RegisterNetEvent("openCinema:ui")
AddEventHandler("openCinema:ui", function(status)
    SendNUIMessage({openCinema = status})
end)