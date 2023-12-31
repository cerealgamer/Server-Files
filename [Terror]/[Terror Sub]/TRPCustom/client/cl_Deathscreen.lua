vRPClient = {}
Tunnel.bindInterface("Custom3",vRPClient)
Proxy.addInterface("Custom3",vRPClient)
vRPServer = Tunnel.getInterface("Custom3","Custom3")
vRP = Proxy.getInterface("vRP")

local respawnTimer = 0
local inClientComa = false
local isPlayerNHS = false

-- MAIN THREAD


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if inClientComa and respawnTimer > 1 then

			if not calledNHS then
				if IsControlJustPressed(1, 51) then
					calledNHS = true
					notify('~g~NHS Called')
					TriggerServerEvent('CallManager:AddNHSCalls', 'Help i have Died!')
				end
			end

			DrawRect(0.51, 0.748, 0.38, 0.036, 0, 0, 0, 150, 0)
			DrawRect(0.494, 0.75, 1.125, 0.17, 0, 0, 0, 150, 0)

			if not calledNHS then
				DrawAdvancedText(0.605, 0.803, 0.005, 0.0028, 0.37, "Press [E] to call the NHS", 255, 255, 255, 255, 6, 0)
			end
			
			DrawAdvancedText(0.605, 0.75, 0.005, 0.0028, 0.37, "Respawn available in ("..respawnTimer.." seconds)", 255, 255, 255, 255, 6, 0)
		end
		if inClientComa and respawnTimer <= 1 then
			DrawRect(0.51, 0.748, 0.38, 0.036, 0, 0, 0, 150, 0)
			DrawRect(0.494, 0.75, 1.125, 0.17, 0, 0, 0, 150, 0)
			DrawAdvancedText(0.605, 0.803, 0.005, 0.0028, 0.37, "Press [E] to respawn!", 238, 18, 32, 255, 6, 0)
		end
		if inClientComa and respawnTimer == 0 and IsControlJustPressed(1, 51) then
			respawnTimer = 0
			SpawnPlayer()
		end
	end
end)

local function SetRespawnTimer(time)
	if respawnTimer == 0 and not inClientComa then
		respawnTimer = time
	end
end

Citizen.CreateThread(function()
  while true do
	Citizen.Wait(100)
	  if vRP.isInComa({}) and not inClientComa then
		SetRespawnTimer(60)
		inClientComa = true
		calledNHS = false
	 end

	 if inClientComa and not vRP.isInComa({}) then
		inClientComa = false
		respawnTimer = 0
	 end
   end
end)

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(1000)
	  if (respawnTimer > 0) then
		respawnTimer = respawnTimer-1
	 end
	end
  end)

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
   -- SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification( false, false)
end

function SpawnPlayer()
	vRP.killComa({})
	Citizen.Wait(250)
	inClientComa = false
end

RegisterNetEvent('TerrorRP:ClearDeathscreen')
AddEventHandler('TerrorRP:ClearDeathscreen', function()
	inClientComa = false
	respawnTimer = 0
end)


