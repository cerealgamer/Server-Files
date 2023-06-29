local openInventory = false
local secondaryInventory = false
local selectedInventoryItem = false
local selectedSecondInventoryItem = false
local inventoryCooldown = false
local maxInventoryWeight = 0.00
local maxSecondaryInventoryWeight = 0.00
tempMainList = {}
tempSecondaryList = {}
local model = GetHashKey('prop_cs_heist_bag_01')

Citizen.CreateThread(function()
    while true do 
        if IsControlJustPressed(0, 182) then
            if not openInventory then
                TriggerServerEvent('fetchInvData')
                TriggerServerEvent('checkSecondInv')
                setCursor(1)
                print("open")
                openInventory = true
            else
                setCursor(0)
                print("close")
                openInventory = false
                secondaryInventory = false
                selectedInventoryItem = false
                selectedSecondInventoryItem = false
            end
        end
        Wait(0)
    end
end)

RegisterNetEvent('sendSecondaryInvData')
AddEventHandler('sendSecondaryInvData', function(maxChestWeight, TerrorChestInv)
    maxSecondaryInventoryWeight = maxChestWeight
    tempSecondaryList = TerrorChestInv
end)

RegisterNetEvent('sendInvData')
AddEventHandler('sendInvData', function(maxUserWeight, TerrorItemsInv)
    maxInventoryWeight = maxUserWeight
    tempMainList = TerrorItemsInv
end)

RegisterNetEvent('clearSelect')
AddEventHandler('clearSelect', function()
    selectedInventoryItem = false
    selectedSecondInventoryItem = false
end)

RegisterNetEvent('checkedSecondInv')
AddEventHandler('checkedSecondInv', function(ok,vtype,name)
    if ok then
        secondaryInventory = true
        TriggerServerEvent('fetchSecondaryInvData')
    end
end)

