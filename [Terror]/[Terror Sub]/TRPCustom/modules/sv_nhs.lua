Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","Custom3")

RegisterNetEvent('TRP:CheckForPermNHS')
AddEventHandler('TRP:CheckForPermNHS', function()
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasGroup({user_id, "nhs"}) then
        TriggerClientEvent('TRP:AllowNHS', source)
    end
end)

RegisterNetEvent('TRP:TriggerBodyBag')
AddEventHandler('TRP:TriggerBodyBag', function(target)
    local source = source
    local user_id = vRP.getUserId({source})
    local target = target
    vRPclient.isInComa(target,{}, function(incoma) incoma = incoma 
        if user_id ~= nil then
            if incoma then
                TriggerClientEvent('BODYBAG:PutInBag', target)
            else
                vRPclient.notify(source, {"~r~They're not dead!"})
            end
        end
    end)
end)

RegisterServerEvent('Finished:NHS')
AddEventHandler('Finished:NHS', function(paycheck)
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasGroup({user_id, "nhs"}) then
        vRP.giveMoney({userid, tonumber(paycheck)})
    end
end)