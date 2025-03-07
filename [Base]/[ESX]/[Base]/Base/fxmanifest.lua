fx_version 'adamant'

game 'gta5'

description 'ESX License'
lua54 'yes'
version '1.0'
legacyversion '1.9.1'

server_scripts {
	'@es_extended/imports.lua',
	'@oxmysql/lib/MySQL.lua',
	'esx_license/config.lua',
	'esx_license/server/main.lua',
	'esx_datastore/server/classes/datastore.lua',
	'esx_datastore/server/main.lua',
	'esx_addoninventory/server/classes/addoninventory.lua',
	'cron/server/main.lua',
}



client_scripts {
	"bob74_ipl/lib/common.lua", 
	"bob74_ipl/lib/observers/interiorIdObserver.lua", 
	"bob74_ipl/lib/observers/officeSafeDoorHandler.lua", 
	"bob74_ipl/client.lua", 
	"bob74_ipl/gtav/base.lua",
	"bob74_ipl/gtav/ammunations.lua",
	"bob74_ipl/gtav/bahama.lua",
	"bob74_ipl/gtav/floyd.lua",
	"bob74_ipl/gtav/franklin.lua",
	"bob74_ipl/gtav/franklin_aunt.lua",
	"bob74_ipl/gtav/graffitis.lua",
	"bob74_ipl/gtav/pillbox_hospital.lua",
	"bob74_ipl/gtav/lester_factory.lua",
	"bob74_ipl/gtav/michael.lua",
	"bob74_ipl/gtav/north_yankton.lua",
	"bob74_ipl/gtav/red_carpet.lua",
	"bob74_ipl/gtav/simeon.lua",
	"bob74_ipl/gtav/stripclub.lua",
	"bob74_ipl/gtav/trevors_trailer.lua",
	"bob74_ipl/gtav/ufo.lua",
	"bob74_ipl/gtav/zancudo_gates.lua",
	"bob74_ipl/gta_online/apartment_hi_1.lua",
	"bob74_ipl/gta_online/apartment_hi_2.lua",
	"bob74_ipl/gta_online/house_hi_1.lua",
	"bob74_ipl/gta_online/house_hi_2.lua",
	"bob74_ipl/gta_online/house_hi_3.lua",
	"bob74_ipl/gta_online/house_hi_4.lua",
	"bob74_ipl/gta_online/house_hi_5.lua",
	"bob74_ipl/gta_online/house_hi_6.lua",
	"bob74_ipl/gta_online/house_hi_7.lua",
	"bob74_ipl/gta_online/house_hi_8.lua",
	"bob74_ipl/gta_online/house_mid_1.lua",
	"bob74_ipl/gta_online/house_low_1.lua",
	"bob74_ipl/dlc_high_life/apartment1.lua",
	"bob74_ipl/dlc_high_life/apartment2.lua",
	"bob74_ipl/dlc_high_life/apartment3.lua",
	"bob74_ipl/dlc_high_life/apartment4.lua",
	"bob74_ipl/dlc_high_life/apartment5.lua",
	"bob74_ipl/dlc_high_life/apartment6.lua",
	"bob74_ipl/dlc_heists/carrier.lua",
	"bob74_ipl/dlc_heists/yacht.lua",
	"bob74_ipl/dlc_executive/apartment1.lua",
	"bob74_ipl/dlc_executive/apartment2.lua",
	"bob74_ipl/dlc_executive/apartment3.lua",
	"bob74_ipl/dlc_finance/office1.lua",
	"bob74_ipl/dlc_finance/office2.lua",
	"bob74_ipl/dlc_finance/office3.lua",
	"bob74_ipl/dlc_finance/office4.lua",
	"bob74_ipl/dlc_finance/organization.lua",
	"bob74_ipl/dlc_bikers/cocaine.lua",
	"bob74_ipl/dlc_bikers/counterfeit_cash.lua",
	"bob74_ipl/dlc_bikers/document_forgery.lua",
	"bob74_ipl/dlc_bikers/meth.lua",
	"bob74_ipl/dlc_bikers/weed.lua",
	"bob74_ipl/dlc_bikers/clubhouse1.lua",
	"bob74_ipl/dlc_bikers/clubhouse2.lua",
	"bob74_ipl/dlc_bikers/gang.lua",
	"bob74_ipl/dlc_import/garage1.lua",
	"bob74_ipl/dlc_import/garage2.lua",
	"bob74_ipl/dlc_import/garage3.lua",
	"bob74_ipl/dlc_import/garage4.lua",
	"bob74_ipl/dlc_import/vehicle_warehouse.lua",
	"bob74_ipl/dlc_gunrunning/bunkers.lua",
	"bob74_ipl/dlc_gunrunning/yacht.lua",
	"bob74_ipl/dlc_smuggler/hangar.lua",
	"bob74_ipl/dlc_doomsday/facility.lua",
	"bob74_ipl/dlc_afterhours/nightclubs.lua",
	"bob74_ipl/dlc_casino/casino.lua",
	"bob74_ipl/dlc_casino/penthouse.lua",
	"bob74_ipl/dlc_tuner/garage.lua",
	"bob74_ipl/dlc_tuner/meetup.lua",
	"bob74_ipl/dlc_tuner/methlab.lua",
	"bob74_ipl/dlc_security/studio.lua",
	"bob74_ipl/dlc_security/billboards.lua",
	"bob74_ipl/dlc_security/musicrooftop.lua",
	"bob74_ipl/dlc_security/garage.lua",
	"bob74_ipl/dlc_security/office1.lua",
	"bob74_ipl/dlc_security/office2.lua",
	"bob74_ipl/dlc_security/office3.lua",
	"bob74_ipl/dlc_security/office4.lua",
	"bob74_ipl/gta_mpsum2/simeonfix.lua",
	"bob74_ipl/gta_mpsum2/vehicle_warehouse.lua",
	"bob74_ipl/gta_mpsum2/warehouse.lua",
	
}


