

local vehicles = {}
function getVehicles() 
    vehicles = {} 
    ESX.TriggerServerCallback("xGarage:getVehicles", function(result) 
        vehicles = result 
    end) 
end

local open = false
local mainMenu = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
local show_car = RageUI.CreateSubMenu(mainMenu, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
local menuKeys = RageUI.CreateSubMenu(mainMenu, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
mainMenu.Display.Header = true
mainMenu.Closed = function() 
    open = false 
    FreezeEntityPosition(PlayerPedId(), false) 
end

function openMenuGaragePublic(Type, PosSortie)
    if open then
        open = false
        RageUI.Visible(mainMenu, false)
    else
        open = true
        RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do
                Wait(0)
                RageUI.IsVisible(mainMenu, function()
                    RageUI.Button("Liste véhicules", nil, {RightLabel = "→→"}, true, { 
                        onSelected = function() 
                            getVehicles() 
                        end 
                    }, show_car)
                    RageUI.Button("Gestion des clées", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            getKeysGive()
                        end
                    }, menuKeys)
                end)
                RageUI.IsVisible(menuKeys, function()
                    RageUI.Button("Donner un double de clé", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local input = lib.inputDialog("Plaque d'immatriculation", {"Plaque d'immatriculation"})
                            if input then 
                                targetT = GetNearbyPlayer(false, true)
                                if not targetT then return end 
                                if targetT then
                                    ESX.TriggerServerCallback("fCore:vip:GetIfHaveVip", function(result)
                                        maxKeys = result and 3 or 1
                                        TriggerServerEvent("fCore:Keys:DuplicateKeysCar", GetPlayerServerId(targetT), input[1], maxKeys)
                                        ESX.SetTimeout(200,function()
                                            getKeysGive()
                                        end)
                                    end)
                                end
                            end
                        end
                    })
                    RageUI.Line("color", 249, 130, 42)
                    RageUI.Separator("↓ Liste des doubles de clées ↓")
                    RageUI.Line("color", 249, 130, 42)
                    if canOpen then 
                        for _, v in pairs(KeysGive) do
                            local data = json.decode(v.other_users) 
                            if #data > 0 then
                                for _, user in ipairs(data) do
                                    RageUI.Button(user.name, "Appuyez sur ENTER pour supprimer la clé", {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            TriggerServerEvent("fCore:Keys:DeleteKeysGive", v.plate, user.identifier)
                                            ESX.SetTimeout(200,function()
                                                getKeysGive()
                                            end)
                                        end
                                    })
                                end
                            end
                        end
                    end
                end)
                RageUI.IsVisible(show_car, function()
                    if #vehicles > 0 then
                        for _,v in pairs(vehicles) do
                            if v.Type == "motorcycles" then
                                v.Type = "vehicle"
                            end
                            if v.Type == Type then 
                                RageUI.Button(("~r~→~s~ %s [~r~%s~s~]"):format(GetDisplayNameFromVehicleModel(json.decode(v.vehicle).model), v.plate), nil, {RightBadge = RageUI.BadgeStyle.Car}, true, {
                                    onSelected = function()
                                    if not ESX.Game.IsSpawnPointClear(GetEntityCoords(PlayerPedId()), 1) then 
                                        cNotification("(~r~Erreur~s~)\nEspace insuffisant pour sortir votre véhicule.")
                                    end
                                        RequestModel(json.decode(v.vehicle).model)
                                        while not HasModelLoaded(json.decode(v.vehicle).model) do
                                            Citizen.Wait(10)
                                        end
                                        
                                        local car = CreateVehicle(json.decode(v.vehicle).model, PosSortie, GetEntityHeading(PlayerPedId()), true, false)
                                        ESX.Game.SetVehicleProperties(car, json.decode(v.vehicle))
                                        SetVehicleNumberPlateText(car, v.plate)
                                        SetPedIntoVehicle(PlayerPedId(), car, -1)
                                        TriggerServerEvent("xGarage:setStats", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)), 2, ESX.Game.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId(), false)))
                                        FreezeEntityPosition(PlayerPedId(), false)
                                        RageUI.CloseAll()
                                        open = false
                                    end
                                })
                            end
                        end
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~Aucun véhicule dans le GaragePublic.~s~")
                        RageUI.Separator("")
                    end
                end)
            end
        end)
    end
end


