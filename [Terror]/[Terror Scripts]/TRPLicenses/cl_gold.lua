Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerCoords = GetEntityCoords(PlayerPedId())
        local gatherCoords = cfg["Drugs"]["Gold"].gather

        if #(playerCoords - gatherCoords) <= 40.0 then
            if IsControlJustPressed(1, 51) then
                TriggerServerEvent('Gather', 'Gold')
            end
        end

        local process_coords = cfg["Drugs"]["Gold"].processing
        if #(playerCoords - process_coords) <= 40.0 then
            if IsControlJustPressed(1, 51) then
                TriggerServerEvent('Process', 'Gold', 'Gold_bar')
            end
        end
    end
end)

Citizen.CreateThread(function()
  blip = AddBlipForCoord(cfg["Drugs"]["Gold"].gather)
  SetBlipSprite(blip, 557)
  SetBlipScale(blip, 1.0)
  SetBlipDisplay(blip, 2)
  SetBlipColour(blip, 5)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Gold Gathering")
  EndTextCommandSetBlipName(blip)

  blip2 = AddBlipForCoord(cfg["Drugs"]["Gold"].processing)
  SetBlipSprite(blip2, 557)
  SetBlipScale(blip2, 0.7)
  SetBlipDisplay(blip2, 2)
  SetBlipColour(blip2, 5)
  SetBlipAsShortRange(blip2, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Gold Processing")
  EndTextCommandSetBlipName(blip2)

end)