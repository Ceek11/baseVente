local Inventory = {}
local Coffre = {}

local openSaisie = false 
menuSaisie = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuSaisieDepo = RageUI.CreateSubMenu(menuSaisie, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuSaisieRetirer = RageUI.CreateSubMenu(menuSaisie, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)

menuSaisie.Closed = function()
    openSaisie = false 
end

function PoliceOpenMenuSaisie(valeur)
    _JobBuilder:GetInfoSalary()
    if openSaisie then 
        openSaisie = false 
        RageUI.Visible(menuSaisie, false)
        return
    else 
        openSaisie = true 
        RageUI.Visible(menuSaisie, true)
        CreateThread(function()
            while openSaisie do 
                RageUI.IsVisible(menuSaisie, function()
                    RageUI.Button("Déposer un object", nil, {}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('fCore:Saisie:GetInventory', function(items) 
                                Inventory = {}
                                Inventory = items
                            end)
                        end
                    }, menuSaisieDepo)
                    for _, grade in pairs(InfoSalaryInBdd) do
                        if grade.job_name == valeur.job and ESX.PlayerData.job.grade_name == grade.name and grade.saisie then
                            RageUI.Button("Prendre un object", nil, {}, true, {
                                onSelected = function()
                                    ESX.TriggerServerCallback('fCore:Boss:GetChestInventory', function(items) 
                                        Coffre = {}
                                        Coffre = items
                                    end, valeur.societyName)
                                end
                            }, menuSaisieRetirer)
                        end
                    end
                end)
                RageUI.IsVisible(menuSaisieRetirer, function()
                    for k,v in pairs(Coffre) do 
                        if v.count > 0 then
                            RageUI.Button(("[~b~x%s~s~] - %s"):format(v.count, v.label), nil, {}, true, {
                                onSelected = function()
                                    local QuantityTake = Visual.KeyboardNumber("Choisie un chiffre", "", 5)
                                    if type(QuantityTake) == "number" then
                                        TriggerServerEvent("fCore:Saisie:TakeObject", valeur.societyName, QuantityTake, v.name, v.label)
                                        ESX.TriggerServerCallback('fCore:Saisie:GetChestInventory', function(items) 
                                            Coffre = {}
                                            Coffre = items
                                        end, valeur.societyName)
                                    else
                                        cNotification("Chiffre invalide")
                                    end
                                end
                            })
                        end
                    end
                end)

                RageUI.IsVisible(menuSaisieDepo, function()
                    for k,v in pairs(Inventory) do
                        if v.count > 0 then
                            RageUI.Button("[~b~x"..v.count.."~s~] - "..v.label, nil, {}, true, {
                                onSelected = function()
                                    if v.name ~= "bracelet_electronique" then 
                                        local QuantityDepo = Visual.KeyboardNumber("Choisie un chiffre", "", 5) 
                                        if type(QuantityDepo) == "number" then
                                            TriggerServerEvent("fCore:Saisie:InventoryDepo", valeur.societyName, QuantityDepo, v.name, v.label)
                                            ESX.TriggerServerCallback('fCore:Saisie:GetInventory', function(items) 
                                                Inventory = {}
                                                Inventory = items
                                            end)
                                        else 
                                            cNotification("Chiffre invalide")
                                        end
                                    else
                                        cNotification("Vous ne pouvez pas poser cette objet")
                                    end
                                end
                            })
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end