escrow_ignore {
	'esx_license/config.lua',
	'esx_license/server/main.lua',
	'esx_datastore/server/classes/datastore.lua',
	'esx_datastore/server/main.lua',
	'esx_addoninventory/server/classes/addoninventory.lua',
	'cron/server/main.lua',
	'async/async.lua',
	"bob74_ipl/lib/common.lua", 
	"bob74_ipl/lib/observers/interiorIdObserver.lua", 
	"bob74_ipl/lib/observers/officeSafeDoorHandler.lua", 
	"bob74_ipl/client.lua", 
	"bob74_ipl/gtav/base.lua",
	"bob74_ipl/gtav/ammunations.lua",
	"bob74_ipl/gtav/bahama.lua",
	"bob74_ipl/gtav/floyd.lua",
	"bob74_ipl/gtav/franklin.lua",
	"bob74_ipl/gtav/franklin_aunt.lua",
	"bob74_ipl/gtav/graffitis.lua",
	"bob74_ipl/gtav/pillbox_hospital.lua",
	"bob74_ipl/gtav/lester_factory.lua",
	"bob74_ipl/gtav/michael.lua",
	"bob74_ipl/gtav/north_yankton.lua",
	"bob74_ipl/gtav/red_carpet.lua",
	"bob74_ipl/gtav/simeon.lua",
	"bob74_ipl/gtav/stripclub.lua",
	"bob74_ipl/gtav/trevors_trailer.lua",
	"bob74_ipl/gtav/ufo.lua",
	"bob74_ipl/gtav/zancudo_gates.lua",
	"bob74_ipl/gta_online/apartment_hi_1.lua",
	"bob74_ipl/gta_online/apartment_hi_2.lua",
	"bob74_ipl/gta_online/house_hi_1.lua",
	"bob74_ipl/gta_online/house_hi_2.lua",
	"bob74_ipl/gta_online/house_hi_3.lua",
	"bob74_ipl/gta_online/house_hi_4.lua",
	"bob74_ipl/gta_online/house_hi_5.lua",
	"bob74_ipl/gta_online/house_hi_6.lua",
	"bob74_ipl/gta_online/house_hi_7.lua",
	"bob74_ipl/gta_online/house_hi_8.lua",
	"bob74_ipl/gta_online/house_mid_1.lua",
	"bob74_ipl/gta_online/house_low_1.lua",
	"bob74_ipl/dlc_high_life/apartment1.lua",
	"bob74_ipl/dlc_high_life/apartment2.lua",
	"bob74_ipl/dlc_high_life/apartment3.lua",
	"bob74_ipl/dlc_high_life/apartment4.lua",
	"bob74_ipl/dlc_high_life/apartment5.lua",
	"bob74_ipl/dlc_high_life/apartment6.lua",
	"bob74_ipl/dlc_heists/carrier.lua",
	"bob74_ipl/dlc_heists/yacht.lua",
	"bob74_ipl/dlc_executive/apartment1.lua",
	"bob74_ipl/dlc_executive/apartment2.lua",
	"bob74_ipl/dlc_executive/apartment3.lua",
	"bob74_ipl/dlc_finance/office1.lua",
	"bob74_ipl/dlc_finance/office2.lua",
	"bob74_ipl/dlc_finance/office3.lua",
	"bob74_ipl/dlc_finance/office4.lua",
	"bob74_ipl/dlc_finance/organization.lua",
	"bob74_ipl/dlc_bikers/cocaine.lua",
	"bob74_ipl/dlc_bikers/counterfeit_cash.lua",
	"bob74_ipl/dlc_bikers/document_forgery.lua",
	"bob74_ipl/dlc_bikers/meth.lua",
	"bob74_ipl/dlc_bikers/weed.lua",
	"bob74_ipl/dlc_bikers/clubhouse1.lua",
	"bob74_ipl/dlc_bikers/clubhouse2.lua",
	"bob74_ipl/dlc_bikers/gang.lua",
	"bob74_ipl/dlc_import/garage1.lua",
	"bob74_ipl/dlc_import/garage2.lua",
	"bob74_ipl/dlc_import/garage3.lua",
	"bob74_ipl/dlc_import/garage4.lua",
	"bob74_ipl/dlc_import/vehicle_warehouse.lua",
	"bob74_ipl/dlc_gunrunning/bunkers.lua",
	"bob74_ipl/dlc_gunrunning/yacht.lua",
	"bob74_ipl/dlc_smuggler/hangar.lua",
	"bob74_ipl/dlc_doomsday/facility.lua",
	"bob74_ipl/dlc_afterhours/nightclubs.lua",
	"bob74_ipl/dlc_casino/casino.lua",
	"bob74_ipl/dlc_casino/penthouse.lua",
	"bob74_ipl/dlc_tuner/garage.lua",
	"bob74_ipl/dlc_tuner/meetup.lua",
	"bob74_ipl/dlc_tuner/methlab.lua",
	"bob74_ipl/dlc_security/studio.lua",
	"bob74_ipl/dlc_security/billboards.lua",
	"bob74_ipl/dlc_security/musicrooftop.lua",
	"bob74_ipl/dlc_security/garage.lua",
	"bob74_ipl/dlc_security/office1.lua",
	"bob74_ipl/dlc_security/office2.lua",
	"bob74_ipl/dlc_security/office3.lua",
	"bob74_ipl/dlc_security/office4.lua",
	"bob74_ipl/gta_mpsum2/simeonfix.lua",
	"bob74_ipl/gta_mpsum2/vehicle_warehouse.lua",
	"bob74_ipl/gta_mpsum2/warehouse.lua",
}

server_exports {
    'GetSharedInventory',
    'AddSharedInventory',
	'GetSharedAccount',
    'AddSharedAccount',
}

shared_script 'async/async.lua'