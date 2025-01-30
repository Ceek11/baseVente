function findItem(arr, itemToFind)
	local foundIt = false
	local index = nil
	for i = 1, #arr, 1 do
		if arr[i] == itemToFind then
			foundIt = true
			index = i
			break
		end
	end
	if not foundIt then
		return foundIt
	else
		return index
	end
end

function findKey(obj, keyToFind)
	local foundIt = false
	local key = nil
	for k, v in pairs(obj) do
		if k == keyToFind then
			foundIt = true
			key = k
			break
		end
	end
	if not foundIt then
		return foundIt
	else
		return key
	end
end

function calcFinalPrice(shopCart, shopProfit)
	local totalCartValue = 0
	for k, v in pairs(shopCart) do
		totalCartValue = totalCartValue + v['price']
	end
	return totalCartValue
end

-- Prevent Free Tunning Bug
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if lsMenuIsShowed then
			DisableControlAction(2, 288, true)
			DisableControlAction(2, 289, true)
			DisableControlAction(2, 170, true)
			DisableControlAction(2, 167, true)
			DisableControlAction(2, 168, true)
			DisableControlAction(2, 23, true)
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('fpwn_customs:cantBill')
AddEventHandler('fpwn_customs:cantBill', function(amount, targetId)
	terminatePurchase()
end)

RegisterNetEvent('fpwn_customs:canBill')
AddEventHandler('fpwn_customs:canBill', function(amount, targetId)
	terminatePurchase()
end)

RegisterNetEvent('fpwn_customs:resetVehicle')
AddEventHandler('fpwn_customs:resetVehicle', function(vehProps)
	ClearVehicleCustomPrimaryColour(vehPedIsIn)
	ClearVehicleCustomSecondaryColour(vehPedIsIn)
	ESX.Game.SetVehicleProperties(vehPedIsIn, vehProps)
	terminatePurchase()
end)

RegisterNetEvent('fpwn_customs:getVehicle')
AddEventHandler('fpwn_customs:getVehicle', function()
	TriggerServerEvent('fpwn_customs:refreshOwnedVehicle', ESX.Game.GetVehicleProperties(vehPedIsIn))
end)

