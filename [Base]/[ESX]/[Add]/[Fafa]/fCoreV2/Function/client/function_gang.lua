_Gang = {}
function _Gang:GetInfoMember(v)
    InfoGangMemberInBdd = {}
    ESX.TriggerServerCallback('fCore:Gang:GetInfoMember', function(InfoMember)
        for i = 1, #InfoMember do 
            table.insert(InfoGangMemberInBdd, InfoMember[i])
        end
    end, v.JobName)
end

function _Gang:GetInfoSalary()
    InfoGangSalaryInBdd = {}
    ESX.TriggerServerCallback('fCore:Gang:GetSalaryMember', function(InfoSalary) 
        for i = 1, #InfoSalary do 
            table.insert(InfoGangSalaryInBdd, InfoSalary[i])
        end
    end)
end
