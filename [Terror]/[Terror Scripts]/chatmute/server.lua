local current_messages = {}
local max_delay = 5
local muted_players = {}


function Get_Messagedata(s)
    if current_messages[s] == nil then
        return 6
    end
    return (os.time() - current_messages[s]), max_delay + (current_messages[s] - os.time())
end


function Set_UserMute(user, time)
    muted_players[user] = os.time() + (time * 60)
end

function Get_UserMute(user)
    if muted_players[user] == nil then
        return 0
    end
    return muted_players[user] - os.time()
end

function timeCount(numSec)
    local nSeconds = numSec
    if nSeconds == 0 then
        return 0
    else
        local	nHours = math.floor(nSeconds/3600);
        local	nMins = math.floor(nSeconds/60 - (nHours*60));
        local	nSecs = math.floor(nSeconds - nHours*3600 - nMins *60);
        
        return nHours,nMins,nSecs
        
    end
end

function checkIfUserUserIsOnCoolown(author)
    if not WasEventCanceled() then
        local Msg_time, time_left = Get_Messagedata(author)
        if Msg_time <= max_delay then
            TriggerClientEvent("chatMessage", author, "^1Please wait ".. time_left.. " seconds before sending another message!")
            return false
        else
            current_messages[author] = os.time()
        end
    end
    return true
end

function checkIfUserIsMuted(author)
    if not WasEventCanceled() then
        local user = GetPlayerIdentifiers(author)
        for i=1,10 do 
            if user[i] then
                thing = string.find(user[i], "license:")
                if thing then
                    local time_left = Get_UserMute(thing)
                    if time_left ~= 0 then
                        local hour, min, sec = timeCount(time_left)
                        if hour > 0 then
                            TriggerClientEvent("chatMessage", author, "^1You are muted! Try again in "..hour.." hour(s) and "..min.." minute(s) and "..sec.." second(s)")
                            return true
                        elseif min > 0 then
                            TriggerClientEvent("chatMessage", author, "^1You are muted! Try again in "..min.." minute(s) and "..sec.." second(s)")
                            return true
                        else
                            TriggerClientEvent("chatMessage", author, "^1You are muted! Try again in "..sec.." seconds(s)")
                            return true
                        end
                    end
                end
            end
        end
    else
        return false
    end
end


RegisterCommand("mute", function(s,a,r)
    local license = ""
    local user = GetPlayerIdentifiers(a[1]) local time = a[2]
    for i=1,10 do 
        if user[i] then
            thing = string.find(user[i], "license:")
            if thing then
                license = thing
            end
        end
    end
    -- change the true to your permission system check
    if true then
        if Get_UserMute(license) ~= 0 then
            TriggerClientEvent("chatMessage", s, "^1User is already muted!")
        else
            Set_UserMute(license, time)
        end
    end
end, false)

RegisterCommand("checkMuted", function(s,a,r)
    local muted_users = ""
    for k,v in pairs(muted_players) do
        time_secs = v - os.time()
        if time_secs ~= 0 then
            local hour, min, sec = timeCount(time_secs)
            if hour > 0 then
                TriggerClientEvent("chatMessage", s, "^1User: "..GetPlayerName(k).." : "..hour.." hour(s) and "..min.." minute(s) and "..sec.." second(s)")
            elseif min > 0 then
                TriggerClientEvent("chatMessage", s, "^1User: "..GetPlayerName(k).." : "..min.." minute(s) and "..sec.." second(s)")
            else
                TriggerClientEvent("chatMessage", s, "^1User: "..GetPlayerName(k).." : "..sec.." seconds(s)")
            end
        end
    end
end, false)

AddEventHandler('chatMessage', function(author, color, text)
    if checkIfUserIsMuted(author) then
        if checkIfUserUserIsOnCoolown(author) then
            CancelEvent()
        end
    else
        CancelEvent()
    end
end)
