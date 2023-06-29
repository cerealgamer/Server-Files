Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(0)
        local armor = GetPedArmour(PlayerPedId())
        if armor > 99 then
            TriggerServerEvent('vRP:ACBan')
            SetPedArmour(PlayerPedId(), 0)
            break;
        end
    end
end)

--Citizen.CreateThread(function()
  --  Wait(1000)
   -- local oldPos = GetEntityCoords(PlayerPedId())
  --  while true do
     ---   local newPos = GetEntityCoords(PlayerPedId())

     --   local dist = #(oldPos-newPos)
     --   oldPos = newPos
      --  if dist > 10 and not IsPedFalling(PlayerPedId()) and not IsPedInParachuteFreeFall(PlayerPedId()) then
        --    if not IsPedInAnyVehicle(PlayerPedId(), 1) then
           --     speedWarnings = speedWarnings + 1
           --     if speedWarnings > 50 then
            --        TriggerServerEvent('vRP:ACBan', 'Noclip')
             --       speedWarnings = 0
             --       break;
           --     end
        --    end
       -- end
       -- Wait(100)
   -- end
--end)

--Citizen.CreateThread(function()
  --  while true do
    --    speedWarnings = 0
end     --   Wait(60000)
  --  end
--)


