return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["acide"] = {
		label = "Acide",
		weight = 1,
		stack = true,
		close = true,
	},

	["alcool"] = {
		label = "Alcool",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["americano"] = {
		label = "Americano",
		weight = 1,
		stack = true,
		close = true,
	},

	["anchois"] = {
		label = "Anchois",
		weight = 1,
		stack = true,
		close = true,
	},

	["attachment_remover"] = {
		label = "Attachement Remover",
		weight = 1,
		stack = true,
		close = true,
	},

	["ball_ammo"] = {
		label = "ball_ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["barquette_poulet"] = {
		label = "Barquette de poulet",
		weight = 1,
		stack = true,
		close = true,
	},

	["beryl"] = {
		label = "Beryl",
		weight = 1,
		stack = true,
		close = true,
	},

	["biere"] = {
		label = "Bière",
		weight = 1,
		stack = true,
		close = true,
	},

	["bijoux"] = {
		label = "Bijoux",
		weight = 1,
		stack = true,
		close = true,
	},

	["bird_crap_ammo"] = {
		label = "bird_crap_ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["bmx"] = {
		label = "BMX",
		weight = 10,
		stack = true,
		close = true,
	},

	["boeuf"] = {
		label = "Boeuf",
		weight = 1,
		stack = true,
		close = true,
	},

	["boeuf_cru"] = {
		label = "Boeuf cru",
		weight = 1,
		stack = true,
		close = true,
	},

	["boeuf_cuit"] = {
		label = "Tomahawk de boeuf",
		weight = 1,
		stack = true,
		close = true,
	},

	["boite_mun_assault"] = {
		label = "Boite 7.62mm",
		weight = 12,
		stack = true,
		close = true,
	},

	["boite_mun_mitraillette"] = {
		label = "Boite 9mm",
		weight = 12,
		stack = true,
		close = true,
	},

	["boite_mun_pistol"] = {
		label = "Boite .45ACP",
		weight = 12,
		stack = true,
		close = true,
	},

	["boite_mun_pompe"] = {
		label = "Boite Calibre 12",
		weight = 12,
		stack = true,
		close = true,
	},

	["bombe_tag"] = {
		label = "Bombe à tag",
		weight = 0.5,
		stack = true,
		close = true,
	},

	["bouteille_champagne"] = {
		label = "Bouteille de champagne",
		weight = 1,
		stack = true,
		close = true,
	},

	["bouteille_eau"] = {
		label = "Bouteille d'eau",
		weight = 1,
		stack = true,
		close = true,
	},

	["bouteille_tequila"] = {
		label = "Bouteille de tequila",
		weight = 1,
		stack = true,
		close = true,
	},

	["bouteille_vin"] = {
		label = "Bouteille de vin",
		weight = 1,
		stack = true,
		close = true,
	},

	["bouteille_vodka"] = {
		label = "Bouteille de vodka",
		weight = 1,
		stack = true,
		close = true,
	},

	["bouteille_whisky"] = {
		label = "Bouteille de whisky",
		weight = 1,
		stack = true,
		close = true,
	},

	["bouteille_woodford"] = {
		label = "Bouteille de Woodfort",
		weight = 1,
		stack = true,
		close = true,
	},

	["bracelet_electronique"] = {
		label = "Bracelet électronique",
		weight = 0.5,
		stack = true,
		close = true,
	},

	["branche_weed_critical"] = {
		label = "Branche de weed (critical)",
		weight = 1,
		stack = true,
		close = true,
	},

	["brownie"] = {
		label = "Brownie",
		weight = 1,
		stack = true,
		close = true,
	},

	["brownie_moule"] = {
		label = "Brownie en moule",
		weight = 1,
		stack = true,
		close = true,
	},

	["bumpton"] = {
		label = "Jeton AutoTemponeuse",
		weight = 1,
		stack = true,
		close = true,
	},

	["cafe"] = {
		label = "Café",
		weight = 1,
		stack = true,
		close = true,
	},

	["casse_vitre"] = {
		label = "Casse vitre",
		weight = 2,
		stack = true,
		close = true,
	},

	["cheeseburger"] = {
		label = "Cheese Burger",
		weight = 1,
		stack = true,
		close = true,
	},

	["chickenburger"] = {
		label = "Chicken Burger",
		weight = 1,
		stack = true,
		close = true,
	},

	["cle_piratage"] = {
		label = "Clé de piratage",
		weight = 0.5,
		stack = true,
		close = true,
	},

	["clip_extended"] = {
		label = "Extended Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["cognac"] = {
		label = "Cognac",
		weight = 1,
		stack = true,
		close = true,
	},

	["cookie"] = {
		label = "Cookie",
		weight = 1,
		stack = true,
		close = true,
	},

	["crack"] = {
		label = "Crack",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["crepe_nutella"] = {
		label = "Crêpe nutella",
		weight = 1,
		stack = true,
		close = true,
	},

	["crystal_meth"] = {
		label = "Crystal de meth",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["cuisse_poulet"] = {
		label = "Cuisse de poulet",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["dauphin"] = {
		label = "Dauphin",
		weight = 7,
		stack = true,
		close = true,
	},

	["donut"] = {
		label = "Donut",
		weight = 1,
		stack = true,
		close = true,
	},

	["drill"] = {
		label = "Perceuse",
		weight = 4,
		stack = true,
		close = true,
	},

	["emeraude"] = {
		label = "Emeraude",
		weight = 1,
		stack = true,
		close = true,
	},

	["espadon"] = {
		label = "Espadon",
		weight = 1,
		stack = true,
		close = true,
	},

	["etoile_mer"] = {
		label = "Etoile de mer",
		weight = 3,
		stack = true,
		close = true,
	},

	["feuille_coca"] = {
		label = "Feuille de coca",
		weight = 1,
		stack = true,
		close = true,
	},

	["feuille_ocb"] = {
		label = "Feuille OCB",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["feuille_tabac"] = {
		label = "Feuille de tabac",
		weight = 1,
		stack = true,
		close = true,
	},

	["feuille_tabac_seche"] = {
		label = "Feuille de tabac séchée",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["ficello"] = {
		label = "Ficello",
		weight = 0.5,
		stack = true,
		close = true,
	},

	["fireextinguisher_ammo"] = {
		label = "fireextinguisher_ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishingrod"] = {
		label = "Canne à pêche",
		weight = 1.5,
		stack = true,
		close = true,
	},

	["flare_ammo"] = {
		label = "Munition de détresse",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["flashlight"] = {
		label = "Flashlight",
		weight = 1,
		stack = true,
		close = true,
	},

	["fragment_minerais"] = {
		label = "Fragment de minerais",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["frite"] = {
		label = "Frite",
		weight = 1,
		stack = true,
		close = true,
	},

	["frozen_margarita"] = {
		label = "Frozen Margarita",
		weight = 1,
		stack = true,
		close = true,
	},

	["fruit_fermente"] = {
		label = "Fruit Fermenté",
		weight = 1,
		stack = true,
		close = true,
	},

	["gadget_parachute"] = {
		label = "Parachute",
		weight = 1,
		stack = true,
		close = true,
	},

	["glace"] = {
		label = "Glace",
		weight = 1,
		stack = true,
		close = true,
	},

	["grand_appat"] = {
		label = "Grand-appât",
		weight = 1,
		stack = true,
		close = true,
	},

	["grappe_raisin"] = {
		label = "Grappe de raisin",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["grip"] = {
		label = "Grip",
		weight = 1,
		stack = true,
		close = true,
	},

	["gzgas_ammo"] = {
		label = "gzgas_ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["hamburger"] = {
		label = "Hamburger",
		weight = 1,
		stack = true,
		close = true,
	},

	["ice_tea"] = {
		label = "Ice-Tea",
		weight = 1,
		stack = true,
		close = true,
	},

	["jumelles"] = {
		label = "Jumelle",
		weight = 1,
		stack = true,
		close = true,
	},

	["jus_raisin"] = {
		label = "Jus de raisin",
		weight = 1,
		stack = true,
		close = true,
	},

	["kit_crochetage"] = {
		label = "Kit de crochetage",
		weight = 2,
		stack = true,
		close = true,
	},

	["kit_reparation"] = {
		label = "Kit de réparation",
		weight = 2,
		stack = true,
		close = true,
	},

	["longchicken"] = {
		label = "Long Chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["luxary_finish"] = {
		label = "Luxury Finish",
		weight = 1,
		stack = true,
		close = true,
	},

	["margarita"] = {
		label = "Margarita",
		weight = 1,
		stack = true,
		close = true,
	},

	["martini"] = {
		label = "Martini",
		weight = 1,
		stack = true,
		close = true,
	},

	["meduse"] = {
		label = "Méduse",
		weight = 1.5,
		stack = true,
		close = true,
	},

	["menotte"] = {
		label = "Menotte",
		weight = 1,
		stack = true,
		close = true,
	},

	["mg_ammo"] = {
		label = "Munition 5.56",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["mgclip"] = {
		label = "MG Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["mochi"] = {
		label = "Mochi",
		weight = 1,
		stack = true,
		close = true,
	},

	["mojito"] = {
		label = "Mojito",
		weight = 1,
		stack = true,
		close = true,
	},

	["molotov_ammo"] = {
		label = "molotov_ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["morue"] = {
		label = "Morue",
		weight = 1,
		stack = true,
		close = true,
	},

	["moyen_appat"] = {
		label = "Moyen-appât",
		weight = 1,
		stack = true,
		close = true,
	},

	["mysterybronze"] = {
		label = "Mystery Bronze",
		weight = 1,
		stack = true,
		close = true,
	},

	["mysterydiamond"] = {
		label = "Mystery Diamond",
		weight = 1,
		stack = true,
		close = true,
	},

	["mysterygold"] = {
		label = "Mystery Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["mysteryiron"] = {
		label = "Mystery Iron",
		weight = 1,
		stack = true,
		close = true,
	},

	["mysteryultime"] = {
		label = "Mystery Ultime",
		weight = 1,
		stack = true,
		close = true,
	},

	["oasis"] = {
		label = "Oasis",
		weight = 1,
		stack = true,
		close = true,
	},

	["pain"] = {
		label = "Pain",
		weight = 0.5,
		stack = true,
		close = true,
	},

	["paquet_marlboro"] = {
		label = "Paquet de marlboro",
		weight = 1,
		stack = true,
		close = true,
	},

	["paquet_viande"] = {
		label = "Paquet de viande",
		weight = 1,
		stack = true,
		close = true,
	},

	["peau_coyote"] = {
		label = "Peau de coyote",
		weight = 1,
		stack = true,
		close = true,
	},

	["peau_puma"] = {
		label = "Peau de puma",
		weight = 1,
		stack = true,
		close = true,
	},

	["pelote_laine"] = {
		label = "Pelote de laine",
		weight = 1,
		stack = true,
		close = true,
	},

	["petit_appat"] = {
		label = "Petit-appât",
		weight = 0.5,
		stack = true,
		close = true,
	},

	["phosphore_rouge"] = {
		label = "Phosphore rouge",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["pince_cheveux"] = {
		label = "Pince à cheveux",
		weight = 1,
		stack = true,
		close = true,
	},

	["pistol_ammo"] = {
		label = "Munition .45ACP",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["pistolclip"] = {
		label = "Pistol Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["plane_rocket_ammo"] = {
		label = "plane_rocket_ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["player_laser_ammo"] = {
		label = "player_laser_ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["pochon_coke"] = {
		label = "Pochon de coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["pochon_crack"] = {
		label = "Pochon de crack",
		weight = 1,
		stack = true,
		close = true,
	},

	["pochon_meth"] = {
		label = "Pochon de meth",
		weight = 1,
		stack = true,
		close = true,
	},

	["pochon_weed_critical"] = {
		label = "Pochon de weed (critical)",
		weight = 1,
		stack = true,
		close = true,
	},

	["potatoes"] = {
		label = "Potatoes",
		weight = 1,
		stack = true,
		close = true,
	},

	["poudre_coke"] = {
		label = "Poudre de coke",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["poulet"] = {
		label = "Poulet",
		weight = 1,
		stack = true,
		close = true,
	},

	["poulet_cuit"] = {
		label = "Poulet cuit",
		weight = 1,
		stack = true,
		close = true,
	},

	["pouletpane"] = {
		label = "Poulet pané",
		weight = 1,
		stack = true,
		close = true,
	},

	["pseudoephedrine"] = {
		label = "Pseudoéphédrine",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["raie"] = {
		label = "Raie",
		weight = 1,
		stack = true,
		close = true,
	},

	["requin"] = {
		label = "Requin",
		weight = 9,
		stack = true,
		close = true,
	},

	["requin_marteau"] = {
		label = "Requin Marteau",
		weight = 8,
		stack = true,
		close = true,
	},

	["rhum"] = {
		label = "Rhum",
		weight = 1,
		stack = true,
		close = true,
	},

	["rifle_ammo"] = {
		label = "Munition 7.62mm",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["rifleclip"] = {
		label = "Rifle Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["riz"] = {
		label = "Riz",
		weight = 1,
		stack = true,
		close = true,
	},

	["rope"] = {
		label = "Câble en acier",
		weight = 3,
		stack = true,
		close = true,
	},

	["sac_farine"] = {
		label = "Sac de farine",
		weight = 1,
		stack = true,
		close = true,
	},

	["salade_cesar"] = {
		label = "Salade césar",
		weight = 1,
		stack = true,
		close = true,
	},

	["sandwich"] = {
		label = "Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["saumon"] = {
		label = "Saumon",
		weight = 1,
		stack = true,
		close = true,
	},

	["scope"] = {
		label = "Viseur",
		weight = 1,
		stack = true,
		close = true,
	},

	["serflex"] = {
		label = "Serflex",
		weight = 1,
		stack = true,
		close = true,
	},

	["shotgun_ammo"] = {
		label = "Munition Calibre 12",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["shotgunclip"] = {
		label = "Shotgun Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["skin"] = {
		label = "Camouflage",
		weight = 1,
		stack = true,
		close = true,
	},

	["smg_ammo"] = {
		label = "Munition 9mm",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["smgclip"] = {
		label = "SMG Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["sniper_remote_ammo"] = {
		label = "Sniper Remote Ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["space_rocket_ammo"] = {
		label = "space_rocket_ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["spray"] = {
		label = "Spray",
		weight = 0.5,
		stack = true,
		close = true,
	},

	["spray_remover"] = {
		label = "Spray Remover",
		weight = 0.5,
		stack = true,
		close = true,
	},

	["stickybomb_ammo"] = {
		label = "stickybomb_ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["stungun_ammo"] = {
		label = "Stungun Ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["suppressor"] = {
		label = "Suppressor",
		weight = 1,
		stack = true,
		close = true,
	},

	["sushi"] = {
		label = "Sushi",
		weight = 1,
		stack = true,
		close = true,
	},

	["tacos"] = {
		label = "Tacos",
		weight = 1,
		stack = true,
		close = true,
	},

	["tank_ammo"] = {
		label = "tank_ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["telephone_bicrave"] = {
		label = "Téléphone de bicrave",
		weight = 1,
		stack = true,
		close = true,
	},

	["tete_weed_critical"] = {
		label = "Tête de weed (critical)",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["the"] = {
		label = "Thé",
		weight = 1,
		stack = true,
		close = true,
	},

	["thon"] = {
		label = "Thon",
		weight = 1,
		stack = true,
		close = true,
	},

	["throwableclip"] = {
		label = "Throwable Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["tint_army"] = {
		label = "Army",
		weight = 1,
		stack = true,
		close = true,
	},

	["tint_gold"] = {
		label = "Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["tint_green"] = {
		label = "Green",
		weight = 1,
		stack = true,
		close = true,
	},

	["tint_lspd"] = {
		label = "LSPD",
		weight = 1,
		stack = true,
		close = true,
	},

	["tint_orange"] = {
		label = "Orange",
		weight = 1,
		stack = true,
		close = true,
	},

	["tint_pink"] = {
		label = "Pink",
		weight = 1,
		stack = true,
		close = true,
	},

	["tint_platinum"] = {
		label = "Platinum",
		weight = 1,
		stack = true,
		close = true,
	},

	["tissu"] = {
		label = "Tissu",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["tortue_mer"] = {
		label = "Tortue de mer",
		weight = 4.5,
		stack = true,
		close = true,
	},

	["umeshu"] = {
		label = "Umeshu",
		weight = 1,
		stack = true,
		close = true,
	},

	["vetement"] = {
		label = "Vêtement",
		weight = 1,
		stack = true,
		close = true,
	},

	["viande_biche"] = {
		label = "Viande de biche",
		weight = 1,
		stack = true,
		close = true,
	},

	["viande_cuite"] = {
		label = "Viande cuite",
		weight = 0.2,
		stack = true,
		close = true,
	},

	["viande_lapin"] = {
		label = "Viande de lapin",
		weight = 1,
		stack = true,
		close = true,
	},

	["viande_oie"] = {
		label = "Viande d'oie",
		weight = 1,
		stack = true,
		close = true,
	},

	["viande_sanglier"] = {
		label = "Viande de sanglier",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_assaultrifle"] = {
		label = "AK-47",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_ball"] = {
		label = "Balle",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_bat"] = {
		label = "Batte de Baseball",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_battleaxe"] = {
		label = "Hache de guerre",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_bottle"] = {
		label = "Bouteille cassé",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_bzgas"] = {
		label = "Grenade lacrymogène",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_carbinerifle"] = {
		label = "M4-A1",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_ceramicpistol"] = {
		label = "Pistolet céramique",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_combatpistol"] = {
		label = "Pistolet de Combat",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_compactrifle"] = {
		label = "Ak Compact",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_crowbar"] = {
		label = "Pied de biche",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_dagger"] = {
		label = "Dague antique",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_dbshotgun"] = {
		label = "Fusil à double canon",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_digiscanner"] = {
		label = "Détecteur de métaux",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_fireextinguisher"] = {
		label = "Fusée de mortier",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_firework"] = {
		label = "Mortier",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_flare"] = {
		label = "Fusée de détresse",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_flaregun"] = {
		label = "Pistolet de détresse",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_flashlight"] = {
		label = "Lampe de poche",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_golfclub"] = {
		label = "Club de Golf",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_gusenberg"] = {
		label = "Thompson",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_hammer"] = {
		label = "Marteau",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_hatchet"] = {
		label = "Hachette",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_heavypistol"] = {
		label = "Pistolet Lourd",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_knife"] = {
		label = "Couteau",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_knuckle"] = {
		label = "Poing Américain",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_machete"] = {
		label = "Machette",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_machinepistol"] = {
		label = "Tech 9",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_microsmg"] = {
		label = "Micro-Uzi",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_minismg"] = {
		label = "Scorpion",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_molotov"] = {
		label = "Cocktail Molotov",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_musket"] = {
		label = "Musquet",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_nightstick"] = {
		label = "Matraque",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_petrolcan"] = {
		label = "Bidon d'essence",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_pipebomb"] = {
		label = "Bombe tuyau",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_pistol"] = {
		label = "Pistolet Berreta",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_pistol50"] = {
		label = "Pistolet Cal.50",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_poolcue"] = {
		label = "Queue de billard",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_pumpshotgun"] = {
		label = "Fusil à pompe",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_revolver"] = {
		label = "Pistolet Revolver",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_sawnoffshotgun"] = {
		label = "Canon scié",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_smg"] = {
		label = "MP5",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_smokegrenade"] = {
		label = "Grenade fumigène",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_snowball"] = {
		label = "Pavé",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_snspistol"] = {
		label = "Pistolet SNS",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_specialcarbine"] = {
		label = "Carabine spécial",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_stickybomb"] = {
		label = "Bombe collante",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_stungun"] = {
		label = "Taser",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_switchblade"] = {
		label = "Cran d'arrêt",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_vintagepistol"] = {
		label = "Pistolet vintage",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon_wrench"] = {
		label = "Clé anglaise",
		weight = 1,
		stack = true,
		close = true,
	},

	["yusuf"] = {
		label = "Weapon Skin",
		weight = 1,
		stack = true,
		close = true,
	},
}