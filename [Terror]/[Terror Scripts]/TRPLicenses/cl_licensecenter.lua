tvRP = Proxy.getInterface("vRP")

RMenu.Add('licenesecenter', 'main', RageUI.CreateMenu("Licenses Shop", "~r~Licenses Center", 1300, 0, "stream", "adminmenu"))
RMenu:Get('licenesecenter', 'main')

RageUI.CreateWhile(1.0, RMenu:Get('licenesecenter', 'main'), nil, function()
  RageUI.IsVisible(RMenu:Get('licenesecenter', 'main'), true, false, true, function()

      for k,v in pairs(cfg["Drugs"]) do

        RageUI.Button(k, nil, {RightLabel = "£" .. GetMoneyString(cfg["Drugs"][k].price)}, true, function(Hovered, Active, Selected)
          if (Selected) then
            TriggerServerEvent('Buy:Lic', k)
          end
        end, RMenu:Get('licenesecenter', 'main'))

      end

  end)
end)

Citizen.CreateThread(function()
  while (true) do
    Citizen.Wait(0)

    local playerCoords = GetEntityCoords(PlayerPedId())
    local dist = #(playerCoords - cfg["License"].Coords)

    if dist < 10.0 then
      DrawMarker(25, cfg["License"].Coords.xy, cfg["License"].Coords.z - 0.98, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 51, 128, 255, 155, 0, 0, 0, 0, 0, 0, 0)
      
      if dist < 1.0 then
          DrawHelpMsg("Press ~INPUT_CONTEXT~ to open licence center.")
        if IsControlJustPressed(1, 51) then
          RageUI.Visible(RMenu:Get('licenesecenter', 'main'), not RageUI.Visible(RMenu:Get('licenesecenter', 'main')))
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

RegisterNetEvent("Try:Process")
AddEventHandler("Try:Process",function(type, final)
  local player = GetPlayerPed(-1)
  RequestAnimDict("melee@large_wpn@streamed_core")
  while not HasAnimDictLoaded("melee@large_wpn@streamed_core") do
      Wait(0)
  end

  pickaxe = CreateObject(GetHashKey("prop_tool_pickaxe"), 0, 0, 0, true, true, true) 
  AttachEntityToEntity(pickaxe, player, GetPedBoneIndex(player, 57005), 0.18, -0.02, -0.02, 350.0, 100.00, 140.0, true, true, false, true, 1, true)

  FreezeEntityPosition(PlayerPedId(), true)
  TaskPlayAnim(player, 'melee@large_wpn@streamed_core', 'ground_attack_on_spot', 8.0, 8.0, 1250, 80, 0, 0, 0, 0)
  Wait(1500)
  TaskPlayAnim(player, 'melee@large_wpn@streamed_core', 'ground_attack_on_spot', 8.0, 8.0, 1250, 80, 0, 0, 0, 0)
  Wait(1500)
  TaskPlayAnim(player, 'melee@large_wpn@streamed_core', 'ground_attack_on_spot', 8.0, 8.0, 1250, 80, 0, 0, 0, 0)
  Wait(1500)
  TaskPlayAnim(player, 'melee@large_wpn@streamed_core', 'ground_attack_on_spot', 8.0, 8.0, 1250, 80, 0, 0, 0, 0)
  Wait(1500)
  ClearPedTasksImmediately(player)
  FreezeEntityPosition(PlayerPedId(), false)
  DeleteEntity(pickaxe)
  TriggerServerEvent('Ended:Processing', type, final)
end)

RegisterNetEvent('Try:Gather')
AddEventHandler('Try:Gather', function(type)
  local player = PlayerPedId()
  TaskStartScenarioInPlace(player,"WORLD_HUMAN_GARDENER_PLANT", 0, true)
  Citizen.Wait(5000)
  ClearPedTasks(player)
  Citizen.Wait(3000)
  ClearPedTasksImmediately(player)
  TriggerServerEvent('Ended:Gathering', type)
end)

function LoadModel(modelName)
  local modelHash
  if (type(modelName) ~= "string") then 
      modelHash = modelName
  else
      modelHash = GetHashKey(modelName)
  end
  if not HasModelLoaded(modelHash) then
      RequestModel(modelHash)
      while not HasModelLoaded(modelHash) do
          Wait(0)
      end
  end
  return modelHash
end

Citizen.CreateThread(function()
  blip = AddBlipForCoord(cfg["License"].Coords)
  SetBlipSprite(blip, 457)
  SetBlipScale(blip, 1.0)
  SetBlipDisplay(blip, 2)
  SetBlipColour(blip, 2)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("License Center")
  EndTextCommandSetBlipName(blip)
end)