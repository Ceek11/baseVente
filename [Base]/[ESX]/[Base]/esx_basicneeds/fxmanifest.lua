fx_version 'adamant'

game 'gta5'

description 'ESX Basic Needs'
lua54 'yes'
version '1.0'
legacyversion '1.9.1'

shared_script '@es_extended/imports.lua'

server_scripts {
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