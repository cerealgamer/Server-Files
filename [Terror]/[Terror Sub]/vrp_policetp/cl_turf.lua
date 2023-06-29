


RMenu.Add('turfmenu', 'main', RageUI.CreateMenu("PD Teleport Menu", "~b~Terror PD Teleport Menu", 1300, 0))
RageUI.CreateWhile(1.0, RMenu:Get('turfmenu', 'main'), nil, function()

RageUI.IsVisible(RMenu:Get('turfmenu', 'main'), true, false, true, function()
        RageUI.Button("Teleport to Spawn Menu" , nil, {RightLabel = ">>>"}, true, function(Hovered, Active, Selected)
            if Selected then
                SetEntityCoords(PlayerPedId(), -45.393093109131,-1173.7066650391,26.110569000244)
            end
        end)
    end, function()
    end)
end)






isInMenu = false
Citizen.CreateThread(function() 
    while true do
        for k, v in pairs(cfg.pdteleport) do 
            local x,y,z = table.unpack(v.marker)
            local v1 = vector3(x,y,z)
            if isInArea(v1, 100.0) then 
                DrawMarker(21, 447.53851318359,-977.02703857422,30.689338684082, 0.98, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 0, 247, 255, 155, 0, 0, 0, 0, 0, 0, 0)
            end
            if isInMenu == false then
            if isInArea(v1, 1.4) then 
                alert('Press ~INPUT_VEH_HORN~ to access PD teleport menu')
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
    blip = AddBlipForCoord(447.24523925781,-975.65545654297,30.689308166504)
    SetBlipSprite(blip, 233)
    SetBlipScale(blip, 0.6)
    SetBlipDisplay(blip, 2)
    SetBlipColour(blip, 3)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("PD Teleport Menu")
    EndTextCommandSetBlipName(blip)
end)