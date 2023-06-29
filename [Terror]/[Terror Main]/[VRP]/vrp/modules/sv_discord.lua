RegisterServerEvent('Terror:getUserIdRP')
AddEventHandler('Terror:getUserIdRP', function()
    local source = source
    local user_id = vRP.getUserId(source)
    TriggerClientEvent('Terror:giveRichPresence', source, user_id)
end)