-- vRP TUNNEL/PROXY
Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
tvRP = Tunnel.getInterface("vRP","tvRP")

vRP.defInventoryItem({"Cocain", "Cocain", "Cocain", function(args) end, 1})
vRP.defInventoryItem({"Cocain_bar", "Cocain_bar", "Cocain_bar", function(args) end, 1})
vRP.defInventoryItem({"Gold", "Gold", "Gold", function(args) end, 1})
vRP.defInventoryItem({"Gold_bar", "Gold_bar", "Gold_bar", function(args) end, 1})
vRP.defInventoryItem({"Heroin", "Heroin", "Heroin", function(args) end, 1})
vRP.defInventoryItem({"Heroin_bar", "Heroin_bar", "Heroin_bar", function(args) end, 1})

RegisterNetEvent('Buy:Lic')
AddEventHandler('Buy:Lic', function(Index)
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.tryFullPayment({user_id, cfg["Drugs"][Index].price}) then
        vRP.addUserGroup({user_id, Index})
        TriggerClientEvent('Client:NotifyString', source, '~g~Bought ' .. Index)
    else
        TriggerClientEvent('Client:NotifyString', source, '~r~Insufficent Amount ')
    end
end)

RegisterNetEvent('Process')
AddEventHandler('Process', function(type, final)
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasGroup({user_id, type}) then
        print(user_id)
        if vRP.tryGetInventoryItem({user_id, type, 1, false}) then
            TriggerClientEvent('Try:Process', source, type, final)
        else
            TriggerClientEvent('Client:NotifyString', source, '~r~You dont have any ' .. type .. " to process.")
        end
    else
        TriggerClientEvent('Client:NotifyString', source, '~r~[Invalid License]')
    end
end)

RegisterNetEvent('Gather')
AddEventHandler('Gather', function(type)
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasGroup({user_id, type}) then
        TriggerClientEvent('Try:Gather', source, type)
    else
        TriggerClientEvent('Client:NotifyString', source, '~r~[Invalid License]')
    end
end)

RegisterNetEvent('Ended:Gathering')
AddEventHandler('Ended:Gathering', function(type)
    local source = source
    local user_id = vRP.getUserId({source})
    if user_id ~= nil then
        vRP.giveInventoryItem({user_id, type, 1, true})
    end
end)

RegisterNetEvent('Ended:Processing')
AddEventHandler('Ended:Processing', function(type, final)
    local source = source
    local user_id = vRP.getUserId({source})
    if user_id ~= nil then
        vRP.giveInventoryItem({user_id, final, 1, true})
    end
end)

RegisterServerEvent('trader:sell')
AddEventHandler('trader:sell', function(original, type, amount)
    local source = source
    local amount = tonumber(amount)
    local user_id = vRP.getUserId({source})
    if vRP.tryGetInventoryItem({user_id, type, amount, false}) then
        vRP.giveMoney({user_id, amount * cfg["Drugs"][original].sell_price})
        TriggerClientEvent('Client:NotifyString', source, '~g~Sold ' .. original .. " for £" ..  GetMoneyString(amount * cfg["Drugs"][original].sell_price))
    else
        TriggerClientEvent('Client:NotifyString', source, '~r~Not Enough')
    end
end)

function GetMoneyString(cashString)
	local i, j, minus, int, fraction = tostring(cashString):find('([-]?)(%d+)([.]?%d*)')
	int = int:reverse():gsub("(%d%d%d)", "%1,")
	return minus .. int:reverse():gsub("^,", "") .. fraction 
end

RegisterNetEvent('Sell:Heroin')
AddEventHandler('Sell:Heroin', function()
    local source = source
    local user_id = vRP.getUserId({source})
    local amount = vRP.getInventoryItemAmount({1, "Heroin_bar"})
    if vRP.tryGetInventoryItem({user_id, "Heroin_bar", amount, true}) then
        vRP.giveMoney({user_id, amount * cfg["Drugs"]["Heroin"].sell_price})
        TriggerClientEvent('Client:NotifyString', source, '~g~Sold ' .. amount .. ' Heroin(s) for £' ..  GetMoneyString(amount * cfg["Drugs"]["Heroin"].sell_price))
    else
        TriggerClientEvent('Client:NotifyString', source, '~r~You dont have any Heroin')
    end
end)