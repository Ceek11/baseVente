local openFisc = false 
menuFisc = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuFisc = RageUI.CreateSubMenu(menuFisc, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuFacture = RageUI.CreateSubMenu(subMenuFisc, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuSalary = RageUI.CreateSubMenu(subMenuFisc, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuAction = RageUI.CreateSubMenu(subMenuFisc, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuListEmployee = RageUI.CreateSubMenu(subMenuFisc, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuFisc.Closed = function()
    openFisc = false
end

function openMenuFisc()
    getSocietyFisc()
    if openFisc then 
        openFisc = false 
        RageUI.Visible(menuFisc, false)
        return
    else
        openFisc = true
        RageUI.Visible(menuFisc, true)
        CreateThread(function()
            while openFisc do 
                RageUI.IsVisible(menuFisc, function()
                    for _,v in pairs(infoSociety) do 
                        RageUI.Button(v.label, nil, {RightLabel = v.money}, true, {
                            onSelected = function()
                                society = v.account_name
                                label = v.label
                                getHistoryBoss()
                                _JobBuilder:GetInfoSalary()
                                _JobBuilder:GetHistoryBilling()
                            end
                        }, subMenuFisc)
                    end
                end)
                RageUI.IsVisible(subMenuFisc, function()
                    RageUI.Button(TranslationJob.Fisc["HistoryInvoice"], nil, {}, true, {
                        onSelected = function()
                            societyName = society
                        end
                    }, menuFacture)
                    RageUI.Button(TranslationJob.Fisc["HistorySalary"], nil, {}, true, {
                        onSelected = function()
                            societyName = string.sub(society, 9)
                        end
                    }, menuSalary)
                    RageUI.Button(TranslationJob.Fisc["History"], nil, {}, true, {
                        onSelected = function()
                            societyName = society
                        end
                    }, menuAction)
                    RageUI.Button(TranslationJob.Fisc["ListEmployee"], nil, {}, true, {
                        onSelected = function()
                            societyName = string.sub(society, 9)
                            _JobBuilder:GetInfoMember(string.sub(society, 9))
                        end
                    }, menuListEmployee)
                end)
                RageUI.IsVisible(menuListEmployee, function()
                    if canGet then
                        for k,v in pairs(InfoMemberInBdd) do 
                            if societyName == v.job then 
                                if v.job == societyName then 
                                    if v.firstname.." "..v.lastname == v.Name then 
                                        RageUI.Button(v.firstname.." "..v.lastname, nil, {RightLabel = v.grade_label.." →→"}, false, {})
                                    else
                                        RageUI.Button(v.firstname.." "..v.lastname, nil, {RightLabel = v.grade_label.." →→"}, true, {})
                                    end
                                end
                            end
                        end
                    else
                        RageUI.Separator("")
                        RageUI.Separator(TranslationJob.Fisc["LoadingInfo"])
                        RageUI.Separator("")
                    end
                end)
                RageUI.IsVisible(menuAction, function()
                    for _,v in pairs(infoAction) do 
                        if v.society == societyName then 
                            RageUI.Button(v.action, nil, {RightLabel = v.price}, true, {})
                        end
                    end
                end)
                RageUI.IsVisible(menuSalary, function()
                    for k,v in pairs(InfoSalaryInBdd) do 
                        if societyName == v.job_name then 
                            RageUI.Button((TranslationJob.Fisc["Grade"]):format(v.label), nil, {RightLabel = ("~b~Salaire : ~s~%s$"):format(v.salary)}, true, {})
                        end
                    end
                end)
                RageUI.IsVisible(menuFacture, function()
                    for k,v in pairs(HistoryBillingInBdd) do 
                        if v.society == societyName then 
                            RageUI.Button(v.employe, nil, {RightLabel = v.facture}, true, {})
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end