
ESX.RegisterServerCallback('SmallTattoos:GetPlayerTattoos', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		MySQL.Async.fetchAll('SELECT tattoos FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			if result[1].tattoos then
				cb(json.decode(result[1].tattoos))
			else
				cb()
			end
		end)
	else
		cb()
	end
end)

ESX.RegisterServerCallback('SmallTattoos:PurchaseTattoo', function(source, cb, tattooList, price, tattoo, tattooName)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return end 
	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		table.insert(tattooList, tattoo)

		MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
			['@tattoos'] = json.encode(tattooList),
			['@identifier'] = xPlayer.identifier
		})

		TriggerClientEvent('esx:showNotification', source, "Vous avez acheté le ~y~" .. tattooName .. "~s~ tattoo pour ~g~$" .. price, "Action", "vert")
		cb(true)
	else
		TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d'argent pour le tattoage")
		cb(false)
	end
end)

RegisterServerEvent('SmallTattoos:RemoveTattoo')
AddEventHandler('SmallTattoos:RemoveTattoo', function (tattooList)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return end 
	MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
		['@tattoos'] = json.encode(tattooList),
		['@identifier'] = xPlayer.identifier
	})
end)