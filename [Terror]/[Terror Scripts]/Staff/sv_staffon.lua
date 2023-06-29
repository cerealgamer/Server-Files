local Proxy = module("vrp", "lib/proxy")
local Tunnel = module("vrp", "lib/Tunnel")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "ORP_Staff")

ORPStaffServer = {}
Tunnel.bindInterface("ORP_Staff",ORPStaffServer)
Proxy.addInterface("ORP_Staff",ORPStaffServer)
ORPStaffClient = Tunnel.getInterface("ORP_Staff","ORP_Staff")

function ORPStaffServer.UpdateStaffTable(name, r, g, b)
  local user_id = vRP.getUserId({source})
  if user_id ~= nil and vRP.hasPermission({user_id, "admin.menu"}) then
    TriggerClientEvent("UpdateTable", -1, name, r,g,b, source)
  end
end

function ORPStaffServer.UpdateStaffTable2()
  local user_id = vRP.getUserId({source})
  if user_id ~= nil and vRP.hasPermission({user_id, "admin.menu"}) then
    TriggerClientEvent("UpdateTable2", -1,source)
  end
end

function ORPStaffServer.StaffOff()
  local user_id = vRP.getUserId({source})
  if user_id ~= nil and vRP.hasPermission({user_id, "admin.menu"}) then
    ORPStaffClient.StaffOff(source)
  end
end


RegisterCommand("staffoff", function(source, args, rawcommand)
  local user_id = vRP.getUserId({source})
  if user_id ~= nil and vRP.hasPermission({user_id, "admin.menu"}) then
    ORPStaffClient.StaffOff(source)
    vRPclient.notify(source, {"~r~You have staffed off."})
  end
end)

RegisterCommand("staffon", function(source, args, rawcommand)
  local user_id = vRP.getUserId({source})
  if user_id ~= nil and vRP.hasPermission({user_id, "admin.menu"}) then
    ORPStaffClient.StaffOn(source)
    vRPclient.notify(source, {"~g~You have staffed on."})
  else
    vRPclient.notify(source, {"~r~You aren't staff."})
  end
end)