local openCoffreHouse = false 
menuCoffreHouse = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuCoffreHouse = RageUI.CreateSubMenu(menuCoffreHouse," ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuChestHouse = RageUI.CreateSubMenu(menuCoffreHouse, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuCoffreHouse.Closed = function()
    openCoffreHouse = false
end

local loadPermission = false
function openMenuCoffreHouse(weightChest, weightCoffreVIP, id)
    ESX.TriggerServerCallback("fCore:vip:GetIfHaveVip", function(result)
        weightmax = result and weightCoffreVIP or weightChest
    end)
    getChestHouse(id)
    if openCoffreHouse then 
        openCoffreHouse = false 
        RageUI.Visible(menuCoffreHouse, false)
        return
    else
        openCoffreHouse = true
        RageUI.Visible(menuCoffreHouse, true)
        CreateThread(function()
            while openCoffreHouse do 
                RageUI.IsVisible(menuCoffreHouse, function()
                    RageUI.Button("Déposer un objet", nil, {}, true, {
                        onSelected = function()
                            getInventoryHouse()
                        end
                    }, subMenuCoffreHouse)
                    RageUI.Button("Retirer un objet", nil, {}, true, {
                        onSelected = function()
                            getChestHouse(id)
                        end
                    },subMenuChestHouse)
                end)
                RageUI.IsVisible(subMenuChestHouse, function()
                    if loadChestHouse then 
                        RageUI.Separator(("Coffre : %s / %s KG "):format(weightCount, weightmax))
                        for _,v in pairs(chestHouse) do 
                            if v.count > 0 then 
                                RageUI.Button(v.label, nil, {RightLabel = ("x%s"):format(v.count)}, true, {
                                    onSelected = function()
                                        local input = lib.inputDialog("Retirer un objet", {"Retirer un objet"})
                                        if input then
                                            TriggerServerEvent("fCore:AgentImmo:ChestRetirer", tonumber(input[1]), v.name, id)
                                            Wait(100)
                                            getChestHouse(id)
                                        end
                                    end
                                })
                            end
                        end
                    end
                end)
                RageUI.IsVisible(subMenuCoffreHouse, function()
                    if loadCoffreHouse then 
                        RageUI.Separator(("Coffre : %s / %s KG "):format(weightCount, weightmax))
                        for _, v in pairs(InventoryPlayer) do 
                            if v.count > 1 then 
                                RageUI.Button(v.label, nil, {RightLabel = ("x%s"):format(v.count)}, true, {
                                    onSelected = function()
                                        local input = lib.inputDialog("Nombre à déposer", {"Le nombre à déposer"})
                                        if input then 
                                            TriggerServerEvent("fCore:AgentImmo:InventoryDepo", tonumber(input[1]), v.name, weightCount, weightmax, v.label, id)
                                            Wait(100)
                                            getInventoryHouse()
                                            getChestHouse(id)
                                        end
                                    end
                                })
                            end
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end


local openManageHouse = false 
menuManageHouse = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuColocataire = RageUI.CreateSubMenu(menuManageHouse, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuColocataireDelete = RageUI.CreateSubMenu(menuManageHouse, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuGestionColocataire = RageUI.CreateSubMenu(menuManageHouse, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuColocataireGestion = RageUI.CreateSubMenu(subMenuGestionColocataire, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuJobGestion = RageUI.CreateSubMenu(subMenuGestionColocataire, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuGangGestion = RageUI.CreateSubMenu(subMenuGestionColocataire, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)

menuManageHouse.Closed = function()
    openManageHouse = false
end

local checkGang, checkJob = false, false
local gangLabel, jobLabel, gangTable, jobTable
function getInfoLabelColoc(id)
    getColocataireJob(id)
    while not loadColocataireJobHouse do 
        Wait(100)
    end
    if loadColocataireJobHouse then 
        for k, v in pairs(colocataireJob) do 
            gangTable = v.gangaccess
            jobTable = v.jobaccess
        end
    end

    for _, v in pairs(jobTable or {}) do 
        jobLabel = v.label
    end

    for _, v in pairs(gangTable or {}) do 
        gangLabel = v.label
    end

    if gangLabel ~= "Personne" then 
        checkGang = true
    end
    if jobLabel ~= "Personne" then 
        checkJob = true
    end
end

function openMenuManageHouse(id)
    getInfoLabelColoc(id)
    if openManageHouse then 
        openManageHouse = false 
        RageUI.Visible(menuManageHouse, false)
        return
    end
    openManageHouse = true
    RageUI.Visible(menuManageHouse, true)
    CreateThread(function()
        while openManageHouse do 
            RageUI.IsVisible(menuManageHouse, function()
                if checkGang or checkJob then 
                    if checkGang and checkJob then 
                        RageUI.Separator(("Job accès : %s"):format(jobLabel))
                        RageUI.Separator(("Gang accès : %s"):format(gangLabel))
                    elseif checkJob then
                        RageUI.Separator(("Job accès : %s"):format(jobLabel))
                    else
                        RageUI.Separator(("Gang accès : %s"):format(gangLabel))
                    end
                    RageUI.Line("color", 249, 130, 42)
                end

                RageUI.Button("Liste des colocataires", nil, {}, true, {
                    onSelected = function()
                        getColocataire(id)
                    end
                }, subMenuColocataire)

                RageUI.Checkbox("Donner accès a votre gang", nil, checkGang, {}, {
                    onChecked = function()
                        checkGang = true 
                        TriggerServerEvent("fCore:AgentImmo:AddGangColocataire", 1, id)
                        Wait(100)
                        getInfoLabelColoc(id)
                    end,
                    onUnChecked = function()
                        checkGang = false 
                        TriggerServerEvent("fCore:AgentImmo:AddGangColocataire", 2, id)
                    end
                })

                RageUI.Checkbox("Donner accès a votre métier", nil, checkJob, {}, {
                    onChecked = function()
                        checkJob = true 
                        TriggerServerEvent("fCore:AgentImmo:AddJobColocataire", 1, id)
                        Wait(100)
                        getInfoLabelColoc(id)
                    end,
                    onUnChecked = function()
                        checkJob = false 
                        TriggerServerEvent("fCore:AgentImmo:AddJobColocataire", 2, id)
                    end
                })

                RageUI.Button("Gestion des permissions", nil, {}, true, {
                    onSelected = function()
                        getColocataire(id)
                    end
                }, subMenuGestionColocataire)
            end)

            RageUI.IsVisible(subMenuColocataire, function()
                RageUI.Separator("↓ ~b~Colocataire~s~ ↓")
                RageUI.Button("Ajouter en colocataire", nil, {RightLabel = "→→"}, true, {
                    onSelected = function()
                        targetT = GetNearbyPlayer(false, true)
                        if targetT then 
                            ESX.TriggerServerCallback("fCore:vip:GetIfHaveVip", function(result)
                                maxKeysHouse = result and 5 or 2
                                TriggerServerEvent("fCore:AgentImmo:AddColoc", GetPlayerServerId(targetT), id, maxKeysHouse)
                            end)
                        end
                    end
                })
                RageUI.Line("color", 249, 130, 42)
                if loadColocataireHouse then 
                    for k, v in pairs(colocataireHouse) do 
                        RageUI.Button(v.name, nil, {}, true, {
                            onSelected = function()
                                name = v.name
                            end
                        }, subMenuColocataireDelete)
                    end
                end
            end)

            RageUI.IsVisible(subMenuColocataireDelete, function()
                RageUI.Button("Supprimer le colocataire", nil, {}, true, {
                    onSelected = function()
                        for k,v in pairs(colocataireHouse) do 
                            if v.name == name then 
                                table.remove(colocataireHouse, k)
                                if #colocataireHouse > 0 then 
                                    TriggerServerEvent("fCore:AgentImmo:DeleteColoc", colocataireHouse, id, 1)
                                else
                                    TriggerServerEvent("fCore:AgentImmo:DeleteColoc", colocataireHouse, id, 2)
                                end
                            end
                        end
                    end
                })
            end)
            RageUI.IsVisible(subMenuGestionColocataire, function()
                if loadColocataireJobHouse then 
                    for k,v in pairs(jobTable) do 
                        RageUI.Button("Gestion job", nil, {}, true, {
                            onSelected = function()
                                coffre = v.coffre 
                                manage = v.manage
                            end
                        }, subMenuJobGestion)
                    end
                end
                if loadColocataireJobHouse then 
                    for k,v in pairs(gangTable) do 
                        RageUI.Button("Gestion gang", nil, {}, true, {
                            onSelected = function()
                                coffre = v.coffre 
                                manage = v.manage
                            end
                        }, subMenuGangGestion)
                    end
                end
                RageUI.Line("color", 249, 130, 42)
                if loadColocataireHouse then 
                    for k, v in pairs(colocataireHouse) do 
                        RageUI.Button(v.name, nil, {}, true, {
                            onSelected = function()
                                identifier = v.identifier 
                                coffre = v.coffre 
                                manage = v.manage
                            end
                        }, subMenuColocataireGestion)
                    end
                end
            end)
            RageUI.IsVisible(subMenuJobGestion, function()
                RageUI.Checkbox("Coffre", nil, coffre, {}, {
                    onChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermissionJob", "coffre", true, id, jobTable)
                        coffre = true
                        Wait(100)
                        getInfoLabelColoc(id)
                    end,
                    onUnChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermissionJob", "coffre", false, id, jobTable)
                        coffre = false 
                        Wait(100)
                        getInfoLabelColoc(id)
                    end
                })
                RageUI.Checkbox("Manage", nil, manage, {}, {
                    onChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermissionJob", "manage", true, id, jobTable)
                        manage = true
                        Wait(100)
                        getInfoLabelColoc(id)
                    end,
                    onUnChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermissionJob", "manage", false, id, jobTable)
                        manage = false 
                        Wait(100)
                        getInfoLabelColoc(id)
                    end
                })
            end)
            RageUI.IsVisible(subMenuGangGestion, function()
                RageUI.Checkbox("Coffre", nil, coffre, {}, {
                    onChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermissionGang", "coffre", true, id, gangTable)
                        coffre = true
                        Wait(100)
                        getInfoLabelColoc(id)
                    end,
                    onUnChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermissionGang", "coffre", false, id, gangTable)
                        coffre = false 
                        Wait(100)
                        getInfoLabelColoc(id)
                    end
                })
                RageUI.Checkbox("Manage", nil, manage, {}, {
                    onChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermissionGang", "manage", true, id, gangTable)
                        manage = true
                        Wait(100)
                        getInfoLabelColoc(id)
                    end,
                    onUnChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermissionGang", "manage", false, id, gangTable)
                        manage = false 
                        Wait(100)
                        getInfoLabelColoc(id)
                    end
                })
            end)

            RageUI.IsVisible(subMenuColocataireGestion, function()
                RageUI.Checkbox("Coffre", nil, coffre, {}, {
                    onChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermission", "coffre", true, id, colocataireHouse, identifier)
                        coffre = true
                        Wait(100)
                        getColocataire(id)
                    end,
                    onUnChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermission", "coffre", false, id, colocataireHouse, identifier)
                        coffre = false 
                        Wait(100)
                        getColocataire(id)
                    end
                })
                RageUI.Checkbox("Manage", nil, manage, {}, {
                    onChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermission", "manage", true, id, colocataireHouse, identifier)
                        manage = true
                        Wait(100)
                        getColocataire(id)
                    end,
                    onUnChecked = function()
                        TriggerServerEvent("fCore:agentImmo:updatePermission", "manage", false, id, colocataireHouse, identifier)
                        manage = false 
                        Wait(100)
                        getColocataire(id)
                    end
                })
            end)
            Wait(0)
        end
    end)
end


