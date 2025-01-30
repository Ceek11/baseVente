
ESX = exports["es_extended"]:getSharedObject()

--- DO NOT EDIT THIS --
local holstered  = true
local blocked	 = false
local PlayerData = {}
local cooldown	 = _G.weaponPull_cooldown
------------------------


Citizen.CreateThread(function()
	if weaponPull.UseESX then
		
		while ESX.GetPlayerData().job == nil do
			Citizen.Wait(10)
		end
		
		PlayerData = ESX.GetPlayerData()
		
		if not PlayerData.job.name == 'police' then
			cooldown = weaponPull.CooldownPolice
		end
	end
end)


 Citizen.CreateThread(function()
	while true do
		loadAnimDict("reaction@intimidation@1h")
		loadAnimDict("weapons@pistol_1h@gang")
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped, false) then
            if DoesEntityExist( ped ) and not IsEntityDead( ped ) and GetVehiclePedIsTryingToEnter(ped) == 0 and not IsPedInParachuteFreeFall (ped) then
                if CheckWeapon(ped) then
                    if holstered then
                        blocked   = true
                        TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                        Citizen.Wait(2500)
                        ClearPedTasks(ped)
                        holstered = false
                    else
                        blocked = false
                    end
                else
                    if not holstered then
                        TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                        Citizen.Wait(1500)
                        ClearPedTasks(ped)
                        holstered = true
                    end
                end
            else
                SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
            end
		else
			holstered = false
		end
        Wait(200)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
        if blocked then
            DisableControlAction(1, 25, true )
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            DisableControlAction(1, 23, true)
            DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
            DisablePlayerFiring(ped, true) -- Disable weapon firing
        end
	end
end)


function CheckWeapon(ped)
	for i = 1, #weaponPull.Weapons do
		if GetHashKey(weaponPull.Weapons[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end


function loadAnimDict(dict)
	while ( not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end
