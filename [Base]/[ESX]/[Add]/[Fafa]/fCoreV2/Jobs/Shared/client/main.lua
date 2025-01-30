

CreateThread(function()
    Wait(1000)
    MarkerJob()
end)

function MarkerJob()
    CreateThread(function()
        _JobBuilder:GetInfoSalary()
        while true do 
            local interval = 1500
            local posPlayer = GetEntityCoords(PlayerPedId())
            local job = ESX.PlayerData.job
            for k, v in pairs(Patron) do 
                if job and job.name == v.jobName then 
                    InService = InServiceJob
                end
                if job and job.name == v.jobName and job.grade_name == v.gradeBoss then 
                    for _, Boss in pairs(v.Boss) do
                        local dest = Boss.point
                        local dist = #(posPlayer - dest)
                        if dist <= Boss.maxMarker then 
                            interval = 0
                            DrawMarker(Boss.markerType, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, Boss.rotX, Boss.rotY, Boss.rotX, Boss.sizeX, Boss.sizeY, Boss.sizeZ, Boss.r, Boss.g, Boss.b, Boss.a, false, false, 2, false, false, false, false)
                            if dist <= Boss.max3D then 
                                DrawName3D(dest.x, dest.y, dest.z + 1, Boss.text, 255, 255, 255)
                                if IsControlJustPressed(1, 51) then 
                                    openMenuBoss(v, Boss)
                                end
                            end
                        end
                    end
                end
                for _, Coffre in pairs(v.Coffre) do
                    local dest = Coffre.point
                    local dist = #(posPlayer - dest)
                    for _, grade in pairs(InfoSalaryInBdd) do
                        if job and job.name == v.jobName then 
                            if grade.job_name == v.jobName and job.grade_name == grade.name and grade.coffre and InService == true then
                                if dist <= Coffre.maxMarker then 
                                    interval = 0
                                    DrawMarker(Coffre.markerType, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, Coffre.rotX, Coffre.rotY, Coffre.rotX, Coffre.sizeX, Coffre.sizeY, Coffre.sizeZ, Coffre.r, Coffre.g, Coffre.b, Coffre.a, false, false, 2, false, false, false, false)
                                    if dist <= Coffre.max3D then 
                                        DrawName3D(dest.x, dest.y, dest.z + 1, Coffre.text, 255, 255, 255)
                                        if IsControlJustPressed(1, 51) then 
                                            openMenuCoffre(v, Coffre)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                for _, Garage in pairs(v.Garage) do
                    local dest = Garage.point
                    local dist = #(posPlayer - dest)
                    for _, grade in pairs(InfoSalaryInBdd) do
                        if job and job.name == v.jobName then 
                            if grade.job_name == v.jobName and job.grade_name == grade.name and grade.garage and InService == true then
                                if dist <= Garage.maxMarker then 
                                    interval = 0
                                    DrawMarker(Garage.markerType, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, Garage.rotX, Garage.rotY, Garage.rotX, Garage.sizeX, Garage.sizeY, Garage.sizeZ, Garage.r, Garage.g, Garage.b, Garage.a, false, true, 2, false, false, false, false)
                                    if dist <= Garage.max3D then 
                                        DrawName3D(dest.x, dest.y, dest.z + 1, Garage.text, 255, 255, 255)
                                        if IsControlJustPressed(1, 51) then 
                                            _BossMainOpenGarage(v, Garage)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                for _, DeleteVehi in pairs(v.DeleteVehi) do
                    local dest = DeleteVehi.point
                    local dist = #(posPlayer - dest)
                    for _, grade in pairs(InfoSalaryInBdd) do
                        if job and job.name == v.jobName then 
                            if grade.job_name == v.jobName and job.grade_name == grade.name and grade.garage and InService == true then
                                if dist <= DeleteVehi.maxMarker then 
                                    if IsPedInVehicle(PlayerPedId(), vehi, true) then
                                    interval = 0
                                    DrawMarker(DeleteVehi.markerType, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, DeleteVehi.rotX, DeleteVehi.rotY, DeleteVehi.rotX, DeleteVehi.sizeX, DeleteVehi.sizeY, DeleteVehi.sizeZ, DeleteVehi.r, DeleteVehi.g, DeleteVehi.b, DeleteVehi.a, false, false, 2, false, false, false, false)
                                        if dist <= DeleteVehi.max3D then 
                                            DrawName3D(dest.x, dest.y, dest.z + 1, DeleteVehi.text, 255, 255, 255)
                                            if IsControlJustPressed(1, 51) then 
                                                local plate = GetVehicleNumberPlateText(vehi)
                                                local custom = ESX.Game.GetVehicleProperties(vehi)
                                                TriggerServerEvent("fCore:Boss:enterVehicleInGarage", plate, custom)
                                                DoScreenFadeOut(1000)
                                                Wait(1000)
                                                TriggerServerEvent("fCore:Keys:RemoveKeysJob", plate)
                                                ESX.Game.DeleteVehicle(vehi)
                                                DoScreenFadeIn(1000)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                for _, fisc in pairs(Tablefisc) do
                    local dest = fisc.point
                    local dist = #(posPlayer - dest)
                    for _, grade in pairs(InfoSalaryInBdd) do
                        if job and job.name == v.jobName then 
                            if grade.job_name == v.jobName and job.grade_name == grade.name and grade.fisc and InService == true then
                                if dist <= fisc.maxMarker then 
                                    interval = 0
                                    DrawMarker(fisc.markerType, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, fisc.rotX, fisc.rotY, fisc.rotX, fisc.sizeX, fisc.sizeY, fisc.sizeZ, fisc.r, fisc.g, fisc.b, fisc.a, false, false, 2, false, false, false, false)
                                    if dist <= fisc.max3D then 
                                        DrawName3D(dest.x, dest.y, dest.z + 1, fisc.text, 255, 255, 255)
                                        if IsControlJustPressed(1, 51) then 
                                            openMenuFisc()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                for _, Vestiaire in pairs(v.Vestiaire) do
                    local dest = Vestiaire.point
                    local dist = #(posPlayer - dest)
                    for _, grade in pairs(InfoSalaryInBdd) do
                        if grade.job_name == v.jobName and job.grade_name == grade.name then
                            if dist <= Vestiaire.maxMarker then 
                                if job and job.name == v.jobName then 
                                    interval = 0
                                    DrawMarker(Vestiaire.markerType, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, Vestiaire.rotX, Vestiaire.rotY, Vestiaire.rotX, Vestiaire.sizeX, Vestiaire.sizeY, Vestiaire.sizeZ, Vestiaire.r, Vestiaire.g, Vestiaire.b, Vestiaire.a, false, false, 2, false, false, false, false)
                                    if dist <= Vestiaire.max3D then 
                                        DrawName3D(dest.x, dest.y, dest.z + 1, Vestiaire.text, 255, 255, 255)
                                        if IsControlJustPressed(1, 51) then 
                                            _BossOpenMenu(v, Vestiaire)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            for k, v in pairs(VenteWeapon) do
                local dest = v.point
                local dist = #(dest-posPlayer) 
                if ESX.PlayerData.job and ESX.PlayerData.job.name == v.job and InService == true then 
                    if dist <= v.distMarker then 
                        interval = 0
                        DrawMarker(v.markerType, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, v.rotX, v.rotY, v.rotZ, v.sizeX, v.sizeY, v.sizeZ, v.r, v.g, v.b, v.a, false, false, 2, false, false, false, false)
                        if dist <= v.dist3D then 
                            DrawName3D(dest.x, dest.y, dest.z, v.text, 255,255,255)
                            if IsControlJustPressed(1, 51) then 
                                openMenuVenteDarme(v)
                            end
                        end
                    end
                end
            end
            for _, VenteConcess in pairs(Concess.Vente) do
                local dest = VenteConcess.point
                local dist = #(posPlayer - dest)
                if ESX.PlayerData.job and ESX.PlayerData.job.name == VenteConcess.jobName and InService == true then 
                    if dist <= VenteConcess.maxMarker then 
                        interval = 0
                        DrawMarker(VenteConcess.markerType, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, VenteConcess.rotX, VenteConcess.rotY, VenteConcess.rotX, VenteConcess.sizeX, VenteConcess.sizeY, VenteConcess.sizeZ, VenteConcess.r, VenteConcess.g, VenteConcess.b, VenteConcess.a, false, false, 2, false, false, false, false)
                        if dist <= VenteConcess.max3D then 
                            DrawName3D(dest.x, dest.y, dest.z + 1, VenteConcess.text, 255, 255, 255)
                            if IsControlJustPressed(1, 51) then 
                                openMenuVenteConcess(VenteConcess)
                            end
                        end
                    end
                end
            end
            for _, Vente in pairs(VenteLTD) do
                local destRecette = Vente.pointRecette
                local distRecette = #(destRecette-posPlayer) 
                if distRecette <= Vente.distMarker then 
                    interval = 0
                    DrawMarker(Vente.markerType, destRecette.x, destRecette.y, destRecette.z-1, 0.0, 0.0, 0.0, Vente.rotX, Vente.rotY, Vente.rotZ, Vente.sizeX, Vente.sizeY, Vente.sizeZ, Vente.r, Vente.g, Vente.b, Vente.a, false, false, 2, false, false, false, false)
                    if distRecette <= Vente.dist3D then 
                        DrawName3D(destRecette.x, destRecette.y, destRecette.z, Vente.textRecette, 255,255,255)
                        if IsControlJustPressed(1, 51) then 
                            openMenuRecetteLTD(Vente)
                        end
                    end
                end
            end
            for _, Vente in pairs(VenteLTD) do
                local dest = Vente.point
                local dist = #(dest-posPlayer) 
                if job and job.name == Vente.job then 
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == Vente.job and InService then 
                        if dist <= Vente.distMarker then 
                            interval = 0
                            DrawMarker(Vente.markerType, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, Vente.rotX, Vente.rotY, Vente.rotZ, Vente.sizeX, Vente.sizeY, Vente.sizeZ, Vente.r, Vente.g, Vente.b, Vente.a, false, false, 2, false, false, false, false)
                            if dist <= Vente.dist3D then 
                                DrawName3D(dest.x, dest.y, dest.z, Vente.text, 255,255,255)
                                if IsControlJustPressed(1, 51) then 
                                    openMenuVenteLtd(Vente)
                                end
                            end
                        end
                    end
                end
            end
            for _, Armurerie in pairs(Armurerie) do 
                local dest = Armurerie.Point
                local dist = #(dest-posPlayer)
                for _, grade in pairs(InfoSalaryInBdd) do
                    if job and job.name == Armurerie.job then 
                        if grade.job_name == Armurerie.job and job.grade_name == grade.name then
                            if dist <= Armurerie.distMarker then 
                                interval = 0
                                DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                                if dist <= Armurerie.dist3D then 
                                    DrawName3D(dest.x, dest.y, dest.z, Armurerie.text, 255,255,255)
                                    if IsControlJustPressed(1, 51) then 
                                        _PoliceOpenMenuArmurerie(Armurerie)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            for _, Saisie in pairs(SaisieJob) do 
                local dest = Saisie.Point
                local dist = #(dest-posPlayer)
                for _, grade in pairs(InfoSalaryInBdd) do
                    if job and job.name == Saisie.job then 
                        if grade.job_name == Saisie.job and job.grade_name == grade.name and InService == true then
                            if dist <= Saisie.distMarker then 
                                interval = 0
                                DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                                if dist <= Saisie.dist3D then 
                                    DrawName3D(dest.x, dest.y, dest.z, Saisie.text, 255,255,255)
                                    if IsControlJustPressed(1, 51) then 
                                        PoliceOpenMenuSaisie(Saisie)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            for _, recolte in pairs(FarmLegal.Recolte) do
                local dest = recolte.point
                local dist = #(dest-posPlayer) 
                if ESX.PlayerData.job and ESX.PlayerData.job.name == recolte.job and (InService == true or Cfg.inService == true) then 
                    if dist <= recolte.maxDistMarker then 
                        interval = 0
                        DrawMarker(recolte.markerType, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, recolte.rotX, recolte.rotY, recolte.rotZ, recolte.sizeX, recolte.sizeY, recolte.sizeZ, recolte.r, recolte.g, recolte.b, recolte.a, false, false, 2, false, false, false, false)
                        if dist <= recolte.distMax3D then 
                            DrawName3D(dest.x, dest.y, dest.z, recolte.text, 255,255,255)
                            if IsControlJustPressed(1, 51) then
                                openMenuFarmLegal(recolte)
                            end
                        end
                    end
                end
            end
            for _, Traitement in pairs(FarmLegal.Traitement) do
                local dest = Traitement.point
                local dist = #(dest-posPlayer) 
                if ESX.PlayerData.job and ESX.PlayerData.job.name == Traitement.job and (InService == true or Cfg.inService == true) then 
                    if dist <= Traitement.maxDistMarker then 
                        interval = 0
                        DrawMarker(Traitement.markerType, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, Traitement.rotX, Traitement.rotY, Traitement.rotZ, Traitement.sizeX, Traitement.sizeY, Traitement.sizeZ, Traitement.r, Traitement.g, Traitement.b, Traitement.a, false, false, 2, false, false, false, false)
                        if dist <= Traitement.distMax3D then 
                            DrawName3D(dest.x, dest.y, dest.z, Traitement.text, 255,255,255)
                            if IsControlJustPressed(1, 51) then 
                                openMenuTraitementLegal(Traitement)
                            end
                        end
                    end
                end
            end
            for _, Revente in pairs(FarmLegal.Revente) do
                local dest = Revente.point
                local dist = #(dest-posPlayer) 
                if ESX.PlayerData.job and ESX.PlayerData.job.name == Revente.job and (InService == true or Cfg.inService == true) then 
                    if dist <= Revente.maxDistMarker then 
                        interval = 0
                        DrawMarker(Revente.markerType, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, Revente.rotX, Revente.rotY, Revente.rotZ, Revente.sizeX, Revente.sizeY, Revente.sizeZ, Revente.r, Revente.g, Revente.b, Revente.a, false, false, 2, false, false, false, false)
                        if dist <= Revente.distMax3D then 
                            DrawName3D(dest.x, dest.y, dest.z, Revente.text, 255,255,255)
                            if IsControlJustPressed(1, 51) then 
                                openMenuReventeLegal(Revente)
                            end
                        end
                    end
                end
            end
                
            for _, Pnj in pairs(Pnj) do
                local dest = Pnj.point
                local dist = #(posPlayer-dest)
                if dist <= 3 then 
                    interval = 0
                    DrawName3D(dest.x, dest.y, dest.z + 1, Pnj.text, 255, 255, 255)
                    if IsControlJustPressed(1, 51) then 
                        openMenuPnj(Pnj)
                    end
                end
            end
            Wait(interval)
        end
    end)
end