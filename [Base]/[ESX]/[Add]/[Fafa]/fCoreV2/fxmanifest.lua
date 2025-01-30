lua54 'yes'
fx_version 'adamant'
games { 'gta5' }

ui_page 'data/index.html'
files {
 'data/**',
 'data/**/**'
}

shared_script '@es_extended/imports.lua'

files {
    "Add/weapon-recoil/*.meta",
    "Modules/Utils/TattooShop/AllTattoos.json",
}

data_file "WEAPONINFO_FILE_PATCH" "Add/weapon-recoil/*.meta"


-- Libs
client_scripts {
    "src/RMenu.lua",
	"src/menu/RageUI.lua",
	"src/menu/Menu.lua",
	"src/menu/MenuController.lua",
	"src/components/*.lua",
	"src/menu/elements/*.lua",
	"src/menu/items/*.lua",
	"src/menu/panels/*.lua",
}


client_scripts {
	'@es_extended/locale.lua',
    '@ox_lib/init.lua',
    "functions.lua",
    "Function/client/*.lua",
    'Modules/Jobs/fpwn_customs/locales/fr.lua',
    "Shared/*.lua",
    "Shared/**/*.lua",
-- Jobs
    "Jobs/Concessionaire/client/*.lua", 
    "Jobs/Concessionaire/function/*.lua", 
    "Jobs/Police/client/*.lua", 
    "Jobs/Police/function/*.lua", 
    "Jobs/AgentImmo/client/*.lua",
    "Jobs/Fisc/client/*.lua",
    "Jobs/Armurier/client/*.lua",
    "Jobs/Ambulance/client/*.lua",
    "Modules/Jobs/poleEmploi/client/*.lua",
    "Modules/Jobs/VenteLtd/client/*.lua",
    "Modules/Jobs/Farm/client/*.lua",
    "Modules/Jobs/armurerie/client/*.lua",
    "Modules/Jobs/armurerie/client/*.lua",
    "Modules/Jobs/Saisie/client/*.lua",
    "Modules/Jobs/Abatoire/client/*.lua",
    "Modules/Jobs/Couture/client/*.lua",
    "Modules/Jobs/menuF6/client/*.lua",
    "Jobs/Shared/function/*.lua", 
    "Jobs/Shared/client/*.lua", 
    "Modules/Jobs/Dj/client/*.lua",
    "Modules/Jobs/tenueGav/client/*.lua",
	"Modules/Jobs/fpwn_customs/client/*.lua",
	"Modules/Jobs/fpwn_customs/functions.lua",
-- Utils
    "Modules/Utils/plonge/client/*lua",
    "Modules/Utils/Location/client/*.lua",
    "Modules/Utils/Pos/client/*.lua",
	"Modules/Utils/Pharmacie/client/*.lua",
    "Modules/illegal/goFast/client/*.lua",
    "Modules/Utils/menuProps/client/*.lua",
	"Modules/Utils/personelMenu/client/*.lua",
	"Modules/Utils/VehicleItem/client/*.lua",
	"Modules/Utils/Tp/*.lua",
	"Modules/Utils/Blips/*.lua",
    "Modules/Utils/ClothesShop/client/*.lua",
    "Modules/Utils/antiTroll/client/*.lua",
	"Modules/Utils/TattooShop/client/*.lua",
    "Modules/Utils/CoiffeurShop/client/*.lua",
    "Modules/Utils/Peche/client/*lua",
	"Modules/Utils/VenteObject/client/*.lua",
    "Modules/Utils/Chasse/client/*.lua",
    -- "Modules/Utils/VenteOccasion/client/*.lua",
	"Modules/Utils/Utils/client/*.lua",
-- Illegal
	"Modules/Illegal/gang/client/*.lua",
	"Modules/Illegal/Blanchisseur/client/*.lua",
	"Modules/Illegal/Farm/client/*.lua",
	"Modules/Illegal/VentePnj/client/*.lua",
	"Modules/Illegal/ShopIllegal/client/*.lua",
    "Modules/Illegal/Bijouterie/client/*.lua",
    "Modules/Illegal/Fleeca/client/*.lua",
    "Modules/Illegal/venteIllegal/client/*.lua",
-- -- Administration
    "Modules/Administration/menuAdmin/client/*.lua",
    "Modules/Administration/menuVip/client/*.lua",
-- Add 
    "Add/heli/heli_client.lua",
    "Add/lux_vehcontrol/client.lua",
    "Add/weapon-pull/config.lua",
    "Add/weapon-pull/client.lua",
    'Add/vSync/vs_client.lua',
	"Add/Binoculars/client/*.lua",
    "Add/Garage/xGarage/client/*lua",
    "Add/Garage/xGarage/shared/*lua",
    'Add/HideInTrunk/main.lua',
    "Add/Keys/client/*.lua",
}



