AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    -- Variables
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local steamid, fivem

    -- Defining variables
    for k,v in ipairs(identifiers) do
        print('V: ' .. v)
        if string.match(v, 'steam') then
            steamid = v
            if config.debugmode then
                print('DEBUG: Steam ID grabbed: ' .. steamid)
            end
        elseif string.match(v, 'fivem') then
            fivem = v
            if config.debugmode then
                print('DEBUG: FiveM ID grabbed: ' .. fivem)
            end
        end
    end

    if not fivem then
        defferals.done('You need to log in to a FiveM CFX.re account')
    -- elseif not steamid then
    --     -- What if user is not running steam
    --     -- deferrals.done('You need to open Steam.')
    --     steam = 'null'
    --     print('DEBUG: No SteamID retrieved')
    else
        deferrals.done()
        if config.debugmode then
            print('DEBUG: FiveM ID is being fetched')
        end
        print("PreQUERY")
        MySQL.query('SELECT * FROM `user_identifiers` WHERE `fivem` = ? LIMIT 1', {
            fivem
        }, function(result)
            if #result == 0 then
                if config.debugmode then
                    print('DEBUG: FiveM ID not found, inserting identifiers into the database')
                end
                TriggerEvent('FW:FirstPlayerJoin', source) -- Trigger client first join event
            elseif #result == 1 then
                if config.debugmode then
                    print('DEBUG: FiveM ID found')
                end
            end
            -- No ending else here, might be needed
        end)
    end
end)