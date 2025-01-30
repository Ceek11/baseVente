local startIndex, endIndex
local Recherche
ServiceAdmin, openAdmin, AllPerms = false, false, false
local inventoryPlayer, var, idPlayer = nil, nil, nil
local createGradeAdminTable = {}
local IndexInventory, IndexSanction, IndexTP, IndexSoins, IndexDeleteVehicle, IndexChange, IndexFiltrePlayer = 1,1,1,1,1,1,1
local IndexModifItem = 1
local labelLicense, TypeLicense, IndexLicense, IndexVehicule, IndexModifItem = {}, {}, 1, 1, 1 
menuAdmin = RageUI.CreateMenu("Menu Admin ", "Admin")
menuReport = RageUI.CreateSubMenu(menuAdmin, "Menu Admin", " ")
subMenuReport = RageUI.CreateSubMenu(menuReport, "Menu Admin ", "Admin")
subMenuJail = RageUI.CreateSubMenu(subMenuReport, "Menu Admin ", "Admin")
optionAvancerReport = RageUI.CreateSubMenu(subMenuReport, "Menu Admin ", "Admin")
menuGiveItemReport = RageUI.CreateSubMenu(optionAvancerReport, "Menu Admin ", "Admin")
menuSetJobReport = RageUI.CreateSubMenu(optionAvancerReport, "Menu Admin ", "Admin")
listWarn = RageUI.CreateSubMenu(optionAvancerReport, "Menu Admin ", "Admin")
menuPersonnel = RageUI.CreateSubMenu(menuAdmin, "Menu Admin ", "Admin")
MenuMeteo = RageUI.CreateSubMenu(menuAdmin, "Menu Admin ", "Admin")
MenuTemps = RageUI.CreateSubMenu(MenuMeteo, "Menu Admin ", "Admin")
MenuMeteoCommand = RageUI.CreateSubMenu(MenuMeteo, "Menu Admin ", "Admin")
menuJoueur = RageUI.CreateSubMenu(menuAdmin, "Menu Admin ", "Admin")
menuVehicule = RageUI.CreateSubMenu(menuAdmin, "Menu Admin ", "Admin")
spawnVehicleAdmin = RageUI.CreateSubMenu(menuVehicule, "Menu Admin ", "Admin")
listVehicleAdmin =  RageUI.CreateSubMenu(spawnVehicleAdmin, "Menu Admin ", "Admin")
menuListVehicleAdmin = RageUI.CreateSubMenu(listVehicleAdmin, "Menu Admin ", "Admin")
VehicleOptionAdmin = RageUI.CreateSubMenu(menuVehicule, "Menu Admin ", "Admin")
menuAdministratif = RageUI.CreateSubMenu(menuAdmin, "Menu Admin ", "Admin")
gestionServeur = RageUI.CreateSubMenu(menuAdministratif, "Menu Admin ", "Admin")
menuCreateItem = RageUI.CreateSubMenu(menuAdministratif, "Menu Admin ", "Admin")
AnnonceServeur = RageUI.CreateSubMenu(menuAdministratif, "Menu Admin ", "Admin")
listeItem = RageUI.CreateSubMenu(menuCreateItem, "Menu Admin ", "Admin")
modifierItem = RageUI.CreateSubMenu(listeItem, "Menu Admin ", "Admin")
gestionPermission = RageUI.CreateSubMenu(gestionServeur, "Menu Admin ", "Admin")
gestionBan= RageUI.CreateSubMenu(gestionServeur, "Menu Admin ", "Admin")
AddAdmin = RageUI.CreateSubMenu(gestionPermission, "Menu Admin ", "Admin")
AddAdminOption = RageUI.CreateSubMenu(gestionPermission, "Menu Admin ", "Admin")
addRolePlayer = RageUI.CreateSubMenu(AddAdminOption, "Menu Admin ", "Admin")
gestionListeAdmin = RageUI.CreateSubMenu(gestionPermission, "Menu Admin ", "Admin")
gestionPlayerAdmin = RageUI.CreateSubMenu(gestionListeAdmin, "Menu Admin ", "Admin")
gestionGererGrade = RageUI.CreateSubMenu(gestionPermission, "Menu Admin ", "Admin")
ManageGererGrade = RageUI.CreateSubMenu(gestionGererGrade, "Menu Admin ", "Admin")
ChangePermissionGrade = RageUI.CreateSubMenu(ManageGererGrade, "Menu Admin ", "Admin")
createGradeAdmin = RageUI.CreateSubMenu(gestionPermission, "Menu Admin ", "Admin")
GestionGradeadmin = RageUI.CreateSubMenu(createGradeAdmin, "Menu Admin ", "Admin")
optionJoueurAdmin = RageUI.CreateSubMenu(menuPersonnel, "Menu Admin ", "Admin")
menuPedPersonel = RageUI.CreateSubMenu(menuPersonnel, "Menu Admin ", "Admin")
menuListPedPersonel = RageUI.CreateSubMenu(menuPedPersonel, "Menu Admin ", "Admin")
menuGiveItemPersonel = RageUI.CreateSubMenu(optionJoueurAdmin, "Menu Admin ", "Admin")
menuSetJobPersonel = RageUI.CreateSubMenu(optionJoueurAdmin, "Menu Admin ", "Admin")
menuMappingAdmin = RageUI.CreateSubMenu(menuAdministratif, "Menu Admin ", "Admin")
menuListJoueur = RageUI.CreateSubMenu(menuJoueur,"Menu Admin ", "Admin")
subMenuHorsLigne = RageUI.CreateSubMenu(menuListJoueur,"Menu Admin ", "Admin")
menuListPlayer = RageUI.CreateSubMenu(menuListJoueur,"Menu Admin ", "Admin")
menuWipe = RageUI.CreateSubMenu(menuListPlayer,"Menu Admin ", "Admin")
menuJailPlayer = RageUI.CreateSubMenu(menuListPlayer,"Menu Admin ", "Admin")
infoJoueur = RageUI.CreateSubMenu(menuListPlayer,"Menu Admin ", "Admin")
showSanction = RageUI.CreateSubMenu(infoJoueur,"Menu Admin ", "Admin")
showWarn = RageUI.CreateSubMenu(showSanction,"Menu Admin ", "Admin")
showBan = RageUI.CreateSubMenu(showSanction,"Menu Admin ", "Admin")
gestionWarn = RageUI.CreateSubMenu(showWarn,"Menu Admin ", "Admin")
infoInventaireJoueur = RageUI.CreateSubMenu(infoJoueur,"Menu Admin ", "Admin")
menuGiveItemPlayer = RageUI.CreateSubMenu(menuListPlayer,"Menu Admin ", "Admin")
menuJoueurSetjob = RageUI.CreateSubMenu(menuListPlayer,"Menu Admin ", "Admin")
changeEsthetique = RageUI.CreateSubMenu(VehicleOptionAdmin,"Menu Admin ", "Admin")
menuAdmin.Closed = function()
    openAdmin = false 
    Recherche = nil
end

local nbrAdmin = nil
RegisterNetEvent("fCore:Admin:nbrAdmin")
AddEventHandler("fCore:Admin:nbrAdmin", function(count)
    nbrAdmin = count
end)

local prisEnCharge = false
RegisterNetEvent("fCore:Admin:StatsReport")
AddEventHandler("fCore:Admin:StatsReport", function(stats)
    prisEnCharge = stats
end)
local prisEnChargeStatus = true

reportTable = {}

