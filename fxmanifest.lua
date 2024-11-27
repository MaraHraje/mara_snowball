fx_version 'adamant'
game 'gta5'

lua54 'yes'

server_scripts {
    '@es_extended/locale.lua', -- Potřebné pro ESX
    '@oxmysql/lib/MySQL.lua',  -- Potřebné pro ESX a databázi
    'server.lua'
}

client_scripts {
    '@es_extended/locale.lua', -- Potřebné pro ESX
    '@ox_lib/init.lua',        -- Potřebné pro ox_lib
    'client.lua'
}
-- Závislosti na jiných zdrojích
dependencies {
    'es_extended',
}