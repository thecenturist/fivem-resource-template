fx_version 'cerulean'
game 'gta5'

author 'Centurist'
version '1.0'
description 'A framework resource template'

client_scripts {
    'config.lua',
    'client/client.lua',
    'functions/functions-cl.lua',
    'commands/commands.lua'
}

server_scripts {
    'config.lua',
    'server/server.lua',
    'functions/functions-sv.lua',
    '@oxmysql/lib/MySQL.lua'
}

dependency 'oxmysql'