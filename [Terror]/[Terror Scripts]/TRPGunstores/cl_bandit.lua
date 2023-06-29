tvRP = Proxy.getInterface("vRP")
local action = nil

RMenu.Add('Bandit', 'main', RageUI.CreateMenu("Rebel", "~b~Rebel", 1300, 0))
RMenu.Add("Bandit", "submenu", RageUI.CreateSubMenu(RMenu:Get("Bandit", "main",  1300, 0)))
RMenu:Get('Bandit', 'main')

RageUI.CreateWhile(1.0, RMenu:Get('Bandit', 'submenu'), nil, function()
  RageUI.IsVisible(RMenu:Get('Bandit', 'submenu'), true, false, true, function()
    if action == "Weapons" then
      for k,v in pairs(cfg["Bandit"]["Weapons"]) do

        RageUI.Button(k, nil, {RightLabel = "£" .. GetMoneyString(v.price)}, true, function(Hovered, Active, Selected)
          if (Selected) then
            TriggerServerEvent('WeaponShop:BuyWeapon', k, "Bandit")
          end
        end, RMenu:Get('Bandit', 'submenu'))

      end
    else

      if weaponWhitelists ~= nil then
        for i,x in pairs(weaponWhitelists) do

          RageUI.Button(x.name, nil, {RightLabel = "£" .. GetMoneyString(x.price)}, true, function(Hovered, Active, Selected)
            if (Selected) then
              TriggerServerEvent('WeaponShop:BuyWhitelistedWeapon', x.hash, x.price)
            end
          end, RMenu:Get('Bandit', 'submenu'))

        end
      end
    end
  end)
end)


RageUI.CreateWhile(1.0, RMenu:Get('Bandit', 'main'), nil, function()
  RageUI.IsVisible(RMenu:Get('Bandit', 'main'), true, false, true, function()

      RageUI.Button("Weapons", nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
        if (Active) then

        end
        if (Hovered) then

        end
        if (Selected) then
          action = "Weapons"
        end
      end, RMenu:Get('Bandit', 'submenu'))

      RageUI.Button("Whitelists", nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
        if (Active) then

        end
        if (Hovered) then

        end
        if (Selected) then
          action = "Whitelist"
        end
      end, RMenu:Get('Bandit', 'submenu'))

  end)
end)

Citizen.CreateThread(function()
  while (true) do
    Citizen.Wait(0)

    local playerCoords = GetEntityCoords(PlayerPedId())
    local dist = #(playerCoords - cfg["Bandit"].Coords)

    if dist < 10.0 then
      DrawMarker(25, cfg["Bandit"].Coords.xy, cfg["Bandit"].Coords.z - 0.98, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 255, 51, 51, 155, 0, 0, 0, 0, 0, 0, 0)      
      if dist < 1.0 then
        DrawHelpMsg("Press ~INPUT_CONTEXT~ to open Rebel")
        if IsControlJustPressed(1, 51) then
          TriggerServerEvent('WeaponShop:GetWhitelistTable')
          RageUI.Visible(RMenu:Get('Bandit', 'main'), not RageUI.Visible(RMenu:Get('Bandit', 'main')))
        end
      end
    end

  end
end)


RegisterNetEvent('WeaponShop:SendWhitelists')
AddEventHandler('WeaponShop:SendWhitelists', function(gunTable)
  weaponWhitelists = gunTable
end)

Citizen.CreateThread(function()
  blip = AddBlipForCoord(cfg["Bandit"].Coords)
  SetBlipSprite(blip, 378)
  SetBlipScale(blip, 1.0)
  SetBlipDisplay(blip, 2)
  SetBlipColour(blip, 1)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Rebel")
  EndTextCommandSetBlipName(blip)
end)