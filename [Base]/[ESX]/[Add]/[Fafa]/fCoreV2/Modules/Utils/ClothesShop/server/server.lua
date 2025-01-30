RegisterServerEvent('zk:insertlunettes')
AddEventHandler('zk:insertlunettes', function(Type, name, lunettes,variation, Nom1, Nom2, price)

    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local getMoney = xPlayer.getAccount('money').money
    if getMoney >= price then 
        maskx = {[Nom1]=tonumber(lunettes), [Nom2]=tonumber(variation)} 
        MySQL.Async.execute('INSERT INTO zk_clothe (identifier, type, nom, clothe) VALUES (@identifier, @type, @nom, @clothe)', {['@identifier']   = xPlayer.identifier,['@type']   = Type, ['@nom']   = name, ['@clothe'] = json.encode(maskx)})
        sNotification(_src, ("Vous venez d'acheter %s"):format(name), "Action", "vert")
        xPlayer.removeAccountMoney('money', price)
    else
        sNotification(_src, "Vous n'avez pas assez d'argent")
    end
end) 

RegisterServerEvent('zk:inserttenue')
AddEventHandler('zk:inserttenue', function(type, name, clothe)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end 
    local query = 'INSERT INTO zk_clothe (identifier, type, nom, clothe) VALUES (@identifier, @type, @nom, @clothe)'
    local param =  {['@identifier'] = xPlayer.identifier, ['@type'] = type, ['@nom'] = name, ['@clothe'] = json.encode(clothe)}
    MySQL.Async.execute(query,param)
end) 

ESX.RegisterServerCallback('zk:getzedkovermask', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local masque = {}
	MySQL.Async.fetchAll('SELECT * FROM zk_clothe WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier,
	}, function(result) 
		for i = 1, #result, 1 do  
			table.insert(masque, {      
                type      = result[i].type, 
				clothe      = result[i].clothe,
				id      = result[i].id,
				nom      = result[i].nom,
			})
		end  
		cb(masque) 
	end)  
end)    