Citizen.CreateThread(function()
    while true do
        if openInventory then
            DisableControlAction(0, 1, true) -- Disable pan
            DisableControlAction(0, 2, true) -- Disable tilt
            DisableControlAction(0, 24, true) -- Disable Attack
            DisableControlAction(0, 257, true) -- Disable Attack2
            DrawRect(0.5, 0.53, 0.572, 0.508, 0, 0, 0, 150)
            DrawRect(0.5, 0.273, 0.572, 0.0069999999999999, 255,0,0, 150)
            DrawAdvancedText(0.593, 0.242, 0.005, 0.0028, 0.66, "Terror Inventory", 255, 255, 255, 255, 7, 0)
            DrawRect(0.5, 0.24, 0.572, 0.058, 0, 0, 0, 225)
            DrawRect(0.342, 0.536, 0.215, 0.436, 0, 0, 0, 150)
            DrawRect(0.652, 0.537, 0.215, 0.436, 0, 0, 0, 150)
            DrawAdvancedText(0.594, 0.364, 0.005, 0.0028, 0.4, "Use", 255, 255, 255, 255, 6, 0)
            DrawAdvancedText(0.594, 0.454, 0.005, 0.0028, 0.4, "Move", 255, 255, 255, 255, 6, 0)
            DrawAdvancedText(0.594, 0.544, 0.005, 0.0028, 0.4, "Move X", 255, 255, 255, 255, 6, 0)
            DrawAdvancedText(0.595, 0.634, 0.005, 0.0028, 0.35, "Give to Nearest Player", 255, 255, 255, 255, 6, 0)
            DrawAdvancedText(0.594, 0.722, 0.005, 0.0028, 0.4, "Trash", 255, 255, 255, 255, 6, 0)
            DrawAdvancedText(0.488, 0.335, 0.005, 0.0028, 0.366, "Amount", 255, 255, 255, 255, 4, 0)
            DrawAdvancedText(0.404, 0.335, 0.005, 0.0028, 0.366, "Item Name", 255, 255, 255, 255, 4, 0)
            DrawAdvancedText(0.521, 0.335, 0.005, 0.0028, 0.366, "Weight", 255, 255, 255, 255, 4, 0)
            DrawAdvancedText(0.833, 0.776, 0.005, 0.0028, 0.288, "[Press L to close]", 255, 255, 255, 255, 4, 0)


            if not secondaryInventory then
                DrawAdvancedText(0.755, 0.5, 0.005, 0.0028, 0.5, "2nd Inventory is unavailable", 255, 255, 255, 150, 6, 0)
                
            else
                DrawAdvancedText(0.798, 0.335, 0.005, 0.0028, 0.366, "Amount", 255, 255, 255, 255, 4, 0)
                DrawAdvancedText(0.714, 0.335, 0.005, 0.0028, 0.366, "Item Name", 255, 255, 255, 255, 4, 0)
                DrawAdvancedText(0.831, 0.335, 0.005, 0.0028, 0.366, "Weight", 255, 255, 255, 255, 4, 0)
                local offset = 0.026
                local cursorOffset = 0.026
                local i = 0
                local totalWeight = 0
                local sortedItemList = sortAlphabetically(tempSecondaryList)
                for _,itemData in pairs(sortedItemList) do 
                    local k = itemData.title
                    local v = itemData["value"]
                    local itemname,amount,weight = table.unpack(v)
                    totalWeight = totalWeight + (amount * weight)
                    DrawAdvancedText(0.714, 0.360 + (i*cursorOffset), 0.005, 0.0028, 0.366, itemname, 255, 255, 255, 255, 4, 0)
                    DrawAdvancedText(0.831, 0.360 + (i*cursorOffset), 0.005, 0.0028, 0.366, tostring(weight*amount).. "kg", 255, 255, 255, 255, 4, 0)
                    DrawAdvancedText(0.798, 0.360 + (i*cursorOffset), 0.005, 0.0028, 0.366, amount, 255, 255, 255, 255, 4, 0)
                    if CursorInArea(0.5443,0.7584,0.3435 + (i*cursorOffset),0.3690 + (i*cursorOffset))  then
                        --DrawRect(0.5, 0.301+(offset * i), 0.223, 0.033, 255, 255, 255, 120)
                        DrawRect(0.652, 0.331+(offset * (i+1)), 0.215, 0.026, 255,0,0, 150)
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            selectedInventoryItem = false
                            selectedSecondInventoryItem = k
                        end
                    elseif k == selectedSecondInventoryItem then 
                        DrawRect(0.652, 0.331+(offset * (i+1)), 0.215, 0.026, 255,0,0, 150)
                    end
                    i = i + 1
                end
                if (totalWeight / maxSecondWeight) > 0.5 then
                    if (totalWeight / maxSecondWeight) > 0.9 then
                        DrawAdvancedText(0.826, 0.307, 0.005, 0.0028, 0.366, "Weight: ".. totalWeight .."/".. maxSecondWeight .. "kg", 255, 50, 0, 255, 4, 0)
                    else
                        DrawAdvancedText(0.826, 0.307, 0.005, 0.0028, 0.366, "Weight: ".. totalWeight .."/".. maxSecondWeight .. "kg", 255, 165, 0, 255, 4, 0)
                    end
                else
                    DrawAdvancedText(0.826, 0.307, 0.005, 0.0028, 0.366, "Weight: ".. totalWeight .."/".. maxSecondWeight .. "kg", 255, 255, 153, 255, 4, 0)
                end 
            end


            -- Use Button
            if CursorInArea(0.4598,0.5333,0.3283,0.3848)  then
                DrawRect(0.5, 0.36, 0.075, 0.056, 255,0,0, 150)
                if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                    if not inventoryCooldown then
                        inventoryCooldown = true
                        if selectedInventoryItem then
                            TriggerServerEvent('useInvItem', selectedInventoryItem)
                            TriggerServerEvent('fetchInvData')
                        elseif selectedSecondInventoryItem then
                            print('Move To Second Inv')
                        else
                            print('No Item Selected')
                        end
                        Citizen.CreateThread(function()
                            Wait(250)
                            TriggerServerEvent('fetchInvData')
                            inventoryCooldown = false
                        end)
                    end
                end
            else
                DrawRect(0.5, 0.36, 0.075, 0.056, 0, 0, 0, 150)
            end

            -- Move Button
            if CursorInArea(0.4598,0.5333,0.418,0.4709)  then
                DrawRect(0.5, 0.45, 0.075, 0.056, 255,0,0, 150)
                if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                    if not inventoryCooldown then
                        inventoryCooldown = true
                        if selectedInventoryItem then
                            TriggerServerEvent('moveInvItem', selectedInventoryItem, "1", "first")
                        elseif selectedSecondInventoryItem then
                            TriggerServerEvent('moveInvItem', selectedSecondInventoryItem, "1", "second")
                        else
                            print('No Item Selected')
                        end
                        Citizen.CreateThread(function()
                            Wait(250)
                            TriggerServerEvent('fetchInvData')
                            TriggerServerEvent('fetchSecondaryInvData')
                            inventoryCooldown = false
                        end)
                    end
                end
            else
                DrawRect(0.5, 0.45, 0.075, 0.056, 0, 0, 0, 150)
            end

            -- Move X Button
            if CursorInArea(0.4598,0.5333,0.5042,0.5588)  then
                DrawRect(0.5, 0.54, 0.075, 0.056, 255,0,0, 150)
                if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                    if not inventoryCooldown then
                        inventoryCooldown = true
                        if selectedInventoryItem then
                            local moveAmount = getMessage()
                            TriggerServerEvent('moveInvItem', selectedInventoryItem, moveAmount, "first")
                            TriggerServerEvent('fetchInvData')
                        elseif selectedSecondInventoryItem then
                            local moveAmount = getMessage()
                            TriggerServerEvent('moveInvItem', selectedSecondInventoryItem, moveAmount, "second")
                            TriggerServerEvent('fetchInvData')
                        else
                            print('No Item Selected')
                        end
                        Citizen.CreateThread(function()
                            Wait(250)
                            TriggerServerEvent('fetchInvData')
                            TriggerServerEvent('fetchSecondaryInvData')
                            inventoryCooldown = false
                        end)
                    end
                end
            else
                DrawRect(0.5, 0.54, 0.075, 0.056, 0, 0, 0, 150)
            end

            -- Give to Player Button
            if CursorInArea(0.4598,0.5333,0.5931,0.6477)  then
                DrawRect(0.5, 0.63, 0.075, 0.056, 255,0,0, 150)
                if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                    if not inventoryCooldown then
                        inventoryCooldown = true
                        if selectedInventoryItem then
                            local giveAmount = getMessage()
                            TriggerServerEvent('giveInvItem', selectedInventoryItem, giveAmount)
                            TriggerServerEvent('fetchInvData')
                        elseif selectedSecondInventoryItem then
                            local giveAmount = getMessage()
                            TriggerServerEvent('giveInvItem', selectedSecondInventoryItem, giveAmount)
                            TriggerServerEvent('fetchInvData')
                        else
                            print('No Item Selected')
                        end
                        Citizen.CreateThread(function()
                            Wait(250)
                            TriggerServerEvent('fetchInvData')
                            TriggerServerEvent('fetchSecondaryInvData')
                            inventoryCooldown = false
                        end)
                    end
                end
            else
                DrawRect(0.5, 0.63, 0.075, 0.056, 0, 0, 0, 150)
            end

            -- Trash Button
            if CursorInArea(0.4598,0.5333,0.6831,0.7377)  then
                DrawRect(0.5, 0.72, 0.075, 0.056, 255,0,0, 150)
                if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                    if not inventoryCooldown then
                        inventoryCooldown = true
                        if selectedInventoryItem then
                            local trashAmount = getMessage()
                            TriggerServerEvent('trashInvItem', selectedInventoryItem, trashAmount)
                            TriggerServerEvent('fetchInvData')
                        elseif selectedSecondInventoryItem then
                            print('Item is on the second iventory')
                        else
                            print('No Item Selected')
                        end
                        Citizen.CreateThread(function()
                            Wait(250)
                            TriggerServerEvent('fetchInvData')
                            inventoryCooldown = false
                        end)
                    end
                end
            else
                DrawRect(0.5, 0.72, 0.075, 0.056, 0, 0, 0, 150)
            end


            local offset = 0.026
            local cursorOffset = 0.026
            local i = 0
            local totalWeight = 0
            local sortedItemList = sortAlphabetically(tempMainList)
            for _,itemData in pairs(sortedItemList) do 
                local k = itemData.title
                local v = itemData["value"]
                local itemname,amount,weight = table.unpack(v)
                print(k)
                print(weight)
                totalWeight = totalWeight + (amount * weight)
                DrawAdvancedText(0.404, 0.360 + (i*cursorOffset), 0.005, 0.0028, 0.366, itemname, 255, 255, 255, 255, 4, 0)
                DrawAdvancedText(0.521, 0.360 + (i*cursorOffset), 0.005, 0.0028, 0.366, tostring(weight*amount).. "kg", 255, 255, 255, 255, 4, 0)
                DrawAdvancedText(0.488, 0.360 + (i*cursorOffset), 0.005, 0.0028, 0.366, amount, 255, 255, 255, 255, 4, 0)
                if CursorInArea(0.2343,0.4484,0.3435 + (i*cursorOffset),0.3690 + (i*cursorOffset))  then
                    --DrawRect(0.5, 0.301+(offset * i), 0.223, 0.033, 255, 255, 255, 120)
                    DrawRect(0.342, 0.331+(offset * (i+1)), 0.215, 0.026, 255,0,0, 150)
                    if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                        selectedInventoryItem = k
                        selectedSecondInventoryItem = false
                    end
                elseif k == selectedInventoryItem then 
                    DrawRect(0.342, 0.331+(offset * (i+1)), 0.215, 0.026, 255,0,0, 150)
                end


                i = i + 1
            end

            if (totalWeight / maxInventoryWeight) > 0.5 then
                if (totalWeight / maxInventoryWeight) > 0.9 then
                    DrawAdvancedText(0.516, 0.307, 0.005, 0.0028, 0.366, "Weight: ".. totalWeight .."/".. maxInventoryWeight .. "kg", 255, 50, 0, 255, 4, 0)
                else
                    DrawAdvancedText(0.516, 0.307, 0.005, 0.0028, 0.366, "Weight: ".. totalWeight .."/".. maxInventoryWeight .. "kg", 255, 165, 0, 255, 4, 0)
                end
            else
                DrawAdvancedText(0.516, 0.307, 0.005, 0.0028, 0.366, "Weight: ".. totalWeight .."/".. maxInventoryWeight .. "kg", 255, 255, 255, 255, 4, 0)
            end 
            
        end
        Wait(0)
    end
end)

RegisterNetEvent('fetchAmount')
AddEventHandler('fetchAmount', function(hash, id, name)
    local player = GetPlayerPed(-1)
    local fetchedAmount = getMessage()
    if HasPedGotWeapon(player,hash,false) then
        TriggerServerEvent('sendAmount', fetchedAmount, id, name)
    else
        print('not got weapon')
    end
end)

RegisterNetEvent('fetchData')
AddEventHandler('fetchData', function(hash, id, name)
    local player = GetPlayerPed(-1)
    if HasPedGotWeapon(player,hash,false) then
        print('got weapon')
    else
        print('not got weapon')
        TriggerServerEvent('sendData', id, name)
    end
end)

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end


function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do
        table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end


function sortAlphabetically(myTable)
    local t = {}
    for title,value in pairsByKeys(myTable) do
        table.insert(t, { title = title, value = value })
    end
    myTable = t
    return myTable
end

function getMessage()
	AddTextEntry('FMMC_MPM_NA', "Enter Amount")
	DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Enter Amount", "", "", "", "", 30)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local result = GetOnscreenKeyboardResult()
		if result then
			return result
		end
    end
	return ""
end