tvRP = Proxy.getInterface("vRP")

RMenu.Add('seller', 'main', RageUI.CreateMenu("Trader", "~b~Sell your Cocain & Gold", 1300, 0))
RMenu:Get('seller', 'main')

RageUI.CreateWhile(1.0, RMenu:Get('seller', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('seller', 'main'), true, false, true, function()

          RageUI.Button("Cocain", nil, {RightLabel = "£" .. GetMoneyString(cfg["Drugs"]["Cocain"].sell_price)}, true, function(Hovered, Active, Selected)
            if (Selected) then
                local amount = getAmount()
                TriggerServerEvent('trader:sell', "Cocain", "Cocain_bar", amount)
            end
          end, RMenu:Get('seller', 'main'))

          RageUI.Button("Gold", nil, {RightLabel = "£" .. GetMoneyString(cfg["Drugs"]["Gold"].sell_price)}, true, function(Hovered, Active, Selected)
            if (Selected) then
                local amount = getAmount()
                TriggerServerEvent('trader:sell', "Gold", "Gold_bar", amount)
            end
          end, RMenu:Get('seller', 'main'))
  
    end)
  end)

  Citizen.CreateThread(function()
    while (true) do
      Citizen.Wait(0)
  
      local playerCoords = GetEntityCoords(PlayerPedId())
      local dist = #(playerCoords - cfg["Trader"].Coords)
      local HeroinDist = #(playerCoords - cfg["Drugs"]["Heroin"].seller)
  
      if dist < 10.0 then
        DrawMarker(25, cfg["Trader"].Coords.xy, cfg["Trader"].Coords.z - 0.98, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 51, 128, 255, 155, 0, 0, 0, 0, 0, 0, 0)
        
        if dist < 1.0 then
        DrawHelpMsg("Press ~INPUT_CONTEXT~ to open Trader")
          if IsControlJustPressed(1, 51) then
            RageUI.Visible(RMenu:Get('seller', 'main'), not RageUI.Visible(RMenu:Get('seller', 'main')))
          end
        end
      end

      if HeroinDist < 1.0 then
        DrawHelpMsg("Press ~INPUT_CONTEXT~ to Sell Heroin")
          if IsControlJustPressed(1, 51) then
            TriggerServerEvent('Sell:Heroin')
          end
        end
  
    end
  end)

  function DrawHelpMsg(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
  end

  function getAmount()
	AddTextEntry('FMMC_MPM_NA', "Enter Amount (Blank to Cancel)")
	DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Enter Amount (Blank to Cancel)", "", "", "", "", 30)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local result = GetOnscreenKeyboardResult()
		if result then
			return result
		end
    end
	return false
end

Citizen.CreateThread(function()
  blip2 = AddBlipForCoord(cfg["Drugs"]["Heroin"].seller)
  SetBlipSprite(blip2, 586)
  SetBlipScale(blip2, 0.8)
  SetBlipDisplay(blip2, 2)
  SetBlipColour(blip2, 1)
  SetBlipAsShortRange(blip2, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Heroin")
  EndTextCommandSetBlipName(blip2)

end)

Citizen.CreateThread(function()
	local dealerAnimDict = "mini@strip_club@idles@bouncer@base"
	RequestAnimDict(dealerAnimDict)
	while not HasAnimDictLoaded(dealerAnimDict) do
		Wait(0)
	end

	local dealerModel =  GetHashKey("s_m_y_dealer_01")
	RequestModel(dealerModel)
	while not HasModelLoaded(dealerModel) do
		Wait(0)
    end
    
  local coords = cfg["Drugs"]["Heroin"].seller
	local dealerEntity = CreatePed(26,dealerModel,coords-1,0,false,true)
	SetModelAsNoLongerNeeded(dealerModel)     
	SetEntityCanBeDamaged(dealerEntity, 0)
	SetPedAsEnemy(dealerEntity, 0)   
	SetBlockingOfNonTemporaryEvents(dealerEntity, 1)
  SetPedResetFlag(dealerEntity, 249, 1)
	SetPedConfigFlag(dealerEntity, 185, true)
	SetPedConfigFlag(dealerEntity, 108, true)
	SetPedCanEvasiveDive(dealerEntity, 0)
	SetPedCanRagdollFromPlayerImpact(dealerEntity, 0)
	SetPedConfigFlag(dealerEntity, 208, true)       
	--SetEntityCollision(dealerEntity, false)
	FreezeEntityPosition(dealerEntity, true)
	TaskPlayAnim(dealerEntity,dealerAnimDict,"base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
  RemoveAnimDict(dealerAnimDict)
end)

Citizen.CreateThread(function()
  while (true) do
    Citizen.Wait(0)

    local playerCoords = GetEntityCoords(PlayerPedId())
    local dist = #(playerCoords - cfg["Drugs"]["Heroin"].seller)

    if dist < 10.0 then
      DrawMarker(25, 3580.5881347656,3647.3974609375,33.888622283936 - 0.999999, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 2.5, 255, 0, 0, 150, 0, 0, 2, 0, 0, 0, false)
    end

  end
end)
