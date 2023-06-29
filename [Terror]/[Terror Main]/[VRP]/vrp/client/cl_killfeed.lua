local function NotificationCl(text,duration, color)
    Citizen.CreateThread(function()
		if color then SetNotificationBackgroundColor(color) end
		-- PlaySoundFrontend(-1, "OTHER_TEXT", "HUD_AWARDS", 0)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        local Notification = DrawNotification(false, true)
        Citizen.Wait(duration)
        RemoveNotification(Notification)
    end)
end

local function Notification(text, duration)
TriggerServerEvent("kills:_notification", text, duration)
end

RegisterNetEvent("kills:notification")
AddEventHandler("kills:notification", NotificationCl)

AddEventHandler('onPlayerKilled', function(playerId, attackerId, reason, position)
    local player = GetPlayerByServerId(playerId)
    local attacker = GetPlayerByServerId(attackerId)

    local reasonString = 'killed'

    if reason == 0 or reason == 56 or reason == 1 or reason == 2 then
        reasonString = 'meleed'
    elseif reason == 3 then
        reasonString = 'knifed'
    elseif reason == 4 or reason == 6 or reason == 18 or reason == 51 then
        reasonString = 'bombed'
    elseif reason == 5 or reason == 19 then
        reasonString = 'burned'
    elseif reason == 7 or reason == 9 then
        reasonString = 'pistoled'
    elseif reason == 10 or reason == 11 then
        reasonString = 'shotgunned'
    elseif reason == 12 or reason == 13 or reason == 52 then
        reasonString = 'SMGd'
    elseif reason == 14 or reason == 15 or reason == 20 then
        reasonString = 'assaulted'
    elseif reason == 16 or reason == 17 then
        reasonString = 'sniped'
    elseif reason == 49 or reason == 50 then
        reasonString = 'ran over'
    end

    if player and attacker then
        Notification(string.format('<b>%s</b> %s <b>%s</b>.', attacker.name, reasonString, player.name), 5000)
    end
end)

function dieMessage()
	local name = GetPlayerName(PlayerId())
	Notification('<C>~b~'..name..'</C>~s~ died', 5000)
end

RegisterNetEvent('playerDied')
AddEventHandler('playerDied', dieMessage)

function killMessage(killer, killT) -- CALLED FROM DEAD CLIENT
	local name = GetPlayerName(PlayerId())
	local killer = GetPlayerFromServerId(killer)
	local killerName = GetPlayerName(killer)

	if killerName == '**Invalid**' then
		-- killerName = "A.I."
		dieMessage()
		return
	end

	local killed = 'killed'
	car = ''

	Notification('<C>~o~'..killerName..'</C>~s~ '..killed..' <C>~o~'..name..'</C>'..car, 5000)
end

RegisterNetEvent('playerKilled')
AddEventHandler('playerKilled', killMessage)