
function DrawText3D(x,y,z, text,px,py,pz)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    
    if onScreen then
        SetTextScale(0.2, 0.2)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

TRP3DText = {
	--["3D Text"] = {dist,x,y,z}
	["Press [E] to open Large Arms Dealer"] = {10,1339.7631835938,4391.8955078125,44.343734741211},
}

TRP3DTextDistances = {}

Citizen.CreateThread(function()
	while true do 
		for k,v in pairs(TRP3DText) do 
			dist,x,y,z = table.unpack(v)
			plyCoords = GetEntityCoords(GetPlayerPed(-1))
			TRP3DTextDistances[k] = #(plyCoords-vector3(x, y, z))
		end 
		Wait(5000)
	end
end)

Citizen.CreateThread(function()
	while true do
		local px,py,pz=table.unpack(GetGameplayCamCoords())
		for k,v in pairs(TRP3DText) do 
			if TRP3DTextDistances[k] ~= nil then
				dist,x,y,z = table.unpack(v)
				if TRP3DTextDistances[k] <= dist then
					DrawText3D(x,y,z,k,px,py,pz)
				end
			end
		end
		Wait(0)
	end
end)