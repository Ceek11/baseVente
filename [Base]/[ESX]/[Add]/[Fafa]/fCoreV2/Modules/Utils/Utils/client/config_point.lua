CreateThread(function()
    while true do 
        local interval = 1000
        local PlayerPos = GetEntityCoords(PlayerPedId())
        local posPharma = vector3(-1830.201660, -380.822266, 50.404186)
        local dist = #(posPharma-PlayerPos)
        if dist <= 5 then 
            interval = 0
            DrawName3D(posPharma.x, posPharma.y, posPharma.z, "Appuyer ~b~[E] ~s~pour ~g~parler ~s~au ~b~pharmacien", 255,255,255)
            if IsControlJustPressed(1, 51) then 
                openPharmacieMenu()
            end
        end

        local PosPoleEmploi = vector3(-268.7475, -956.5675, 32.22314)
        local dist = #(PosPoleEmploi-PlayerPos)
        if dist <= 5 then 
            interval = 0
            DrawName3D(PosPoleEmploi.x, PosPoleEmploi.y, PosPoleEmploi.z, "Appuyer ~b~[E] ~s~pour ~g~parler ~s~au ~s~conseillé du ~b~pôle emploi", 255,255,255)
            if IsControlJustPressed(1, 51) then 
                openMenuPoleEmploi()
            end
        end

        local PosBlanchisseur = vector3(1117.926, -3194.214, -40.39698)
        local dist = #(PosBlanchisseur-PlayerPos)
        if dist <= 5 then 
            interval = 0
            DrawName3D(PosBlanchisseur.x,PosBlanchisseur.y, PosBlanchisseur.z, "Appuyer ~b~[E] ~s~pour ~g~parler ~s~au ~b~blanchisseur d'argent", 255,255,255)
            if IsControlJustPressed(1, 51) then 
                openMenuBlanchisseur()
            end
        end

        Wait(interval)
    end
end)