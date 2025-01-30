_JobBuilder = {}
function _JobBuilder:GetInfoSociety()
    InfoSocietyInBdd = {}
    ESX.TriggerServerCallback('fCore:Boss:GetInfoSocietyAccount', function(result) 
        for i = 1, #result do 
            table.insert(InfoSocietyInBdd, result[i])
        end
    end)
end

function _JobBuilder:GetInfoMember(jobName)
    InfoMemberInBdd = {}
    canGet = false
    ESX.TriggerServerCallback('fCore:Boss:GetInfoMember', function(InfoMember)
        for i = 1, #InfoMember do 
            table.insert(InfoMemberInBdd, InfoMember[i])
        end
        canGet = true
    end, jobName)
end

function _JobBuilder:GetInfoSalary()
    InfoSalaryInBdd = {}
    ESX.TriggerServerCallback('fCore:Boss:GetSalaryMember', function(InfoSalary) 
        for i = 1, #InfoSalary do 
            table.insert(InfoSalaryInBdd, InfoSalary[i])
        end
    end)
end

function _JobBuilder:GetHistoryBilling()
    HistoryBillingInBdd = {}
    ESX.TriggerServerCallback('fCore:Boss:GetHistoryBilling', function(HistoryBilling) 
        for i = 1, #HistoryBilling do 
            table.insert(HistoryBillingInBdd, HistoryBilling[i])
        end
    end)
end

function _JobBuilder:GetInfoVehicule()
    InfoVehiculeInBdd = {}
    ESX.TriggerServerCallback('fCore:Boss:GetVehiculeInGarage', function(CountVehicule)
        for i = 1, #CountVehicule do 
            table.insert(InfoVehiculeInBdd, CountVehicule[i])
        end
    end)
end

function _JobBuilder:GetOutfit()
    Outfit = {}
    ESX.TriggerServerCallback("fCore:Boss:GetOutfit", function(OutfitInBdd)
        Outfit = OutfitInBdd
    end, ESX.PlayerData.job.name)
end

function _JobBuilder:GetInformationBlanchiment()
    infoBlanchimentBoss = {}
    ESX.TriggerServerCallback("fCore:Boss:Blanchiment", function(infoBlanchiment)
        infoBlanchimentBoss = infoBlanchiment
    end, ESX.PlayerData.job.name)
end




function refreshInfoSalary()
    SetTimeout(100, function()
        _JobBuilder:GetInfoSalary()
    end)
end

function blipsAppel(pos, text)
    local GPSBlipId = AddBlipForCoord(pos.x, pos.y, pos.z)
    SetBlipSprite(GPSBlipId, 1)
    SetBlipColour(GPSBlipId, 3)
    SetBlipScale(GPSBlipId, 1.0)
    SetBlipAsShortRange(GPSBlipId, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(GPSBlipId)
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local playerPos = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, pos.x, pos.y, pos.z, true)
            if distance <= 5.0 then
                RemoveBlip(GPSBlipId)
                break
            end
        end
    end)
end