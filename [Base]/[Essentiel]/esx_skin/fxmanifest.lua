fx_version 'adamant'

game 'gta5'
description 'ESX Skin'
version '1.10.2'
lua54 'yes'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/main.lua'
}

escrow_ignore {
	'locales/*.lua',
	'config.lua',
	'client/main.lua',
	'server/main.lua'
}

dependencies {
	'es_extended',
	'skinchanger'
}
