local staffPed = "a_m_y_motox_01" --- need you to change to the staffped code
local originalPed
local permission = "vrp.adminmenu"

-- Register the command "staffon" for players to change into the staff ped
RegisterCommand("staffon", function(source, args, rawCommand)
    -- Get the player's current ped
    originalPed = GetEntityModel(GetPlayerPed(-1))
    -- Change the player's ped to the staff ped
    if IsModelInCdimage(staffPed) and IsModelValid(staffPed) then
      RequestModel(staffPed)
      while not HasModelLoaded(staffPed) do
        Citizen.Wait(0)
      end
      SetPlayerModel(PlayerId(), staffPed)
      SetTextComponentFormat("STRING")
        AddTextComponentString("Staff Mode: On")
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        SetPlayerInvincible(PlayerId(), true)
    else
    end
end)

-- Register the command "staffoff" for players to change back to their original ped
RegisterCommand("staffoff", function(source, args, rawCommand)
    -- Change the player's ped back to their original ped
    RequestModel(originalPed)
    while not HasModelLoaded(originalPed) do
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), originalPed)
    SetTextComponentFormat("STRING")
    AddTextComponentString("Staff Mode: Off")
    SetTextCentre(true)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
    SetPlayerInvincible(PlayerId(), false)
end)
