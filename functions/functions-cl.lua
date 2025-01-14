function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end

function getCoords()
    local coords = GetEntityCoords(entity, false)
    local heading = GetEntityHeading(entity)
    return vector4(coords.x, coords.y, coords.z, heading)
end

function spawnVehicle(vehicle)
    local veh = vehicle or 'tailgater'
    if not IsModelInCdimage(veh) or not IsModelAVehicle(veh) then
        notify("Vehicle is not recognized")
        return
    end
    RequestModel(veh)
    while not HasModelLoaded(veh) do
        Wait(500)
    end
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    if IsPedInAnyVehicle(playerPed, true) then
        deleteVehicle()
    end
    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
    SetPedIntoVehicle(playerPed, vehicle, -1)
    SetEntityAsNoLongerNeeded(vehicleName)
    notify("Vehicle spawned.")
end

function deleteVehicle()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, true)
    DeleteEntity(vehicle)
    notify("Vehicle deleted.")
end

function giveWeapon(weapon)
    local weaponHash = ("weapon_" .. weapon)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponHash), 999, false, false)
    notify("Weapon given.")
end

function fixVehicle()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    SetVehicleFixed(vehicle)
end

function healSelf()
    local maxHealth = GetPedMaxHealth(PlayerPedId())
    SetEntityHealth(PlayerPedId(), maxHealth)
end

function reviveSelf()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed, true)
    NetworkResurrectLocalPlayer(playerPos, true, true, false)
    SetPlayerInvincible(playerPed, false)
    ClearPedBloodDamage(playerPed)
    SetPedVisble(playerPed)
end

function SetTrafficDensity(density)
    SetParkedVehicleDensityMultiplierThisFrame(density)
    SetVehicleDensityMultiplierThisFrame(density)
    SetRandomVehicleDensityMultiplierThisFrame(density)
end

function SetPedDensity(density)
    SetPedDensityMultiplierThisFrame(density)
    SetScenarioPedDensityMultiplierThisFrame(density)
end

function drawTxt(content, font, color, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1], colour[2], colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

function teleportToWaypoint()
    local waypoint = GetFirstBlipInfoId(8)
    if DoesBlipExist(waypoint) then
        local waypointCoords = GetBlipCoords(waypoint)
        for height = 1,1000 do
            Wait(10)
            local playerPed = GetPlayerPed(-1)
            local foundGround, groundZ = GetGroundZFor3dCoord(waypointCoords.x, waypointCoords.y, height + 0.0)
            if foundGround then
                SetEntityCoordsNoOffset(playerPed, waypointCoords.x, waypointCoords.y, groundZ +2.0, false, false, true)
                break
            end
        end
    else
        notify("No waypoint set.")
    end
end

function EnablePVP(bool)
    local playerPed = PlayerPedId()
    SetCanAttackFriendly(playerPed, bool, true)
    NetworkSetFriendlyFireOption(bool)
end

function SetPedVisible()
    SetEntityVisible(entity, true, 0)
    NetworkSetEntityInvisibleToNetwork(entity, false)
end