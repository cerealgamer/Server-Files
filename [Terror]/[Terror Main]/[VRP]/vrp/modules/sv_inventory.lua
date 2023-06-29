local lang = vRP.lang
local cfg = module("cfg/inventory")

RegisterNetEvent('checkSecondInv')
AddEventHandler('checkSecondInv', function()
    vRPclient.getNearestOwnedVehicle(source,{7},function(ok,vtype,name)
        TriggerClientEvent('checkedSecondInv', source, ok,vtype,name)
    end)
end)

RegisterNetEvent('fetchInvData')
AddEventHandler('fetchInvData', function()
    local user_id = vRP.getUserId(source)
    local maxUserWeight = cfg.inventory_weight_per_strength
    local inventory = {}
    local data = vRP.getUserDataTable(user_id)
    if data and data.inventory then
        for k,v in pairs(data.inventory) do
            local id = k
            local name,description,weight = vRP.getItemDefinition(k)
            local amount = v.amount
            inventory[id] = {name,v.amount,weight}
        end
        TriggerClientEvent('sendInvData', source, maxUserWeight, inventory)
    end
end)

RegisterNetEvent('fetchSecondaryInvData')
AddEventHandler('fetchSecondaryInvData', function()
    local user_id = vRP.getUserId(source)
    local source = source
    vRPclient.getNearestOwnedVehicle(source,{7},function(ok,vtype,name)
        local chestname = "u"..user_id.."veh_"..string.lower(name)
        vRP.getSData("chest:"..chestname, function(cdata)
            chest = json.decode(cdata) or {}
            local maxSecondaryWeight = cfg.default_vehicle_chest_weight
            secondaryInventory = {}
            for k,v in pairs(chest) do 
                local id = k
                local name,description,weight = vRP.getItemDefinition(k)
                local amount = v.amount
                secondaryInventory[id] = {name,v.amount,weight}
            end
            TriggerClientEvent('sendSecondaryInvData', source, maxSecondaryWeight, secondaryInventory)
        end)
    end)
end)

RegisterNetEvent('trashInvItem')
AddEventHandler('trashInvItem', function(idname, amount)
    local user_id = vRP.getUserId(source)
    local newAmount = tonumber(amount)
    vRP.tryGetInventoryItem(user_id,idname,newAmount,false)
    vRPclient.playAnim(source,{true,{{"pickup_object","pickup_low",1}},false})
end)

RegisterNetEvent('giveInvItem')
AddEventHandler('giveInvItem', function(idname, amount)
    local user_id = vRP.getUserId(source)
    local newAmount = tonumber(amount)
    vRPclient.getNearestPlayer(source,{10},function(nplayer)
        if nplayer ~= nil then
            local nuser_id = vRP.getUserId(nplayer)
            local new_weight = vRP.getInventoryWeight(nuser_id)+vRP.getItemWeight(idname)*newAmount
            if new_weight <= cfg.inventory_weight_per_strength then
                if vRP.tryGetInventoryItem(user_id,idname,newAmount,true) then
                    vRP.giveInventoryItem(nuser_id,idname,newAmount,true)
                    TriggerEvent('updateSecondPed', nplayer)
                    vRPclient.playAnim(player,{true,{{"mp_common","givetake1_a",1}},false})
                    vRPclient.playAnim(nplayer,{true,{{"mp_common","givetake2_a",1}},false})
                else
                    vRPclient.notify(source,{"~r~Opps, Something went wrong"})
                end
            else
                vRPclient.notify(source,{"~r~Players Inventory is full"})
            end
        else
            vRPclient.notify(source,{"~r~No Players Near"})
        end
    end)
end)

AddEventHandler('updateSecondPed', function(nplayer)
    local user_id = vRP.getUserId(nplayer)
    local maxUserWeight = cfg.inventory_weight_per_strength
    local inventory = {}
    local data = vRP.getUserDataTable(user_id)
    for k,v in pairs(data.inventory) do 
        local id = k
        local name,description,weight = vRP.getItemDefinition(k)
        local amount = v.amount
        inventory[id] = {name,v.amount,weight}
    end
    TriggerClientEvent('sendInvData', nplayer, maxUserWeight, inventory)
end)

