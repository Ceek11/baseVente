fx_version 'adamant'

game 'gta5'

description 'ESX Status'

version '1.0'
legacyversion '1.9.1'

lua54 'yes'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/classes/status.lua',
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/css/app.css',
	'html/scripts/app.js'
}

escrow_ignore {
	'html/ui.html',
	'html/css/app.css',
	'html/scripts/app.js',
	'config.lua',
	'client/classes/status.lua',
	'client/main.lua',
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/main.lua',
}