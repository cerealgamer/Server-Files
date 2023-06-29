Config = {}

Config.spawnpoint = {
	vector3(-45.393093109131,-1173.7066650391,26.110569000244)
}


RMenu.Add("RESPAWN", "main", RageUI.CreateMenu("Spawn Menu", "~r~Terror Spawn Menu", 1350, 50, "stream", "adminmenu"))
RageUI.CreateWhile(1.0, RMenu:Get("RESPAWN", "main"),nil,function()
	RageUI.IsVisible(RMenu:Get("RESPAWN", "main"),true,true,true, function()
        RageUI.Button("St Thomas Hospital", "", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
                SetEntityCoords(PlayerPedId(), 361.84051513672,-593.13464355469,28.664552688599)
            end
        end)
        RageUI.Button("You Tool", "", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
                SetEntityCoords(PlayerPedId(), 2750.2973632813,3470.5307617188,55.698265075684)
            end
		end)
		RageUI.Button("Scrapyard", "", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
                SetEntityCoords(PlayerPedId(), 1541.11328125,-2146.8479003906,77.475555419922)
            end
		end)
		RageUI.Button("Eastern Motel", "", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
                SetEntityCoords(PlayerPedId(), 358.10925292969,2623.1472167969,44.678703308105)
        	end
		end)
		RageUI.Button("Sandy Hospital", "", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
                SetEntityCoords(PlayerPedId(), 1839.7781982422,3672.0986328125,34.276706695557)
            end
		end)
		RageUI.Button("Mission Row PD", "", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
                SetEntityCoords(PlayerPedId(), 428.19479370117,-981.58215332031,30.710285186768)
        	end
		end)
		RageUI.Button("LSD 7/ 11", "", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
                SetEntityCoords(PlayerPedId(), 2562.3566894531,384.85333251953,108.62047576904)
        	end
		end)
		RageUI.Button("Rebel Diner", "", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
			if Selected then
                SetEntityCoords(PlayerPedId(), 1586.9771728516,6449.7622070313,25.317150115967)
        	end
    	end)
    end)
end)




Ismenuopened = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), false, nil, true

		for k,v in pairs(Config.spawnpoint) do
			local distance = #(playerCoords - v)

			if distance < 120.0 then
				letSleep = false
				if distance < 1.5 then
					isInMarker, currentZone = true, k
				end
			end
		end
		if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
			hasAlreadyEnteredMarker, lastZone = true, currentZone
--			RageUI.Visible(RMenu:Get("RESPAWN", "main"), true)
			Ismenuopened = true
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			RageUI.Visible(RMenu:Get("RESPAWN", "main"), false)
			hasAlreadyEnteredMarker = false
			Ismenuopened = false
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if Ismenuopened then
			FreezeEntityPosition(PlayerPedId(-1), true)
			-- DisableAllControlActions(0)
			-- EnableControlAction(0, 245, true)
			RageUI.Visible(RMenu:Get("RESPAWN", "main"), true)
		else
			FreezeEntityPosition(PlayerPedId(-1), false)
			Citizen.Wait(500)
		end
	end
end)