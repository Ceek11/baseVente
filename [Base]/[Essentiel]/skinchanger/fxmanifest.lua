fx_version 'adamant'

game 'gta5'
lua54 'yes'
description 'Official ESX-Legacy resource for handling the Player`s Skin'
version '1.10.2'

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/main.lua'
}


escrow_ignore {
	'locales/*.lua',
	'config.lua',
	'client/main.lua'   
}