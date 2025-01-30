local employeInService = 0 
RegisterNetEvent('fCore:Boss:GiveInformationCountService')
AddEventHandler('fCore:Boss:GiveInformationCountService', function(count)
    employeInService = count
end)


local openBoss = false 
menuBoss = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuGestionSociety = RageUI.CreateSubMenu(menuBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
ListMemberBoss = RageUI.CreateSubMenu(subMenuGestionSociety, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
ActionMemberBoss = RageUI.CreateSubMenu(ListMemberBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
ManagePermissionGradeBoss = RageUI.CreateSubMenu(subMenuGestionSociety, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
SubMenuGestionGradeBoss = RageUI.CreateSubMenu(ManagePermissionGradeBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
ChangeInfoGradeBoss = RageUI.CreateSubMenu(SubMenuGestionGradeBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
SalaryManageBoss = RageUI.CreateSubMenu(subMenuGestionSociety, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
GestionEntrepriseBoss = RageUI.CreateSubMenu(subMenuGestionSociety, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuHistoryBillBoss = RageUI.CreateSubMenu(GestionEntrepriseBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
SubMenuHistoryBillingBoss = RageUI.CreateSubMenu(GestionEntrepriseBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
GestionStockBoss = RageUI.CreateSubMenu(subMenuGestionSociety, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
StockVehicleBoss = RageUI.CreateSubMenu(GestionStockBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
StockWeaponPolice = RageUI.CreateSubMenu(GestionStockBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
StockKitRepa = RageUI.CreateSubMenu(GestionStockBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
StockHelico = RageUI.CreateSubMenu(GestionStockBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
stockBateau = RageUI.CreateSubMenu(GestionStockBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuBoss.Closed = function()
    openBoss = false 
end

local ChangeActionMoney = 1
local CreateGrade = {}
function openMenuBoss(valeur, Boss)
    TriggerServerEvent("fCore:Boss:addCountService", "test", valeur.jobName)
    _JobBuilder:GetInfoSociety()
    _JobBuilder:GetInfoMember(valeur.jobName)
    _JobBuilder:GetInfoSalary()
    _JobBuilder:GetHistoryBilling()
    _JobBuilder:GetInformationBlanchiment()
    if openBoss then 
        openBoss = false 
        RageUI.Visible(menuBoss, false)
        return
    else
        openBoss = true 
        RageUI.Visible(menuBoss, true)
        CreateThread(function()
            while openBoss do 
                DisableControlAction(1, 51, true)
                FreezeEntityPosition(PlayerPedId(), true)
                RageUI.IsVisible(menuBoss, function()
                    RageUI.Separator((TranslationJob.AllJob["your_society"]):format(valeur.jobLabel))
                    for k,v in pairs(InfoSocietyInBdd) do 
                        if v.account_name == valeur.societyName then 
                            RageUI.Separator((TranslationJob.AllJob["separator_society_Money"]):format(v.money))
                        end
                    end
                    RageUI.Separator(TranslationJob.AllJob["manage_money"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.List(TranslationJob.AllJob["withdraw_deposit_money"], {"Déposer", "Retirer"}, ChangeActionMoney, nil, {LeftBadge = RageUI.BadgeStyle.Star}, true, {
                        onListChange = function(Index, Items)
                            ChangeActionMoney = Index
                        end,
                        onSelected = function()
                            local quantityMoney = Visual.KeyboardNumber(TranslationJob.AllJob["choose_number_money"], "", 10)
                            if tonumber(quantityMoney) then 
                                TriggerServerEvent("fCore:Boss:ActionBossMoney", ChangeActionMoney, quantityMoney, valeur.jobName, valeur.gradeBoss, valeur.societyName, valeur.Webhooks, Boss.point)
                                TriggerServerEvent("fCore:Boss:sendInfoActionBoss", ChangeActionMoney, quantityMoney, valeur.societyName)
                                Wait(100)
                                _JobBuilder:GetInfoSociety()
                            else
                                cNotification(TranslationJob.AllJob["Cnotif_enter_number"])
                            end
                        end
                    })
                    if Boss.makeFakeMoney then  
                        local canBlanchir = #infoBlanchimentBoss > 0
                        RageUI.Button(TranslationJob.AllJob["make_fake_money"], nil, {RightLabel = "→", LeftBadge = RageUI.BadgeStyle.Star}, not canBlanchir, {
                            onSelected = function()
                                local MakeFakeMoney = Visual.KeyboardNumber("Choissisez le nombre d'argent à blanchir", "", 10)
                                if tonumber(MakeFakeMoney) then 
                                    if MakeFakeMoney < valeur.maxFakeMoney then 
                                        TriggerServerEvent("fCore:Boss:MakeFakeMoney", MakeFakeMoney, Boss.percentageMoney, valeur.jobName, valeur.gradeBoss, Boss.point, valeur.Webhooks)
                                        _JobBuilder:GetInformationBlanchiment()
                                        _JobBuilder:GetInfoSociety()
                                    else
                                        cNotification("Vous ne pouvez pas blanchir autant")
                                    end
                                else
                                    cNotification(TranslationJob.AllJob["Cnotif_enter_number"])
                                end
                            end
                        })                        
                    end
                    RageUI.Separator(TranslationJob.AllJob["action_boss"] )
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationJob.AllJob["boss_action"], nil, {RightLabel = "→", LeftBadge = RageUI.BadgeStyle.Star}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback("fCore:Boss:GetNumberEmployee", function(NbrEmployeeBossBdd) 
                                NbrEmployeeBoss = NbrEmployeeBossBdd
                            end, valeur.jobName)
                        end
                    },subMenuGestionSociety)
                end)
                RageUI.IsVisible(subMenuGestionSociety, function()
                    RageUI.Separator((TranslationJob.AllJob["separator_number_employee_in_service"]):format(employeInService))
                    RageUI.Separator(TranslationJob.AllJob["permission_patron"] )
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationJob.AllJob["manage_employe"], nil, {RightLabel = "→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, ListMemberBoss)
                    RageUI.Button(TranslationJob.AllJob["manage_permission"], nil, {RightLabel = "→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, ManagePermissionGradeBoss)
                    RageUI.Button(TranslationJob.AllJob["manage_salary"], nil, {RightLabel = "→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, SalaryManageBoss)
                    RageUI.Button(TranslationJob.AllJob["manage_stock"] , nil, {RightLabel = "→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, GestionStockBoss)
                    RageUI.Button(TranslationJob.AllJob["manage_society"], nil, {RightLabel = "→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, GestionEntrepriseBoss)
                end)
                RageUI.IsVisible(ListMemberBoss, function()
                    RageUI.Separator(TranslationJob.AllJob["separator_recruit_membre"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationJob.AllJob["button_recruit_an_employee"], nil, {RightLabel = "→", LeftBadge = RageUI.BadgeStyle.Star}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                TriggerServerEvent("fCore:Boss:AcceptRecruitement", GetPlayerServerId(targetT), valeur.jobName, valeur.gradeBoss, Boss.point)
                                SetTimeout(100, function()
                                    _JobBuilder:GetInfoMember(valeur.jobName)
                                end)
                            end
                        end
                    })
                    RageUI.Separator(TranslationJob.AllJob["employe_in_society"])
                    RageUI.Line("color", 19, 107, 190)
                    for i = 1, #InfoMemberInBdd do
                        local member = InfoMemberInBdd[i]
                        if valeur.jobName == member.job then 
                            if member.job == valeur.jobName then 
                                if member.firstname.." "..member.lastname == member.Name then 
                                    RageUI.Button(member.firstname.." "..member.lastname, nil, {RightLabel = member.grade_label.." →→"}, false, {})
                                else
                                    RageUI.Button(member.firstname.." "..member.lastname, nil, {RightLabel = member.grade_label.." →→"}, true, {
                                        onSelected = function()
                                            grade_label = member.grade_label
                                            identifier = member.identifier
                                            firstname = member.firstname
                                            lastname = member.lastname
                                            job = member.job
                                        end
                                    }, ActionMemberBoss)
                                end
                            end
                        end
                    end
                end)

                RageUI.IsVisible(ActionMemberBoss, function()
                    DisableControlAction(1, 51, true)
                    RageUI.Separator((TranslationJob.AllJob["separator_employee"]):format(firstname, lastname))
                    RageUI.Line("color", 19, 107, 190)
                    for i = 1, #InfoSalaryInBdd do 
                        local salary = InfoSalaryInBdd[i]
                        if salary.job_name == valeur.jobName and salary.label ~= grade_label then
                            RageUI.Button((('%s. %s'):format(salary.grade, salary.label)), nil, {RightLabel = "~b~Choisir"}, true, {
                                onSelected = function()
                                    TriggerServerEvent('fCore:Boss:AddSetjobEmployee', identifier, salary.job_name, salary.grade, firstname, lastname)
                                    SetTimeout(100, function()
                                        _JobBuilder:GetInfoMember(valeur.jobName)
                                    end)
                                end
                            })
                        end
                        if salary.label == grade_label and salary.job_name == valeur.jobName then 
                            RageUI.Button((('%s. %s'):format(salary.grade, salary.label)), nil, {RightLabel = "~g~Actuel", LeftBadge = RageUI.BadgeStyle.Star}, true, {})
                        end
                    end
                    RageUI.Button(TranslationJob.AllJob["button_dismiss_employee"], nil, {RightBadge = RageUI.BadgeStyle.Alert}, true, {
                        onSelected = function()
                            TriggerServerEvent('fCore:Boss:AddSetjobEmployee', identifier, Cfg.NoJob, 0, firstname, lastname)
                            SetTimeout(100, function()
                                _JobBuilder:GetInfoMember(valeur.jobName)
                            end)
                        end
                    },ListMemberBoss)
                end)
                RageUI.IsVisible(ManagePermissionGradeBoss, function()
                    RageUI.Separator(TranslationJob.AllJob["separator_created_grade"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationJob.AllJob["button_creates_grade"], nil, {RightLabel = "→→", LeftBadge = RageUI.BadgeStyle.Star}, true, {
                        onSelected = function()
                            local name = Visual.KeyboardText(TranslationJob.AllJob["choose_name_create"], "", 10)
                            CreateGrade.name = name 
                            if CreateGrade.name == nil or CreateGrade.name == "" or CreateGrade.name == " " then
                                cNotification(TranslationJob.AllJob["Cnotif_no_choose_name_grade"], "Action", "vert")
                            else
                                local label = Visual.KeyboardText(TranslationJob.AllJob["choose_label_create"], "", 10)
                                CreateGrade.label = label
                                if CreateGrade.label == nil or CreateGrade.label == "" or CreateGrade.label == " " then
                                    cNotification(TranslationJob.AllJob["Cnotif_no_choose_label_grade"], "Action", "vert")
                                else
                                    local grade = Visual.KeyboardNumber(TranslationJob.AllJob["choose_grade_create"], "", 10)
                                    CreateGrade.grade = grade
                                    if not tonumber(grade) or grade == nil then
                                        cNotification(TranslationJob.AllJob["Cnotif_no_choose_grade"], "Action", "vert")
                                    else
                                        local salary = Visual.KeyboardNumber(TranslationJob.AllJob["choose_salary_create"], "", 10)
                                        CreateGrade.salary = salary
                                        if CreateGrade.salary == nil or CreateGrade.salary == "" or CreateGrade.salary == " " then
                                            cNotification(TranslationJob.AllJob["Cnotif_no_choose_salary_grade"], "Action", "vert")
                                        else
                                            if CreateGrade.grade >= ESX.PlayerData.job.grade then
                                                cNotification(TranslationJob.AllJob['notif_grade_elevate'], "Action", "vert")
                                            else 
                                                TriggerServerEvent('fCore:Boss:createGrade', CreateGrade, valeur.jobName, valeur.gradeBoss, Boss.point)
                                                refreshInfoSalary()
                                            end
                                        end
                                    end
                                end    
                            end
                        end                
                    })
                    RageUI.Separator(TranslationJob.AllJob["separator_current_ranks"])
                    RageUI.Line("color", 19, 107, 190)
                    for i = 1, #InfoSalaryInBdd do 
                        local gradeActuelle = InfoSalaryInBdd[i]
                        if gradeActuelle.job_name == valeur.jobName then
                            RageUI.Button(gradeActuelle.label.." | Grade : "..gradeActuelle.grade.." ", nil, {LeftBadge = RageUI.BadgeStyle.Star}, true, {
                                onSelected = function()
                                    id = gradeActuelle.id
                                    job_name = gradeActuelle.job_name
                                    grade = gradeActuelle.grade
                                    coffre = gradeActuelle.coffre
                                    armurerie = gradeActuelle.armurerie
                                    saisie = gradeActuelle.saisie
                                    garage = gradeActuelle.garage
                                    fisc = gradeActuelle.fisc
                                end
                            },SubMenuGestionGradeBoss)
                        end
                    end
                end)
                RageUI.IsVisible(SubMenuGestionGradeBoss, function()
                    RageUI.Button(TranslationJob.AllJob["button_info_job"], nil, {RightLabel = "→→", LeftBadge = RageUI.BadgeStyle.Star}, true, {
                        onSelected = function()
                            idJob = id 
                        end
                    }, ChangeInfoGradeBoss)
                    DisableControlAction(1, 51, true)
                    RageUI.Separator(TranslationJob.AllJob["separator_permission"])
                    RageUI.Line("color", 19, 107, 190)

                    RageUI.Checkbox("Coffre", nil, coffre, {LeftBadge = RageUI.BadgeStyle.Star}, {
                        onChecked = function()  
                            coffre = true
                            TriggerServerEvent("fCore:Boss:changePermission", "coffre", 1, grade, job_name, valeur.jobName, valeur.gradeBoss, Boss.point)
                            refreshInfoSalary()
                        end,
                        onUnChecked = function()
                            coffre = false
                            TriggerServerEvent("fCore:Boss:changePermission", "coffre", 0, grade, job_name, valeur.jobName, valeur.gradeBoss, Boss.point)
                            refreshInfoSalary()
                        end
                    })
                    RageUI.Checkbox("Garage", nil, garage, {LeftBadge = RageUI.BadgeStyle.Star}, {
                        onChecked = function()  
                            garage = true
                            TriggerServerEvent("fCore:Boss:changePermission", "garage", 1, grade, job_name, valeur.jobName, valeur.gradeBoss, Boss.point)
                            refreshInfoSalary()
                        end,
                        onUnChecked = function()
                            garage = false
                            TriggerServerEvent("fCore:Boss:changePermission", "garage", 0, grade, job_name, valeur.jobName, valeur.gradeBoss, Boss.point)
                            refreshInfoSalary()
                        end
                    })
                    for _, opt in pairs(Boss.Option) do 
                        if opt.armurerie == true then 
                            RageUI.Checkbox("Armurerie", nil, armurerie, {LeftBadge = RageUI.BadgeStyle.Star}, {
                                onChecked = function()  
                                    armurerie = true
                                    TriggerServerEvent("fCore:Boss:changePermission", "armurerie", 1, grade, job_name, valeur.jobName, valeur.gradeBoss, Boss.point)
                                    refreshInfoSalary()
                                end,
                                onUnChecked = function()
                                    armurerie = false
                                    TriggerServerEvent("fCore:Boss:changePermission", "armurerie", 0, grade, job_name, valeur.jobName, valeur.gradeBoss, Boss.point)
                                    refreshInfoSalary()
                                end
                            })
                        end
                        if opt.saisie then 
                            RageUI.Checkbox("Saisie", nil, saisie, {LeftBadge = RageUI.BadgeStyle.Star}, {
                                onChecked = function()  
                                    saisie = true
                                    TriggerServerEvent("fCore:Boss:changePermission", "saisie", 1, grade, job_name, valeur.jobName, valeur.gradeBoss, Boss.point)
                                    refreshInfoSalary()
                                end,
                                onUnChecked = function()
                                    saisie = false
                                    TriggerServerEvent("fCore:Boss:changePermission", "saisie", 0, grade, job_name, valeur.jobName, valeur.gradeBoss, Boss.point)
                                    refreshInfoSalary()
                                end
                            })
                        end
                        if opt.fisc then 
                            RageUI.Checkbox("Fisc", nil, fisc, {LeftBadge = RageUI.BadgeStyle.Star}, {
                                onChecked = function()  
                                    fisc = true
                                    TriggerServerEvent("fCore:Boss:changePermission", "fisc", 1, grade, job_name, valeur.jobName, valeur.gradeBoss, Boss.point)
                                    refreshInfoSalary()
                                end,
                                onUnChecked = function()
                                    fisc = false
                                    TriggerServerEvent("fCore:Boss:changePermission", "fisc", 0, grade, job_name, valeur.jobName, valeur.gradeBoss, Boss.point)
                                    refreshInfoSalary()
                                end
                            })
                        end
                    end
                end)
                RageUI.IsVisible(ChangeInfoGradeBoss, function()
                    RageUI.Button(TranslationJob.AllJob["button_change_info_label"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local NewLabel = Visual.KeyboardText(TranslationJob.AllJob["choose_name_job"], "", 10)
                            if NewLabel == " " or NewLabel == nil or NewLabel == "" then 
                                cNotification(TranslationJob.AllJob["Cnotif_true_data"])
                            else
                                TriggerServerEvent("fCore:Boss:ChangeInfoJob", "Label", NewLabel, idJob)
                                SetTimeout(500, function()
                                    _JobBuilder:GetInfoSalary()
                               end)
                            end
                        end
                    })
                    RageUI.Button(TranslationJob.AllJob["button_change_info_grade"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local NewGrade = Visual.KeyboardNumber(TranslationJob.AllJob["choose_grade_job"], "", 2)
                            if not tonumber(NewGrade) then 
                                cNotification(TranslationJob.AllJob["Cnotif_enter_number"]) 
                            else 
                                TriggerServerEvent("fCore:Boss:ChangeInfoJob", "Grade", NewGrade, idJob)
                                SetTimeout(500, function()
                                    _JobBuilder:GetInfoSalary()
                               end)
                            end
                        end
                    })
                    RageUI.Button("Supprimer le job", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local input = lib.inputDialog('Supprimer le grade', {
                                {type = 'input', label = 'Etes vous sur ?', description = 'Mettez oui / non', required = true},
                            })
                            if input[1] == "oui" then 
                                TriggerServerEvent("fCore:Boss:DeleteJob", idJob)
                                cNotification("Vous avez continuer la supression")
                                SetTimeout(500, function()
                                    _JobBuilder:GetInfoSalary()
                               end)
                            else
                                cNotification("Vous n'avez pas continuer la supression")
                            end
                        end
                        
                    })
                end)
                RageUI.IsVisible(SalaryManageBoss, function()
                    RageUI.Separator(TranslationJob.AllJob["separator_manage_salary"])
                    RageUI.Line("color", 19, 107, 190)
                    for k, v in pairs(InfoSalaryInBdd) do 
                        if v.job_name == valeur.jobName then 
                            RageUI.Button("Grade : "..v.label, "Le salaire maximum est dans 500$", {RightLabel = "~b~"..v.salary.."$"}, true, {
                                onSelected = function()
                                    SalaryNumber = Visual.KeyboardNumber(TranslationJob.AllJob["choose_salary_create"], "", 5)
                                    if tonumber(SalaryNumber) and SalaryNumber <= 500 then
                                        TriggerServerEvent("fCore:Boss:setSalary", SalaryNumber, v.grade, v.job_name, valeur.jobName, valeur.gradeBoss, Boss.point)
                                        refreshInfoSalary()
                                    else
                                        cNotification(TranslationJob.AllJob["choose_number"])
                                    end
                                end
                            })
                        end
                    end
                end)
                RageUI.IsVisible(GestionEntrepriseBoss, function()
                    RageUI.Separator(TranslationJob.AllJob["separotor_manage_history"])
                    RageUI.Line("color", 19, 107, 190)
                    for _, opt in pairs(Boss.Option) do                         
                        if opt.historyBill then 
                            RageUI.Button(TranslationJob.AllJob["button_gestion_bill"], nil, {RightLabel = "→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, menuHistoryBillBoss)
                        end
                    end
                end)
                RageUI.IsVisible(menuHistoryBillBoss, function()
                    RageUI.Separator(TranslationJob.AllJob["separator_billing_society"])
                    RageUI.Line("color", 19, 107, 190)
                    for k,v in pairs(HistoryBillingInBdd) do 
                        if v.job == valeur.JobName then 
                            RageUI.Button((TranslationJob.AllJob["button_billin_employe"]):format(v.id,  v.employe), nil, {}, true, {
                                onSelected = function()
                                    id = v.id
                                    employe = v.employe
                                    client = v.client
                                    facture = v.facture
                                    raison = v.raison
                                end
                            },SubMenuHistoryBillingBoss)
                        end
                    end
                    RageUI.Button(TranslationJob.AllJob["button_delete_all_billing"], nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("fCore:Boss:DeleteAllBilling", valeur.jobName, valeur.gradeBoss, Boss.point)
                            SetTimeout(100, function()
                                _JobBuilder:GetHistoryBilling()
                            end)
                        end
                    })
                end)
                RageUI.IsVisible(SubMenuHistoryBillingBoss, function()
                    RageUI.Info(("~b~Employé %s"):format(employe), {("Raison : %s"):format(raison)}, {})
                    RageUI.Separator(("~y~Facture~s~ #%s"):format(id))
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Separator(("~b~Nom de l'employé~s~ : %s"):format(employe))
                    RageUI.Separator(("~g~Nom du client~s~ : %s"):format(client))
                    RageUI.Separator(("~g~Prix~s~ : %s$"):format(facture))
                    RageUI.Button("~r~Supprimer la facture", nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("fCore:Boss:DeleteBilling", id, valeur.jobName, valeur.gradeBoss, Boss.point)
                            SetTimeout(100, function()
                                _JobBuilder:GetHistoryBilling()
                            end)
                        end
                    })
                end)
                RageUI.IsVisible(GestionStockBoss, function()
                    RageUI.Separator(TranslationJob.AllJob["separator_manage_stock"])
                    RageUI.Line("color", 19, 107, 190)
                    for _, opt in pairs(Boss.Option) do 
                        if opt.stockVehicle then 
                            RageUI.Button(TranslationJob.AllJob["button_stock_vehicle"], nil, {RightLabel = "→→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, StockVehicleBoss)
                        end
                        if opt.stockKitRepa then 
                            RageUI.Button("Stock kit de réparation", nil, {RightLabel = "→→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, StockKitRepa)
                        end
                        if opt.stockHeli then
                            RageUI.Button("Achat d'hélico", nil, {RightLabel = "→→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, StockHelico)
                        end
                        if opt.stockBateau then
                            RageUI.Button("Achat Bateau", nil, {RightLabel = "→→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, stockBateau)
                        end
                        if opt.armurerie then 
                            RageUI.Button("Achat d'arme", nil, {RightLabel = "→→", LeftBadge = RageUI.BadgeStyle.Star}, true, {}, StockWeaponPolice)
                        end
                    end
                end)

                RageUI.IsVisible(StockHelico, function()
                    RageUI.Separator("Achat d'hélico")
                    RageUI.Line("color", 19, 107, 190)
                    for _,v in pairs(valeur.HeliShop) do 
                        RageUI.Button(v.label, nil, {}, true, {
                            onSelected = function()
                                local input = lib.inputDialog("Choisir le nom de l'hélico", {"Choisir le nom de l'hélico", "Choisir le grade minimum"})
                                if input then 
                                    if tonumber(input[2]) then 
                                        label = input[1]
                                        grade = input[2]
                                        RequestModel(v.name)
                                        while not HasModelLoaded(v.name) do 
                                            Wait(10)
                                        end
                                        helicustom = CreateVehicle(v.name, vector3(-233.2032, -990.1321, 29.30493), 40, false, false)
                                        custom = ESX.Game.GetVehicleProperties(helicustom)
                                        TriggerServerEvent("fCore:Boss:BuyVehicleForSociety", ESX.PlayerData.job.name, v.name, label, v.price, grade, custom, valeur.societyName, valeur.jobName, valeur.gradeBoss, v.price, "Heli")
                                        DeleteEntity(helicustom)
                                    else
                                        cNotification("Il faut mettre un chiffre correct")
                                    end
                                end
                            end
                        })
                    end
                end)

                RageUI.IsVisible(stockBateau, function()
                    RageUI.Separator("Achat Bateau")
                    RageUI.Line("color", 19, 107, 190)
                    for _,v in pairs(valeur.BateauShop) do 
                        RageUI.Button(v.label, nil, {}, true, {
                            onSelected = function()
                                local input = lib.inputDialog("Choisir le nom du Bateau", {"Choisir le nom du Bateau", "Choisir le grade minimum"})
                                if input then 
                                    if tonumber(input[2]) then 
                                        label = input[1]
                                        grade = input[2]
                                        RequestModel(v.name)
                                        while not HasModelLoaded(v.name) do 
                                            Wait(10)
                                        end
                                        Bateaucustom = CreateVehicle(v.name, vector3(-233.2032, -990.1321, 29.30493), 40, false, false)
                                        custom = ESX.Game.GetVehicleProperties(Bateaucustom)
                                        TriggerServerEvent("fCore:Boss:BuyVehicleForSociety", ESX.PlayerData.job.name, v.name, label, v.price, grade, custom, valeur.societyName, valeur.jobName, valeur.gradeBoss, v.price, "Bateau")
                                        DeleteEntity(Bateaucustom)
                                    else
                                        cNotification("Il faut mettre un chiffre correct")
                                    end
                                end
                            end
                        })
                    end
                end)

                RageUI.IsVisible(StockVehicleBoss, function()
                    RageUI.Separator(TranslationJob.AllJob["separator_Purchasable"]) 
                    RageUI.Line("color", 19, 107, 190)
                    for i = 1, #valeur.Vehicule do 
                        local v = valeur.Vehicule[i]
                        RageUI.Button(v.label, nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = v.price.."$"}, true, {
                            onSelected = function()
                                local label = Visual.KeyboardText(TranslationJob.AllJob["choose_name_vehicle"], "", 20)
                                if label ~= nil or label ~= "" or label ~= " " then 
                                    local grade = Visual.KeyboardNumber(TranslationJob.AllJob["choose_grade_vehicle"], '', 3) 
                                    if tonumber(grade) then 
                                        RequestModel(v.name)
                                        while not HasModelLoaded(v.name) do
                                            Citizen.Wait(10)
                                        end    
                                        vehiclecustom = CreateVehicle(v.name, vector3(-233.2032, -990.1321, 29.30493), 40, false, false)
                                        custom = ESX.Game.GetVehicleProperties(vehiclecustom)
                                        TriggerServerEvent("fCore:Boss:BuyVehicleForSociety", ESX.PlayerData.job.name, v.name, label, v.price, grade, custom, valeur.societyName, valeur.jobName, valeur.gradeBoss, v.price, "car")
                                        DeleteEntity(vehiclecustom)
                                        cNotification(TranslationJob.AllJob["Cnotif_buy_vehicule"], "Action", "vert")
                                    else
                                        cNotification(TranslationJob.AllJob["Cnotif_enter_number"])
                                    end
                                else
                                    cNotification(TranslationJob.AllJob["Cnotif_label_vehicule"])
                                end
                            end
                        })
                    end
                end)

                RageUI.IsVisible(StockWeaponPolice, function()
                    RageUI.Separator("Achat d'arme") 
                    for _,weapon in pairs(Armurerie) do
                        for _, v in pairs(weapon.Weapon) do 
                            if ESX.PlayerData.job.name == weapon.job then 
                                RageUI.Button(v.label, nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = v.price.."$"}, true, {
                                    onSelected = function()
                                        local ChooseGrade = Visual.KeyboardNumber("Choisi le grade", "", 20)
                                        if tonumber(ChooseGrade) then
                                            TriggerServerEvent("Police:BuyWeaponForSociety", ESX.PlayerData.job.name, v.name, v.price, ChooseGrade, v.label, valeur.societyName)
                                        else
                                            ESX.ShowNotification("Rentre un numéro valide")
                                        end
                                    end
                                })
                            end
                        end
                    end
                end)

                RageUI.IsVisible(StockKitRepa, function()
                    RageUI.Separator("Achat de kit de réparation")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Achater des kits de réparation", nil, {}, true, {
                        onSelected = function()
                            local input = lib.inputDialog("La somme de kits", {"La somme de kits"})
                            if StockKitRepa then 
                                kitRepation = input[1]
                                TriggerServerEvent("fCore:Boss:AddKitMecano", valeur.societyName, kitRepation, PriceKitRepa)
                            end
                        end
                    })
                end)

                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end

RegisterNetEvent("fCore:Boss:GiveInformationOfRecruitement")
AddEventHandler("fCore:Boss:GiveInformationOfRecruitement", function(targetT, jobName, gradeBoss, point, _src)
    cNotification("Appuyer sur ~b~[E]~s~ pour accepter le recrutement\n Appuyer sur ~r~[Y]~s~ pour refuser le recrutement")
    verifRecruitement(targetT, jobName, gradeBoss, point, _src)
end)

function verifRecruitement(targetT, jobName, gradeBoss, point, _src)
    CreateThread(function()
        local keyPressed = false
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then
                if targetT then 
                    TriggerServerEvent("fCore:Boss:RecruitEmployee", targetT, jobName, gradeBoss, point, _src)
                    cNotification("Vous venez d'accepter le recrutement", "Action", "vert")
                    keyPressed = true
                end
            elseif IsControlJustPressed(1, 246) then 
                if targetT then 
                    cNotification("Tu viens refuser le recrutement")
                    TriggerServerEvent("fCore:Boss:sendMessageEmploye", _src)
                    keyPressed = true
                end
            end
            Wait(0)
        end
    end)
end