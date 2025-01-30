
local openClothesShop = false 
menuCreateOuftifClothesShop = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuCreateOuftifClothesShop = RageUI.CreateSubMenu(menuCreateOuftifClothesShop, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuCreateOuftifClothesShop.Closed = function()
    openClothesShop = false 
    if currentSkin ~= nil then
        TriggerEvent("skinchanger:loadSkin", currentSkin)
    end 
    currentSkin = nil
end

local currentSkin = nil
skinSelectedIndexName = nil
local IndexChanges = {}
local slidemax = 0
local IndexChange = 1

local variation = {
    bags_1 = {model = "texture", var = 5},
    mask_1 = {model = "texture", var = 1},
    torso_1 =  {model = "texture", var = 11},
    tshirt_1 = {model = "texture", var = 8},
    pants_1 = {model = "texture", var = 4},
    shoes_1 = {model = "texture", var = 6},
    decals_1 = {model = "Prop", var = 1},
    arms = {model = "Prop", var = 10},
    chain_1 = {model = "Prop", var = 1},
    ears_2 = {model = "Prop", var = 1},
    helmet_1 = {model = "Prop", var = 0},
    glasses_1 = {model = "Prop", var = 1},
    watches_1 = {model = "Prop", var = 1}
}

local blacklist = {
    tshirt_1 = {},
    torso_1 = {},
    bags_1 = {},
    mask_1 = {},
    torso_1 =  {},
    pants_1 = {},
    shoes_1 = {},
    decals_1 = {},
    arms = {},
    chain_1 = {},
    ears_2 = {},
    helmet_1 = {20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71},
    glasses_1 = {},
    watches_1 = {}
}

local price = {
    tshirt_1 = {35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35},
    bags_1 = {35},
    mask_1 = {35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35},
    torso_1 =  {35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35},
    pants_1 = {35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35},
    shoes_1 = {35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35},
    decals_1 = {35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35},
    arms = {35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,},
    chain_1 = {35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35},
    ears_2 = {},
    helmet_1 = {35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35},
    glasses_1 = {35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35},
    watches_1 = {35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35}
}

function openMenuClothesShop(mask)
    if openClothesShop then 
        openClothesShop = false 
        RageUI.Visible(menuCreateOuftifClothesShop, false)
        return
    else
        openClothesShop = true 
        RageUI.Visible(menuCreateOuftifClothesShop, true)
        RefreshSkinValuesClothesShop()
        TriggerEvent("skinchanger:getSkin", function(skin) currentSkin = skin end)    
        CreateThread(function()
            while openClothesShop do 
                RageUI.IsVisible(menuCreateOuftifClothesShop, function()
                    RageUI.Separator(TranslationUtils.ClotheShop["MainTitle"])
                    RageUI.Line("color", 19, 107, 190)
                    for _, v in pairs(clothesShop.skinComponents) do 
                        if HasValueCompenentsClothesShop(v.name) or v.name == "arms" then 
                            local blacklistedIndices = blacklist[v.name] or {}
                            local totalIndices = clothesShop.skinValues[v.name]
                            local validIndices = totalIndices - #blacklistedIndices
                            if v.name == "mask_1" and mask then 
                                RageUI.Button(v.label, nil, {RightLabel = validIndices}, true, {
                                    onSelected = function()
                                        label = v.label
                                        skinSelectedIndexName = v.name
                                        name2 = string.gsub(v.name, "1", "2")
                                    end
                                }, subMenuCreateOuftifClothesShop)
                            elseif v.name ~= "mask_1" and not mask then 
                                RageUI.Button(v.label, nil, {RightLabel = validIndices}, true, {
                                    onSelected = function()
                                        label = v.label
                                        skinSelectedIndexName = v.name
                                        name2 = string.gsub(v.name, "1", "2")
                                    end
                                }, subMenuCreateOuftifClothesShop)
                            end
                        end
                    end
                end)
                
                RageUI.IsVisible(subMenuCreateOuftifClothesShop, function()
                    RageUI.Separator((TranslationUtils.ClotheShop["CategoryTitle"]):format(label))
                    RageUI.Line("color", 19, 107, 190)
                    if skinSelectedIndexName ~= nil and clothesShop.skinValues[skinSelectedIndexName] ~= nil then
                        local validIndices = {} 
                        for i=1, clothesShop.skinValues[skinSelectedIndexName] do
                            local isBlacklisted = false 
                            if blacklist[skinSelectedIndexName] ~= nil then
                                for _, blacklistedIndex in pairs(blacklist[skinSelectedIndexName]) do
                                    if i == blacklistedIndex then
                                        isBlacklisted = true
                                        break
                                    end
                                end
                            end
                            if not isBlacklisted then
                                table.insert(validIndices, i)
                                if IndexChanges[i] == nil then
                                    IndexChanges[i] = 0 
                                end
                                for k,v in pairs(variation) do 
                                    if skinSelectedIndexName == k then
                                        if v.model == "texture" then 
                                            slidemax = GetNumberOfPedTextureVariations(PlayerPedId(), v.var, i)-1
                                        else 
                                            slidemax = GetNumberOfPedPropTextureVariations(PlayerPedId(), v.var, i)-1
                                        end
                                    end
                                end
                                local items = {"0"}
                                if slidemax > 0 then 
                                    for j=1, slidemax do 
                                        table.insert(items, j)
                                    end
                                end
                                if price[skinSelectedIndexName][i] then 
                                    nameClothes = label.." n°"..i - #blacklist[skinSelectedIndexName]
                                    RageUI.List((TranslationUtils.ClotheShop["ClothingItem"]):format(nameClothes, price[skinSelectedIndexName][i]), items, IndexChanges[i]+1, "Appuyer sur ~r~ENTER~s~ pour acheter se vêtement", {}, true, {
                                        onListChange = function(Index, Items)
                                            IndexChanges[i] = Index - 1
                                            TriggerEvent("skinchanger:change", name2, IndexChanges[i])
                                        end,
                                        onActive = function()
                                            if currentIndex ~= i then
                                                TriggerEvent("skinchanger:change", skinSelectedIndexName, i)
                                                currentIndex = i
                                            end
                                        end,
                                        onSelected = function()
                                            TriggerEvent('skinchanger:getSkin', function(skin)
                                                save()
                                                TriggerServerEvent("zk:insertlunettes", "clothes"..skinSelectedIndexName, nameClothes, i, IndexChanges[i], skinSelectedIndexName, name2, price[skinSelectedIndexName][i]) 
                                            end)
                                        end
                                    })                                    
                                end

                            end
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end


local openSaveOutfit = false 
menuSaveOutfit = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuSaveOutfit.Closed = function()
    openSaveOutfit = false 
end

function openMenuSaveOutif()
    if openSaveOutfit then  
        openSaveOutfit = false 
        RageUI.Visible(menuSaveOutfit, false)
        return
    else
        openSaveOutfit = true 
        RageUI.Visible(menuSaveOutfit, true)
        CreateThread(function()
            while openSaveOutfit do 
                RageUI.IsVisible(menuSaveOutfit, function()
                    RageUI.Separator(TranslationUtils.ClotheShop["SaveOutfit"])
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Sauvegarder ma tenue", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            savetenue()
                        end
                    })
                end)                
                Wait(0)
            end
        end)
    end
end


local blacklistModder = {
    tshirt_1 = {},
    torso_1 = {},
    bags_1 = {},
    mask_1 = {},
    torso_1 =  {},
    pants_1 = {},
    shoes_1 = {},
    decals_1 = {},
    arms = {},
    chain_1 = {},
    ears_2 = {},
    helmet_1 = {},
    glasses_1 = {},
    watches_1 = {}
}

local priceModder = {
    tshirt_1 = {},
    bags_1 = {},
    torso_1 =  {},
    pants_1 = {},
    shoes_1 = {},
    decals_1 = {},
    arms = {},
    chain_1 = {},
    ears_2 = {},
    helmet_1 = {},
    glasses_1 = {},
    watches_1 = {},
}


local openClothesShopModder = false 
menuCreateOuftifClothesShopModder = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuCreateOuftifClothesShopModder = RageUI.CreateSubMenu(menuCreateOuftifClothesShopModder, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuCreateOuftifClothesShopModder.Closed = function()
    openClothesShopModder = false 
    if currentSkin ~= nil then
        TriggerEvent("skinchanger:loadSkin", currentSkin)
    end 
    currentSkin = nil
end

function openMenuClothesShopModder(mask)
    if openClothesShopModder then 
        openClothesShopModder = false 
        RageUI.Visible(menuCreateOuftifClothesShopModder, false)
        return
    else
        openClothesShopModder = true 
        RageUI.Visible(menuCreateOuftifClothesShopModder, true)
        RefreshSkinValuesClothesShop()
        TriggerEvent("skinchanger:getSkin", function(skin) currentSkin = skin end)    
        CreateThread(function()
            while openClothesShopModder do 
                RageUI.IsVisible(menuCreateOuftifClothesShopModder, function()
                    RageUI.Separator(TranslationUtils.ClotheShop["MainTitle"])
                    RageUI.Line("color", 19, 107, 190)
                    for _, v in pairs(clothesShop.skinComponents) do 
                        if HasValueCompenentsClothesShop(v.name) or v.name == "arms" then 
                            local blacklistedIndices = blacklistModder[v.name] or {}
                            local totalIndices = clothesShop.skinValues[v.name]
                            local validIndices = totalIndices - #blacklistedIndices
                            if v.name == "mask_1" and mask then 
                                RageUI.Button(v.label, nil, {RightLabel = validIndices}, true, {
                                    onSelected = function()
                                        label = v.label
                                        skinSelectedIndexName = v.name
                                        name2 = string.gsub(v.name, "1", "2")
                                    end
                                }, subMenuCreateOuftifClothesShopModder)
                            elseif v.name ~= "mask_1" and not mask then 
                                RageUI.Button(v.label, nil, {RightLabel = validIndices}, true, {
                                    onSelected = function()
                                        label = v.label
                                        skinSelectedIndexName = v.name
                                        name2 = string.gsub(v.name, "1", "2")
                                    end
                                }, subMenuCreateOuftifClothesShopModder)
                            end
                        end
                    end
                end)
                
                RageUI.IsVisible(subMenuCreateOuftifClothesShopModder, function()
                    RageUI.Separator((TranslationUtils.ClotheShop["CategoryTitle"]):format(label))
                    RageUI.Line("color", 19, 107, 190)
                    if skinSelectedIndexName ~= nil and clothesShop.skinValues[skinSelectedIndexName] ~= nil then
                        local validIndices = {} 
                        for i=1, clothesShop.skinValues[skinSelectedIndexName] do
                            local isBlacklisted = false 
                            if blacklistModder[skinSelectedIndexName] ~= nil then
                                for _, blacklistedIndex in pairs(blacklistModder[skinSelectedIndexName]) do
                                    if i == blacklistedIndex then
                                        isBlacklisted = true
                                        break
                                    end
                                end
                            end
                            if not isBlacklisted then
                                table.insert(validIndices, i)
                                if IndexChanges[i] == nil then
                                    IndexChanges[i] = 0 
                                end
                                for k,v in pairs(variation) do 
                                    if skinSelectedIndexName == k then
                                        if v.model == "texture" then 
                                            slidemax = GetNumberOfPedTextureVariations(PlayerPedId(), v.var, i)-1
                                        else 
                                            slidemax = GetNumberOfPedPropTextureVariations(PlayerPedId(), v.var, i)-1
                                        end
                                    end
                                end
                                local items = {"0"}
                                if slidemax > 0 then 
                                    for j=1, slidemax do 
                                        table.insert(items, j)
                                    end
                                end
                                if priceModder[skinSelectedIndexName][i] then 
                                    nameClothes = label.." n°"..i - #blacklistModder[skinSelectedIndexName]
                                    RageUI.List((TranslationUtils.ClotheShop["ClothingItem"]):format(nameClothes, priceModder[skinSelectedIndexName][i]), items, IndexChanges[i]+1, "Appuyer sur ~r~ENTER~s~ pour acheter se vêtement", {}, true, {
                                        onListChange = function(Index, Items)
                                            IndexChanges[i] = Index - 1
                                            TriggerEvent("skinchanger:change", name2, IndexChanges[i])
                                        end,
                                        onActive = function()
                                            if currentIndex ~= i then
                                                TriggerEvent("skinchanger:change", skinSelectedIndexName, i)
                                                currentIndex = i
                                            end
                                        end,
                                        onSelected = function()
                                            TriggerEvent('skinchanger:getSkin', function(skin)
                                                save()
                                                TriggerServerEvent("zk:insertlunettes", "clothes"..skinSelectedIndexName, nameClothes, i, IndexChanges[i], skinSelectedIndexName, name2, price[skinSelectedIndexName][i]) 
                                            end)
                                        end
                                    })                                    
                                end

                            end
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end
