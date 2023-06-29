Citizen.CreateThread(function()
	while true do
		TriggerServerEvent('Terror:getUserIdRP')
		Citizen.Wait(600000)
	end
end)

local user_id = nil

RegisterNetEvent('Terror:giveRichPresence')
AddEventHandler('Terror:giveRichPresence', function(user_id)
	if user_id ~= nil then 
		SetDiscordAppId(821797893861408859)
		SetDiscordRichPresenceAsset('terror')
		SetDiscordRichPresenceAssetText("TerrorRP | British RP")
		SetRichPresence("[ID: "..user_id.."] | "..#GetActivePlayers().. "/64")

		--faded pussies
		SetDiscordRichPresenceAction(0, "Join TerrorRP", "fivem://connect/87.237.52.175:30120")
        SetDiscordRichPresenceAction(1, "Discord", "https://discord.gg/terror5m")
	end
end)

