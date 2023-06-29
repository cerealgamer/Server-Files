Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerCoords = GetEntityCoords(PlayerPedId())
        local gatherCoords = cfg["Drugs"]["Heroin"].gather

        if #(playerCoords - gatherCoords) <= 40.0 then
            if IsControlJustPressed(1, 51) then
                TriggerServerEvent('Gather', 'Heroin')
                Wait(10000)
            end
        end

        local process_coords = cfg["Drugs"]["Heroin"].processing
        if #(playerCoords - process_coords) <= 40.0 then
            if IsControlJustPressed(1, 51) then
                TriggerServerEvent('Process', 'Heroin', 'Diamond_bar')
            end
        end
    end
end)