RegisterNetEvent("fCore:Admin:report")
AddEventHandler("fCore:Admin:report", function(source, args, name)
    table.insert(reportTable, {id = source, reason = (TranslationAdministration.MenuAdmin["reasonReport"]):format(args, name), playerName = name, prisEnCharge = false})
    cNotification((TranslationAdministration.MenuAdmin["CNotif_newreport"]):format(#reportTable))
end)

function openMenuAdmin()
    TriggerServerEvent("fCore:Admin:getPermsAdmin")
    TriggerServerEvent("fCore:Admin:getGroupAdmin")
    if openAdmin then 
        openAdmin = false 
        RageUI.Visible(menuAdmin, false)
        return
    else
        openAdmin = true
        RageUI.Visible(menuAdmin, true)
        CreateThread(function()
            while openAdmin do 
                RageUI.IsVisible(menuAdmin, function()
                    LabelModeAdmin = ServiceAdmin and TranslationAdministration.MenuAdmin["DesactiverAdmin"] or TranslationAdministration.MenuAdmin["ActiverAdmin"] 
                    RageUI.Checkbox(LabelModeAdmin, nil, ServiceAdmin, {}, {
                        onChecked = function()
                            ServiceAdmin = true
                            TriggerServerEvent("fCore:Admin:nbrAdmin", true)
                            cNotification(TranslationAdministration.MenuAdmin["CNotif_takeservice"])
                            tenueAdmin()
                        end,
                        onUnChecked = function()
                            ServiceAdmin = false
                            TriggerServerEvent("fCore:Admin:nbrAdmin", false)
                            cNotification(TranslationAdministration.MenuAdmin["CNotif_leaveService"])
                            tenueAdmin()
                        end
                    })
                    if checkPerms("shownvbrreport") then 
                        RageUI.Checkbox(TranslationAdministration.MenuAdmin["AfficherNbReport"], nil, nbrReport, {}, {
                            onChecked = function()
                                nbrReport = true
                                TriggerEvent("fCore:Admin:showReport", nbrReport)
                            end,
                            onUnChecked = function()
                                nbrReport = false
                                TriggerEvent("fCore:Admin:showReport", nbrReport)
                            end
                        })
                    end
                    if ServiceAdmin then 
                        RageUI.Separator(TranslationAdministration.MenuAdmin["MenuAdmin"])
                        RageUI.Line("color", 19, 107, 190)
                        RageUI.Separator((TranslationAdministration.MenuAdmin["NbStaffActif"]):format(nbrAdmin))
                        if checkPerms("menureport") then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["ReportDev"], nil, {RightLabel = "→→"}, true, {}, menuReport)
                        end
                        if checkPerms("menupersonnel") then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["MonJoueur"], nil, {RightLabel = "→→"}, true, {},menuPersonnel)
                        end
                        if checkPerms("meteo") then 
                            RageUI.Button("Changer la météo", nil, {RightLabel = "→→"}, true, {}, MenuMeteo)
                        end
                        if checkPerms("menujoueur") then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["JoueurDev"], nil, {RightLabel = "→→"}, true, {}, menuJoueur)
                        end
                        if checkPerms("menuvehicle") then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["Vehicule"], nil, {RightLabel = "→→"}, true, {
                                onSelected = function()
                                    getCategorieVehicule()
                                    getVehicleBdd()
                                end
                            }, menuVehicule)
                        end
                        if checkPerms("menuserveur") then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["Serveur"], nil, {RightLabel = "→→"}, true, {}, menuAdministratif)
                        end
                    end
                end)
                RageUI.IsVisible(MenuMeteo, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_weatherMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_changeTime"], nil, {}, true, {
                        onSelected = function()
                            time = lib.inputDialog(TranslationAdministration.MenuAdmin["S_changeTime"], {
                                {type = "number", label = "L'heure"},
                                {type = "number", label = "Les minutes"}
                            })
                            if time then 
                                if not time[2] then
                                    time[2] = 00
                                end
                                ExecuteCommand(("time %s %s"):format(time[1], time[2]))
                            end
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_freezeTime"], nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand("freezetime")
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_freezeWeather"], nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand("freezeweather")
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_weather"], nil, {RightLabel = "→"}, true, {}, MenuMeteoCommand)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_timeMenu"], nil, {RightLabel = "→"}, true, {}, MenuTemps)
                end)
                RageUI.IsVisible(MenuMeteoCommand, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_weatherMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(Administration.Meteo) do 
                        RageUI.Button((TranslationAdministration.MenuAdmin["S_currentTime"]):format(v.label), nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                ExecuteCommand(v.command)
                            end
                        })
                    end
                end)

                RageUI.IsVisible(MenuTemps, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_timeOptions"])
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(Administration.Temps) do 
                        RageUI.Button((TranslationAdministration.MenuAdmin["S_currentTime"]):format(v.label), nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                ExecuteCommand(v.command)
                            end
                        })
                    end
                end)
                RageUI.IsVisible(menuReport, function()
                    if checkPerms("showreport") then 
                        RageUI.Separator(TranslationAdministration.MenuAdmin["MenuReport"])
                        RageUI.Line("color", 19, 107, 190)
                        if #reportTable > 0 then 
                            for k,v in pairs(reportTable) do
                                local labelStatsReport = not v.prisEnCharge and TranslationAdministration.MenuAdmin["Attente"] or TranslationAdministration.MenuAdmin["EnCharge"]
                                RageUI.Button((TranslationAdministration.MenuAdmin["InfosReportAttente"]):format(k, v.playerName, v.id), nil, {RightLabel = labelStatsReport}, true, {
                                    onSelected = function()
                                        prisEnCharge = v.prisEnCharge
                                        name = v.playerName
                                        id = v.id
                                        nbr = k
                                        reason = v.reason
                                    end
                                }, subMenuReport)
                            end                        
                        else
                            RageUI.Separator("")
                            RageUI.Separator(TranslationAdministration.MenuAdmin["AucunReport"])
                            RageUI.Separator("")
                        end
                    else
                        RageUI.Separator("")
                        RageUI.Separator(TranslationAdministration.MenuAdmin["CNotif_dontHavePermission"])
                        RageUI.Separator("")
                    end
                end)
                RageUI.IsVisible(subMenuReport, function()
                    RageUI.Button(TranslationAdministration.MenuAdmin["PrendreEnCharge"], reason, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            if nbr and reportTable[nbr] then
                                local reportEntry = reportTable[nbr]
                                reportEntry.prisEnCharge = true
                            end
                            updateStatusReport()
                        end
                    })
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Separator((TranslationAdministration.MenuAdmin["InfosReportEnCharge"]): format(name, id, nbr))
                    RageUI.Line("color", 19, 107, 190)
                    if checkPerms("tpjoueur") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["TeleporterVersLui"], reason, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:Admin:GotoPlayer", id)
                            end
                        })
                        RageUI.Button(TranslationAdministration.MenuAdmin["TeleporterVersMoi"], reason, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:Admin:bringPlayer", id)
                            end
                        })
                    end
                    RageUI.Button(TranslationAdministration.MenuAdmin["OptionAvancee"], reason, {RightLabel = "→→"}, true, {}, optionAvancerReport)
                    RageUI.Button(TranslationAdministration.MenuAdmin["FermerReport"], reason, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            TriggerServerEvent("fCore:Admin:sendMessageToClose", id)
                            table.remove(reportTable, nbr)
                            updateStatusReport()
                        end
                    })
                end)
                RageUI.IsVisible(optionAvancerReport, function()
                    if checkPerms("remettreplayer") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["RemettrePersonne"], nil, {}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:Admin:BackCoordsPlayer", id)
                            end
                        })
                    end
                    if checkPerms("spectacte") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["Spectate"], nil, {}, true, {
                            onSelected = function()
                                SpectatePlayer(id)
                            end
                        })
                    end
                    if checkPerms("sendmessage") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["EnvoyerMessage"], nil, {}, true, {
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["EnvoyerMessage"], {TranslationAdministration.MenuAdmin["LeMessage"]})
                                if input then 
                                    TriggerServerEvent("fCore:Admin:SendMessagePlayer", id, input[1])
                                end
                            end
                        })
                    end
                    if checkPerms("revive") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["Revive"], nil, {}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:revive", id)
                            end
                        })
                    end
                    if checkPerms("heal") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin[TranslationAdministration.MenuAdmin["Heal"]], nil, {}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:heal", id)
                            end
                        })
                    end
                    if checkPerms("giveitem") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["GiveItem"], nil, {}, true, {
                            onSelected = function()
                                Recherche = nil
                                GetItemInBDD()
                            end
                        }, menuGiveItemReport)
                    end
                    if checkPerms("givemoney") then 
                        RageUI.List(TranslationAdministration.MenuAdmin["GiveArgent"], {"Money", "Bank", 'Black Money'}, IndexChange, nil, {}, true, {
                            onListChange = function(Index, Items)
                                IndexChange = Index
                            end,
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["GiveArgent"], {{type = 'number', label = 'Give de l\'argent', description = 'Give de l\'argent', icon = 'hashtag'}})
                                if input then
                                    local giveMoney = input[1]
                                    TriggerServerEvent("fCore:MenuAdmin:GiveMoney", IndexChange, giveMoney, id)
                                end
                            end
                        })      
                    end
                    if checkPerms("sesetjob") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["Setjob"], nil, {}, true, {
                            onSelected = function()
                                Recherche = nil
                                GetJobInBDD()
                            end
                        }, menuSetJobReport)
                    end
                    if checkPerms("sanction") then 
                        RageUI.List(TranslationAdministration.MenuAdmin["S_punishAction"], {TranslationAdministration.MenuAdmin["Kick"], TranslationAdministration.MenuAdmin["Warn"], "Ban"}, IndexSanction, nil, {}, true, {
                            onListChange = function(Index, Items)
                                IndexSanction = Index
                            end,
                            onSelected = function()
                                if IndexSanction == 1 then 
                                    local input = lib.inputDialog(TranslationAdministration.MenuAdmin["RaisonKick"], {TranslationAdministration.MenuAdmin["LaRaisonDuKick"]})
                                    if input then 
                                        TriggerServerEvent("fCore:AdminkickPlayer", id, input[1])
                                    end
                                elseif IndexSanction == 2 then
                                    local input = lib.inputDialog(TranslationAdministration.MenuAdmin["RaisonWarn"], {TranslationAdministration.MenuAdmin["LaRaisonDuWarn"]})
                                    if input then 
                                        TriggerServerEvent("fCore:Admin:Warn", id, input[1])
                                    end
                                elseif IndexSanction == 3 then
                                    local input = lib.inputDialog("Info ban", {
                                        {type = 'checkbox', label = 'Permanant'},   
                                        {type = 'input', label = TranslationAdministration.MenuAdmin["S_banReason"], description = TranslationAdministration.MenuAdmin["S_banReasonPrompt"], required = true, min = 4, max = 50},
                                        {type = 'number', label = TranslationAdministration.MenuAdmin["S_banDuration"], description = TranslationAdministration.MenuAdmin["S_banDuration"], icon = 'hashtag'},
                                    })
                                    if input then 
                                        if input[2] and (input[1] or input[3]) then
                                            if not input[1] then 
                                                if input[3] then
                                                    TriggerServerEvent("fCore:Admin:BanPlayer", id, input[1], input[2], input[3], 1)
                                                end
                                            else
                                                TriggerServerEvent("fCore:Admin:BanPlayer", id, input[1], input[2], 58899898, 1)
                                            end
                                            TriggerServerEvent("fCore:Admin:listBan", id, input[2])
                                        end
                                    end
                                end
                            end
                        })
                    end
                    if checkPerms("listewarn") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["ListeWarns"], nil, {}, true, {
                            onSelected = function()
                                namePlayer = name
                                getWarn(id)
                            end
                        }, listWarn)
                    end
                    if checkPerms("freeze") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["Freeze"], nil, {}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:Admin:FreezePlayer", id)
                            end
                        })
                    end
                end)
                RageUI.IsVisible(listWarn, function()
                    if warnListLoad then 
                        if #warnList > 0 then 
                            RageUI.Separator((TranslationAdministration.MenuAdmin["NomDuJoueur"]):format(namePlayer))
                            for k,v in pairs(warnList) do
                                RageUI.Button((TranslationAdministration.MenuAdmin["S_warnMessage"]):format(k, v.nameadmin), v.reason, {}, true, {})
                            end
                        else
                            RageUI.Separator("")
                            RageUI.Separator(TranslationAdministration.MenuAdmin["S_noWarn"])
                            RageUI.Separator("")
                        end
                    end
                end)
                RageUI.IsVisible(menuSetJobReport, function()
                    if not finishToLoadJob then 
                        RageUI.Separator("")
                        RageUI.Separator(TranslationAdministration.MenuAdmin["AttenteDonnees"])
                        RageUI.Separator("")
                    else
                        RageUI.Button(TranslationAdministration.MenuAdmin["RechercheJob"], nil, {}, true, {
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["RechercheItems"], {"Recherche un job"})
                                if input then
                                    Recherche = input[1]
                                end
                            end
                        })
                        if Recherche then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["AnnulerRecherche"], nil, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    Recherche = nil
                                end
                            })
                        end
                        RageUI.Line("color", 19, 107, 190)
                        if not Recherche then
                            for _, v in pairs(GetJobMenuAdmin) do 
                                RageUI.Button(v.jobName.." | "..v.label, nil, {}, true, {
                                    onSelected = function()
                                        local input = lib.inputDialog(TranslationAdministration.MenuAdmin["Job12"], {{type = 'number', label = 'Job 1 ou 2', description = 'Le setjob doit est 1 ou 2', icon = 'hashtag'}})
                                        if input then 
                                            setjobAdmin = input[1]
                                            TriggerServerEvent("fCore:MenuAdmin:setjobReport", v.grade, v.jobName, setjobAdmin, id)
                                        end
                                    end
                                })
                            end
                        else
                            local lowercaseRecherche = string.lower(Recherche)
                            for _, v in pairs(GetJobMenuAdmin) do 
                                local lowercaseFullName = string.lower(v.jobName.." | "..v.label)
                                if string.find(lowercaseFullName, lowercaseRecherche, 1, true) then 
                                    RageUI.Button(v.jobName.." | "..v.label, nil, {}, true, {
                                        onSelected = function()
                                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["Job12"], {{type = 'number', label = 'Job 1 ou 2', description = 'Le setjob doit est 1 ou 2', icon = 'hashtag'}})
                                            if tonumber(input) then 
                                                setjobAdmin = input[1]
                                                TriggerServerEvent("fCore:MenuAdmin:setjobReport", v.grade, v.jobName, setjobAdmin, id)
                                            end
                                        end
                                    })
                                end
                            end
                        end                                             
                    end
                end)
                RageUI.IsVisible(menuPersonnel, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_personalMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    if checkPerms("menuoptions") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["OptionsJoueur"], nil, {RightLabel = "→→"}, true, {}, optionJoueurAdmin)
                    end
                    if checkPerms("menuped") then
                        RageUI.Button(TranslationAdministration.MenuAdmin["MenuPed"], nil, {RightLabel = "→→"}, true, {},menuPedPersonel)
                    end
                end)
                RageUI.IsVisible(menuPedPersonel, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_pedMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["ChangerPed"], nil, {RightLabel = "→→"}, true, {}, menuListPedPersonel)     
                end)
                RageUI.IsVisible(menuGiveItemReport, function()
                    if not finishToLoadTable then 
                        RageUI.Separator("")
                        RageUI.Separator(TranslationAdministration.MenuAdmin["AttenteDonnees"])
                        RageUI.Separator("")
                    else
                        RageUI.Button(TranslationAdministration.MenuAdmin["RechercheItems"], nil, {}, true, {
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["RechercheItems"], {"Recherche un items"})
                                if input then
                                    Recherche = input[1]
                                end
                            end
                        })
                        if Recherche then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["AnnulerRecherche"], nil, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    Recherche = nil
                                end
                            })
                        end
                        RageUI.Line("color", 19, 107, 190)
                        if not Recherche then
                            for _, v in pairs(GetItemMenuAdmin) do 
                                RageUI.Button(v.label, nil, {}, true, {
                                    onSelected = function()
                                        local input = lib.inputDialog(TranslationAdministration.MenuAdmin["CombienDItem"], {{type = 'number', label = 'Combien d\'item se give', description = 'Combien d\'item se give', icon = 'hashtag'}})
                                        if input then 
                                            nbrItemGive = input[1]
                                            TriggerServerEvent("fCoreV2:MenuAdmin:giveiteReport", v.name, nbrItemGive, id)
                                        end
                                    end
                                })
                            end
                        else
                            local lowercaseRecherche = string.lower(Recherche)
                            for _, v in pairs(GetItemMenuAdmin) do 
                                local lowercaseLabel = string.lower(v.label)
                                if string.find(lowercaseLabel, lowercaseRecherche, 1, true) then 
                                    RageUI.Button(v.label, nil, {}, true, {
                                        onSelected = function()
                                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["CombienDItem"], {{type = 'number', label = 'Combien d\'item se give', description = 'Combien d\'item se give', icon = 'hashtag'}})
                                            if input then 
                                                nbrItemGive = input[1]
                                                TriggerServerEvent("fCoreV2:MenuAdmin:giveiteReport", v.name, nbrItemGive, id)
                                            end
                                        end 
                                    })
                                end
                            end
                        end                        
                    end
                end)
                RageUI.IsVisible(menuListPedPersonel, function()
                    RageUI.Separator("↓ ~b~Ped options~s~↓")
                    RageUI.Line("color", 19, 107, 190)
                    if Recherche then
                        RageUI.Button(TranslationAdministration.MenuAdmin["AnnulerRecherche"], nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                Recherche = nil
                            end
                        })
                    end 
                    RageUI.Button(TranslationAdministration.MenuAdmin["RechercherPed"], nil, {}, true, {
                        onSelected = function()
                            Recherche = nil
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["RechercheDePed"], {"Recherche un ped"})
                            if input then
                                Recherche = input[1]
                            end
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["SeRemettreNormal"], nil, {}, true, {
                        onSelected = function()
                            setNormalPed()
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["MettrePedParNom"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["MettreNomPed"], {TranslationAdministration.MenuAdmin["MettreNomPed"]})
                            if input then 
                                local pedName = input[1]
                                setPed(pedName)
                            end
                        end
                    })
                    RageUI.Line("color", 249,130,42)
                    if not Recherche then
                        for _, v in pairs(Administration.ListPed) do
                            RageUI.Button(v.label, nil, {}, true, {
                                onSelected = function()
                                    setPed(v.name)
                                end
                            })
                        end
                    else
                        local lowercaseRecherche = string.lower(Recherche)
                        for _, v in pairs(Administration.ListPed) do
                            local lowercaseLabel = string.lower(v.label)
                            if string.find(lowercaseLabel, lowercaseRecherche, 1, true) then 
                                RageUI.Button(v.label, nil, {}, true, {
                                    onSelected = function()
                                        setPed(v.name)
                                    end
                                })
                            end
                        end
                    end                    
                    
                end)
                RageUI.IsVisible(optionJoueurAdmin, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_optionsMenu"])
                    RageUI.Line("color", 249,130,42)
                    if checkPerms("tagsjoueur") then
                        RageUI.Checkbox(TranslationAdministration.MenuAdmin["TagsJoueurs"], nil, tagsPlayer, {}, {
                            onChecked = function()
                                tagsPlayer = true
                                ShowNames()
                            end,
                            onUnChecked = function()
                                tagsPlayer = false
                                ShowNames(false)
                            end,
                            onSelected = function(Index)
                                Administration.valeurUtils.checknamejoueurs = Index
                            end
                        })    
                    end
                    if checkPerms("blipsjoueur") then
                        RageUI.Checkbox(TranslationAdministration.MenuAdmin["BlipsJoueurs"], nil, blipsPlayer, {}, {
                            onChecked = function()
                                blipsPlayer = true
                                ShowBlips(true)
                            end,
                            onUnChecked = function()
                                blipsPlayer = false
                                ShowBlips(false)
                            end
                        })  
                    end
                    if checkPerms("godmode") then   
                        RageUI.Checkbox(TranslationAdministration.MenuAdmin["GodMode"], nil, GodeMode, {}, {
                            onChecked = function()
                                GodeMode = true
                                ShowGodMod()
                            end,
                            onUnChecked = function()
                                GodeMode = false
                                ShowGodMod(false)
                            end
                        })        
                    end
                    if checkPerms("tpmarker") then  
                        RageUI.Button(TranslationAdministration.MenuAdmin["TeleportationMarker"], nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                ExecuteCommand("tpm")
                            end
                        })
                    end
                    RageUI.Button("Menu skin", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            TriggerEvent("esx_skin:openSaveableMenu")
                            openAdmin = false 
                            RageUI.CloseAll()
                        end
                    })
                    if checkPerms("sesetjob") then  
                        RageUI.Button(TranslationAdministration.MenuAdmin["SeSetjob"], nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                Recherche = nil
                                GetJobInBDD()
                            end
                        }, menuSetJobPersonel)
                    end
                    if checkPerms("giveitem") then  
                        RageUI.Button(TranslationAdministration.MenuAdmin["SeGiveItem"], nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                Recherche = nil
                                GetItemInBDD()
                            end
                        }, menuGiveItemPersonel)
                    end
                    if checkPerms("actionsoins") then  
                        RageUI.List(TranslationAdministration.MenuAdmin["S_healingAction"], {TranslationAdministration.MenuAdmin["SeHeal"], TranslationAdministration.MenuAdmin["SeRevive"]}, IndexSoins, nil, {}, true, {
                            onListChange = function(Index, Items)
                                IndexSoins = Index
                            end,
                            onSelected = function()
                                if IndexSoins == 1 then 
                                    TriggerServerEvent("fCore:heal", GetPlayerServerId(PlayerId()))
                                elseif IndexSoins == 2 then
                                    TriggerServerEvent("fCore:revive", GetPlayerServerId(PlayerId()))
                                end
                            end
                        })
                    end
                    if checkPerms("givemoney") then  
                        RageUI.List(TranslationAdministration.MenuAdmin["SeGiveArgent"], {"Money", "Bank", 'Black Money'}, IndexChange, nil, {}, true, {
                            onListChange = function(Index, Items)
                                IndexChange = Index
                            end,
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["GiveItem"], {{type = 'number', label = 'Give de l\'argent', description = 'Give de l\'argent', icon = 'hashtag'}})
                                if input then
                                    local giveMoney = input[1]
                                    TriggerServerEvent("fCore:MenuAdmin:GiveMoney", IndexChange, giveMoney, GetPlayerServerId(PlayerId()))
                                end
                            end
                        })
                    end
                end)
                RageUI.IsVisible(menuSetJobPersonel, function()
                    if not finishToLoadJob then 
                        RageUI.Separator("")
                        RageUI.Separator(TranslationAdministration.MenuAdmin["AttenteDonnees"])
                        RageUI.Separator("")
                    else
                        RageUI.Button(TranslationAdministration.MenuAdmin["RechercheJob"], nil, {}, true, {
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_jobSearch"], {TranslationAdministration.MenuAdmin["S_jobSearch"]})
                                if input then
                                    Recherche = input[1]
                                end
                            end
                        })
                        if Recherche then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["AnnulerRecherche"], nil, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    Recherche = nil
                                end
                            })
                        end
                        RageUI.Line("color", 19, 107, 190)
                        if not Recherche then
                            for _, v in pairs(GetJobMenuAdmin) do 
                                RageUI.Button(v.jobName.." | "..v.label, nil, {}, true, {
                                    onSelected = function()
                                        local input = lib.inputDialog(TranslationAdministration.MenuAdmin["Job12"], {TranslationAdministration.MenuAdmin["MettreQuelSetjob"]})
                                        if input then 
                                            setjobAdmin = input[1]
                                            TriggerServerEvent("fCore:MenuAdmin:setjob", v.grade, v.jobName, setjobAdmin)
                                        end
                                    end
                                })
                            end
                        else
                            local lowercaseRecherche = string.lower(Recherche)
                            for _, v in pairs(GetJobMenuAdmin) do 
                                local lowercaseFullName = string.lower(v.jobName.." | "..v.label)
                                if string.find(lowercaseFullName, lowercaseRecherche, 1, true) then 
                                    RageUI.Button(v.jobName.." | "..v.label, nil, {}, true, {
                                        onSelected = function()
                                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["Job12"], {TranslationAdministration.MenuAdmin["MettreQuelSetjob"]})
                                            if tonumber(input) then 
                                                setjobAdmin = input[1]
                                                TriggerServerEvent("fCore:MenuAdmin:setjob", v.grade, v.jobName, setjobAdmin)
                                            end
                                        end
                                    })
                                end
                            end
                        end                                             
                    end
                end)

                RageUI.IsVisible(menuGiveItemPersonel, function()
                    if not finishToLoadTable then 
                        RageUI.Separator("")
                        RageUI.Separator(TranslationAdministration.MenuAdmin["AttenteDonnees"])
                        RageUI.Separator("")
                    else
                        RageUI.Button(TranslationAdministration.MenuAdmin["RechercheItems"], nil, {}, true, {
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["RechercheItems"], {"Recherche un items"})
                                if input then
                                    Recherche = input[1]
                                end
                            end
                        })
                        if Recherche then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["AnnulerRecherche"], nil, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    Recherche = nil
                                end
                            })
                        end
                        RageUI.Line("color", 19, 107, 190)
                        if not Recherche then
                            for _, v in pairs(GetItemMenuAdmin) do 
                                RageUI.Button(v.label, nil, {}, true, {
                                    onSelected = function()
                                        local input = lib.inputDialog(TranslationAdministration.MenuAdmin["CombienDItem"], {{type = 'number', label = 'Combien d\'item se give', description = 'Combien d\'item se give', icon = 'hashtag'}})
                                        if input then 
                                            nbrItemGive = input[1]
                                            TriggerServerEvent("fCoreV2:MenuAdmin:giveitem", v.name, nbrItemGive)
                                        end
                                    end
                                })
                            end
                        else
                            local lowercaseRecherche = string.lower(Recherche)
                            for _, v in pairs(GetItemMenuAdmin) do 
                                local lowercaseLabel = string.lower(v.label)
                                if string.find(lowercaseLabel, lowercaseRecherche, 1, true) then 
                                    RageUI.Button(v.label, nil, {}, true, {
                                        onSelected = function()
                                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["CombienDItem"], {{type = 'number', label = 'Combien d\'item se give', description = 'Combien d\'item se give', icon = 'hashtag'}})
                                            if input then 
                                                nbrItemGive = input[1]
                                                TriggerServerEvent("fCoreV2:MenuAdmin:giveitem", v.name, nbrItemGive)
                                            end
                                        end 
                                    })
                                end
                            end
                        end                        
                    end
                end)
                RageUI.IsVisible(menuJoueur, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["MenuJoueur"])
                    RageUI.Line("color", 19, 107, 190)
                    if checkPerms("listeplayer") then
                        RageUI.Button(TranslationAdministration.MenuAdmin["ListeDesJoueurs"], nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                Recherche = nil
                                getPlayerOffline()
                            end
                        }, menuListJoueur)
                    end
                end)
                RageUI.IsVisible(menuListJoueur, function()
                    RageUI.Separator("↓ ~b~Liste des joueurs~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.List("Filtrer par", {"En ligne", "Hors ligne", "Tout les joueurs"}, IndexFiltrePlayer, nil, {}, true, {
                        onListChange = function(Index, Items)
                            IndexFiltrePlayer = Index
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_search"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_playerSearch"], {
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_playerName"]},
                            })
                            if input then 
                                Recherche = input[1]
                            end
                        end
                    })
                    if Recherche then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["AnnulerRecherche"], nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                Recherche = nil
                            end
                        })
                    end
                    if IndexFiltrePlayer == 1 then 
                        RageUI.Checkbox(TranslationAdministration.MenuAdmin["AfficherHorsZone"], nil, playerInZone, {}, {
                            onChecked = function()
                                playerInZone = true
                                TriggerServerEvent("fCore:Admin:refreshPlayer")
                            end,
                            onUnChecked = function()
                                playerInZone = false
                            end
                        })
                        if not playerInZone then 
                            if not Recherche then 
                                RageUI.Separator(TranslationAdministration.MenuAdmin["JoueursInZone"])
                                RageUI.Line("color", 19, 107, 190)
                                RageUI.Separator((TranslationAdministration.MenuAdmin["S_onlinePlayer"]):format(#playerInSession))
                                for k,v in pairs(serversIdSession) do
                                    -- print(json.encode(v))
                                    if GetPlayerName(GetPlayerFromServerId(v)) == "**Invalid**" then 
                                        table.remove(serversIdSession, k) 
                                    end
                                    RageUI.Button("[ID : "..v.."~s~] - ~r~"..GetPlayerName(GetPlayerFromServerId(v)), nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            id = v
                                            name = GetPlayerName(GetPlayerFromServerId(v))
                                        end
                                    }, menuListPlayer)
                                end
                            else
                                RageUI.Separator(TranslationAdministration.MenuAdmin["JoueursInZone"])
                                RageUI.Line("color", 19, 107, 190)
                                for k,v in pairs(serversIdSession) do
                                    local lowercaseRecherche = string.lower(Recherche)
                                    local lowercaseFullName = string.lower("[ID : "..v.."~s~] - ~r~"..GetPlayerName(GetPlayerFromServerId(v)))
                                    if GetPlayerName(GetPlayerFromServerId(v)) == "**Invalid**" then 
                                        table.remove(serversIdSession, k) 
                                    end
                                    if string.find(lowercaseFullName, lowercaseRecherche, 1, true) then 
                                        RageUI.Button("[ID : "..v.."~s~] - ~r~"..GetPlayerName(GetPlayerFromServerId(v)), nil, {RightLabel = "→→"}, true, {
                                            onSelected = function()
                                                id = v
                                                name = GetPlayerName(GetPlayerFromServerId(v))
                                            end
                                        }, menuListPlayer)
                                    end
                                end
                            end
                        elseif playerInZone then 
                            RageUI.Separator(TranslationAdministration.MenuAdmin["JoueursHorsZone"])
                            RageUI.Line("color", 19, 107, 190)
                            RageUI.Separator((TranslationAdministration.MenuAdmin["S_onlinePlayer"]):format(#playerInSession))
                            if not Recherche then 
                                for k, v in pairs(playerInSession) do
                                    if v.name == "**Invalid**" then 
                                        table.remove(playerInSession, k) 
                                    end
                                    RageUI.Button("[ID : "..v.id.."~s~] - ~r~"..v.name, nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            id = v.id
                                            name = v.name
                                        end
                                    }, menuListPlayer)
                                end
                            else
                                for k, v in pairs(playerInSession) do
                                    local lowercaseRecherche = string.lower(Recherche)
                                    local lowercaseFullName = string.lower("[ID : "..v.id.."~s~] - ~r~"..v.name)
                                    if v.name == "**Invalid**" then 
                                        table.remove(playerInSession, k) 
                                    end
                                    if string.find(lowercaseFullName, lowercaseRecherche, 1, true) then 
                                        RageUI.Button("[ID : "..v.id.."~s~] - ~r~"..v.name, nil, {RightLabel = "→→"}, true, {
                                            onSelected = function()
                                                id = v.id
                                                name = v.name
                                            end
                                        }, menuListPlayer)
                                    end
                                end
                            end
                        end
                    elseif IndexFiltrePlayer == 2 then 
                        RageUI.Separator("↓ ~b~Hors ligne~s~ ↓")
                        RageUI.Line("color", 19, 107, 190)
                        if allUsersLoad then 
                            RageUI.Separator(("Nombre de joueur hors ligne : ~b~ %s"):format(#allUsers-#playerInSession))
                            if not Recherche then 
                                for _,v in pairs(allUsers) do 
                                    local statusPlayer = false
                                    for _,online in pairs(playerInSession) do 
                                        if online.identifier == v.identifier then 
                                            statusPlayer = true
                                            break
                                        end
                                    end
                                    if not statusPlayer then 
                                        RageUI.Button(("%s - %s %s"):format("[~r~Hors ligne~s~]",v.firstname,v.lastname), nil, {}, true, {}, subMenuHorsLigne)
                                    end
                                end
                            else
                                local lowercaseRecherche = string.lower(Recherche)
                                for _,v in pairs(allUsers) do 
                                    local lowercaseFullName = string.lower(v.firstname.. " "..v.lastname)
                                    local statusPlayer = false
                                    for _,online in pairs(playerInSession) do 
                                        if online.identifier == v.identifier then 
                                            statusPlayer = true
                                            break
                                        end
                                    end
                                    if not statusPlayer then
                                        if string.find(lowercaseFullName, lowercaseRecherche, 1, true) then 
                                            RageUI.Button(("%s - %s %s"):format("[~r~Hors ligne~s~]",v.firstname,v.lastname), nil, {}, true, {}, subMenuHorsLigne)
                                        end
                                    end
                                end
                            end
                        end
                    elseif IndexFiltrePlayer == 3 then 
                        RageUI.Separator("↓ ~b~Tous les joueurs~s~ ↓")
                        RageUI.Line("color", 19, 107, 190)
                        if allUsersLoad then 
                            RageUI.Separator(("Nombre de joueur total :~b~ %s"):format(#allUsers))
                            if not Recherche then 
                                for _,v in pairs(allUsers) do 
                                    local statusPlayer = "[~r~Hors ligne~s~]"
                                    for _,online in pairs(playerInSession) do 
                                        if online.identifier == v.identifier then 
                                            statusPlayer = "[~g~En ligne~s~]"
                                            break
                                        end
                                    end
                                    RageUI.Button(("%s - %s %s"):format(statusPlayer,v.firstname,v.lastname), nil, {}, true, {}, subMenuHorsLigne)
                                end
                            else
                                local lowercaseRecherche = string.lower(Recherche)
                                for _,v in pairs(allUsers) do
                                    local statusPlayer = "[~r~Hors ligne~s~]"
                                    for _,online in pairs(playerInSession) do 
                                        if online.identifier == v.identifier then 
                                            statusPlayer = "[~g~En ligne~s~]"
                                            break
                                        end
                                    end
                                    local lowercaseFullName = string.lower(v.firstname.. " "..v.lastname)
                                    if string.find(lowercaseFullName, lowercaseRecherche, 1, true) then 
                                        RageUI.Button(("%s - %s %s"):format(statusPlayer,v.firstname,v.lastname), nil, {}, true, {}, subMenuHorsLigne)
                                    end
                                end
                            end
                        end
                    end
                end)
                RageUI.IsVisible(subMenuHorsLigne, function()
                    RageUI.Separator("↓ ~b~Liste des actions ↓~s~")
                    RageUI.Line("color", 19, 107, 190)  
                    RageUI.Separator("Job : Police | Orga : Ballas")
                    RageUI.Separator((TranslationAdministration.MenuAdmin["ArgentPropre"]):format(moneyPlayer))
                    RageUI.Separator((TranslationAdministration.MenuAdmin["S_dirtyMoney"]):format(blackmoneyPlayer))
                    RageUI.Separator((TranslationAdministration.MenuAdmin["ArgentBanque"]):format(bankPlayer))
                    RageUI.Button("Changer la postions ~b~[En dev]", nil, {RightLabel = "→→"}, true, {}) 
                    RageUI.Button("Changer le job ~b~[En dev]", nil, {RightLabel = "→→"}, true, {}) 
                    RageUI.Button("Changer le gang ~b~[En dev]", nil, {RightLabel = "→→"}, true, {}) 
                    RageUI.Button("Voir l'invenaire ~b~[En dev]", nil, {RightLabel = "→→"}, true, {})
                    RageUI.Button("Liste des kick ~b~[En dev]", nil, {RightLabel = "→→"}, true, {})
                    RageUI.Button("Liste des warn ~b~[En dev]", nil, {RightLabel = "→→"}, true, {})
                    RageUI.Button("Liste des bans ~b~[En dev]", nil, {RightLabel = "→→"}, true, {})
                    RageUI.Button("Liste des jail ~b~[En dev]", nil, {RightLabel = "→→"}, true, {})
                    RageUI.Button("Liste des véhicules ~b~[En dev]", nil, {RightLabel = "→→"}, true, {})
                end)
                RageUI.IsVisible(menuListPlayer, function()
                    RageUI.Separator(("↓ ~b~%s~s~ ↓"):format(name))
                    RageUI.Line("color", 19, 107, 190)
                    if checkPerms("infojoueur") then
                        RageUI.Button(TranslationAdministration.MenuAdmin["InfosJoueurDev"], nil, {}, true, {
                            onSelected = function()
                                infoPlayerAdmin(id)
                            end
                        }, infoJoueur)
                    end
                    if checkPerms("tpmarker") then
                        RageUI.List(TranslationAdministration.MenuAdmin["S_teleportAction"], {TranslationAdministration.MenuAdmin["TeleporterPersonne"], TranslationAdministration.MenuAdmin["AllerSurPersonne"], TranslationAdministration.MenuAdmin["RemettrePersonne"]}, IndexTP, nil, {}, true, {
                            onListChange = function(Index, Items)
                                IndexTP = Index
                            end,
                            onSelected = function()
                                if IndexTP == 1 then 
                                    TriggerServerEvent("fCore:Admin:bringPlayer", id)
                                elseif IndexTP == 2 then
                                    TriggerServerEvent("fCore:Admin:GotoPlayer", id)
                                elseif IndexTP == 3 then
                                    TriggerServerEvent("fCore:Admin:BackCoordsPlayer", id)
                                end
                            end
                        })
                    end
                    if checkPerms("actionsoins") then
                        RageUI.List(TranslationAdministration.MenuAdmin["S_healingAction"], {TranslationAdministration.MenuAdmin["Heal"], TranslationAdministration.MenuAdmin["Revive"]}, IndexSoins, nil, {}, true, {
                            onListChange = function(Index, Items)
                                IndexSoins = Index
                            end,
                            onSelected = function()
                                if IndexSoins == 1 then 
                                    TriggerServerEvent("fCore:heal", id)
                                elseif IndexSoins == 2 then
                                    TriggerServerEvent("fCore:revive", id)
                                end
                            end
                        })
                    end
                    if checkPerms("givemoney") then
                        RageUI.List(TranslationAdministration.MenuAdmin["GiveArgent"], {"Money", "Bank", 'Black Money'}, IndexChange, nil, {}, true, {
                            onListChange = function(Index, Items)
                                IndexChange = Index
                            end,
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["GiveItem"], {{type = 'number', label = 'Give de l\'argent', description = 'Give de l\'argent', icon = 'hashtag'}})
                                if input then
                                    local giveMoney = input[1]
                                    TriggerServerEvent("fCore:MenuAdmin:GiveMoney", IndexChange, giveMoney, id)
                                end
                            end
                        })
                    end
                    if checkPerms("sanction") then
                        RageUI.List(TranslationAdministration.MenuAdmin["S_punishAction"], {TranslationAdministration.MenuAdmin["Kick"], TranslationAdministration.MenuAdmin["Warn"], "Ban"}, IndexSanction, nil, {}, true, {
                            onListChange = function(Index, Items)
                                IndexSanction = Index
                            end,
                            onSelected = function()
                                if IndexSanction == 1 then 
                                    local input = lib.inputDialog(TranslationAdministration.MenuAdmin["RaisonKick"], {TranslationAdministration.MenuAdmin["LaRaisonDuKick"]})
                                    if input then 
                                        TriggerServerEvent("fCore:AdminkickPlayer", id, input[1])
                                    end
                                elseif IndexSanction == 2 then
                                    local input = lib.inputDialog(TranslationAdministration.MenuAdmin["RaisonWarn"], {TranslationAdministration.MenuAdmin["LaRaisonDuWarn"]})
                                    if input then 
                                        TriggerServerEvent("fCore:Admin:Warn", id, input[1])
                                    end
                                elseif IndexSanction == 3 then
                                    local input = lib.inputDialog("Info ban", {
                                        {type = 'checkbox', label = 'Permanant'},   
                                        {type = 'input', label = TranslationAdministration.MenuAdmin["S_banReason"], description = TranslationAdministration.MenuAdmin["S_banReasonPrompt"], required = true, min = 4, max = 50},
                                        {type = 'number', label = TranslationAdministration.MenuAdmin["S_banDuration"], description = TranslationAdministration.MenuAdmin["S_banDuration"], icon = 'hashtag'},
                                    })
                                    if input then 
                                        if input[2] and (input[1] or input[3]) then
                                            if not input[1] then 
                                                if input[3] then
                                                    TriggerServerEvent("fCore:Admin:BanPlayer", id, input[1], input[2], input[3], 1)
                                                end
                                            else
                                                TriggerServerEvent("fCore:Admin:BanPlayer", id, input[1], input[2], 58899898, 1)
                                            end
                                            TriggerServerEvent("fCore:Admin:listBan", id, input[2])
                                        end
                                    end
                                end
                            end
                        })
                        RageUI.Button("Jail", nil, {RightLabel = "→→"}, true, {}, menuJailPlayer)
                    end
                    if checkPerms("spectacte") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["Spectate"] , nil, {}, true, {
                            onSelected = function()
                                SpectatePlayer(id)
                            end
                        })
                    end
                    if checkPerms("sendmessage") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["EnvoyerMessage"], nil, {}, true, {
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["EnvoyerMessage"], {TranslationAdministration.MenuAdmin["LeMessage"]})
                                if input then 
                                    TriggerServerEvent("fCore:Admin:SendMessagePlayer", id, input[1])
                                end
                            end
                        })
                    end
                    if checkPerms("sendmessage") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["GiveItem"], nil, {}, true, {
                            onSelected = function()
                                Recherche = nil
                                GetItemInBDD()
                                idJoueur = id
                            end
                        }, menuGiveItemPlayer)    
                    end     
                    if checkPerms("sesetjob") then           
                        RageUI.Button(TranslationAdministration.MenuAdmin["Setjob"], nil, {}, true, {
                            onSelected = function()
                                Recherche = nil
                                GetJobInBDD()
                                idJoueur = id
                            end
                        }, menuJoueurSetjob)
                    end
                    if checkPerms("freeze") then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["Freeze"], nil, {}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:Admin:FreezePlayer", id)
                            end
                        })
                    end
                    -- if checkPerms("wipe") then 
                        RageUI.Button("Wipe le joueur", nil, {}, true, {
                            onSelected = function()
                                for _,v in pairs(WipeLicense) do 
                                    table.insert(labelLicense, v.label)
                                    table.insert(TypeLicense, v.Type)
                                end
                            end
                        }, menuWipe)
                    -- end
                end)
                RageUI.IsVisible(menuWipe, function()
                    RageUI.Separator("↓ Option wipe ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Wipe total", nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_removeWarnPrompt"], {{type = 'input', label = TranslationAdministration.MenuAdmin["S_confirmPrompt"], description = TranslationAdministration.MenuAdmin["S_yesNoPrompt"], required = true},})
                            if input then 
                                if input[1] == "oui" then
                                    TriggerServerEvent("fCore:wipeTotal", id)
                                end
                            end
                        end
                    })
                    RageUI.Button("Wipe inventaire", nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_removeWarnPrompt"], {{type = 'input', label = TranslationAdministration.MenuAdmin["S_confirmPrompt"], description = TranslationAdministration.MenuAdmin["S_yesNoPrompt"], required = true},})
                            if input then 
                                if input[1] == "oui" then
                                    TriggerServerEvent("fCore:wipeinventory", id)
                                end
                            end
                        end
                    })
                    RageUI.List("Wipe un véhicule", {"Avec la plaque", "Tout les véhicules"}, IndexVehicule, nil, {}, true, {
                        onListChange = function(Index, Items)
                            IndexVehicule = Index
                        end,
                        onSelected = function()
                            if IndexVehicule == 1 then 
                                local input = lib.inputDialog("Supprimer la plaque", {
                                    {type = 'input', label = "Plaque du véhicule", description = "Supprimer le vehicule avec la plaque", required = true}
                                })
                                if input then 
                                    TriggerServerEvent("fCore:wipeVehicule", id, IndexVehicule, input[1])
                                end
                            elseif IndexVehicule == 2 then 
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_removeWarnPrompt"], {{type = 'input', label = TranslationAdministration.MenuAdmin["S_confirmPrompt"], description = TranslationAdministration.MenuAdmin["S_yesNoPrompt"], required = true},})
                                if input then 
                                    if input[1] == "oui" then
                                        TriggerServerEvent("fCore:wipeVehicule", id, IndexVehicule)
                                    end
                                end
                            end
                        end
                    })
                    RageUI.List("Wipe une license", labelLicense, IndexLicense, nil, {}, true, {
                        onListChange = function(Index, Items)
                            IndexLicense = Index
                        end,
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_removeWarnPrompt"], {{type = 'input', label = TranslationAdministration.MenuAdmin["S_confirmPrompt"], description = TranslationAdministration.MenuAdmin["S_yesNoPrompt"], required = true},})
                            if input then 
                                if input[1] == "oui" then
                                    TriggerServerEvent("fCore:wipeLicense", id, TypeLicense[IndexLicense])
                                end
                            end
                        end
                    })
                end)
                RageUI.IsVisible(menuJoueurSetjob, function()
                    if not finishToLoadJob then 
                        RageUI.Separator("")
                        RageUI.Separator(TranslationAdministration.MenuAdmin["AttenteDonnees"])
                        RageUI.Separator("")
                    else
                        RageUI.Button(TranslationAdministration.MenuAdmin["RechercheJob"], nil, {}, true, {
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["RechercheItems"], {"Recherche un job"})
                                if input then
                                    Recherche = input[1]
                                end
                            end
                        })
                        if Recherche then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["AnnulerRecherche"], nil, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    Recherche = nil
                                end
                            })
                        end
                        RageUI.Line("color", 19, 107, 190)
                        if not Recherche then
                            for _, v in pairs(GetJobMenuAdmin) do 
                                RageUI.Button(v.jobName.." | "..v.label, nil, {}, true, {
                                    onSelected = function()
                                        local input = lib.inputDialog(TranslationAdministration.MenuAdmin["Job12"], {{type = 'number', label = 'Job 1 ou 2', description = 'Le setjob doit est 1 ou 2', icon = 'hashtag'}})
                                        if input then 
                                            setjobAdmin = input[1]
                                            TriggerServerEvent("fCore:MenuAdmin:setjobReport", v.grade, v.jobName, setjobAdmin, idJoueur)
                                        end
                                    end
                                })
                            end
                        else
                            local lowercaseRecherche = string.lower(Recherche)
                            for _, v in pairs(GetJobMenuAdmin) do 
                                local lowercaseFullName = string.lower(v.jobName.." | "..v.label)
                                if string.find(lowercaseFullName, lowercaseRecherche, 1, true) then 
                                    RageUI.Button(v.jobName.." | "..v.label, nil, {}, true, {
                                        onSelected = function()
                                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["Job12"], {{type = 'number', label = 'Job 1 ou 2', description = 'Le setjob doit est 1 ou 2', icon = 'hashtag'}})
                                            if tonumber(input) then 
                                                setjobAdmin = input[1]
                                                TriggerServerEvent("fCore:MenuAdmin:setjobReport", v.grade, v.jobName, setjobAdmin, idJoueur)
                                            end
                                        end
                                    })
                                end
                            end
                        end                                             
                    end
                end)
                RageUI.IsVisible(infoJoueur, function()
                    if loadInfoPlayer then 
                        for k,v in pairs(infoPlayer) do
                            RageUI.Separator((TranslationAdministration.MenuAdmin["NomDuJoueur"]):format(v.name))
                            RageUI.Separator((TranslationAdministration.MenuAdmin["InfosJoueur"]):format(v.id, v.idUnique))
                            RageUI.Separator((TranslationAdministration.MenuAdmin["InfosJoueurJobOrga"]):format(v.Job, v.Job2))
                            RageUI.Button(TranslationAdministration.MenuAdmin["VoirInventaire"], nil, {RightLabel = "→→"}, true, {
                                onSelected = function()
                                    idPlayer = id
                                    getInventoryPlayer(id)
                                end
                            }, infoInventaireJoueur)
                            RageUI.Button(TranslationAdministration.MenuAdmin["VoirSanctions"], nil, {RightLabel = "→→"}, true, {
                                onSelected = function()
                                    namePlayer = v.name
                                    idPlayer = id
                                end
                            }, showSanction)
                        end
                    end
                end)
                RageUI.IsVisible(menuJailPlayer, function()
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_setJailAction"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_jailAction"], {
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_jailDuration"], description = TranslationAdministration.MenuAdmin["S_jailDurationPrompt"], required = true},
                                {type = 'input', label = 'Raison', description = TranslationAdministration.MenuAdmin["S_jailReasonPrompt"], required = true},
                            })  
                            if input  then                      
                                TriggerServerEvent("fCore:Admin:JailPlayer", id, input[1], input[2])
                            end
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_unjailAction"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_unjailPrompt"], {
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_confirmPrompt"], description = TranslationAdministration.MenuAdmin["S_yesNoPrompt"], required = true},
                            })
                            if input then
                                if input[1] == "oui" then 
                                    TriggerServerEvent("fCore:Admin:unJailPlayer", id)
                                end  
                            end                          
                        end
                    })
                end)
                RageUI.IsVisible(showSanction, function()
                    RageUI.Separator("↓ ~b~Liste des actions ↓~s~")
                    RageUI.Line("color", 19, 107, 190)    
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_viewWarns"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            getWarn(idPlayer)
                        end
                    }, showWarn)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_viewBans"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            getBanPlayer(idPlayer)
                        end
                    }, showBan)
                    RageUI.Button("Liste des jail ~b~[En dev]", nil, {RightLabel = "→→"}, true, {})
                    RageUI.Button("Liste des kick ~b~[En dev]", nil, {RightLabel = "→→"}, true, {})
                    RageUI.Button("Liste des véhicules ~b~[En dev]", nil, {RightLabel = "→→"}, true, {})
                end)
                RageUI.IsVisible(showWarn, function()
                    if warnListLoad then 
                        if #warnList > 0 then 
                            RageUI.Separator((TranslationAdministration.MenuAdmin["NomDuJoueur"]):format(namePlayer))
                            for k,v in pairs(warnList) do
                                RageUI.Button((TranslationAdministration.MenuAdmin["S_warnMessage"]):format(k, v.nameadmin), v.reason, {}, true, {
                                    onSelected = function()
                                        id = v.id
                                    end
                                }, gestionWarn)
                            end
                        else
                            RageUI.Separator("")
                            RageUI.Separator(TranslationAdministration.MenuAdmin["S_noWarn"])
                            RageUI.Separator("")
                        end
                    end
                end)
                RageUI.IsVisible(gestionWarn, function()
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_removeWarn"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_removeWarnPrompt"], {
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_confirmPrompt"], description = TranslationAdministration.MenuAdmin["S_yesNoPrompt"], required = true},
                            })
                            if input then 
                                if input[1] == "oui" then 
                                    TriggerServerEvent("fcore:Admin:deleteWarn", id)
                                    Wait(100)
                                    getWarn(idPlayer)
                                end
                            end
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_modifyWarnReason"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog('Modifier la raison du warn', {
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_modifyWarnReason"], description = '', required = true},
                            })
                            if input then 
                                TriggerServerEvent("fcore:Admin:modifRaison", id, input[1])
                                Wait(100)
                                getWarn(idPlayer)
                            end
                        end
                    })
                end)
                RageUI.IsVisible(showBan, function()
                    if BanListLoad then 
                        if #BanList > 0 then 
                            RageUI.Separator((TranslationAdministration.MenuAdmin["NomDuJoueur"]):format(namePlayer))
                            for k,v in pairs(BanList) do
                                RageUI.Button(("Ban #%s | Admin : %s"):format(k, v.nameadmin), v.reason, {}, true, {
                                    onSelected = function()

                                    end
                                })
                            end
                        else
                            RageUI.Separator("")
                            RageUI.Separator(TranslationAdministration.MenuAdmin["S_noBan"])
                            RageUI.Separator("")
                        end
                    end
                end)
                RageUI.IsVisible(infoInventaireJoueur, function()
                    if loadInfoInventoryPlayer then 
                        RageUI.Separator((TranslationAdministration.MenuAdmin["ArgentPropre"]):format(moneyPlayer))
                        RageUI.Separator((TranslationAdministration.MenuAdmin["S_dirtyMoney"]):format(blackmoneyPlayer))
                        RageUI.Separator((TranslationAdministration.MenuAdmin["ArgentBanque"]):format(bankPlayer))
                        RageUI.Separator(TranslationAdministration.MenuAdmin["MenuInventaire"])
                        RageUI.Line("color", 19, 107, 190)    
                        for k,v in pairs(infoInventoryPlayer) do 
                            if v.count > 0 then
                                RageUI.List(("[~b~x%s~s~] - %s"):format(v.count ,v.label), {"Retirer", "Prendre"}, IndexInventory, nil, {}, true, {
                                    onListChange = function(Index, Items)
                                        IndexInventory = Index
                                    end,
                                    onSelected = function()
                                        if IndexInventory == 1 then 
                                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_removeItem"], {
                                                {type = 'number', label = TranslationAdministration.MenuAdmin["S_itemAmountPrompt"], icon = 'hashtag'},
                                            })
                                            if input then
                                                if input[1] <= v.count then 
                                                    TriggerServerEvent("fCore:Admin:withdrawItem", 'retirer', input[1], v.name, idPlayer)
                                                    SetTimeout(200, function()
                                                        getInventoryPlayer(idPlayer)
                                                    end)
                                                else
                                                    cNotification(TranslationAdministration.MenuAdmin["S_insufficientItems"])
                                                end
                                            end
                                        elseif IndexInventory == 2 then 
                                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_removeItem"], {
                                                {type = 'number', label = TranslationAdministration.MenuAdmin["S_itemAmountPrompt"], icon = 'hashtag'},
                                            })
                                            if input then
                                                if input[1] <= v.count then 
                                                    TriggerServerEvent("fCore:Admin:withdrawItem", 'prendre', input[1], v.name, idPlayer)
                                                    SetTimeout(200, function()
                                                        getInventoryPlayer(idPlayer)
                                                    end)
                                                else
                                                    cNotification(TranslationAdministration.MenuAdmin["S_insufficientItems"])
                                                end
                                            end
                                        end
                                    end
                                })
                            end
                        end
                    end
                end)
                RageUI.IsVisible(menuVehicule, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_vehicleMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    if checkPerms("vehicleoption") then
                        RageUI.Button(TranslationAdministration.MenuAdmin["S_vehicleOptions"], nil, {RightLabel = "→→"}, true, {}, VehicleOptionAdmin)
                    end
                    if checkPerms("spawnvehicule") then
                        RageUI.Button(TranslationAdministration.MenuAdmin["S_spawnVehicle"], nil, {RightLabel = "→→"}, true, {}, spawnVehicleAdmin)
                    end
                end)
                RageUI.IsVisible(menuGiveItemPlayer, function()
                    if not finishToLoadTable then 
                        RageUI.Separator("")
                        RageUI.Separator(TranslationAdministration.MenuAdmin["AttenteDonnees"])
                        RageUI.Separator("")

                    else
                        RageUI.Button(TranslationAdministration.MenuAdmin["RechercheItems"], nil, {}, true, {
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["RechercheItems"], {"Recherche un items"})
                                if input then
                                    Recherche = input[1]
                                end
                            end
                        })
                        if Recherche then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["AnnulerRecherche"], nil, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    Recherche = nil
                                end
                            })
                        end
                        RageUI.Line("color", 19, 107, 190)
                        if not Recherche then
                            for _, v in pairs(GetItemMenuAdmin) do 
                                RageUI.Button(v.label, nil, {}, true, {
                                    onSelected = function()
                                        local input = lib.inputDialog(TranslationAdministration.MenuAdmin["CombienDItem"], {{type = 'number', label = 'Combien d\'item se give', description = 'Combien d\'item se give', icon = 'hashtag'}})
                                        if input then 
                                            nbrItemGive = input[1]
                                            TriggerServerEvent("fCoreV2:MenuAdmin:giveiteReport", v.name, nbrItemGive, idJoueur)
                                        end
                                    end
                                })
                            end
                        else
                            local lowercaseRecherche = string.lower(Recherche)
                            for _, v in pairs(GetItemMenuAdmin) do 
                                local lowercaseLabel = string.lower(v.label)
                                if string.find(lowercaseLabel, lowercaseRecherche, 1, true) then 
                                    RageUI.Button(v.label, nil, {}, true, {
                                        onSelected = function()
                                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["CombienDItem"], {{type = 'number', label = 'Combien d\'item se give', description = 'Combien d\'item se give', icon = 'hashtag'}})
                                            if input then 
                                                nbrItemGive = input[1]
                                                TriggerServerEvent("fCoreV2:MenuAdmin:giveiteReport", v.name, nbrItemGive, idJoueur)
                                            end
                                        end 
                                    })
                                end
                            end
                        end                        
                    end
                end)
                RageUI.IsVisible(VehicleOptionAdmin, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_vehicleOptionsMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["ReparerVehicule"], nil, {}, true, {
                        onSelected = function()
                            reparerVehicle()
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["EssenceMax"], nil, {}, true, {
                        onSelected = function()
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            SetVehicleFuelLevel(vehicle, 100.0)
                            DecorSetFloat(vehicle, "_ANDY_FUEL_DECORE_", GetVehicleFuelLevel(vehicle))
                        end
                    })
                    
                    RageUI.Checkbox(TranslationAdministration.MenuAdmin["VehiculeGodmode"], nil, godmodAdmin, {}, {
                        onChecked = function()
                            godmodAdmin = true
                            godmodVehicle(true)
                        end,
                        onUnChecked = function()
                            godmodAdmin = false
                            godmodVehicle(false)
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["NettoyerVehicule"], nil, {}, true, {
                        onSelected = function()
                            cleanVehicle()
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["RetournerVehiculeRoues"], nil, {}, true, {
                        onSelected = function()
                            returnVehicleOnWheels()
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["RetournerVehicule180"], nil, {}, true, {
                        onSelected = function()
                            returnVehicle()
                        end
                    })
                    RageUI.List(TranslationAdministration.MenuAdmin["SupprimerVehicule"], {TranslationAdministration.MenuAdmin["DansRayon"], TranslationAdministration.MenuAdmin["FaceAToi"], TranslationAdministration.MenuAdmin["DansVehicule"]}, IndexDeleteVehicle, nil, {}, true, {
                        onListChange = function(Index, Items)
                            IndexDeleteVehicle = Index
                        end,
                        onSelected = function()
                            if IndexDeleteVehicle == 1 then 
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_deleteRadius"], {{type = 'number', label = 'Radius delete', description = 'Radius delete', icon = 'hashtag'}})
                                if input then 
                                    TriggerEvent('esx:deleteVehicle', input[1])
                                end
                            elseif IndexDeleteVehicle == 2 then 
                                local vehicle = ESX.Game.GetVehicleInDirection()
                                if DoesEntityExist(vehicle) then
                                    ESX.Game.DeleteVehicle(vehicle)
                                else
                                    cNotification(TranslationAdministration.MenuAdmin["AucunVehiculeDirection"])
                                end
                            elseif IndexDeleteVehicle == 3 then 
                                local vehicle = GetVehiclePedIsIn(playerPed, false)
                                if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                                    ESX.Game.DeleteVehicle(vehicle)
                                else
                                    cNotification(TranslationAdministration.MenuAdmin["PasAssisVehicule"])
                                end
                            end
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["RechercheProprietaireVehicule"], nil, {}, true, {
                        onSelected = function()
                            local vehicle = ESX.Game.GetVehicleInDirection()
                            local plate = GetVehicleNumberPlateText(vehicle)
                            if DoesEntityExist(vehicle) then
                                TriggerServerEvent("fCore:Police:searchPlateInBdd", plate)
                            end
                        end
                    })
                    RageUI.Checkbox(TranslationAdministration.MenuAdmin["FreezeUnfreezeVehicule"], nil, freezeVehicle, {}, {
                        onChecked = function()
                            freezeVehicle = true
                            freezeUnfreezeVehicle(true)
                        end,
                        onUnChecked = function()
                            freezeVehicle = false
                            freezeUnfreezeVehicle(false)
                        end
                    })
                end)
                RageUI.IsVisible(changeEsthetique, function()
                    RageUI.Button(TranslationAdministration.MenuAdmin["ChangerPlaque"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["ChangerPlaque"], {" "})
                            if input then 
                                local plate = input[1]
                                changePlateVehicle(plate)
                            end
                        end
                    })                    
                end)
                RageUI.IsVisible(spawnVehicleAdmin, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_spawnMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_spawnByName"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["DonnerNomVehicule"], {TranslationAdministration.MenuAdmin["DonnerNomVehicule"]})
                            if input then 
                                nameVehicule = input[1]
                                SpawnVehicle(nameVehicule, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true)
                            end
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["ListeVehicules"], nil, {}, true, {}, listVehicleAdmin)
                end)
                RageUI.IsVisible(listVehicleAdmin, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_categoryList"])
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(listCategorie) do 
                        RageUI.Button(("Catégorie - %s"):format(v.label), nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                nameCategory = v.name
                                labelCategory = v.label
                            end
                        }, menuListVehicleAdmin)
                    end
                end)
                RageUI.IsVisible(menuListVehicleAdmin, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_vehicleList"])
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(listVehicleConcess) do 
                        if nameCategory == v.category then 
                            RageUI.Button(v.name, nil, {}, true, {
                                onSelected = function()
                                    SpawnVehicle(v.model, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true)
                                end
                            })
                        end 
                    end
                end)
                RageUI.IsVisible(menuAdministratif, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_adminMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    if checkPerms("mapping") then
                        RageUI.Button(TranslationAdministration.MenuAdmin["MenuMapping"], nil, {RightLabel = "→→"}, true, {}, menuMappingAdmin)
                    end
                    if checkPerms("gestionserveur") then
                        RageUI.Button(TranslationAdministration.MenuAdmin["GestionServeurDev"], nil, {RightLabel = "→→"}, true, {}, gestionServeur)
                    end
                    if checkPerms("annonceserveur") then
                        RageUI.Button("Annonce serveur", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["DonnerNomVehicule"], {TranslationAdministration.MenuAdmin["DonnerNomVehicule"]})
                                if input then
                                    TriggerServerEvent("fCore:Admin:announceServeur", input[1])
                                end
                            end
                        })
                    end                    
                    if checkPerms("createitem") then
                        RageUI.Button(TranslationAdministration.MenuAdmin["S_createItem"], nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                if weightSysteme then 
                                    var = "weight"
                                else
                                    var = "limite"
                                end
                            end
                        }, menuCreateItem)
                    end
                end)
                RageUI.IsVisible(menuCreateItem, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_createItemMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_createItem"], nil, {}, true, {
                        onSelected = function()
                            item = lib.inputDialog(TranslationAdministration.MenuAdmin["S_createItem"], {
                                {type = "input", label = TranslationAdministration.MenuAdmin["S_itemLabel"], required = true},
                                {type = "input", label = TranslationAdministration.MenuAdmin["S_itemName"], required = true},
                                {type = "input", label = (TranslationAdministration.MenuAdmin["S_itemType"]):format(var), required = true},
                            })
                            if item then 
                                TriggerServerEvent("fCore:Admin:CreateItem", item[1], item[2], item[3], var)
                            end
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_itemList"], nil, {}, true, {
                        onSelected = function()
                            Recherche = nil
                            GetItemInBDD()
                        end
                    }, listeItem)
                end)
                RageUI.IsVisible(listeItem, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_itemListMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    if not finishToLoadTable then 
                        RageUI.Separator("")
                        RageUI.Separator(TranslationAdministration.MenuAdmin["AttenteDonnees"])
                        RageUI.Separator("")
                    else
                        RageUI.Button(TranslationAdministration.MenuAdmin["RechercheItems"], nil, {}, true, {
                            onSelected = function()
                                local input = lib.inputDialog(TranslationAdministration.MenuAdmin["RechercheItems"], {"Recherche un items"})
                                if input then
                                    Recherche = input[1]
                                end
                            end
                        })
                        if Recherche then 
                            RageUI.Button(TranslationAdministration.MenuAdmin["AnnulerRecherche"], nil, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    Recherche = nil
                                end
                            })
                        end
                        RageUI.Line("color", 19, 107, 190)
                        if not Recherche then
                            for _, v in pairs(GetItemMenuAdmin) do 
                                RageUI.Button((TranslationAdministration.MenuAdmin["S_itemInfoLabel"]):format(v.label), (TranslationAdministration.MenuAdmin["S_itemInfoName"]):format(v.name, var, v.weight), {}, true, {
                                    onSelected = function()
                                        nameA = v.name
                                        label = v.label
                                        weight = v.weight
                                    end
                                }, modifierItem)
                            end
                        else
                            local lowercaseRecherche = string.lower(Recherche)
                            for _, v in pairs(GetItemMenuAdmin) do 
                                local lowercaseLabel = string.lower(v.label)
                                if string.find(lowercaseLabel, lowercaseRecherche, 1, true) then 
                                    RageUI.Button(v.label, nil, {}, true, {
                                        onSelected = function()
                                            nameA = v.name
                                            label = v.label
                                            weight = v.weight
                                        end 
                                    }, modifierItem)
                                end
                            end
                        end                        
                    end
                end)
                RageUI.IsVisible(modifierItem, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_itemModificationMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.List(TranslationAdministration.MenuAdmin["S_modifyItem"], {"Label", "name", var}, IndexModifItem, nil, {}, true, {
                        onListChange = function(Index, Items)
                            IndexModifItem = Index
                        end,
                        onSelected = function()
                            if IndexModifItem == 1 then 
                                local newlabel = lib.inputDialog(TranslationAdministration.MenuAdmin["S_changeItemLabel"], {{type = 'input', label = 'Label de l\'item', required = true}})
                                if newlabel then 
                                    TriggerServerEvent("fcore:admin:modification", nameA, newlabel[1], "label", "name")
                                end
                            elseif IndexModifItem == 2 then 
                                newname = lib.inputDialog(TranslationAdministration.MenuAdmin["S_changeItemName"], {{type = "input", label = TranslationAdministration.MenuAdmin["S_itemName"], required = true}})
                                if newname then 
                                    TriggerServerEvent("fcore:admin:modification", label, newname[1], "name", "label")
                                end
                            elseif IndexModifItem == 3 then
                                newlimwei = lib.inputDialog(TranslationAdministration.MenuAdmin["S_changeItemWeight"], {{type = "number", label = "Le "..var.." de l'item", required = true}})
                                if newlimwei then 
                                    TriggerServerEvent("fcore:admin:modification", nameA, newlimwei[1], var, "name")
                                end
                            end
                        end
                    })

                    RageUI.Button(TranslationAdministration.MenuAdmin["S_deleteItem"], nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("fCore:Admin:DeleteItem", nameA)
                        end
                    })
                end)
                RageUI.IsVisible(menuMappingAdmin, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_mappingMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    for _,v in pairs(Administration.PosMapping) do 
                        RageUI.Button(v.label, nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                SetEntityCoords(PlayerPedId(), v.coords)
                            end
                        })
                    end
                end)
                RageUI.IsVisible(gestionServeur, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_permissionsMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["manage_permission"], nil, {}, true, {}, gestionPermission)
                end)
                RageUI.IsVisible(gestionPermission, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_createRankMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_createRank"], nil, {}, true, {}, createGradeAdmin)
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_addAdmin"], nil, {}, true, {
                        onSelected = function()
                            Recherche = nil
                            TriggerServerEvent("fCore:Admin:refreshPlayer")
                        end
                    }, AddAdmin)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_adminList"], nil, {}, true, {
                        onSelected = function()
                            Recherche = nil
                            getPlayerAdmin()
                        end
                    }, gestionListeAdmin)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_manageRanks"], nil, {}, true, {
                        onSelected = function()
                            getManageGrade()
                        end
                    }, gestionGererGrade)
                end)
                RageUI.IsVisible(AddAdmin, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_onlinePlayersMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("~b~Recherche un joueur~s~", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local input = lib.inputDialog("Recherche un joueur", {"Pour rechercher un joueur"})
                            if input then
                                Recherche = input[1]
                            end
                        end
                    })
                    if Recherche then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["AnnulerRecherche"], nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                Recherche = nil
                            end
                        })
                    end
                    if not Recherche then 
                        for k, v in pairs(playerInSession) do
                            if v.name == "**Invalid**" then 
                                table.remove(playerInSession, k) 
                            end
                            RageUI.Button("[ID : "..v.id.."~s~] - ~r~"..v.name, nil, {}, true, {
                                onSelected = function()
                                    id = v.id
                                    getManageGrade()
                                end
                            }, AddAdminOption)
                        end
                    else

                        local lowercaseRecherche = string.lower(Recherche)
                        for k, v in pairs(playerInSession) do
                            local lowercaseFullName = string.lower("[ID : "..v.id.."~s~] - ~r~"..v.name)
                            if string.find(lowercaseFullName, lowercaseRecherche, 1, true) then 
                                if v.name == "**Invalid**" then 
                                    table.remove(playerInSession, k) 
                                end
                                RageUI.Button("[ID : "..v.id.."~s~] - ~r~"..v.name, nil, {}, true, {
                                    onSelected = function()
                                        id = v.id
                                        getManageGrade()
                                    end
                                }, AddAdminOption)
                            end
                        end


                    end
                end)
                RageUI.IsVisible(AddAdminOption, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_rankListMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    if loadGestionAdmin then 
                        for k,v in pairs(gestionAdmin) do 
                            RageUI.Button((TranslationAdministration.MenuAdmin["S_rankChangeInfo"]):format(v.color,v.namegrade), nil, {}, true, {
                                onSelected = function()
                                    idPlayer = id
                                    idgrade = v.idgrade
                                end
                            }, addRolePlayer)
                        end
                    end
                end)
                RageUI.IsVisible(addRolePlayer, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_selectRankMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_addAsAdmin"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog("Etes vous sur ?", {"Oui/Non"})
                            if input then 
                                if input[1] == "Oui" then 
                                    TriggerServerEvent("fCore:Admin:AddAdmin", idPlayer, idgrade)
                                else
                                    cNotification(TranslationAdministration.MenuAdmin["CNotif_cancelAddGrade"])
                                end
                            end
                        end
                    })
                end)
                RageUI.IsVisible(createGradeAdmin, function()
                    RageUI.Separator("↓ ~b~Création du grade ~s~↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_rankInfo"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_createNewRank"], {
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_setRankId"], description = TranslationAdministration.MenuAdmin["S_assignId"], required = true},
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_setDisplayName"], description = TranslationAdministration.MenuAdmin["S_setDisplayName"], required = true},
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_setRankColor"], description = TranslationAdministration.MenuAdmin["S_setDisplayName"], required = true},
                            })
                            if input then 
                                if input[1] and input[2] and input[3] then 
                                    createGradeAdminTable.idGarde = input[1]
                                    createGradeAdminTable.nameGrade = input[2]
                                    createGradeAdminTable.color = ("~%s~"):format(input[3])
                                    valideGrade = true
                                else
                                    cNotification(TranslationAdministration.MenuAdmin["CNotif_lackInformation"])
                                end
                            end
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_setPermissions"], nil, {}, true, {}, GestionGradeadmin)
                    if createGradeAdminTable.idGarde and createGradeAdminTable.nameGrade and createGradeAdminTable.color then 
                     RageUI.Line("color", 19, 107, 190)
                        RageUI.Button(TranslationAdministration.MenuAdmin["S_createRank"], nil, {}, true, {
                            onSelected = function()
                                TriggerServerEvent("fCore:Admin:CreateGradeAdmin", createGradeAdminTable, Administration.TablegestionGrade)
                                createGradeAdminTable = {}
                            end
                        })
                    end
                end)
                RageUI.IsVisible(gestionGererGrade, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_manageRankMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    if loadGestionAdmin then 
                        
                        for k,v in pairs(gestionAdmin) do 
                            RageUI.Button((TranslationAdministration.MenuAdmin["S_rankChangeInfo"]):format(v.color,v.namegrade), nil, {}, true, {
                                onSelected = function()
                                    idInfoGrade = v.id 
                                    permission = v.permissions
                                end
                            }, ManageGererGrade)
                        end
                    end
                end)
                RageUI.IsVisible(ManageGererGrade, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_manageRankMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_changeRankInfo"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_changeRankDetails"], {
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_setRankId"], description = TranslationAdministration.MenuAdmin["S_assignId"], required = true},
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_setDisplayName"], description = TranslationAdministration.MenuAdmin["S_setDisplayName"], required = true},
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_setRankColor"], description = TranslationAdministration.MenuAdmin["S_setDisplayName"], required = true},
                            })
                            if input then 
                                if input[1] and input[2] and input[3] then 
                                    createGradeAdminTable.idGarde = input[1]
                                    createGradeAdminTable.nameGrade = input[2]
                                    createGradeAdminTable.color = ("~%s~"):format(input[3])
                                    TriggerServerEvent("fCore:Admin:UpdateInfoJob", createGradeAdminTable, idInfoGrade)
                                else
                                    cNotification(TranslationAdministration.MenuAdmin["CNotif_lackInformation"])
                                end
                            end
                        end
                    })
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_setPermissions"], nil, {}, true, {
                        onSelected = function()
                            IdGrade = idInfoGrade
                            addPerms = json.decode(permission)
                        end
                    }, ChangePermissionGrade)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_deleteRank"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog(TranslationAdministration.MenuAdmin["S_deleteRank"], {
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_confirmPrompt"], description = TranslationAdministration.MenuAdmin["S_yesNoPrompt"], required = true},
                            })
                            if input then 
                                if input[1] == "oui" then 
                                    TriggerServerEvent("fCore:Admin:deleteGrade", idInfoGrade)
                                    cNotification(TranslationAdministration.MenuAdmin["CNotif_continueDelete"])
                                else
                                    cNotification(TranslationAdministration.MenuAdmin["CNotif_DontHaveDelete"])
                                
                                end
                            end
                        end
                    })
                end)
                RageUI.IsVisible(ChangePermissionGrade, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_permissionChangeMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    if addPerms then 
                        for k,v in pairs(addPerms) do 
                            RageUI.Checkbox(v.label, nil, v.status, {}, {
                                onChecked = function()
                                    v.status = true
                                    TriggerServerEvent("fCore:Admin:UpdatePermission", addPerms, IdGrade)
                                end,
                                onUnChecked = function()
                                    v.status = false
                                    TriggerServerEvent("fCore:Admin:UpdatePermission", addPerms, IdGrade)
                                end
                            })
                        end
                    end
                end)
                RageUI.IsVisible(GestionGradeadmin, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_manageRankMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Checkbox("~b~Mettre toute les perms", nil, AllPerms, {}, {
                        onChecked = function()
                            for _,v in pairs(Administration.TablegestionGrade) do 
                                v.status = true
                            end
                            AllPerms = true
                        end,
                        onUnChecked = function()
                            for _,v in pairs(Administration.TablegestionGrade) do 
                                v.status = false
                            end
                            AllPerms = false
                        end
                    })
                    for _,v in pairs(Administration.TablegestionGrade) do 
                        RageUI.Checkbox(v.label, nil, v.status, {}, {
                            onChecked = function()
                                v.status = true
                            end,
                            onUnChecked = function()
                                v.status = false
                            end
                        })
                    end
                end)    
                RageUI.IsVisible(gestionListeAdmin, function()
                    RageUI.Button("~b~Recherche un admin~s~", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local input = lib.inputDialog("Recherche un admin", {"Pour rechercher un admin"})
                            if input then
                                Recherche = input[1]
                            end
                        end
                    })
                    if Recherche then 
                        RageUI.Button(TranslationAdministration.MenuAdmin["AnnulerRecherche"], nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                Recherche = nil
                            end
                        })
                    end
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_adminManagementMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    if loadIsAdmin then 
                        if not Recherche then 
                            for _,v in pairs(isAdmin) do 
                                RageUI.Button((TranslationAdministration.MenuAdmin["S_adminDetails"]):format(v.lastname, v.firstname, v.color, v.group), nil, {}, true, {
                                    onSelected = function()
                                        identifier = v.identifier
                                    end
                                }, gestionPlayerAdmin)
                            end
                        else

                            local lowercaseRecherche = string.lower(Recherche)
                            for _,v in pairs(isAdmin) do 
                                local lowercaseFullName = string.lower(v.lastname.." | "..v.firstname)
                                if string.find(lowercaseFullName, lowercaseRecherche, 1, true) then 
                                    RageUI.Button((TranslationAdministration.MenuAdmin["S_adminDetails"]):format(v.lastname, v.firstname, v.color, v.group), nil, {}, true, {
                                        onSelected = function()
                                            identifier = v.identifier
                                        end
                                    }, gestionPlayerAdmin)
                                end
                            end
                            
                        end
                    end
                end)
                RageUI.IsVisible(gestionPlayerAdmin, function()
                    RageUI.Separator(TranslationAdministration.MenuAdmin["S_manageRankMenu"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationAdministration.MenuAdmin["S_removeFromStaff"], nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog('Supprimer le grade', {
                                {type = 'input', label = TranslationAdministration.MenuAdmin["S_confirmPrompt"], description = TranslationAdministration.MenuAdmin["S_yesNoPrompt"], required = true},
                            })
                            if input then 
                                if input[1] == "oui" then 
                                    TriggerServerEvent("fCore:Admin:deleteAdminPlayer", identifier)
                                end
                            end
                        end
                    })
                end)
                Wait(0)
            end
        end)
    end
end


Keys.Register('F9', "menuAdmin", 'Ouvrir le menu Admin', function()
    if openAdmin == false then
        if checkPerms("menuadmin") then 
            openMenuAdmin()
        else
            cNotification(TranslationAdministration.MenuAdmin["CNotif_dontHavePermission"])
        end
    end
end)

