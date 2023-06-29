Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerCoords = GetEntityCoords(PlayerPedId())
        local gatherCoords = cfg["Drugs"]["Cocain"].gather

        if #(playerCoords - gatherCoords) <= 40.0 then
            if IsControlJustPressed(1, 51) then
                TriggerServerEvent('Gather', 'Cocain')
            end
        end

        local process_coords = cfg["Drugs"]["Cocain"].processing
        if #(playerCoords - process_coords) <= 40.0 then
            if IsControlJustPressed(1, 51) then
                TriggerServerEvent('Process', 'Cocain', 'Cocain_bar')
            end
        end
    end
end)

Citizen.CreateThread(function()
  blip = AddBlipForCoord(cfg["Drugs"]["Cocain"].gather)
  SetBlipSprite(blip, 479)
  SetBlipScale(blip, 1.0)
  SetBlipDisplay(blip, 2)
  SetBlipColour(blip, 39)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Cocain Gathering")
  EndTextCommandSetBlipName(blip)

  blip2 = AddBlipForCoord(cfg["Drugs"]["Cocain"].processing)
  SetBlipSprite(blip2, 479)
  SetBlipScale(blip2, 0.7)
  SetBlipDisplay(blip2, 2)
  SetBlipColour(blip2, 39)
  SetBlipAsShortRange(blip2, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Cocain Processing")
  EndTextCommandSetBlipName(blip2)

end)