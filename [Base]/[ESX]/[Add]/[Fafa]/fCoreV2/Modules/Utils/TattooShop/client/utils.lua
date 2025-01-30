currentTattoos = {}
local opacity = 1

function GetNaked()
	TriggerEvent('skinchanger:getSkin', function()
		if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 0,
				tshirt_1 = 15,
				tshirt_2 = 0,
				arms     = 15,
				torso_1  = 91,
				torso_2  = 0,
				pants_1  = 14,
				pants_2  = 0,
				shoes_1 = 5,
				glasses_1 = 0
			})
		else
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 1,
				tshirt_1 = 34,
				tshirt_2 = 0,
				arms     = 15,
				torso_1  = 101,
				torso_2  = 1,
				pants_1  = 16,
				pants_2  = 0,
				shoes_1 = 5,
				glasses_1 = 5
			})
		end
	end)
end

function ResetSkin()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
	ClearPedDecorations(PlayerPedId())
	for k, v in pairs(currentTattoos) do
		if v.Count ~= nil then
			for i = 1, v.Count do
				SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
			end
		else
			SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
		end
	end
end

function DrawTattoo(collection, name)
	ClearPedDecorations(PlayerPedId())
	for k, v in pairs(currentTattoos) do
		if v.Count ~= nil then
			for i = 1, v.Count do
				SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
			end
		else
			SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
		end
	end
	for i = 1, opacity do
		SetPedDecoration(PlayerPedId(), collection, name)
	end
end

function BuyTattoo(collection, name, label, price)
	ESX.TriggerServerCallback('SmallTattoos:PurchaseTattoo', function(success)
		if success then
			table.insert(currentTattoos, {collection = collection, nameHash = name, Count = opacity})
		end
	end, currentTattoos, price, {collection = collection, nameHash = name, Count = opacity}, GetLabelText(label))
end

AddEventHandler('skinchanger:modelLoaded', function()
	ESX.TriggerServerCallback('SmallTattoos:GetPlayerTattoos', function(tattooList)
		if tattooList then
			ClearPedDecorations(PlayerPedId())
			for k, v in pairs(tattooList) do
				if v.Count ~= nil then
					for i = 1, v.Count do
						SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
					end
				else
					SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
				end
			end
			currentTattoos = tattooList
		end
	end)
end)


Citizen.CreateThread(function()
	while true do
        ESX.TriggerServerCallback('SmallTattoos:GetPlayerTattoos', function(tattooList)
            if tattooList then
                ClearPedDecorations(PlayerPedId())
                for k, v in pairs(tattooList) do
                    if v.Count ~= nil then
                        for i = 1, v.Count do
                            SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
                        end
                    else
                        SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
                    end
                end
                currentTattoos = tattooList
            end
        end)
        Wait(360000)
	end
end)


function GetPlayerTattoos()
    PlayerTattoos = {}
    loadTattoo = false
    ESX.TriggerServerCallback('SmallTattoos:GetPlayerTattoos', function(tattooList)
        for k,v in pairs(tattooList) do 
            table.insert(PlayerTattoos, v)
        end
        loadTattoo = true
    end)
end

function RemoveTattoo(name, label)
	for k, v in pairs(currentTattoos) do
        print(v.nameHash)
		if v.nameHash == name then
			table.remove(currentTattoos, k)
		end
	end
	TriggerServerEvent("SmallTattoos:RemoveTattoo", currentTattoos)
	cNotification("Vous avez retirer ~y~" .. GetLabelText(label) .. "~s~ tattoo", "Action", "vert")
end