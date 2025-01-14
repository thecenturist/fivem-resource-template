-- First Thread - Things that need to happen every few seconds --
CreateThread(function()
    while true do
        Wait(2500)
        DistantCopCarSirens(false)
        SetMaxWantedLevel(config.maxwantedlevel)
    end
end)

-- Second Thread -- Things that need to happen every tick --
CreateThread(function()
    while true do
        Wait(0)
        -- Traffic and Ped density management
        SetTrafficDensity(config.trafficdensity)
        SetPedDensity(config.peddensity)
        EnablePVP(config.enablepvp)
    end
end)