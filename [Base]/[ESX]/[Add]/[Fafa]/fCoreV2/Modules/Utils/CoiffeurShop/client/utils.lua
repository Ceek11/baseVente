settingsList = {
    Hair = {maxList = 78, IndexChange = 1},
    Barbe = {maxList = 28, IndexChange = 1},
    Sourcil = {maxList = 33, IndexChange = 1},
    Maquillage = {maxList = 92, IndexChange = 1},
    Lipstick = {maxList = 9, IndexChange = 1},
    Blemishes = {maxList = 19, IndexChange = 1},
    Blush = {maxList = 32, IndexChange = 1},
    Complexion = {maxList = 11, IndexChange = 1},
    Lentile = {maxList = 31, IndexChange = 1},
}

listHair = {}
for i = 1, settingsList.Hair.maxList do 
    table.insert(listHair, i)
end

listLentile = {}
for i = 1, settingsList.Lentile.maxList do 
    table.insert(listLentile, i)
end

listBlush = {}
for i = 1, settingsList.Blush.maxList do 
    table.insert(listBlush, i)
end

listBarbe = {}
for i = 1, settingsList.Barbe.maxList do 
    table.insert(listBarbe, i)
end

listSourcil = {}
for i = 1, settingsList.Sourcil.maxList do 
    table.insert(listSourcil, i)
end

listMaquillage = {}
for i = 1, settingsList.Maquillage.maxList do 
    table.insert(listMaquillage, i)
end

listLipstick = {}
for i = 1, settingsList.Lipstick.maxList do 
    table.insert(listLipstick, i)
end

listBlemishes = {}
for i = 1, settingsList.Blemishes.maxList do 
    table.insert(listBlemishes, i)
end

listComplexion = {}
for i = 1, settingsList.Complexion.maxList do 
    table.insert(listComplexion, i)
end



-- function updateRotationPlayer(heading)
--     while isMenuVehicleOpened do
--         if IsControlPressed(1, 174) then 
--             heading = heading - 0.70
--             if heading < 0 then
--                 heading = 360
--             end
--         elseif IsControlPressed(1, 175) then 
--             heading = heading + 0.70
--             if heading > 360 then
--                 heading = 0
--             end
--         end
--         if DoesEntityExist(vehicule) then SetEntityHeading(vehicule, heading) end
--         Wait(0)
--     end
-- end
