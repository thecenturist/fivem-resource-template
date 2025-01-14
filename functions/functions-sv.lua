-- Handle all operation for when a player first joins the server --
RegisterServerEvent('FW:FirstPlayerJoin')
AddEventHandler('FW:FirstPlayerJoin', function(source)
    -- Variable creation
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local steamid, license, discord, fivem, ip

    -- Definining variables as user's identifiers
    for k,v in ipairs(identifiers) do
        if string.match(v, 'steam') then
            steamid = v
        elseif string.match(v, 'license:') then
            license = v
        elseif string.match(v, 'discord') then
            discord = v
        elseif string.match(v, 'fivem') then
            fivem = v
        elseif string.match(v, 'ip') then
            ip = v
        end
    end

    -- Create the user in the database
    -- user_identifiers
    MySQL.insert('INSERT INTO user_identifiers (playername, license, discord, fivem, ip) VALUES (?, ?, ?, ?, ?)',
    {
        GetPlayerName(source),
        license,
        discord,
        fivem,
        ip,
    }, function(id)
        print('DEBUG: Inserted identifiers into user_identifiers table: ' .. id)
    end)

    if config.debugmode then
        print('DEBUG: Identifiers inserted into the database')
    end
end)