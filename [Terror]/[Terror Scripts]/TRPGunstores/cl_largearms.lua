tvRP = Proxy.getInterface("vRP")
local action = nil

RMenu.Add('largearms', 'main', RageUI.CreateMenu("Large Arms", "~r~Large Arms", 1300, 0, "stream", "adminmenu"))
RMenu.Add("largearms", "submenu", RageUI.CreateSubMenu(RMenu:Get("largearms", "main",  1300, 0)))
RMenu:Get('largearms', 'main')

RageUI.CreateWhile(1.0, RMenu:Get('largearms', 'submenu'), nil, function()
  RageUI.IsVisible(RMenu:Get('largearms', 'submenu'), true, false, true, function()
    if action == "Weapons" then
      for k,v in pairs(cfg["Large Arms"]["Weapons"]) do

        RageUI.Button(k, nil, {RightLabel = "£" .. GetMoneyString(v.price)}, true, function(Hovered, Active, Selected)
          if (Selected) then
            TriggerServerEvent('WeaponShop:BuyWeapon', k, "Large Arms")
          end
        end, RMenu:Get('largearms', 'submenu'))

      end
    else

      if weaponWhitelists ~= nil then
        for i,x in pairs(weaponWhitelists) do

          RageUI.Button(x.name, nil, {RightLabel = "£" .. GetMoneyString(x.price)}, true, function(Hovered, Active, Selected)
            if (Selected) then
              TriggerServerEvent('WeaponShop:BuyWhitelistedWeapon', x.hash, x.price)
            end
          end, RMenu:Get('largearms', 'submenu'))

        end
      end
    end
  end)
end)


RageUI.CreateWhile(1.0, RMenu:Get('largearms', 'main'), nil, function()
  RageUI.IsVisible(RMenu:Get('largearms', 'main'), true, false, true, function()

      RageUI.Button("Weapons", nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
        if (Active) then

        end
        if (Hovered) then

        end
        if (Selected) then
          action = "Weapons"
        end
      end, RMenu:Get('largearms', 'submenu'))

      RageUI.Button("Whitelists", nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
        if (Active) then

        end
        if (Hovered) then

        end
        if (Selected) then
          action = "Whitelist"
        end
      end, RMenu:Get('largearms', 'submenu'))

  end)
end)

Citizen.CreateThread(function()
  while (true) do
    Citizen.Wait(0)

    local playerCoords = GetEntityCoords(PlayerPedId())
    local dist = #(playerCoords - cfg["Large Arms"].Coords)

    if dist < 10.0 then
      DrawMarker(25, cfg["Large Arms"].Coords.xy, cfg["Large Arms"].Coords.z - 0.98, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 255, 51, 51, 155, 0, 0, 0, 0, 0, 0, 0)      
      if dist < 1.0 then
        DrawHelpMsg("Press ~INPUT_CONTEXT~ to open Large Arms")
        if IsControlJustPressed(1, 51) then
          TriggerServerEvent('WeaponShop:GetWhitelistTable')
          RageUI.Visible(RMenu:Get('largearms', 'main'), not RageUI.Visible(RMenu:Get('largearms', 'main')))
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
  blip = AddBlipForCoord(cfg["Large Arms"].Coords)
  SetBlipSprite(blip, 150)
  SetBlipScale(blip, 1.0)
  SetBlipDisplay(blip, 2)
  SetBlipColour(blip, 1)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Large Arms")
  EndTextCommandSetBlipName(blip)
end)