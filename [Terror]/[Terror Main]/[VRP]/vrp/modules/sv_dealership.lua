--- {spawn, title, desc, price}

local SimeonsCars = {

    {spawncode = "adder", vehname = "Adder", vehdesc = "Xkgt Car (Max Speed 130 MPH)", price = 0},
    {spawncode = "sanchez", vehname = "Sanchez", vehdesc = "GT2RS Car (Max Speed 230 mph)", price = 0}

}



RegisterServerEvent('DEFAULTShowroom:brought')
AddEventHandler('DEFAULTShowroom:brought', function(vehicle, price)
    local correctcar = false 
    local wrongprice = false 
    local player = source
    local user_id = vRP.getUserId(source)
    for i,v in pairs(SimeonsCars) do 
        if v.spawncode == vehicle then 
            correctcar = true 
            if v.price ~= price then 
            wrongprice = true
            end
        end
    end    
    if wrongprice == true then 
    print("Tried hacking DEFAULTShowroom with price: " .. price .. " Item spawncode: " .. vehicle )
    
    end

    if correctcar == false then 
    print("Tried hacking DEFAULTShowroom with price: " .. price .. " Item spawncode: " .. vehicle )
    end

    MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pvehicle, affected)
		if #pvehicle > 0 then
			vRPclient.notify(player,{"~r~Vehicle already owned."})
		else

			if vRP.tryFullPayment(user_id, price) then
               vRP.getUserIdentity(user_id, function(identity)					
                   MySQL.execute("vRP/add_vehicle", {user_id = user_id, vehicle = vehicle, registration = "P "..identity.registration})
               end)

				vRPclient.notify(player,{"You paid ~r~$"..price})
                vRPclient.notify(player,{"To pickup your vehicle please visit any garage."})
                
			else
                vRPclient.notify(player,{"~r~Not enough money."})
            end
		end
	end)
end)


RegisterServerEvent("DEFAULT:SHOWROOM")
AddEventHandler("DEFAULT:SHOWROOM", function()
    local user_id = vRP.getUserId(source)
    if vRP.hasGroup(user_id, "user") then 
        TriggerClientEvent('DEFAULT:Opendefaultshowroom', source)
    else
        vRPclient.notify(source,{"Wrong perms"})
    end
end)