RegisterNetEvent('moveInvItem')
AddEventHandler('moveInvItem', function(idname, amount, type)
    local user_id = vRP.getUserId(source)
    local source = source
    local newAmount = tonumber(amount)
    local maxSecondaryWeight = cfg.default_vehicle_chest_weight
    local maxInventoryWeight = cfg.inventory_weight_per_strength

    if type == "first" then
        vRPclient.getNearestOwnedVehicle(source,{7},function(ok,vtype,name)
            if ok then
                local chestname = "u"..user_id.."veh_"..string.lower(name)
                vRP.getSData("chest:"..chestname, function(cdata)
                    chest.items = json.decode(cdata) or {}
                    local new_weight = vRP.computeItemsWeight(chest.items)+vRP.getItemWeight(idname)*newAmount
                    if new_weight <= maxSecondaryWeight then
                        if newAmount > 0 and vRP.tryGetInventoryItem(user_id, idname, newAmount, false) then
                            if chest.items[idname] ~= nil then
                                chest.items[idname].amount = chest.items[idname].amount+newAmount
                            else -- create item entry
                                chest.items[idname] = {amount=newAmount}
                            end
                            vRP.setSData("chest:"..chestname, json.encode(chest.items))
                        end
                    else
                        vRPclient.notify(source,{"~r~Chest is full"})
                    end
                end)
            else
                vRPclient.notify(source,{"~r~No Owned vehicle Near"})
            end
        end)
    elseif type == "second" then
        vRPclient.getNearestOwnedVehicle(source,{7},function(ok,vtype,name)
            local chestname = "u"..user_id.."veh_"..string.lower(name)
            vRP.getSData("chest:"..chestname, function(cdata)
                chest.items = json.decode(cdata) or {}
                local new_weight = vRP.getInventoryWeight(user_id)+vRP.getItemWeight(idname)*newAmount
                if new_weight <= maxSecondaryWeight then
                    local totalAmount = chest.items[idname].amount
                    if totalAmount >= newAmount then
                        vRP.giveInventoryItem(user_id, idname, newAmount, false)
                        chest.items[idname].amount = chest.items[idname].amount-newAmount
                        if chest.items[idname].amount <= 0 then
                            chest.items[idname] = nil
                            TriggerClientEvent('clearSelect', source)
                            TriggerEvent('updateSecondPed', source)
                        end
                        vRP.setSData("chest:"..chestname, json.encode(chest.items))
                    end
                else
                    vRPclient.notify(source,{"~r~Inventory is full"})
                end
            end)
        end)
    end
end)

RegisterNetEvent('updatefetchInvData')
AddEventHandler('updatefetchInvData', function(source)
    local user_id = vRP.getUserId(source)
    local maxUserWeight = cfg.inventory_weight_per_strength
    local inventory = {}
    local data = vRP.getUserDataTable(user_id)
    for k,v in pairs(data.inventory) do 
        local id = k
        local name,description,weight = vRP.getItemDefinition(k)
        local amount = v.amount
        inventory[id] = {name,v.amount,weight}
    end
    TriggerClientEvent('sendInvData', source, maxUserWeight, inventory)
end)

RegisterNetEvent('sendAmount')
AddEventHandler('sendAmount', function(amount, idname, name)
    local user_id = vRP.getUserId(source)
    ammoAmount = tonumber(amount)
    vRPclient.getWeapons(source, {}, function(uweapons)
        if vRP.tryGetInventoryItem(user_id, idname, ammoAmount, false) then -- give weapon ammo
            local weapons = {}
            weapons[name] = {ammo = ammoAmount}
            vRPclient.giveWeapons(source, {weapons,false})
            TriggerEvent('updatefetchInvData', source)
        end
    end)
end)

RegisterNetEvent('sendData')
AddEventHandler('sendData', function(idname, name)
    local user_id = vRP.getUserId(source)
    if vRP.tryGetInventoryItem(user_id, idname, 1, false) then
        local weapons = {}
        weapons[name] = {ammo = 0}
        vRPclient.giveWeapons(source, {weapons})
    end
end)

RegisterNetEvent('useInvItem')
AddEventHandler('useInvItem', function(idname)
    local user_id = vRP.getUserId(source)
    local source = source

    if string.starts(idname, "wbody|") then
        local name = string.gsub(idname,"wbody|","")
        name = string.upper(string.sub(name,1,1))..string.lower(string.sub(name,2))
        local hash = GetHashKey(name)
        TriggerClientEvent('fetchData', source, hash, idname, name)
    elseif string.starts(idname, "wammo|") then
        local name = string.gsub(idname,"wammo|","")
        name = string.upper(string.sub(name,1,1))..string.lower(string.sub(name,2))
        local hash = GetHashKey(name)
        TriggerClientEvent('fetchAmount', source, hash, idname, name)
    else
        print('no')
    end
end)


function string.starts(String,Start)
    return string.sub(String,1,string.len(Start))==Start
end