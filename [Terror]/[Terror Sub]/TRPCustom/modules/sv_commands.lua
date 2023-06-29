local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
local users = {}
RegisterNetEvent("PlayerJoined")
AddEventHandler(
    "PlayerJoined",
    function()
        local tempid = source
        local user_id = vRP.getUserId({source})
        if users[tempid] then
        else
            users[tempid] = user_id
            print("player source: ", source)
            print(json.encode(users))
        end
    end
)

RegisterCommand("getmyid", function(source)
    TriggerClientEvent('chatMessage', source, "[Server]", {255, 255, 255}, " Perm ID: " .. vRP.getUserId({source}) , "alert")
end)

RegisterCommand("getmytempid", function(source)
	TriggerClientEvent('chatMessage', source, "[Server]", {255, 255, 255}, " Your TempID: " .. source, "alert")
end)

RegisterServerEvent("TRP:PermID")
AddEventHandler("TRP:PermID", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    TriggerClientEvent('chatMessage', player, '^7[^1TRP^7]', {255, 0, 0}, "Your Perm ID is: ^4" .. user_id .. "^7." )
end)

RegisterServerEvent("TRP:TempID")
AddEventHandler("TRP:TempID", function(temp_id)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    TriggerClientEvent('chatMessage', player, '^7[^1TRP^7]', {255, 0, 0}, "Your Temp ID is: ^4" .. temp_id .. "^7." )
end)

RegisterCommand('getid', function(source, args)
    if args and args[1] then 
        local userid = vRP.getUserId({args[1]})
        if userid then 
            TriggerClientEvent('chatMessage', source, '^7[^1TRP^7]', {255, 0, 0}, "The Temp ID for: ^1" .. args[1] .. " ^0|^1 Perm ID: " .. userid, "alert")
        else 
            TriggerClientEvent('chatMessage', source, '^7[^1TRP^7]', {255, 0, 0}, "Temp ID cannot be found! This user is most likely offline.", "alert")
        end
    else 
        TriggerClientEvent('chatMessage', source, '^7[^1TRP^7]', {255, 0, 0}, "Please specify a user eg: /getid [tempid]", "alert")
    end
end)

RegisterCommand("a", function(source,args, rawCommand)
    user_id2 = vRP.getUserId({source})   
    if vRP.hasPermission({user_id2, "vrp.adminmenu"}) then
       
    else 
        local playerName = "Server "
        local msg = "Access denied."
        TriggerClientEvent('chatMessage', source, "^7Alert: " , { 128, 128, 128 }, msg, "alert")
        return 
    end
    local msg = rawCommand:sub(2)
    local playerName =  "^7[Staff Chat] " .. GetPlayerName(source)..": "
    local players = GetPlayers()
    for i,v in pairs(players) do 
        name = GetPlayerName(v)
        user_id = vRP.getUserId({v})   
        if vRP.hasPermission({user_id, "vrp.adminmenu"}) then
            TriggerClientEvent('chatMessage', v, playerName , { 128, 128, 128 }, msg, "staff")
        end
    end
end)