local Inventory = {}
local Coffre = {}
local OpenCoffreBoss = false 
MenuCoffreBoss = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
MenuDeposerCoffreBoss = RageUI.CreateSubMenu(MenuCoffreBoss,  " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
MenuRetirerCoffreBoss = RageUI.CreateSubMenu(MenuCoffreBoss, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
MenuCoffreBoss.Closed = function()
    OpenCoffreBoss = false
end

function openMenuCoffre(valeur, coffre)
    if OpenCoffreBoss then
        OpenCoffreBoss = false 
        RageUI.Visible(MenuCoffreBoss, false)
        return 
    else
        OpenCoffreBoss = true 
        RageUI.Visible(MenuCoffreBoss, true)
        CreateThread(function()
            while OpenCoffreBoss do 
                FreezeEntityPosition(PlayerPedId(), true)
                DisableControlAction(1, 51, true)
                RageUI.IsVisible(MenuCoffreBoss, function()
                    RageUI.Separator(TranslationJob.AllJob["separator_name_society"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button(TranslationJob.AllJob["button_deposit_object"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('fCore:Boss:GetInventory', function(items) 
                                Inventory = {}
                                Inventory = items
                            end)
                        end
                    }, MenuDeposerCoffreBoss)
                    RageUI.Button(TranslationJob.AllJob["button_remove_object"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('fCore:Boss:GetChestInventory', function(items) 
                                Coffre = {}
                                Coffre = items
                            end, valeur.societyName)
                        end
                    }, MenuRetirerCoffreBoss)
                end)
                RageUI.IsVisible(MenuDeposerCoffreBoss, function()
                    for k,v in pairs(Inventory) do
                        if v.count > 0 then
                            RageUI.Button("[~b~x"..v.count.."~s~] - "..v.label, nil, {}, true, {
                                onSelected = function()
                                    if v.name ~= "bracelet_electronique" then 
                                        local QuantityDepo = Visual.KeyboardNumber(TranslationJob.AllJob["choose_number"], "", 5) 
                                        if type(QuantityDepo) == "number" then
                                            TriggerServerEvent("fCore:Boss:InventoryDepo", valeur.societyName, QuantityDepo, v.name, v.label, valeur.Webhooks)
                                            ESX.TriggerServerCallback('fCore:Boss:GetInventory', function(items) 
                                                Inventory = {}
                                                Inventory = items
                                            end)
                                        else 
                                            cNotification(TranslationJob.AllJob["Cnotif_enter_number"], "Action", "rouge")
                                        end
                                    else
                                        cNotification("Vous ne pouvais pas ranger cette objet")
                                    end
                                end
                            })
                        end
                    end
                end)
                RageUI.IsVisible(MenuRetirerCoffreBoss, function()
                    for k,v in pairs(Coffre) do 
                        if v.count > 0 then
                            RageUI.Button(("[~b~x%s~s~] - %s"):format(v.count, v.label), nil, {}, true, {
                                onSelected = function()
                                    local QuantityTake = Visual.KeyboardNumber(TranslationJob.AllJob["choose_number"], "", 5)
                                    if type(QuantityTake) == "number" then
                                        TriggerServerEvent("fCore:Boss:TakeObject", valeur.societyName, QuantityTake, v.name, v.label, valeur.Webhooks)
                                        ESX.TriggerServerCallback('fCore:Boss:GetChestInventory', function(items) 
                                            Coffre = {}
                                            Coffre = items
                                        end, valeur.societyName)
                                    else
                                        cNotification(TranslationJob.AllJob["Cnotif_enter_number"], "Action", "rouge")
                                    end
                                end
                            })
                        end
                    end
                end)
            Wait(0)
            FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end