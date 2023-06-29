-----------------------
----- [Turf Menu] -----
-----------------------
----- [By Cloned] -----

local inturf = 1

RMenu.Add('turfmenu', 'main', RageUI.CreateMenu("Turf Menu", "~b~Terror Turf Menu", 1300, 0))
RageUI.CreateWhile(1.0, RMenu:Get('turfmenu', 'main'), nil, function()

RageUI.IsVisible(RMenu:Get('turfmenu', 'main'), true, false, true, function()
        RageUI.Button("Take Turf" , nil, {RightLabel = ">>>"}, true, function(Hovered, Active, Selected)
            if Selected then
                if inturf == 1 then
                    alert("~g~You have started holding the Turf, please wait 1 minutes!")
                    notify("~g~You have started holding the Turf, please wait 1 minutes!")
                    TriggerServerEvent('TRP:TurfMessage')
                    Citizen.Wait(60000)
                    GiveWeaponToPed(PlayerPedId(), "weapon_mosin", 250, false, true)
                    alert("~g~Succesfully taken Turf!")
                    notify("~g~Succesfully gained ~b~%100 Armor, ~g~1 Mosin (250 Ammo)")
                    SetPedArmour(PlayerPedId(), 98)
                end
            end
        end)
            RageUI.Button("Dispand Turf" , nil, {RightLabel = ">>>"}, true, function(Hovered, Active, Selected)
            if Selected then
            end
        end)
        RageUI.Button("Raise Commision Rate" , nil, {RightLabel = ">>>"}, true, function(Hovered, Active, Selected)
            if Selected then
                commision = getAmount()
                TriggerEvent(commision)
                CommisionMsg()
            end
        end)
    end, function()
    end)
end)






isInMenu = false
Citizen.CreateThread(function() 
    while true do
        for k, v in pairs(cfg.turf) do 
            local x,y,z = table.unpack(v.marker)
            local v1 = vector3(x,y,z)
            if isInArea(v1, 100.0) then 
                DrawMarker(30, 1545.5437011719,6332.4477539063,24.079111099243, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 2.5, 255, 0, 0, 150, 0, 0, 2, 0, 0, 0, false)
            end
            if isInMenu == false then
            if isInArea(v1, 1.4) then 
                alert('Press ~INPUT_VEH_HORN~ to access turf menu')
                if IsControlJustPressed(0, 51) then 
                    RageUI.Visible(RMenu:Get("turfmenu", "main"), true)
                    isInMenu = true
                end
            end
            end
            if isInArea(v1, 1.4) == false then
                RageUI.Visible(RMenu:Get("turfmenu", "main"), false)
                isInMenu = false
            end
        end
        Citizen.Wait(0)
    end
end)


function isInArea(v, dis) 
    
    if #(GetEntityCoords(PlayerPedId(-1)) - v) <= dis then  
        return true
    else 
        return false
    end
end

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function getAmount()
	AddTextEntry('FMMC_KEY_TIP8', "Enter a number (%) you want the commison to be raised to.")
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "Enter Amount (Blank to Cancel)", "", "", "", "", 30)
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

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

Citizen.CreateThread(function()
    blip = AddBlipForCoord(1545.5437011719,6332.4477539063,24.079111099243)
    SetBlipSprite(blip, 429)
    SetBlipScale(blip, 0.8)
    SetBlipDisplay(blip, 2)
    SetBlipColour(blip, 1)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Turf")
    EndTextCommandSetBlipName(blip)
end)
