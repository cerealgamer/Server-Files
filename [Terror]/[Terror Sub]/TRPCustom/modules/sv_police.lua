RegisterServerEvent('TerrorRP:CheckForPerm')
AddEventHandler('TerrorRP:CheckForPerm', function()
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasGroup({user_id, "Police Officer"}) then
        TriggerClientEvent('TerrorRP:AllowPD', source)
    end
end)

RegisterServerEvent('TerrorRP:placeSpike')
AddEventHandler('TerrorRP:placeSpike', function(netid, coords)
    TriggerClientEvent('TerrorRP:addSpike', -1, netid, coords)
end)

RegisterServerEvent('TerrorRP:removeSpike')
AddEventHandler('TerrorRP:removeSpike', function(netid)
    TriggerClientEvent('TerrorRP:deleteSpike', -1, netid)
end)

RegisterServerEvent('TerrorRP:Police48')
AddEventHandler('TerrorRP:Police48', function(hash)
    local source = source
    local coords = GetEntityCoords(PlayerPedId())
    local arm_coords = vector3(461.16909790039,-981.13897705078,30.689310073853)
        if #(arm_Coords - playerCoords) < 1.0 then
    TriggerClientEvent('GiveWepHash', source, hash)
        end
end)

RegisterServerEvent('Finished:PD')
AddEventHandler('Finished:PD', function(paycheck)
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasGroup({user_id, "Police Officer"}) then
        vRP.giveMoney({userid, tonumber(paycheck)})
    end
end)