local Jobs = {}
MySQL.ready(function()
	local result = MySQL.Sync.fetchAll('SELECT * FROM jobs', {})
	for i=1, #result, 1 do
		Jobs[result[i].name] = result[i]
		Jobs[result[i].name].grades = {}
	end
	local result2 = MySQL.Sync.fetchAll('SELECT * FROM job_grades', {})
	for i=1, #result2, 1 do
		Jobs[result2[i].job_name].grades[tostring(result2[i].grade)] = result2[i]
	end
end)

ESX.RegisterServerCallback("fCore:Gang:GetInfoMember", function(source, cb, JobName)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    MySQL.Async.fetchAll("SELECT identifier, firstname, lastname, job2, job2_grade FROM users WHERE job2 = @job2 ORDER BY job2_grade DESC", {['@job2'] = JobName}, function(result)
        InfoMember = {}
        local xPlayer = ESX.GetPlayerFromId(_src) 
        CountJob2 = 0
        for i = 1, #result, 1 do
            if result[i].job2 == JobName then 
                CountJob2 = CountJob2 +1
            end
            table.insert(InfoMember, {
                identifier = result[i].identifier,
                firstname = result[i].firstname,
                lastname = result[i].lastname,
                job2 = result[i].job2,
                job2_grade = result[i].job2_grade,
                grade_label = Jobs[result[i].job2].grades[tostring(result[i].job2_grade)].label,
                Name = xPlayer.getName(),
                CountJob2 = CountJob2
            })
        end
        cb(InfoMember)
    end)
end)  

ESX.RegisterServerCallback("fCore:Gang:GetSalaryMember", function(source, cb)
    local _src = source 
    local query = "SELECT name, job_name, grade, salary, label FROM job_grades"
    MySQL.Async.fetchAll(query, function(result)
        local InfoSalary = {}
        for i = 1, #result do            
            table.insert(InfoSalary, {
                name = result[i].name,
                job_name = result[i].job_name,
                grade = result[i].grade,
                salary = result[i].salary,
                label = result[i].label,
            })
        end
        cb(InfoSalary)
    end)
end)


function getMaximumGrade(jobname)
	local queryDone, queryResult = false, nil
	MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @jobname ORDER BY `grade` DESC ;', {
		['@jobname'] = jobname
	}, function(result)
		queryDone, queryResult = true, result
	end)
	while not queryDone do
		Citizen.Wait(10)
	end
	if queryResult[1] then
		return queryResult[1].grade
	end
	return nil
end


RegisterNetEvent("fCore:Gang:AddSetjobEmployee")
AddEventHandler("fCore:Gang:AddSetjobEmployee", function(identifier, job_name, grade, firstname, lastname, JobName, GradeBoss)
    local xTarget = ESX.GetPlayerFromIdentifier(identifier)
    local query = "UPDATE users SET job2 = @job2, job2_grade = @job2_grade WHERE identifier = @identifier"
    local param = {["@job2"] = job_name, ["@job2_grade"] = grade, ["@identifier"] = identifier}
    if grade ~= tonumber(getMaximumGrade(job_name)) or job_name == Config.NoJob2 then
        if xTarget then
            xTarget.setJob2(job_name, grade)
            MySQL.Async.execute(query, param)
            sNotification(_src, (TranslationIllegal.Gang["ChangementGrade"]):format(firstname, lastname))
        else
            MySQL.Async.execute(query, param)
            sNotification(_src, TranslationIllegal.Gang["Snotif_change_grade"])
        end
    end
end)


RegisterNetEvent("fCore:Gang:CreateGrade")
AddEventHandler("fCore:Gang:CreateGrade", function(CreateGrade, JobName, GradeBoss)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local query = "INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (@job_name, @grade, @name, @label, @salary)"
    local param = {['@job_name'] = JobName,["@grade"] = CreateGrade.grade, ["@name"] = CreateGrade.name, ["@label"] = CreateGrade.label,["@salary"] = CreateGrade.salary}
    checkJob2Grade(xPlayer, JobName, GradeBoss, _src)
    MySQL.Async.insert(query, param)
    sNotification(_src, TranslationIllegal.Gang["Snotif_wait_reboot_to_setjob"])
end)

RegisterNetEvent("fCore:Gang:setSalary")
AddEventHandler("fCore:Gang:setSalary", function(SalaryNumber, grade, job_name, JobName, GradeBoss)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local query = "UPDATE job_grades SET salary = @salary WHERE job_name = @job_name AND grade = @grade"
    local param = {["grade"] = grade, ["job_name"] = job_name, ["salary"] = SalaryNumber}
    checkJob2Grade(xPlayer, JobName, GradeBoss, _src)
    MySQL.Async.execute(query,param)
    sNotification(_src, TranslationIllegal.Gang["Snotif_change_salary"])
end)


RegisterNetEvent("fCore:Gang:resignation")
AddEventHandler("fCore:Gang:resignation", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    xPlayer.setJob2(Cfg.NoJob2, 0)
end)


RegisterNetEvent("fCore:Boss:gangAcceptRecruitement")
AddEventHandler("fCore:Boss:gangAcceptRecruitement", function(targetT, JobName, GradeBoss, maxMember)
    local _src = source 
    if CountJob2 < maxMember then 
        TriggerClientEvent("fCore:Boss:gang:GiveinfoRecruitement", targetT, targetT, _src, JobName, GradeBoss)
    else
        sNotification(_src, TranslationIllegal.Gang["TropDeGens"])
    end
end)

RegisterNetEvent("fCore:Boss:Gang:sendMessageEmploye")
AddEventHandler("fCore:Boss:Gang:sendMessageEmploye", function(src)
    sNotification(src, TranslationIllegal.Gang["PlayerRefusedRecruit"])
end)


