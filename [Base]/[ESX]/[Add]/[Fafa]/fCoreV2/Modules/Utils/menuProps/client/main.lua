local limit, object, lock = 0, {}, false
local cooldownProps = true

local function RequestModels(modelHash)
	if not HasModelLoaded(modelHash) and IsModelInCdimage(modelHash) then
		RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)
		end
	end
end

local function SpawnObject(model, coords, cb)
	local model = GetHashKey(model)
    limit = limit + 1
	Citizen.CreateThread(function()
        RequestModels(model)
        Wait(1)
        local obj = CreateObject(model, coords.x, coords.y, coords.z, true, false, true)
        if cb then
            cb(obj)
        end
	end)
	lock = true
	Citizen.CreateThread(function()
		while true do
			Wait(7)
			if lock then
				DisableControlAction(0, 22, true) -- Saut
				DisableControlAction(0, 21, true) -- Sprint
			else
				Wait(500)
			end
		end
	end)
end

local function SpawnObj(obj)
    if limit < menuProps.LimitProps then
        local coords, forward = GetEntityCoords(PlayerPedId()), GetEntityForwardVector(PlayerPedId())
        local objectCoords = (coords + forward * 1.0)
        local Ent = nil

        SpawnObject(obj, objectCoords, function(obj)
            SetEntityCoords(obj, objectCoords, 0.0, 0.0, 0.0, 0)
            SetEntityHeading(obj, GetEntityHeading(PlayerPedId()))
            PlaceObjectOnGroundProperly(obj)
            Ent = obj
            Wait(1)
        end)
        
        Wait(1)
        while Ent == nil do Wait(1) end
        SetEntityHeading(Ent, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(Ent)
        local placed = false
        while not placed do
            Citizen.Wait(1)
            local coords, forward = GetEntityCoords(PlayerPedId()), GetEntityForwardVector(PlayerPedId())
            local objectCoords = (coords + forward * 2.0)
            SetEntityCoords(Ent, objectCoords, 0.0, 0.0, 0.0, 0)
            SetEntityHeading(Ent, GetEntityHeading(PlayerPedId()))
            PlaceObjectOnGroundProperly(Ent)
            SetEntityAlpha(Ent, 170, 170)

            if IsControlJustReleased(1, 38) then
                placed = true
                cooldownProps = true
            end
        end

        FreezeEntityPosition(Ent, true)
        SetEntityInvincible(Ent, true)
        ResetEntityAlpha(Ent)
        local NetId = NetworkGetNetworkIdFromEntity(Ent)
        table.insert(object, NetId)
        lock = false
    else
        ESX.ShowNotification("(~r~Erreur~s~)\nVous avez atteint la limite de props.")
    end
end

local function RemoveObj(id, k)
    limit = limit - 1
    Citizen.CreateThread(function()
        SetNetworkIdCanMigrate(id, true)
        local entity = NetworkGetEntityFromNetworkId(id)
        NetworkRequestControlOfEntity(entity)
        local test = 0
        while test > 100 and not NetworkHasControlOfEntity(entity) do
            NetworkRequestControlOfEntity(entity)
            Wait(1)
            test = test + 1
        end
        SetEntityAsNoLongerNeeded(entity)

        local test = 0
        while test < 100 and DoesEntityExist(entity) do 
            SetEntityAsNoLongerNeeded(entity)
            TriggerServerEvent("DeleteEntity", NetworkGetNetworkIdFromEntity(entity))
            DeleteEntity(entity)
            DeleteObject(entity)
            if not DoesEntityExist(entity) then 
                table.remove(object, k)
				DisableControlAction(0, 22, false) -- Saut
				DisableControlAction(0, 21, false) -- Sprint
            end
            SetEntityCoords(entity, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0)
            Wait(1)
            test = test + 1
        end
    end)
end


local selectProps = nil
local openProps = false
mainMenu = RageUI.CreateMenu("Menu Props", "Interaction", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenu = RageUI.CreateSubMenu(mainMenu, "Menu Props", "Liste props", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
suppression = RageUI.CreateSubMenu(mainMenu, "Menu Props", "Suppression", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
mainMenu.Closed = function() 
    openProps = false 
end 
subMenu.Closed = function() 
    selectProps = nil 
end


function openPropsMenuProps()
    ESX.TriggerServerCallback("fCore:vip:GetIfHaveVip", function(result)
        if openProps then
            openProps = false
            RageUI.Visible(mainMenu, false)
            return
        else
            openProps = true
            RageUI.Visible(mainMenu, true)
            Citizen.CreateThread(function()
                while openProps do
                    RageUI.IsVisible(mainMenu, function()
                        RageUI.Separator("↓ ~b~Props~s~ ↓")
                        RageUI.Line("color", 19, 107, 190)
                        RageUI.Separator(("Nombre de props déjà posé: ~r~%s/%s~s~"):format(limit, menuProps.LimitProps))
                        RageUI.Button("Supprimer les props", nil, {RightLabel = "→→"}, true, {}, suppression)
                        RageUI.Line("color", 19, 107, 190)
                        if result then 
                            for k,v in pairs(menuProps.Props) do
                                if k == ESX.PlayerData.job.name or k == "vip" then
                                    RageUI.Button(k, nil, {RightLabel = "→→", LeftBadge = RageUI.BadgeStyle.Star}, true, {
                                        onSelected = function() 
                                            checkMenuProps(k)                                        
                                        end
                                    }, subMenu)
                                end
                            end
                        else
                            for k,v in pairs(menuProps.Props) do
                                if k == ESX.PlayerData.job.name then
                                    RageUI.Button(k, nil, {RightLabel = "→→", LeftBadge = RageUI.BadgeStyle.Star}, true, {
                                        onSelected = function() 
                                            checkMenuProps(k)
                                        end
                                    }, subMenu)
                                end
                            end
                        end
                    end)
                    RageUI.IsVisible(subMenu, function()
                        if limit < menuProps.LimitProps then 
                            if tableMenuPropsLoad then 
                                if #tableMenuProps > 0 then
                                for _,v in pairs(tableMenuProps) do
                                        RageUI.Button(v.Button, nil, {RightLabel = "→"}, cooldownProps, {
                                            onSelected = function()
                                                cooldownProps = false
                                                ESX.ShowNotification("(~y~Information~s~)\nAppuyez sur votre touche ~r~[E]~s~ pour poser le props.")
                                                SpawnObj(v.Props)
                                            end
                                        })
                                    end
                                else
                                    RageUI.Separator("")
                                    RageUI.Separator("~r~Catégorie vide.")
                                    RageUI.Separator("")
                                end
                            end
                        else
                            RageUI.Separator("")
                            RageUI.Separator("~r~Vous avez la limite de props.")
                            RageUI.Separator("")
                        end
                    end)
                    RageUI.IsVisible(suppression, function()
                        if #object > 0 then
                            for _,v in pairs(object) do
                                RageUI.Button(("Object: %s [~r~%s~s~]"):format(GetEntityModel(NetworkGetEntityFromNetworkId(v)), v), nil, {RightLabel = "→"}, true, {
                                    onActive = function()
                                        DrawMarker(0, (GetEntityCoords(NetworkGetEntityFromNetworkId(v))).x, (GetEntityCoords(NetworkGetEntityFromNetworkId(v))).y, (GetEntityCoords(NetworkGetEntityFromNetworkId(v))).z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 170, 1, 0, 2, 1, nil, nil, 0)
                                    end,
                                    onSelected = function()
                                        RemoveObj(v, _)
                                        table.remove(object, _)
                                    end
                                })
                            end
                        else
                            RageUI.Separator("")
                            RageUI.Separator("~r~Aucun props poser.")
                            RageUI.Separator("")
                        end
                    end)
                Wait(0)
                end
            end)
        end
    end)
end

Keys.Register('J', "menuprops", 'Ouvrir le menu props', function()
    if openProps == false then
        openPropsMenuProps()
    end
end)



function checkMenuProps(k)
    tableMenuProps = {}
    tableMenuPropsLoad = false
    for _,v in pairs(menuProps.Props[k]) do
        table.insert(tableMenuProps, v)
    end
    tableMenuPropsLoad = true
end