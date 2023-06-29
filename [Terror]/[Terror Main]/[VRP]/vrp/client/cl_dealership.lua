local DEFAULTCARS = {

    {spawncode = "adder", vehname = "Adder", vehdesc = "Xkgt Car (Max Speed 130 MPH)", price = 0},
    {spawncode = "sanchez", vehname = "Sanchez", vehdesc = "GT2RS Car (Max Speed 230 mph)", price = 0},

}




local NearDEFAULTDEALERSHIP = false
local HasEnteredDEFAULTDEALERSHIP = false


RMenu.Add('defaultshowroom', 'main', RageUI.CreateMenu("~w~Terror Showroom", "~b~Terror Showroom",1250,100))
RMenu.Add('defaultshowroom', 'submenu',  RageUI.CreateSubMenu(RMenu:Get("defaultshowroom", "main")))
RageUI.CreateWhile(1.0, true, function()
    if RageUI.Visible(RMenu:Get('defaultshowroom', 'main')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true}, function()
            RageUI.Button("Vehicles", "", {}, true, function(Hovered, Active, Selected) end, RMenu:Get("defaultshowroom", "submenu"))
        end)
    end
    if RageUI.Visible(RMenu:Get('defaultshowroom', 'submenu')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true}, function()
            for i,v in pairs(DEFAULTCARS) do 
                RageUI.Button(v.vehname, v.vehdesc, {RightLabel = "£" .. v.price}, true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent('DEFAULTShowroom:brought',v.spawncode ,v.price)
                        
                    end
                end)
            end
        end)
	end
end, 1)


Citizen.CreateThread(function()
    while true do 
        Wait(1000)
        if #(GetEntityCoords(PlayerPedId()) - vec3(-32.98607635498,-1102.2288818359,26.42234992981)) <= 2.0 then 
            NearDEFAULTDEALERSHIP = true
        else 
            NearDEFAULTDEALERSHIP = false 
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        DrawMarker(2, -32.935157775879,-1102.1359863281,27.422342300415 - 0.98, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 234, 255, 3, 155, 0, 0, 0, 0, 0, 0, 0)
        if NearDEFAULTDEALERSHIP and not HasEnteredDEFAULTDEALERSHIP then 
            HasEnteredDEFAULTDEALERSHIP = true 
            TriggerServerEvent("DEFAULT:SHOWROOM")
        end

        if not NearDEFAULTDEALERSHIP and HasEnteredDEFAULTDEALERSHIP then 
            HasEnteredDEFAULTDEALERSHIP = false
            RageUI.CloseAll()
            RageUI.Visible(RMenu:Get('defaultshowroom', 'main'), false)
            RageUI.Visible(RMenu:Get('defaultshowroom', 'submenu'), false)
        end
    end
end)

RegisterNetEvent("DEFAULT:Opendefaultshowroom")
AddEventHandler("DEFAULT:Opendefaultshowroom", function()
    RageUI.Visible(RMenu:Get('defaultshowroom', 'main'), true)
end)



Citizen.CreateThread(function()
    local Blip = AddBlipForCoord(-32.98607635498,-1102.2288818359,26.42234992981)
    SetBlipSprite(Blip, 225)
    SetBlipDisplay(Blip, 4)
    SetBlipScale(Blip, 1.0)
    SetBlipColour(Blip, 1)
    SetBlipAsShortRange(Blip, true)
    AddTextEntry("MAPBLIP", "Dealership")
    BeginTextCommandSetBlipName("MAPBLIP")
    EndTextCommandSetBlipName(Blip)
    SetBlipCategory(Blip, 1)
end)


