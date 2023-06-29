--- --- --- --- --- --- --- --- --- --- ---
--- --- --- Cloned's Anticheat! --- --- ---
--- --- --- --- --- --- --- --- --- --- ---
	--- --- Weapon Blacklist --- --- 
	--- --- --- --- --- --- ---  ---
	
carblacklist = {
	'RHINO',
	'AKULA',
	'SAVAGE',
	'HUNTER',
	'BUZZARD',
	'BUZZARD2',
	'ANNIHILATOR',
	'VALKYRIE',
	'HYDRA',
	'APC',
	'Trailersmall2',
	'Lazer',
	'oppressor',
	'mogul',
	'barrage',
	'Khanjali',
	'volatol',
	'chernobog',
	'avenger',
	'stromberg',
	'nightshark',
	'besra',
	'babushka ',
	'starling',
	'insurgent',
	'cargobob',
	'cargobob2',
	'cargobob3',
	'cargobob4',
	'caracara',
	'deluxo',
	'menacer',
    'scramjet',
    'oppressor2',
    'revolter',
    'viseris',
    'savestra',
    'thruster',
    'ardent',
    'dune3',
    'tampa3',
    'halftrack',
    'nokota',
    'strikeforce',
    'bombushka',
    'molotok',
    'pyro',
    'ruiner2',
    'limo2',
    'technical',
    'technical2',
    'technical3',
    'jb700w',
    'blazer5',
    'insurgent3',
	'boxville5',
	'bruiser',
    'bruiser2',
    'bruiser3',
    'brutus',
    'brutus2',
    'brutus3',
    'cerberus',
    'cerberus2',
    'cerberus3',
    'dominator4',
    'dominator5',
    'dominator6',
    'impaler2',
    'impaler3',
    'impaler4',
    'imperator',
    'imperator2',
    'imperator3',
    'issi4',
    'issi5',
    'issi6',
    'monster3',
    'monster4',
    'monster5',
    'scarab',
    'scarab2',
    'scarab3',
    'slamvan4',
    'slamvan5',
    'slamvan6',
    'zr380',
    'zr3802',
    'zr3803',
	'alphaz1',
	'avenger2',
	'blimp',
	'blimp2',
	'blimp3',
	'cargoplane',
	'cuban800',
	'dodo',
	'duster',
	'howard',
	'jet',
	'luxor',
	'luxor2',
	'mammatus',
	'microlight',
	'miljet',
	'nimbus',
	'rogue',
	'seabreeze',
	'shamal',
	'stunt',
	'titan',
	'tula',
	'velum',
	'velum2',
	'vestra'
}

Citizen.CreateThread(function()
    while true do
        Wait(1)

        playerPed = GetPlayerPed(-1)
        if playerPed then
            checkCar(GetVehiclePedIsIn(playerPed, false))
        end
    end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
			notify("~r~[Anticheat]: ~b~This vehicle is blacklisted!")
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(carblacklist) do
		if model == GetHashKey(blacklistedCar) then
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

Citizen.CreateThread( function()
    while true do
       Citizen.Wait(0)
       RestorePlayerStamina(PlayerId(), 1.0)
    end
end)

RegisterCommand( "dv", function()
    TriggerEvent( "wk:deleteVehicle" )
end, false )
TriggerEvent( "chat:addSuggestion", "/dv", "Deletes the vehicle you're sat in, or standing next to." )

-- The distance to check in front of the player for a vehicle   
local distanceToCheck = 5.0

-- The number of times to retry deleting a vehicle if it fails the first time 
local numRetries = 5

-- Add an event handler for the deleteVehicle event. Gets called when a user types in /dv in chat
RegisterNetEvent( "wk:deleteVehicle" )
AddEventHandler( "wk:deleteVehicle", function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                DeleteGivenVehicle( vehicle, numRetries )
            else 
                Notify( "You must be in the driver's seat!" )
            end 
        else
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( ped, pos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then 
                DeleteGivenVehicle( vehicle, numRetries )
            else 
                Notify( "~y~You must be in or near a vehicle to delete it." )
            end 
        end 
    end 
end )

function DeleteGivenVehicle( veh, timeoutMax )
    local timeout = 0 

    SetEntityAsMissionEntity( veh, true, true )
    DeleteVehicle( veh )

    if ( DoesEntityExist( veh ) ) then
        Notify( "~r~Failed to delete vehicle, trying again..." )

        -- Fallback if the vehicle doesn't get deleted
        while ( DoesEntityExist( veh ) and timeout < timeoutMax ) do 
            DeleteVehicle( veh )

            -- The vehicle has been banished from the face of the Earth!
            if ( not DoesEntityExist( veh ) ) then 
                Notify( "~g~Vehicle deleted." )
            end 

            -- Increase the timeout counter and make the system wait
            timeout = timeout + 1 
            Citizen.Wait( 500 )

            -- We've timed out and the vehicle still hasn't been deleted. 
            if ( DoesEntityExist( veh ) and ( timeout == timeoutMax - 1 ) ) then
                Notify( "~r~Failed to delete vehicle after " .. timeoutMax .. " retries." )
            end 
        end 
    else 
        Notify( "~g~Vehicle deleted." )
    end 
end 

-- Gets a vehicle in a certain direction
-- Credit to Konijima
function GetVehicleInDirection( entFrom, coordFrom, coordTo )
	local rayHandle = StartShapeTestCapsule( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7 )
    local _, _, _, _, vehicle = GetShapeTestResult( rayHandle )
    
    if ( IsEntityAVehicle( vehicle ) ) then 
        return vehicle
    end 
end

-- Shows a notification on the player's screen 
function Notify( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end