RegisterNetEvent("fCore:Gang:RecruitEmployee")
AddEventHandler("fCore:Gang:RecruitEmployee", function(Target, JobName, GradeBoss, _src)
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local TargetX = ESX.GetPlayerFromId(Target)
    local society = GetPlayerIdentifier(Target, 1)
    TargetX.setJob2(JobName, 0)
    local query = "UPDATE users SET job2 = @job2, job2_grade = @job2_grade WHERE society = @society"
    local param = {["@job2"] = JobName, ["@job2_grade"] = 0, ["@society"] = string.sub(society, 9)}
    MySQL.Async.execute(query, param)
    sNotification(_src, TranslationIllegal.Gang['Snotif_recruiter'].. TargetX.name .. '~w~.')
    sNotification(Target, TranslationIllegal.Gang['Snotif_been_hired'].. xPlayer.name .. '~w~.')
end)


RegisterNetEvent("fCore:Boss:gang:changePermission")
AddEventHandler("fCore:Boss:gang:changePermission", function(Type, permission, grade, job_name, jobName)
    local _src = source    
    local query = "UPDATE job_grades SET "..Type.." = @permission WHERE job_name = @job_name AND grade = @grade"
    MySQL.Async.execute(query, {["@grade"] = grade, ["@job_name"] = job_name, ["@permission"] = permission})
end)

RegisterNetEvent("fCore:Gang:UpdatePlayer")
AddEventHandler("fCore:Gang:UpdatePlayer", function()
    local query = "UPDATE users SET job = @job, job_grade = @job_grade"
    local param = {["@job"] = Cfg.NoJob2,["@job_grade"] = 0}
    MySQL.Async.execute(query, param)
end)


RegisterNetEvent("fCore:Gang:Deletegrade")
AddEventHandler("fCore:Gang:Deletegrade", function(grade, job_name)
    local _src = source
    local query = "DELETE FROM job_grades WHERE grade = @grade AND job_name = @job_name"
    local param = {["@grade"] = grade, ["@job_name"] = job_name}
    MySQL.Async.execute(query, param)
    sNotification(_src, TranslationIllegal.Gang["deleteGrade"])
end)




ESX.RegisterServerCallback("fCore:Gang:getInventory", function(source, cb)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local getInventory = xPlayer.getInventory()
    cb(getInventory)
end)


ESX.RegisterServerCallback("fCore:Gang:getChestGang", function(source, cb, society)
    local weightCount = 0
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local chestGang = {}
    MySQL.Async.fetchAll("SELECT name, count, label FROM CoffreGang WHERE society = @society", {
        ["@society"] = society
    }, function(result)
        for _,v in pairs(result) do 
            local weight = xPlayer.getInventoryItem(v.name).weight
            weightCount = weightCount + weight * v.count
            table.insert(chestGang, {name = v.name, count = v.count, label = v.label})
        end
        cb(chestGang, weightCount)
    end)
end)




RegisterNetEvent("fCore:Gang:InventoryDepo")
AddEventHandler("fCore:Gang:InventoryDepo", function(QuantityDepo, name, weightChest, weightChestMax, label, society)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local weight = xPlayer.getInventoryItem(name).weight 
    newWeigt = weightChest + (weight*QuantityDepo)
    if newWeigt >= weightChestMax then 
        sNotification(_src, TranslationIllegal.Gang["DepasseCapacite"])
    else
        local count = 0
        local found = false
        MySQL.Async.fetchAll("SELECT name, count FROM CoffreGang WHERE society = @society", {
            ["@society"] = society
        }, function(result)
            if result and #result > 0 then 
                for _, v in ipairs(result) do 
                    if name == v.name then 
                        count = v.count + QuantityDepo
                        MySQL.Async.execute("UPDATE CoffreGang SET count = @count WHERE society = @society AND name = @name", {
                            ["@count"] = count, 
                            ["@society"] = society, 
                            ["@name"] = name
                        }, function(rowsChanged)
                            if rowsChanged > 0 then
                                xPlayer.removeInventoryItem(name, QuantityDepo)
                            end
                        end)
                        found = true
                        break
                    end
                end
            end
            if not found then
                MySQL.Async.execute("INSERT INTO CoffreGang (society, name, count, label) VALUES (@society, @name, @count, @label)", {
                    ["@society"] = society, 
                    ["@name"] = name,
                    ["@count"] = QuantityDepo, 
                    ["@label"] = label
                }, function(rowsChanged)
                    if rowsChanged > 0 then
                        xPlayer.removeInventoryItem(name, QuantityDepo)
                    end
                end)
            end
        end)
    end
end)

RegisterNetEvent("fCore:Gang:ChestRetirer")
AddEventHandler("fCore:Gang:ChestRetirer", function(QuantityRetirer, name, society)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local count = 0
    MySQL.Async.fetchAll("SELECT name, count FROM CoffreGang WHERE society = @society", {
        ["@society"] = society
    }, function(result)
        if result and #result > 0 then 
            for _, v in ipairs(result) do 
                if name == v.name then 
                    if v.count >= QuantityRetirer then 
                        count = v.count - QuantityRetirer
                        MySQL.Async.execute("UPDATE CoffreGang SET count = @count WHERE society = @society AND name = @name", {
                            ["@count"] = count, 
                            ["@society"] = society, 
                            ["@name"] = name
                        }, function(rowsChanged)
                            if rowsChanged > 0 then
                                xPlayer.addInventoryItem(name, QuantityRetirer)
                            end
                        end)
                    end
                end
            end
        end
    end)
end)



