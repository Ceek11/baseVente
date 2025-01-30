_PoliceJob  = {}
function _PoliceJob:GetFilType()
    fillTypeInBdd = {}
    ESX.TriggerServerCallback('Police:GetInfoFillType', function(fillType) 
        for i = 1, #fillType do 
            table.insert(fillTypeInBdd, fillType[i])
        end
    end)
end

function _PoliceJob:GetInfoSalary()
    InfoSalaryInBdd = {}
    ESX.TriggerServerCallback('Police:GetSalaryMember', function(InfoSalary) 
        for i = 1, #InfoSalary do 
            table.insert(InfoSalaryInBdd, InfoSalary[i])
        end
    end)
end

function _PoliceJob:checkAmendes(targetT)
    infoAmendesInBdd = {}
    checkAmendes = false
    ESX.TriggerServerCallback("fCore:police:getAmendes", function(result) 
        for i = 1, #result do 
            table.insert(infoAmendesInBdd, result[i])
        end
        checkAmendes = true
    end, targetT)
end

