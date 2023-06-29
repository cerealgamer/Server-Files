tvRP = Proxy.getInterface("vRP")

RMenu.Add('shankshop', 'main', RageUI.CreateMenu("Shank Shop", "~r~Shank Shop", 1300, 0, "stream", "adminmenu"))
RMenu:Get('shankshop', 'main')

RageUI.CreateWhile(1.0, RMenu:Get('shankshop', 'main'), nil, function()
  RageUI.IsVisible(RMenu:Get('shankshop', 'main'), true, false, true, function()
    for WeaponName,WeaponInfo in pairs(cfg["Shank Shop"]["Weapons"]) do

      RageUI.Button(WeaponName, nil, {RightLabel = "£" .. GetMoneyString(WeaponInfo.price)}, true, function(Hovered, Active, Selected)
        if Selected then
          TriggerServerEvent('WeaponShop:BuyWeapon', WeaponName, "Shank Shop")
        end
      end, RMenu:Get('shankshop', 'main'))

    end
  end)
end)

Citizen.CreateThread(function()
  while (true) do
    Citizen.Wait(0)

    local playerCoords = GetEntityCoords(PlayerPedId())
    local dist = #(playerCoords - cfg["Shank Shop"].Coords)

    if dist < 10.0 then
      DrawMarker(25, cfg["Shank Shop"].Coords.xy, cfg["Shank Shop"].Coords.z - 0.98, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 255, 51, 51, 155, 0, 0, 0, 0, 0, 0, 0)
      if dist < 1.0 then
        DrawHelpMsg("Press ~INPUT_CONTEXT~ to open Shank Shop")
        if IsControlJustPressed(1, 51) then
          RageUI.Visible(RMenu:Get('shankshop', 'main'), not RageUI.Visible(RMenu:Get('shankshop', 'main')))
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  blip = AddBlipForCoord(cfg["Shank Shop"].Coords)
  SetBlipSprite(blip, 154)
  SetBlipScale(blip, 1.0)
  SetBlipDisplay(blip, 2)
  SetBlipColour(blip, 1)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Shank Shop")
  EndTextCommandSetBlipName(blip)
end)