RegisterNetEvent('TRP:3Bus')
AddEventHandler('TRP:3Bus', function()
    local source = source
    local user_id = vRP.getUserId({source})
    vRP.giveBankMoney({user_id, cfg["Bus Job"].pay_check})
end)