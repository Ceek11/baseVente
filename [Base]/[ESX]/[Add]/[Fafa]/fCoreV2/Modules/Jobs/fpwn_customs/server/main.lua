ESX = exports["es_extended"]:getSharedObject()
local Vehicles

local VehiclesInShop = {}


RegisterServerEvent('fpwn_customs:refreshOwnedVehicle')
AddEventHandler('fpwn_customs:refreshOwnedVehicle', function(vehicleProps)
	local query = 'SELECT vehicle FROM owned_vehicles WHERE plate = @plate'
	local param = {['@plate'] = vehicleProps.plate}
	MySQL.Async.fetchAll(query, param, function(result)
		if result[1] then
			local vehicle = json.decode(result[1].vehicle)

			if vehicleProps.model == vehicle.model then
				local query = 'UPDATE owned_vehicles SET vehicle = @vehicle WHERE plate = @plate'
				local param = { ['@plate'] = vehicleProps.plate, ['@vehicle'] = json.encode(vehicleProps)}
				MySQL.Async.execute(query, param)
			end
		end
	end)
end)

ESX.RegisterServerCallback('fpwn_customs:getVehiclesPrices', function(source, cb)
	if not Vehicles then
		local query = 'SELECT * FROM vehicles'
		MySQL.Async.fetchAll(query, function(result)
			local vehicles = {}

			for i=1, #result, 1 do
				table.insert(vehicles, {
					model = result[i].model,
					price = result[i].price
				})
			end

			Vehicles = vehicles
			cb(Vehicles)
		end)
	else
		cb(Vehicles)
	end
end)

RegisterServerEvent('fpwn_customs:checkVehicle')
AddEventHandler('fpwn_customs:checkVehicle', function(plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return end 
	for k, v in pairs(VehiclesInShop) do 
		if v.plate == plate and _source ~= k then
			TriggerClientEvent('fpwn_customs:resetVehicle', source, v)
			VehiclesInShop[xPlayer.identifier] = nil
			break
		end
	end
end)

RegisterServerEvent('fpwn_customs:saveVehicle')
AddEventHandler('fpwn_customs:saveVehicle', function(oldVehProps)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return end 
	if oldVehProps then
		VehiclesInShop[xPlayer.identifier] = oldVehProps
	end
end)


RegisterServerEvent('fCore:Custom:giveBilling')
AddEventHandler('fCore:Custom:giveBilling', function(society, newVehProps, shopCart, targetT)
    local _src = source
    local price = calcFinalPrice(shopCart)
    TriggerClientEvent("fCore:Custom:giveInfoPaiment", targetT, targetT, society, newVehProps, price, _src)
end)

RegisterServerEvent('fCore:Custom:finishPurchase')
AddEventHandler('fCore:Custom:finishPurchase', function(_src, targetT, society, newVehProps, price)
    local target = source
    local xPlayer = ESX.GetPlayerFromId(_src)
	if not xPlayer then return end 
	local xTarget = ESX.GetPlayerFromId(target)
	local isFinished = false
	if price <= 0 then
		TriggerClientEvent('fpwn_customs:cantBill', target)
		TriggerClientEvent('fpwn_customs:resetVehicle', target, VehiclesInShop[xPlayer.identifier])
		VehiclesInShop[xPlayer.identifier] = nil
		return
	end
    
    if price <= xTarget.getMoney() then
        TriggerClientEvent('esx:showNotification', targetT, "vert", "Action", "Vous avez payer"..price.."$")
        TriggerClientEvent('esx:showNotification', _src, "vert", "Action", ("Vous avez reçu %s$ <br>L'entreprise à reçu %s <br>Le fournisseur à reçu %s"):format(math.round(price*0.25), math.round(price*0.45), math.round(price*0.30)))
        xTarget.removeMoney(price)
        xPlayer.addAccountMoney('money', price*0.25)
        TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
            account.addMoney(price*0.45)
        end)

        TriggerEvent('fpwn_customs:refreshOwnedVehicle', newVehProps)
        isFinished = true
    else
        TriggerClientEvent('esx:showNotification', targetT, "vert", "Action", "Vous n'avez pas payer")
        isFinished = false
    end
	if not isFinished then
		TriggerClientEvent('fpwn_customs:cantBill', target)
		TriggerClientEvent('fpwn_customs:resetVehicle', target, VehiclesInShop[xPlayer.identifier])
	end

	if VehiclesInShop[xPlayer.identifier] then VehiclesInShop[xPlayer.identifier] = nil end
end)
