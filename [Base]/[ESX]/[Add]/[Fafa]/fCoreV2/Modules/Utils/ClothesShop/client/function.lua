function RefreshSkinValuesClothesShop()
    clothesShop.skinComponents = {}
    clothesShop.skinValues = {}
    TriggerEvent("skinchanger:getData", function(components, values)
        clothesShop.skinComponents = components
        clothesShop.skinValues = values
    end)
end

function HasValueCompenentsClothesShop(value)
    for k,v in pairs(clothesShop.componentsList) do
        if value == v then
            return true
        end
    end
    return false
end

function save()
	TriggerEvent('skinchanger:getSkin', function(skin)
		TriggerServerEvent('esx_skin:save', skin)
	end)
end

function savetenue()
	TriggerEvent('skinchanger:getSkin', function(skin)
		local math = math.random(1, 9200)
		TriggerServerEvent("zk:inserttenue", "clothestenue", "Tenue N°"..math.."", skin) 
		cNotification('Vous avez acheter votre tenue [~y~'..math..'~s~] ', "Action", "vert")
	end)
end