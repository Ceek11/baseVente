local openGang = false 
menuGang = RageUI.CreateMenu("Gang", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuGangInfo = RageUI.CreateSubMenu(menuGang, "Gang", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
ManageEmployeeGang = RageUI.CreateSubMenu(menuGangInfo, "Gang", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
SalaryManageGang= RageUI.CreateSubMenu(menuGang, "Gang", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
GestionGradedeGang = RageUI.CreateSubMenu(SalaryManageGang, "Gang", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)

menuGang.Closed = function()
    openGang = false 
end

CreateGradeGang = {}
local StatsButton = true
function openMenuGang(Info)
    _Gang:GetInfoMember(Info)
    _Gang:GetInfoSalary()
    if openGang then 
        openGang = false 
        RageUI.Visible(menuGang, false)
    else
        openGang = true 
        RageUI.Visible(menuGang, true)
        CreateThread(function()
            while openGang do 
                RageUI.IsVisible(menuGang, function()
                    RageUI.Separator(TranslationIllegal.Gang["OptionsGroupe"])
                    if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == Info.JobName and ESX.PlayerData.job2.grade_name == "boss" then 
                        RageUI.Line("color", 19, 107, 190)
                        RageUI.Button(TranslationIllegal.Gang["button_member_management"], nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                _Gang:GetInfoMember(Info)
                            end
                        }, menuGangInfo)
                        RageUI.Button(TranslationIllegal.Gang["button_grade_management"], nil, {RightLabel = "→→"}, true, {}, SalaryManageGang)
                        RageUI.Line("color", 19, 107, 190)
                    end
                    RageUI.Button(TranslationIllegal.Gang["leaveGroup"], nil, {}, true, {
                        onSelected = function()
                            local Confirmation = Visual.KeyboardText(TranslationIllegal.Gang["areYouSur"], "Oui / Non", 10)
                            if Confirmation == "Oui" then 
                                TriggerServerEvent("fCore:Gang:resignation", Cfg.NoJob2)
                            else
                                cNotification(TranslationIllegal.Gang["Cancell"])
                            end                            
                        end
                    })
                end)
                RageUI.IsVisible(menuGangInfo, function()
                    RageUI.Separator(TranslationIllegal.Gang["RecruterMembres"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationIllegal.Gang["button_recruit_an_employee"], nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            targetT = GetNearbyPlayer(false, true)
                            if not targetT then return end 
                            if targetT then 
                                TriggerServerEvent("fCore:Boss:gangAcceptRecruitement", GetPlayerServerId(targetT), Info.JobName, Info.GradeBoss, Info.maxMember)
                            end
                        end
                    },menuGang)
                    RageUI.Separator(TranslationIllegal.Gang["separator_member_in_society"])
                    RageUI.Line("color", 19, 107, 190)
                    for i = 1, #InfoGangMemberInBdd do
                        local member = InfoGangMemberInBdd[i]
                        if Info.JobName == member.job2 then 
                            if member.job2 == Info.JobName then 
                                if member.firstname.." "..member.lastname == member.Name then 
                                    RageUI.Button(member.firstname.." "..member.lastname, nil, {RightLabel = member.grade_label.." →→"}, false, {})
                                else
                                    RageUI.Button(member.firstname.." "..member.lastname, nil, {RightLabel = member.grade_label.." →→"}, true, {
                                        onSelected = function()
                                            grade_label = member.grade_label
                                            identifier = member.identifier
                                            firstname = member.firstname
                                            lastname = member.lastname
                                            job2 = member.job2
                                        end
                                    }, ManageEmployeeGang)
                                end
                            end
                        end
                    end
                end)
                RageUI.IsVisible(ManageEmployeeGang, function()
                    RageUI.Separator((TranslationIllegal.Gang["separator_employee"]):format(firstname, lastname))
                    RageUI.Line("color", 19, 107, 190)                    
                    for i = 1, #InfoGangSalaryInBdd do 
                        local salary = InfoGangSalaryInBdd[i]
                        if salary.name ~= "boss" then 
                            StatsButton = true 
                        else
                            StatsButton = false
                        end
                        if salary.job_name == Info.JobName and salary.label ~= grade_label then
                            RageUI.Button((('%s. %s'):format(salary.grade, salary.label)), nil, {RightLabel = TranslationIllegal.Gang["Choose"]}, StatsButton, {
                                onSelected = function()
                                    TriggerServerEvent('fCore:Gang:AddSetjobEmployee', identifier, salary.job_name, salary.grade, firstname, lastname, Info.JobName)
                                    SetTimeout(500, function()
                                        _Gang:GetInfoSalary()
                                    end)
                                end
                            },menuGang)
                        end
                        if salary.label == grade_label and salary.job_name == Info.JobName then 
                            RageUI.Button((('%s. %s'):format(salary.grade, salary.label)), nil, {RightLabel = TranslationIllegal.Gang["Current"]}, true, {})
                        end
                    end
                    RageUI.Button(TranslationIllegal.Gang["button_dismiss_employee"], nil, {RightBadge = RageUI.BadgeStyle.Alert}, true, {
                        onSelected = function()
                            TriggerServerEvent('fCore:Gang:AddSetjobEmployee', identifier, Cfg.NoJob2, 0, firstname, lastname, Info.JobName)
                            SetTimeout(500, function()
                                 _Gang:GetInfoSalary()
                            end)
                        end
                    },menuGang)
                end)
                RageUI.IsVisible(SalaryManageGang, function()
                    DisableControlAction(1, 51, true)
                    RageUI.Separator(TranslationIllegal.Gang["GestionGrades"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationIllegal.Gang["button_creates_grade"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            local name = Visual.KeyboardText(TranslationIllegal.Gang["choose_name_create"], "", 50)
                            CreateGradeGang.name = name 
                            if CreateGradeGang.name == nil or CreateGradeGang.name == "" or CreateGradeGang.name == " " then
                                cNotification(TranslationIllegal.Gang["Cnotif_no_choose_name_grade"])
                            else
                                local label = Visual.KeyboardText(TranslationIllegal.Gang["choose_label_create"], "", 50)
                                CreateGradeGang.label = label
                                if CreateGradeGang.label == nil or CreateGradeGang.label == "" or CreateGradeGang.label == " " then
                                    cNotification(TranslationIllegal.Gang["Cnotif_no_choose_label_grade"])
                                else
                                    local grade = Visual.KeyboardNumber(TranslationIllegal.Gang["choose_grade_create"], "", 2)
                                    CreateGradeGang.grade = grade
                                    if not tonumber(grade) or grade == nil then
                                        cNotification(TranslationIllegal.Gang["Cnotif_no_choose_grade"])
                                    else
                                        if CreateGradeGang.grade >= ESX.PlayerData.job2.grade then
                                            cNotification(TranslationIllegal.Gang['notif_grade_elevate'])
                                        else 
                                            TriggerServerEvent('fCore:Gang:CreateGrade', CreateGradeGang, Info.JobName, Info.GradeBoss)
                                            SetTimeout(500, function()
                                                _Gang:GetInfoSalary()
                                            end)
                                        end
                                    end
                                end    
                            end
                        end                
                    })
                    RageUI.Separator(TranslationIllegal.Gang["manage_grade"])
                    RageUI.Line("color", 19, 107, 190)
                    for k, v in pairs(InfoGangSalaryInBdd) do 
                        if v.job_name == Info.JobName then 
                            RageUI.Button("Grade "..v.grade.." : "..v.label, nil, {}, true, {
                                onSelected = function()
                                    job_name = v.job_name
                                    grade = v.grade
                                    name = v.name
                                end
                            },GestionGradedeGang)
                        end
                    end
                end)
                RageUI.IsVisible(GestionGradedeGang, function()
                        RageUI.Button(TranslationIllegal.Gang["SupprimerGrade"], nil, {}, true, {
                        onSelected = function()
                            if name ~= "boss" then
                                SureSupr = Visual.KeyboardText(TranslationIllegal.Gang["areYouSur"], "Oui/Non", 10)
                                if SureSupr == " " or SureSupr == "" or SureSupr == nil then 
                                    cNotification(TranslationIllegal.Gang["YouDontHaveAnyCharacter"])
                                else
                                    if SureSupr == "Oui" then 
                                        for k,v in pairs(InfoGangMemberInBdd) do 
                                            if v.job_grade == grade and v.job == job_name then
                                                TriggerServerEvent("fCore:Gang:UpdatePlayer")
                                            end
                                        end
                                        TriggerServerEvent("fCore:Gang:Deletegrade", grade, job_name)
                                        SetTimeout(500, function()
                                            _Gang:GetInfoSalary()
                                        end)
                                    else 
                                        cNotification(TranslationIllegal.Gang["AnnulationSuppression"])
                                    end
                                end
                            else
                                cNotification(TranslationIllegal.Gang["GradePatron"])
                            end
                        end
                    },SalaryManageGang)
                end)
                Wait(0)
            end
        end)
    end
end


Keys.Register('F7', "Gang", 'Ouvrir le menu gang / orga', function()
    for _,v in pairs(InfoGang) do
        if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == v.JobName then  
            if openGang == false then
                openMenuGang(v)
            end
        end
    end
end)


RegisterNetEvent("fCore:Boss:gang:GiveinfoRecruitement")
AddEventHandler("fCore:Boss:gang:GiveinfoRecruitement", function(targetT, _src, JobName, GradeBoss)
    cNotification(TranslationIllegal.Gang["RejoindreRecrutement"])
    verifRecrutementGang(targetT, _src, JobName, GradeBoss)
end)

function verifRecrutementGang(targetT, _src, JobName, GradeBoss)
    CreateThread(function()
        local keyPressed = false
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then
                if targetT then 
                    TriggerServerEvent("fCore:Gang:RecruitEmployee", targetT, JobName, GradeBoss, _src)
                    cNotification(TranslationIllegal.Gang["RejoindreSucces"])
                    keyPressed = true
                end
            elseif IsControlJustPressed(1, 246) then 
                if targetT then 
                    cNotification(TranslationIllegal.Gang["RefuserRecrutement"])
                    TriggerServerEvent("fCore:Boss:Gang:sendMessageEmploye", _src)
                    keyPressed = true
                end
            end
            Wait(0)
        end
    end)
end









local openCoffreGang = false 
menuCoffreGang = RageUI.CreateMenu(" ", " ")
subMenuDepoGang =  RageUI.CreateSubMenu(menuCoffreGang," ", " ")
subMenuRetirerGang =  RageUI.CreateSubMenu(menuCoffreGang," ", " ")
menuCoffreGang.Closed = function()
    openCoffreGang = false 
end
weightChest = 150
function openMenuCoffreGang(valeur)
    getInventoryChestGang(valeur.society)
    if openCoffreGang then 
        openCoffreGang = false
        RageUI.Visible(menuCoffreGang, false) 
        return 
    else 
        openCoffreGang = true 
        RageUI.Visible(menuCoffreGang, true)
        CreateThread(function()
            while openCoffreGang do 
                DisableControlAction(1, 51, true)
                RageUI.IsVisible(menuCoffreGang, function()
                    RageUI.Button(TranslationIllegal.Gang["DeposerObjet"], nil, {}, true, {
                        onSelected = function()
                            getInventoryGang()
                        end
                    }, subMenuDepoGang)
                    RageUI.Button(TranslationIllegal.Gang["RetirerObjet"], nil, {}, true, {
                        onSelected = function()
                            getInventoryChestGang(valeur.society)
                        end
                    }, subMenuRetirerGang)
                end)
                RageUI.IsVisible(subMenuRetirerGang, function()
                    if loadChestGang then 
                        RageUI.Separator(("Coffre : %s / %s KG "):format(weightCount, weightChest))
                        RageUI.Line()
                        for _,v in pairs(chestGang) do 
                            if v.count >= 1 then 
                                RageUI.Button(v.label, nil, {RightLabel = ("x%s"):format(v.count)}, true, {
                                    onSelected = function()
                                        local input = lib.inputDialog(TranslationIllegal.Gang["RetirerObjet"], {TranslationIllegal.Gang["RetirerObjet"]})
                                        if input then
                                            TriggerServerEvent("fCore:Gang:ChestRetirer", tonumber(input[1]), v.name, valeur.society)
                                            Wait(100)
                                            getInventoryChestGang(valeur.society)
                                        end

                                    end
                                })
                            end
                        end
                    end
                end)
                RageUI.IsVisible(subMenuDepoGang, function()
                    if loadCoffreGang then 
                        RageUI.Separator(("Coffre : %s / %s KG "):format(weightCount, weightChest))
                        RageUI.Line()
                        for _, v in pairs(InventoryPlayer) do 
                            if v.count >= 1 then 
                                RageUI.Button(v.label, nil, {RightLabel = ("x%s"):format(v.count)}, true, {
                                    onSelected = function()
                                        if v.name ~= "bracelet_electronique" then 
                                            local input = lib.inputDialog(TranslationIllegal.Gang["NombreDepot"], {"Le nombre à déposer"})
                                            if input then 
                                                TriggerServerEvent("fCore:Gang:InventoryDepo", tonumber(input[1]), v.name, weightCount, weightChest, v.label, valeur.society)
                                                Wait(100)
                                                getInventoryGang()
                                                getInventoryChestGang(valeur.society)
                                            end
                                        else
                                            cNotification(TranslationIllegal.Gang["ImpossibleDepot"])
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