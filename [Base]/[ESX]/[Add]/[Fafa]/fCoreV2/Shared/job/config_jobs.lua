PoleEmploi = {
    Emploi = {
        {label = "Couture", name = "couture", grade = 0},
        {label = "Abatoire", name = "abatoire", grade = 0},
        {label = "Chomeur", name = "unemployed", grade = 0},
    }
}

Abatoire = {
    Garage = {
        {label = "Van", name = "burrito2aba", spawn = vector3(-25.73208, 6285.564, 31.23464), heading = 33.32, caution = 250},
    },
    Cloak = {
        clothes = {
            civil = {
                [0] = {
                    variations = {male = {}, female = {}},
                    onEquip = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                        SetPedArmour(PlayerPedId(), 0)
                    end
                    }
                },
            Employe = {
                [0] = {
                    variations = {
                        male = {
                            sex = 0,
                            bags_1 = 0, bags_2 = 0,
                            tshirt_1 = 107, tshirt_2 = 0,
                            torso_1 = 50, torso_2 = 0,
                            arms = 38,
                            pants_1 = 80, pants_2 = 9,
                            shoes_1 = 16, shoes_2 = 3,
                            mask_1 = 0, mask_2 = 0,
                            bproof_1 = 14, bproof_2 = 0,
                            helmet_1 = 1, helmet_2 = 0,
                            chain_1 = 0, chain_2 = 0,
                            decals_1 = 0, decals_2 = 0,
                            glasses_1 = 5, glasses_2 = 5,
                            watches_1 = -1, watches_2 = 0
                        },
                        female = {
                            sex = 1,
                            bags_1 = 0, bags_2 = 0,
                            tshirt_1 = 34, tshirt_2 = 0,
                            torso_1 = 13, torso_2 = 7,
                            arms = 15,
                            pants_1 = 28, pants_2 = 13,
                            shoes_1 = 61, shoes_2 = 5,
                            mask_1 = 0, mask_2 = 0,
                            bproof_1 = 14, bproof_2 = 0,
                            helmet_1 = -1, helmet_2 = 0,
                            chain_1 = 10, chain_2 = 0,
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
    }
}


Couture = {
    Garage = {
        {label = "Van", name = "burrito2cou", spawn = vector3(710.957520, -979.659668, 23.852542), heading = 223.41761779786, caution = 250},
    },
    Cloak = {
        clothes = {
            civil = {
                [0] = {
                    variations = {male = {}, female = {}},
                    onEquip = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                        SetPedArmour(PlayerPedId(), 0)
                    end
                    }
                },
            Employe = {
                [0] = {
                    variations = {
                        male = {
                            sex = 0,
                            bags_1 = 0, bags_2 = 0,
                            tshirt_1 = 107, tshirt_2 = 0,
                            torso_1 = 50, torso_2 = 0,
                            arms = 38,
                            pants_1 = 80, pants_2 = 9,
                            shoes_1 = 16, shoes_2 = 3,
                            mask_1 = 0, mask_2 = 0,
                            bproof_1 = 14, bproof_2 = 0,
                            helmet_1 = 1, helmet_2 = 0,
                            chain_1 = 0, chain_2 = 0,
                            decals_1 = 0, decals_2 = 0,
                            glasses_1 = 5, glasses_2 = 5,
                            watches_1 = -1, watches_2 = 0
                        },
                        female = {
                            sex = 1,
                            bags_1 = 0, bags_2 = 0,
                            tshirt_1 = 34, tshirt_2 = 0,
                            torso_1 = 13, torso_2 = 7,
                            arms = 15,
                            pants_1 = 28, pants_2 = 13,
                            shoes_1 = 61, shoes_2 = 5,
                            mask_1 = 0, mask_2 = 0,
                            bproof_1 = 14, bproof_2 = 0,
                            helmet_1 = -1, helmet_2 = 0,
                            chain_1 = 10, chain_2 = 0,
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
    }
}