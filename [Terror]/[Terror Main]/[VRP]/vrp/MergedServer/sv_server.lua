local inTheRing = nil; 
local oldContestant = nil;
local RingContestantFound = false;
local ringCoords = vec3(164.96968078613,-1262.3480224609,10.814866065979)
local plrsInThePit = {}
function sendChatMsg(msg)
    TriggerClientEvent('chat:addMessage', -1, {
        color = { 255, 0, 0},
        multiline = true,
        args = {"The PIT", msg}
      })      
end

-- New opponent thread.
Citizen.CreateThread(function()
    while true do
        Wait(500)
        plrsInThePit = {}
        RingContestantFound = nil;
        for i,v in pairs(GetPlayers()) do 
            local ped = GetPlayerPed(v)
            local coords = GetEntityCoords(ped)
            if #(ringCoords - coords) <= 8.5 then 
                plrsInThePit[v] = true;
                if v == inTheRing or inTheRing == nil then
                    vRPclient.isInComa(v, {}, function(in_coma)
                        if not in_coma then 
                            if not RingContestantFound and inTheRing == nil then 
                                inTheRing = v
                                sendChatMsg(GetPlayerName(inTheRing) .. ' Temp ID: ' .. inTheRing .. ' has hold of the pit')
                                oldContestant = v;
                            end
                        else 
                        end
                    end)
                end
            end
        end
    end
end)

--Contestant checking thread.
Citizen.CreateThread(function()
    while true do 
        Wait(500)
        if inTheRing then 
            vRPclient.isInComa(inTheRing, {}, function(in_coma)
                if in_coma then 
                    sendChatMsg(GetPlayerName(inTheRing) .. ' Temp ID: ' .. inTheRing .. ' has lost hold of the pit')
                    inTheRing = nil; 
                end
                if inTheRing then 
                    local ped = GetPlayerPed(inTheRing)
                    local coords = GetEntityCoords(ped)
                    if #(ringCoords - coords) >= 8.5 then 
                        sendChatMsg(GetPlayerName(inTheRing) .. ' Temp ID: ' .. inTheRing .. ' has lost hold of the pit')
                        inTheRing = nil;
                    end
                end
            end)

        end
    end
end)

-- Payment thread.
Citizen.CreateThread(function()
    while true do 
        Wait(60000)
        if inTheRing then 
            local user_id = vRP.getUserId(inTheRing)
            if user_id then 
                vRP.giveMoney(user_id,25000)
                vRPclient.notify(inTheRing,{"~g~You recieved £25000 for holding the Pit."})
            end
        end
    end
end)