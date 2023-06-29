tvRP = Proxy.getInterface("vRP")

RMenu.Add('smallarms', 'main', RageUI.CreateMenu("Small Arms", "~r~Small Arms", 1300, 0, "stream", "adminmenu"))
RMenu:Get('smallarms', 'main')

RageUI.CreateWhile(1.0, RMenu:Get('smallarms', 'main'), nil, function()
  RageUI.IsVisible(RMenu:Get('smallarms', 'main'), true, false, true, function()
    for WeaponName,WeaponInfo in pairs(cfg["Small Arms"]["Weapons"]) do

      RageUI.Button(WeaponName, nil, {RightLabel = "£" .. GetMoneyString(WeaponInfo.price)}, true, function(Hovered, Active, Selected)
        if Selected then
          TriggerServerEvent('WeaponShop:BuyWeapon', WeaponName, "Small Arms")
        end
      end, RMenu:Get('smallarms', 'main'))

    end
  end)
end)

Citizen.CreateThread(function()
  while (true) do
    Citizen.Wait(0)

    local playerCoords = GetEntityCoords(PlayerPedId())
    local dist = #(playerCoords - cfg["Small Arms"].Coords)
    local dist2 = #(playerCoords - cfg["Small Arms"].Coords2)

    if dist < 10.0 then
      DrawMarker(25, cfg["Small Arms"].Coords.xy, cfg["Small Arms"].Coords.z - 0.98, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 255, 51, 51, 155, 0, 0, 0, 0, 0, 0, 0)
      if dist < 1.0 then
        DrawHelpMsg("Press ~INPUT_CONTEXT~ to open Small Arms")
        if IsControlJustPressed(1, 51) then
          RageUI.Visible(RMenu:Get('smallarms', 'main'), not RageUI.Visible(RMenu:Get('smallarms', 'main')))
        end
      end
    end


    if dist2 < 10.0 then
      DrawMarker(25, cfg["Small Arms"].Coords2.xy, cfg["Small Arms"].Coords2.z - 0.98, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 255, 51, 51, 155, 0, 0, 0, 0, 0, 0, 0)
      if dist2 < 1.0 then
        DrawHelpMsg("Press ~INPUT_CONTEXT~ to open Small Arms")
        if IsControlJustPressed(1, 51) then
          RageUI.Visible(RMenu:Get('smallarms', 'main'), not RageUI.Visible(RMenu:Get('smallarms', 'main')))
        end
      end
    end

  end
end)

function GetMoneyString(cashString)
	local i, j, minus, int, fraction = tostring(cashString):find('([-]?)(%d+)([.]?%d*)')
	int = int:reverse():gsub("(%d%d%d)", "%1,")
	return minus .. int:reverse():gsub("^,", "") .. fraction 
end

RegisterNetEvent('Client:NotifyString')
AddEventHandler('Client:NotifyString', function(string)
  notify(string)
end)

function notify(string)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(string)
  DrawNotification(true, false)
end

RegisterNetEvent('GiveWepHash')
AddEventHandler('GiveWepHash', function(hash)
  notify('~g~Bought Weapon')
  GiveWeaponToPed(PlayerPedId(), GetHashKey(hash), 250, false, false)
end)

function DrawHelpMsg(msg)
  SetTextComponentFormat("STRING")
  AddTextComponentString(msg)
  DisplayHelpTextFromStringLabel(0,0,1,-1)
end

Citizen.CreateThread(function()
  blip = AddBlipForCoord(cfg["Small Arms"].Coords)
  SetBlipSprite(blip, 567)
  SetBlipScale(blip, 1.0)
  SetBlipDisplay(blip, 2)
  SetBlipColour(blip, 1)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Small Arms")
  EndTextCommandSetBlipName(blip)

  blip2 = AddBlipForCoord(cfg["Small Arms"].Coords2)
  SetBlipSprite(blip2, 567)
  SetBlipScale(blip2, 1.0)
  SetBlipDisplay(blip2, 2)
  SetBlipColour(blip2, 1)
  SetBlipAsShortRange(blip2, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Small Arms")
  EndTextCommandSetBlipName(blip2)
end)