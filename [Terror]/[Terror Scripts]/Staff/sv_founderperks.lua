RegisterCommand("fix", function(source, args, rawcommand)
  local user_id = vRP.getUserId({source})
  if user_id ~= nil and vRP.hasPermission({user_id, "founder.perks"}) then
    ORPStaffClient.FounderFixVeh(source)
  end
end)

RegisterServerEvent("ORP:checkfounderperks")
AddEventHandler("ORP:checkfounderperks", function()
    local source = source
    local user_id = vRP.getUserId({source})
    if user_id ~= nil and vRP.hasPermission({user_id, "founder.perks"}) then
        TriggerClientEvent("ORP:founderperks",source)
    end
end)