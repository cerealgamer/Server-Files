local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vRP_gunshop")

RegisterServerEvent("Polices:buywap")
AddEventHandler('Polices:buywap', function(price, hash)
    local source = source
    userid = vRP.getUserId({source})
    if cfg.perm ~= nil then 
        if vRP.hasPermission({userid, cfg.perm}) then
            if vRP.tryPayment({userid, price}) then
                TriggerClientEvent("Polices:givewap", source,  hash)
                vRPclient.notify(source, {"~g~Paid "..cfg.currency..tostring(price)})
            else 
                TriggerClientEvent("Polices:menu", source, false)
                vRPclient.notify(source, {"~r~Insufficient funds"})
            end
        else
            vRPclient.notify(source, {"~r~You do not have permission to buy guns"})
        end
    else 
        if vRP.tryPayment({userid, price}) then
            TriggerClientEvent("Polices:givewap", source,  hash)
            vRPclient.notify(source, {"~g~Paid "..cfg.currency..tostring(price)})
        else 
            TriggerClientEvent("Polices:menu", source, false)
            vRPclient.notify(source, {"~r~Insufficient funds"})
        end
    end
end)

RegisterServerEvent("Police:buyarmour")
AddEventHandler('Police:buyarmour', function(price, level)
    playerid = vRP.getUserId({source})
    if cfg.perm ~= nil then 
        if vRP.hasPermission({playerid, cfg.perm}) then
            if vRP.tryPayment({playerid, price}) then
                TriggerClientEvent("Polices:givearmour", source, level)
                vRPclient.notify(source, {"~g~Paid "..cfg.currency..tostring(price)})
            else 
                TriggerClientEvent("Polices:menu", source, false)
                vRPclient.notify(source, {"~r~Insufficient funds"})
            end
        else
            vRPclient.notify(source, {"~r~You do not have permission to buy guns"})
        end
    else 
        if vRP.tryPayment({playerid, price}) then
            TriggerClientEvent("Polices:givearmour", source,  level)
            vRPclient.notify(source, {"~g~Paid "..cfg.currency..tostring(price)})
        else 
            TriggerClientEvent("Polices:armour", source, false)
            vRPclient.notify(source, {"~r~Insufficient funds"})
        end
    end
end)

--vRP.Weapons = {}

--vRP.Weapons[source] = {GetHashKey('WEAPON_AK200')} -- add this onto server side wherever you give the client weapons

