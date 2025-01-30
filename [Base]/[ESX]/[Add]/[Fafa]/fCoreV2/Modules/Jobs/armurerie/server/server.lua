
ESX.RegisterServerCallback('Police:GetInventory', function(source, cb)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local items = xPlayer.getInventory()
    cb(items)
end)

RegisterNetEvent("Police:put_weapon")
AddEventHandler("Police:put_weapon", function(weaponName, label, job)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local grade = xPlayer.getJob().grade
    xPlayer.removeWeapon(name)
    MySQL.Async.insert("INSERT INTO weapon_society (job, label, name, grade) VALUES (@job, @label, @name, @grade)", {
        ["@job"] = job,
        ["@label"] = label,
        ["@name"] = weaponName,
        ["@grade"] = grade,
    })
end)

RegisterNetEvent("Police:TakeWeapon")
AddEventHandler("Police:TakeWeapon", function(name, label, jobName, id)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.addWeapon(name, ammo)
    MySQL.Async.execute("DELETE FROM weapon_society WHERE id = @id", {["@id"] = id})
    sNotification(src, (TranslationJob.Armurerie["YouJustGun"]):format(label))
end)

ESX.RegisterServerCallback("Police:GetWeaponInSociety", function(source, cb)
    local WeaponInSociety = {}
    MySQL.Async.fetchAll("SELECT * FROM weapon_society", function(result)
        for k,v in pairs(result) do 
            table.insert(WeaponInSociety, {
                id = v.id,
                job = v.job,
                count = v.count,
                label = v.label,
                name = v.name,
                grade = v.grade,
            })
        end
        cb(WeaponInSociety)
    end)
end)


