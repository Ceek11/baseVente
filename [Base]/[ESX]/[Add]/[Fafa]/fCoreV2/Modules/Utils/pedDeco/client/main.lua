function LoadAnimDict(dict)
	if not HasAnimDictLoaded(dict) then
		RequestAnimDict(dict)
		while not HasAnimDictLoaded(dict) do
			Wait(1)
		end
	end
end

AddEventHandler("playerSpawned", function()
    local animDict, animationName = "timetable@tracy@sleep@", "idle_c"
    LoadAnimDict(animDict)
    TaskPlayAnim(PlayerPedId(), animDict, animationName, 1.0,-1.0, -1, 1, 1, true, true, true)
    TriggerServerEvent("PlayerConnexion")
end)

CreateThread(function()
    local animDict, animationName = "timetable@tracy@sleep@", "idle_c"
    LoadAnimDict(animDict)
end)