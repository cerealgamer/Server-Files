-- vRP TUNNEL/PROXY
Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

MySQL = module("vrp_mysql", "MySQL")
vRP = Proxy.getInterface("vRP")
tvRP = Tunnel.getInterface("vRP","tvRP")

MySQL.createCommand("vRP/get_whitelists","SELECT * FROM weapon_whitelists WHERE user_id = @uid")

RegisterNetEvent('WeaponShop:BuyWeapon')
AddEventHandler('WeaponShop:BuyWeapon', function(Index, Type)
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.tryPayment({user_id, cfg[Type]["Weapons"][Index].price}) then
        TriggerClientEvent('GiveWepHash', source, cfg[Type]["Weapons"][Index].hash)
    else
        TriggerClientEvent('Client:NotifyString', source, '~r~Insufficent Amount.')
    end
end)


RegisterNetEvent('WeaponShop:GetWhitelistTable')
AddEventHandler('WeaponShop:GetWhitelistTable', function()
    local source = source
    local user_id = vRP.getUserId({source})
    MySQL.query("vRP/get_whitelists", {uid = user_id}, function(rows,affected)
        if #rows > 0 then
            TriggerClientEvent('WeaponShop:SendWhitelists', source, rows)
        end
    end)
end)

RegisterNetEvent('WeaponShop:BuyWhitelistedWeapon')
AddEventHandler('WeaponShop:BuyWhitelistedWeapon', function(hash, price)
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.tryPayment({user_id, price}) then
        TriggerClientEvent('GiveWepHash', source, hash)
    else
        TriggerClientEvent('Client:NotifyString', source, '~r~Insufficent Amount.')
    end
end)

RegisterNetEvent('WeaponShop:Armor')
AddEventHandler('WeaponShop:Armor', function()
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.tryPayment({user_id, cfg["Bandit"].Armor_price}) then
        TriggerClientEvent('WeaponShop:8348', source)
    else
        TriggerClientEvent('Client:NotifyString', source, '~r~Insufficent Amount.')
    end
end)


RegisterServerEvent('DoesOwnBandit')
AddEventHandler('DoesOwnBandit', function()
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasGroup({user_id, "Bandit"}) then
        print("c")
        TriggerClientEvent('DoesOwnBandit', source, true)
    else
        print("bb")
    end
end)