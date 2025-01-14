RegisterCommand('car', function(source, args)
    local vehicle = args[1] or 'tailgater'
    spawnVehicle(vehicle)
end, false)

RegisterCommand('dv', function(source)
    deleteVehicle()
end, false)

RegisterCommand('weapon', function(source, args)
    local weapon = args[1] or 'pistol'
    giveWeapon(weapon)
end, false)

RegisterCommand('fix', function(source)
    fixVehicle()
end, false)

RegisterCommand('heal', function(source)
    healSelf()
end, false)

RegisterCommand('revive', function(source)
    reviveSelf()
end, false)

RegisterCommand('tp', function(source)
    teleportToWaypoint()
end, false)