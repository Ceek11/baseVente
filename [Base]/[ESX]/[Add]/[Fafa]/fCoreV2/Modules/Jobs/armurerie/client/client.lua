local OpenArmureriePolice = false 
MenuArmureriePolice = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
MenuRemoveWeaponPolice = RageUI.CreateSubMenu(MenuArmureriePolice," ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
MenuArmureriePolice.Closed = function()
    OpenArmureriePolice = false 
end

IndexList = 1
local items = {}
local Inventory = {}

function _PoliceOpenMenuArmurerie(valeur)
    table.insert(items, TranslationJob.Armurerie["AllWeapon"])
    for k, v in pairs(valeur.Weapon) do
        table.insert(items, v.label)
    end
    GetWeaponInSociety()
    if OpenArmureriePolice then 
        OpenArmureriePolice = false 
        RageUI.Visible(MenuArmureriePolice, false)
        return 
    else
        OpenArmureriePolice = true 
        RageUI.Visible(MenuArmureriePolice, true)
        CreateThread(function()
            while OpenArmureriePolice do 
                RageUI.IsVisible(MenuArmureriePolice, function()
                    RageUI.Separator(TranslationJob.Armurerie["weaponAvailable"])
                    RageUI.Button(TranslationJob.Armurerie["StoreWeapons"], nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('Police:GetInventory', function(items) 
                                Inventory = {}
                                Inventory = items
                            end)
                        end
                    }, MenuRemoveWeaponPolice)
                    RageUI.List(TranslationJob.Armurerie["SortWeapon"], items, IndexList, nil, {}, true, {
                        onListChange = function(Index, Item)
                            IndexList = Index
                        end
                    })
                    RageUI.Line()
                    for k,v in pairs(WeaponInSocietyInBdd) do 
                        if ESX.PlayerData.job.grade >= v.grade  then 
                            if items[IndexList] == v.label then 
                                RageUI.Button("- "..v.label, nil, {RightLabel = TranslationJob.Armurerie["ToRecover"]}, true, {
                                    onSelected = function()
                                        TriggerServerEvent("Police:TakeWeapon", v.name, v.label, v.job)
                                        SetTimeout(100,function()
                                            GetWeaponInSociety()
                                        end)
                                    end
                                })
                            elseif items[IndexList] == "Toute les armes" then 
                                RageUI.Button("- "..v.label, nil, {RightLabel = TranslationJob.Armurerie["ToRecover"]}, true, {
                                    onSelected = function()
                                        TriggerServerEvent("Police:TakeWeapon", v.name, v.label, v.job, v.id)
                                        SetTimeout(100,function()
                                            GetWeaponInSociety()
                                        end)
                                    end
                                })
                            end
                        end
                    end
                end)
                RageUI.IsVisible(MenuRemoveWeaponPolice, function()
                    for k,v in pairs(Inventory) do
                        if v.name:find("weapon_") then
                            if v.count > 0 then
                                RageUI.Button("[~b~x"..v.count.."~s~] - "..v.label, nil, {RightLabel = TranslationJob.Armurerie["Deposit"]}, true, {
                                    onSelected = function()
                                        TriggerServerEvent("Police:put_weapon", v.name, v.label, valeur.job)
                                        ESX.TriggerServerCallback('Police:GetInventory', function(items) 
                                            Inventory = {}
                                            Inventory = items
                                        end)
                                        SetTimeout(100,function()
                                            GetWeaponInSociety()
                                        end)
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