function getInformationGarage()
    getInformationGarageBdd = {}
    GarageLoad = false
    ESX.TriggerServerCallback("fCore:AgentImmo:displayGarage", function(result) 
        for k,v in pairs(result) do 
            table.insert(getInformationGarageBdd, v)
        end
        GarageLoad = true
    end)
end

CreateThread(function()
    TriggerServerEvent("fCore:AgentImmo:ShowHouse")
end)



getInformationHouseBdd = {}
RegisterNetEvent("fCore:AgentImmo:displayHouse")
AddEventHandler("fCore:AgentImmo:displayHouse", function(result)
    getInformationHouseBdd = result
    HouseLoad = true
end)

function GetOwnerHouse(id)
    OwnerHouse = false
    ColocHouse = {}
    JobHouse = {}
    GangHouse = {}
    ESX.TriggerServerCallback("fCore:AgenImmo:GetOwnerHouse", function(OwnerHouseResult, ColocHouseResult, JobHouseResult, GangHouseResult)
        OwnerHouse = OwnerHouseResult
        ColocHouse = ColocHouseResult
        JobHouse = JobHouseResult
        GangHouse = GangHouseResult
    end, id)
end

function CreatePointHouse(coffre, manage, weightChest,weightCoffreVIP, id)
    CreateThread(function()
        while inProperty do 
            local interval = 1000 
            local posPlayer = GetEntityCoords(PlayerPedId())
            local destCoffre = coffre 
            local distCoffre = #(vector3(destCoffre.x, destCoffre.y, destCoffre.z)-posPlayer)
            if distCoffre <= 5 then
                if OwnerHouse then 
                    interval = 0
                    DrawMarker(27, destCoffre.x, destCoffre.y, destCoffre.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                    if distCoffre <= 2 then 
                        ESX.ShowHelpNotification("Appuyer sur E pour ouvrir le coffre")
                        if IsControlJustPressed(1, 51) then 
                            openMenuCoffreHouse(weightChest, weightCoffreVIP, id)
                        end
                    end
                elseif #ColocHouse > 0 then
                    for _,v in pairs(ColocHouse) do
                        if v.coffre then 
                            interval = 0
                            DrawMarker(27, destCoffre.x, destCoffre.y, destCoffre.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                            if distCoffre <= 2 then 
                                ESX.ShowHelpNotification("Appuyer sur E pour ouvrir le coffre")
                                if IsControlJustPressed(1, 51) then 
                                    openMenuCoffreHouse(weightChest, weightCoffreVIP, id)
                                end
                            end
                        end
                    end
                elseif #JobHouse > 0 then 
                    for _,v in pairs(JobHouse) do
                        if v.coffre then 
                            interval = 0
                            DrawMarker(27, destCoffre.x, destCoffre.y, destCoffre.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                            if distCoffre <= 2 then 
                                ESX.ShowHelpNotification("Appuyer sur E pour ouvrir le coffre")
                                if IsControlJustPressed(1, 51) then 
                                    openMenuCoffreHouse(weightChest, weightCoffreVIP, id)
                                end
                            end
                        end
                    end
                elseif #GangHouse > 0 then
                    for _,v in pairs(GangHouse) do
                        if v.coffre then 
                            interval = 0
                            DrawMarker(27, destCoffre.x, destCoffre.y, destCoffre.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                            if distCoffre <= 2 then 
                                ESX.ShowHelpNotification("Appuyer sur E pour ouvrir le coffre")
                                if IsControlJustPressed(1, 51) then 
                                    openMenuCoffreHouse(weightChest, weightCoffreVIP, id)
                                end
                            end
                        end
                    end
                end
            end
            local destManage = manage 
            local distManage = #(vector3(destManage.x, destManage.y, destManage.z)-posPlayer)
            if distManage <= 5 then 
                if OwnerHouse then 
                    interval = 0
                    DrawMarker(27, destManage.x, destManage.y, destManage.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                    if distManage <= 2 then 
                        ESX.ShowHelpNotification("Appuyer sur E pour ouvrir le Manage")
                        if IsControlJustPressed(1, 51) then 
                            openMenuManageHouse(id)
                        end
                    end
                elseif #ColocHouse > 0 then 
                    for k,v in pairs(ColocHouse) do
                        if v.manage then 
                            interval = 0
                            DrawMarker(27, destManage.x, destManage.y, destManage.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                            if distManage <= 2 then 
                                ESX.ShowHelpNotification("Appuyer sur E pour ouvrir le Manage")
                                if IsControlJustPressed(1, 51) then 
                                    openMenuManageHouse(id)
                                end
                            end
                        end
                    end
                elseif #JobHouse > 0 then 
                    for k,v in pairs(JobHouse) do
                        if v.manage then 
                            interval = 0
                            DrawMarker(27, destManage.x, destManage.y, destManage.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                            if distManage <= 2 then 
                                ESX.ShowHelpNotification("Appuyer sur E pour ouvrir le Manage")
                                if IsControlJustPressed(1, 51) then 
                                    openMenuManageHouse(id)
                                end
                            end
                        end
                    end
                elseif #GangHouse > 0 then 
                    for k,v in pairs(GangHouse) do
                        if v.manage then 
                            interval = 0
                            DrawMarker(27, destManage.x, destManage.y, destManage.z, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                            if distManage <= 2 then 
                                ESX.ShowHelpNotification("Appuyer sur E pour ouvrir le Manage")
                                if IsControlJustPressed(1, 51) then 
                                    openMenuManageHouse(id)
                                end
                            end
                        end
                    end
                end
            end
            Wait(0)
        end
    end)
end

function getInventoryHouse()
    InventoryPlayer = {}
    loadCoffreHouse = false
    ESX.TriggerServerCallback("fCore:AgentImmo:getInventory", function(getInventory) 
        for k,v in pairs(getInventory) do 
            table.insert(InventoryPlayer, v)
        end
        loadCoffreHouse = true
    end)
end

function getChestHouse(id)
    chestHouse = {}
    loadChestHouse = false
    weightCount = 0
    ESX.TriggerServerCallback("fCore:AgentImmo:getChestHouse", function(result, weight) 
        for _,v in pairs(result) do 
            table.insert(chestHouse, v)
        end
        weightCount = weight
        loadChestHouse = true
    end, id)
end

function getColocataire(id)
    colocataireHouse = {}
    loadColocataireHouse = false 
    ESX.TriggerServerCallback("fCore:agentImmo:getColocataire", function(result) 
        for k,v in pairs(result) do 
            table.insert(colocataireHouse, v)
        end
        loadColocataireHouse = true
    end, id)
end


function getColocataireJob(id)
    colocataireJob = {}
    loadColocataireJobHouse = false 
    ESX.TriggerServerCallback("fCore:AgentImmo:GetJobColacation", function(result) 
        for k,v in pairs(result) do 
            table.insert(colocataireJob, v)
        end
        loadColocataireJobHouse = true
    end, id)
end



RegisterNetEvent("fCore:agentImmo:sonnerAppartOwner")
AddEventHandler("fCore:agentImmo:sonnerAppartOwner", function(namePlayer, idPlayer, coords)
    cNotification("Appuyer sur ~b~E~s~ pour faire rentrer la personne \nAppuyer sur ~r~Y~s~ pour ne pas faire rentrer la personne", "Action", "vert")
    verifSonnerAppart(idPlayer, coords)
end)

function verifSonnerAppart(idPlayer, coords)
    CreateThread(function()
        local keyPressed = false 
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then 
                TriggerServerEvent("fCore:agentImmo:AddInAppart", idPlayer, coords)
                cNotification("Vous avez fait rentrer la personne", "Action", "vert")
                keyPressed = true
            elseif IsControlJustPressed(1, 246) then 
                cNotification("~r~Vous n'avez pas fait rentrer la personne")
                keyPressed = true
            end
            Wait(0)
        end
    end)
end