server_scripts {
	'@es_extended/locale.lua',
	'@oxmysql/lib/MySQL.lua',
-- Function 
    "Function/server/*.lua",
    'Modules/Jobs/fpwn_customs/locales/fr.lua',
    -- Config
    "Shared/*.lua",
    "Shared/**/*.lua",
--Jobs 
    "Jobs/Ambulance/server/*.lua",
    "Jobs/Concessionaire/server/*.lua", 
    "Jobs/Police/server/*.lua", 
    "Jobs/AgentImmo/server/*.lua",
    "Jobs/Fisc/server/*.lua",
    "Jobs/Armurier/server/*.lua",
    "Modules/Jobs/poleEmploi/server/*.lua",
    "Modules/Jobs/VenteLtd/server/*.lua",
    "Modules/Jobs/Farm/server/*.lua",
    "Modules/Jobs/armurerie/server/*.lua",
    "Modules/Jobs/Saisie/server/*.lua",
    "Modules/Jobs/menuF6/server/*.lua",
    "Modules/Jobs/Abatoire/server/*.lua",
    "Modules/Jobs/Couture/server/*.lua",
    "Jobs/Shared/server/*.lua", 
    "Modules/Utils/plonge/server/*lua",
    "Jobs/server/server.lua", 
    "Modules/Jobs/Dj/server/*.lua",
    "Modules/Jobs/fpwn_customs/server/*.lua",
    "Modules/Jobs/fpwn_customs/functions.lua",
-- Utils
	"Modules/Utils/Location/server/*.lua",
    "Modules/Utils/Chasse/server/*.lua",
	"Modules/Utils/Pharmacie/server/*.lua",
	"Modules/Utils/personelMenu/server/*.lua",
    "Modules/illegal/goFast/server/*.lua",
	"Modules/Utils/VehicleItem/server/*.lua",
    "Modules/Utils/Ammo/server/*.lua",
    "Modules/Utils/Peche/server/*lua",
    "Modules/Utils/antiTroll/server/*.lua",
    "Modules/Utils/Pos/server/*.lua",
	"Modules/Utils/Utils/server/*.lua",
	"Modules/Utils/TattooShop/server/*.lua",
    "Modules/Utils/CoiffeurShop/server/*.lua",
    "Modules/Utils/ClothesShop/server/*.lua",
	"Modules/Utils/VenteObject/server/*.lua",
	"Add/Binoculars/server/*.lua",
    -- "Modules/Utils/VenteOccasion/server/*.lua",
-- Illegal 
    "Modules/Illegal/gang/server/*.lua",
    "Modules/Illegal/Bijouterie/server/*.lua",
    "Modules/Illegal/Fleeca/server/*.lua",
    "Modules/Illegal/Blanchisseur/server/*.lua",
    "Modules/Illegal/Farm/server/*.lua",
    "Modules/Illegal/VentePnj/server/*.lua",
    "Modules/Illegal/ShopIllegal/server/*.lua",
    "Modules/Illegal/venteIllegal/server/*.lua",
-- Administration 
    "Modules/Administration/menuAdmin/server/*.lua",
    "Modules/Administration/menuVip/server/*.lua",
    "Modules/Administration/DiscordWhitelist/server/*.lua", 
    "Add/heli/heli_server.lua",
    "Add/lux_vehcontrol/server.lua",
    'Add/vSync/vs_server.lua',
	'Add/esx_addonaccount/server/classes/addonaccount.lua',
	'Add/esx_addonaccount/server/main.lua',
	'Add/esx_addoninventory/server/classes/addoninventory.lua',
	'Add/esx_addoninventory/server/main.lua',
	'Add/esx_datastore/server/classes/datastore.lua',
	'Add/esx_datastore/server/main.lua',
	'Add/cron/server/main.lua',
    "Add/Garage/xGarage/server/*lua",
    "Add/Garage/xGarage/shared/*lua",
    "Add/Keys/server/*.lua",
}

escrow_ignore {
    "Modules/Utils/Blips/*.lua",
	'client/menu.lua',
	"src/RMenu.lua",
	"src/menu/RageUI.lua",
	"src/menu/Menu.lua",
	"src/menu/MenuController.lua",
	"src/components/*.lua",
	"src/menu/elements/*.lua",
	"src/menu/items/*.lua",
	"src/menu/panels/*.lua",

    "Jobs/**/client/*.lua",
    "Function/client/*.lua",
    
    "Shared/*.lua",
    "Shared/**/*.lua",
    "Add/**/*.lua",
    "Add/**/**/*.lua",
    "Modules/**/**/client/*.lua",

}




server_export "IsRolePresent"
server_export "GetRoles"