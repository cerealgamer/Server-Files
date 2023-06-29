--- --- --- --- --- --- --- --- --- --- ---
--- --- --- Cloned's Anticheat! --- --- ---
--- --- --- --- --- --- --- --- --- --- ---
	--- --- Weapon Blacklist --- --- 
	--- --- --- --- --- --- ---  ---

weaponblacklist = {
	"WEAPON_MACHETE",
	"WEAPON_SWITCHBLADE",
	"WEAPON_POOLCUE",
	"WEAPON_DAGGER",
	"WEAPON_CROWBAR",
	"WEAPON_KNIFE",
	"WEAPON_KNUCKLE", 
	"WEAPON_HAMMER", 
	"WEAPON_GOLFCLUB",
	"WEAPON_BOTTLE", 
	"WEAPON_HATCHET", 
	"WEAPON_FLASHLIGHT", 
	"WEAPON_PROXMINE", 
	"WEAPON_BZGAS", 
	"WEAPON_SMOKEGRENADE", 
	"WEAPON_MOLOTOV", 
	"WEAPON_FIREEXTINGUISHER", 
	"WEAPON_PETROLCAN", 
	"WEAPON_HAZARDCAN", 
	"WEAPON_SNOWBALL", 
	"WEAPON_FLARE", 
	"WEAPON_BALL", 
	"WEAPON_REVOLVER", 
	"WEAPON_PIPEWRENCH",
	"WEAPON_PISTOL_MK2", 
	"WEAPON_COMBATPISTOL", 
	"WEAPON_APPISTOL", 
	"WEAPON_PISTOL50", 
	"WEAPON_SNSPISTOL", 
	"WEAPON_HEAVYPISTOL", 
	"WEAPON_VINTAGEPISTOL", 
	"WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL", 
	"WEAPON_MICROSMG", 
	"WEAPON_MINISMG", 
	"WEAPON_SMG_MK2", 
	"WEAPON_ASSAULTSMG", 
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_COMBATPDW",
	"WEAPON_GUSENBERG", 
	"WEAPON_MACHINEPISTOL",
	"WEAPON_ASSAULTRIFLE", 
	"WEAPON_ASSAULTRIFLE_MK2", 
	"WEAPON_CARBINERIFLE", 
	"WEAPON_CARBINERIFLE_MK2", 
	"WEAPON_ADVANCEDRIFLE", 
	"WEAPON_SPECIALCARBINE",
	"WEAPON_BULLPUPRIFLE", 
	"WEAPON_COMPACTRIFLE",
	"WEAPON_PUMPSHOTGUN", 
	"WEAPON_SWEEPERSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN", 
	"WEAPON_BULLPUPSHOTGUN", 
	"WEAPON_ASSAULTSHOTGUN", 
	"WEAPON_MUSKET", 
	"WEAPON_HEAVYSHOTGUN", 
	"WEAPON_DBSHOTGUN", 
	"WEAPON_SNIPERRIFLE", 
	"WEAPON_HEAVYSNIPER", 
	"WEAPON_HEAVYSNIPER_MK2", 
	"WEAPON_MARKSMANRIFLE", 
	"WEAPON_GRENADELAUNCHER", 
	"WEAPON_GRENADELAUNCHER_SMOKE", 
	"WEAPON_RPG", 
	"WEAPON_MINIGUN", 
	"WEAPON_FIREWORK", 
	"WEAPON_RAILGUN", 
	"WEAPON_HOMINGLAUNCHER", 
	"WEAPON_GRENADE", 
	"WEAPON_STICKYBOMB", 
	"WEAPON_COMPACTLAUNCHER", 
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_REVOLVER_MK2", 
	"WEAPON_DOUBLEACTION",
	"WEAPON_SPECIALCARBINE_MK2", 
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_MARKSMANRIFLE_MK2", 
	"WEAPON_RAYPISTOL", 
	"WEAPON_RAYCARBINE", 
	"WEAPON_RAYMINIGUN",
	"WEAPON_NAVYREVOLVER", 
	"WEAPON_CERAMICPISTOL", 
	"WEAPON_STONE_HATCHET",
	"WEAPON_PIPEBOMB", 
	"GADGET_PARACHUTE",
	"WEAPON_PASSENGER_ROCKET"
}

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)

			if disableallweapons then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBlacklisted(weapon) then
					RemoveWeaponFromPed(playerPed, weapon)
					notify("~r~[Anticheat]: ~b~This weapon is blacklisted!")
				end
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end

	return false
end

-- Notify Function [Don't recommend touching!] --
function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end