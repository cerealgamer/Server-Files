----- [Put Server Sided Scripts here (If Needed)] ----- 

RegisterServerEvent('TRP:TurfMessage')
AddEventHandler('TRP:TurfMessage', function()
    TriggerClientEvent('chatMessage', source, "^3[Turf Wars]:", {255, 255, 255}, "A turf has started at ^1Rebel+, ^7this will be completed in 1 minute.", "alert")
end)