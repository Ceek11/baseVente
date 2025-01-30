function applySkinSpecific(infos)
	TriggerEvent('skinchanger:getSkin', function(skin)
		local uniformObject
		if skin.sex == 0 then
			uniformObject = infos.variations.male
		else
			uniformObject = infos.variations.female
		end
		if uniformObject then
			TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
		end
		infos.onEquip()
	end)
end

local openTenueGav = false
menuTenueGav = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuTenueGav.Closed = function()
    openTenueGav = false
end

function openMenuTenueGav(valeur)
    if openTenueGav then 
        openTenueGav = false 
        RageUI.Visible(menuTenueGav, false)
        return
    else
        openTenueGav = true
        RageUI.Visible(menuTenueGav, true)
        CreateThread(function()
            while openTenueGav do 
                RageUI.IsVisible(menuTenueGav, function()
                    for _, infos in pairs(valeur.Tenue.civil) do
                        RageUI.Button(infos.label, (TranslationJob.tenueGav["Equipement"]):format(infos.label), {RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                applySkinSpecific(infos)
                            end
                        })
                    end
                    RageUI.Line("color", 249, 142, 39)     
                    RageUI.Separator(TranslationJob.tenueGav["clothe"])   
                    for _,infos in pairs(valeur.Tenue.Gav) do
                        RageUI.Button(infos.label, (TranslationJob.tenueGav["Equipement"]):format(infos.label), {RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                applySkinSpecific(infos)
                            end
                        })
                    end   
                end)
                Wait(0)
            end
        end)
    end
end



