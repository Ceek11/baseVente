TenueGav = {
    { ----PRISON
        Point = vec3(478.036407, -1005.278442, 26.273146),
        distMarker = 10,
        dist3D = 1.5,
        Tenue = {
            civil = {
                [0] = {
            
                    label = "Tenue Personnel",
                    variations = {male = {}, female = {}},
                    onEquip = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                        SetPedArmour(PlayerPedId(), 0)
                    end
                    }
                },
            Gav = {
                {
                    label = "Tenue GAV",
                    variations = {
                        male = {
                            sex = 0,
                            bags_1 = 0, bags_2 = 0,
                            tshirt_1 = 23, tshirt_2 = 0,
                            torso_1 = 134, torso_2 = 0,
                            arms = 4,
                            pants_1 = 133, pants_2 = 1,
                            shoes_1 = 135, shoes_2 = 0,
                            mask_1 = 0, mask_2 = 0,
                            bproof_1 = 0, bproof_2 = 0,
                            helmet_1 = -1, helmet_2 = 0,
                            chain_1 = 0, chain_2 = 0,
                            decals_1 = 0, decals_2 = 0,
                            glasses_1 = -1, glasses_2 = 0,
                            watches_1 = -1, watches_2 = 0
                        },
                        female = {
                            sex = 1,
                            bags_1 = 0, bags_2 = 0,
                            tshirt_1 = 135, tshirt_2 = 0,
                            torso_1 = 127, torso_2 = 0,
                            arms = 3,
                            pants_1 = 135, pants_2 = 1,
                            shoes_1 = 146, shoes_2 = 20,
                            mask_1 = 0, mask_2 = 0,
                            bproof_1 = 0, bproof_2 = 0,
                            helmet_1 = -1, helmet_2 = 0,
                            chain_1 = 0, chain_2 = 0,
                            decals_1 = 0, decals_2 = 0,
                            glasses_1 = -1, glasses_2 = 0,
                            watches_1 = -1, watches_2 = 0
                        }
                    },
                onEquip = function()
                end
                },
            }
        }
    },
}