globalInRedzone = false

local combatTimer = 30
local redzoneCfg = {
  -- ["Bandit"] = {vector3(2384.8393554688,3080.80078125,48.162200927734),0.0},
  ["Diamond"] = {vector3(3524.685546875,3722.6999511719,77.021446228027),200.0 },
  ["Large Arms"] = {vector3(1341.2395019532,4328.4223632812,38.077922821044),100.0 },
  ["Rebel"] = {vector3(1479.7166748046,6324.5131835938,26.45866394043),90.0 },
  ["Smeltery"] = {vector3(1095.5245361328,-1998.486328125,29.54412651062),100.0}
}

local function getNonZDistance(vector1,vector2)
    return #(vector3(vector1.x,vector1.y,0.0)-vector3(vector2.x,vector2.y,0.0))
end

Citizen.CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        globalInRedzone = false
        for redZone,v in pairs(redzoneCfg) do
            local zoneVector = v[1]
            local zoneRadius = v[2]
            if #(playerCoords-zoneVector) <= zoneRadius then
                globalInRedzone = true
                local playerCoords = GetEntityCoords(PlayerPedId())
                combatTimer = 30
                local lastSavedGoodPos
                local startRed = false
                while not startRed do
                    playerCoords = GetEntityCoords(PlayerPedId())
                    while getNonZDistance(playerCoords,zoneVector) <= zoneRadius do
                        playerCoords = GetEntityCoords(PlayerPedId())
                        lastSavedGoodPos = playerCoords
                        if IsDisabledControlJustPressed(0, 24) and GetSelectedPedWeapon(PlayerPedId()) ~= `WEAPON_UNARMED` then
                            combatTimer = 30
                        end
                        if combatTimer == 0 then
                            DrawAdvancedText(0.931, 0.914, 0.005, 0.0028, 0.49, "Combat Timer ended, you may leave.", 255, 51, 51, 255, 7, 0)
                        else
                            DrawAdvancedText(0.931, 0.914, 0.005, 0.0028, 0.49, "Combat Timer: " .. combatTimer .. " seconds", 255, 51, 51, 255, 7, 0)
                        end
                        Wait(0)
                    end
                    if combatTimer == 0 then
                        startRed = true
                    else
                        local lineVector = v[1] - GetEntityCoords(PlayerPedId())
                        lastSavedGoodPos = lastSavedGoodPos + (lineVector * 0.01)
                        
                        if GetVehiclePedIsIn(PlayerPedId(),false) == 0 then
                            TaskGoStraightToCoord(PlayerPedId(), lastSavedGoodPos.x, lastSavedGoodPos.y,lastSavedGoodPos.z, 8.0, 1000, GetEntityHeading(PlayerPedId()), 0.0)
                        else
                            SetEntityCoords(PlayerPedId(), lastSavedGoodPos.x, lastSavedGoodPos.y,lastSavedGoodPos.z)
                        end
                        SetTimeout(1000,function()
                            ClearPedTasks(PlayerPedId())
                        end)
                    end
                    Wait(0)
                end
            end
        end
        Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do
        if combatTimer > 0 then
            combatTimer = combatTimer - 1
        end
        Wait(1000)
    end
end)