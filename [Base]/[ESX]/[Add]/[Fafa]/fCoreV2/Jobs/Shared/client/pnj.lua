local openPnj = false 
menuPnj = RageUI.CreateMenu(" ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuPlaintePnj = RageUI.CreateSubMenu(menuPnj, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
subMenuCallPnj = RageUI.CreateSubMenu(menuPnj, " ", " ", nil, nil, BannerConfig.TextureDictionary, BannerConfig.TextureName)
menuPnj.Closed = function()
    openPnj = false
end

local StatsButton = true
local CreatePlainte = {}
function openMenuPnj(v)
    if openPnj then 
        openPnj = false 
        RageUI.Visible(menuPnj, false)
        return
    else 
        openPnj = true 
        RageUI.Visible(menuPnj, true)
        CreateThread(function()
            while openPnj do 
                FreezeEntityPosition(PlayerPedId(), true)
                DisableControlAction(1, 51, true)
                RageUI.IsVisible(menuPnj, function()
                    RageUI.Separator("↓ ~b~Accueil~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Porter plainte", nil, {}, true, {}, subMenuPlaintePnj)
                    RageUI.Button(v.buttonCall, nil, {}, StatsButton, {
                        onSelected = function()
                            local name = Visual.KeyboardText("Entrez votre nom et prénom", "", 50)
                            if name ~= "" and name ~= " " and name ~= nil then 
                                local raison = Visual.KeyboardText("Entrez votre raison de l'appel", "", 200)
                                if raison ~= "" and raison ~= " " and raison ~= nil then 
                                    TriggerServerEvent("fCore:Pnj:CallJobs", v.Job, name, raison, v.point)
                                    cNotification("Votre appel à était émis, veuilliez patientez pour avoir une réponse", "Action", "vert")
                                    StatsButton = false 
                                    SetTimeout(5000, function()
                                        StatsButton = true
                                    end)
                                else
                                    cNotification("Vous n'avez pas entrer de valeur")    
                                end
                            else
                                cNotification("Vous n'avez pas entrer de valeur")
                            end
                        end
                    })
                end)
                RageUI.IsVisible(subMenuPlaintePnj, function()
                    RageUI.Separator("↓ ~b~Porter plainte~s~ ↓")
                    RageUI.Line("color", 19, 107, 190)
                    RageUI.Button("Nom / Prénoms", ("Votre nom et prénom : ~g~%s~s~"):format(CreatePlainte.name or "Aucun"), {}, true, {
                        onSelected = function()
                            local name = Visual.KeyboardText("Entrez votre nom et prénom", "", 50)
                            CreatePlainte.name = name
                            if name ~= "" and name ~= " " and name ~= nil then
                                cNotification("Vous venez d'enregistrer votre prénom et nom", "Action", "vert")
                            else
                                cNotification("Vous n'avez pas entrer de valeur")
                            end 
                        end
                    })
                    RageUI.Button("Numéro de téléphone", ("Votre numéro : ~g~%s~s~"):format(CreatePlainte.nomberPhone or "Aucun"), {}, true, {
                        onSelected = function()
                            local nomberPhone = Visual.KeyboardNumber("Entrez votre numéro de téléphone", "", 50)
                            CreatePlainte.nomberPhone = nomberPhone
                            if tonumber(nomberPhone) then
                                cNotification("Vous venez d'enregistrer votre numéro de téléphone", "Action", "vert")
                            else
                                cNotification("Vous n'avez pas entrer de valeur")
                            end 
                        end
                    })
                    RageUI.Button("Raison de la plainte", ("La raison de votre plainte : \n~g~%s~s~"):format(CreatePlainte.raison or "Aucun"), {}, true, {
                        onSelected = function()
                            local raison = Visual.KeyboardText("Entrez votre raison de la plainte", "", 200)
                            CreatePlainte.raison = raison
                            if raison ~= "" and raison ~= " " and raison ~= nil then 
                                cNotification("Vous venez d'enregistrer votre raison", "Action", "vert") 
                            else
                                cNotification("Vous n'avez pas entrer de valeur")    
                            end
                        end
                    })
                    RageUI.Button("L'auteur des faits", ("Mettez le ~g~Nom / Prénoms~s~ de la personne contre qui ~r~vous portez plainte~s~.\n\nL'auteur des faits ~g~%s~s~"):format(CreatePlainte.nameOfResponsable or "Aucun"), {}, true, {
                        onSelected = function()
                            local nameOfResponsable = Visual.KeyboardText("Entrez le nom / prénom de l'auteur des faits", "", 50)
                            CreatePlainte.nameOfResponsable = nameOfResponsable
                            if nameOfResponsable ~= "" and nameOfResponsable ~= " " and nameOfResponsable ~= nil then 
                                cNotification("Vous venez d'enregistrer le nom / prénom de l'auteur des faits", "Action", "vert") 
                            else
                                cNotification("Vous n'avez pas entrer de valeur")    
                            end
                        end
                    })
                    RageUI.Button("Email discord", ("Votre email discord : ~g~%s~s~"):format(CreatePlainte.emailDiscord or "Aucun"), {}, true, {
                        onSelected = function()
                            local emailDiscord = Visual.KeyboardText("Mettez votre email discord", "", 50)
                            CreatePlainte.emailDiscord = emailDiscord
                            if emailDiscord ~= "" and emailDiscord ~= " " and emailDiscord ~= nil then 
                                cNotification("Vous venez d'enregistrer votre email discord", "Action", "vert") 
                            else
                                cNotification("Vous n'avez pas entrer de valeur")    
                            end
                        end
                    })
                    RageUI.Button("~g~Envoyer la plainte", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                           TriggerServerEvent("fCore:Pnj:SendPlainte", CreatePlainte, v.sendInfoWebhooks)
                           CreatePlainte = {}
                        end
                    })
                    RageUI.Button("~r~Annuler", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            CreatePlainte = {}
                        end
                    })
                end)
                Wait(0)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end)
    end
end

appelCentral = {}
RegisterNetEvent("fCore:Pnj:VerifStatusCall")
AddEventHandler("fCore:Pnj:VerifStatusCall", function(Player, name, raison, pos, _src)

    table.insert(appelCentral, {name = name, raison = raison, position = pos})
    cNotification("Appel d'un citoyen à la central \n\nAppuyer sur ~b~[E]~s~ pour accepter\nAppuyer sur ~r~[Y]~s~ pour Refuser", "Action", "vert")
    CreateThread(function()
        local keyPressed = false 
        while not keyPressed do 
            SetTimeout(5000, function()
                keyPressed = true
            end)
            if IsControlJustPressed(1, 51) then
                if Player then 
                    cNotification("Tu viens d'accepter l'appel", "Action", "vert")
                    TriggerServerEvent("fCore:Pnj:AcceptAppel", _src)
                    blipsAppel(pos, "Appel Central")
                    keyPressed = true
                end
            elseif IsControlJustPressed(1, 246) then 
                if Player then 
                    cNotification("Tu viens refuser le l'appel")
                    keyPressed = true
                end
            end
            Wait(0)
        end
    end)
end)
