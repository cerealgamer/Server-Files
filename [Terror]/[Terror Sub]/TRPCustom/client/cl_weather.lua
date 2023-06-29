Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        SetWeatherTypePersist('EXTRASUNNY')
        SetWeatherTypeNow('EXTRASUNNY')
        SetWeatherTypeNowPersist('EXTRASUNNY')
    end
end)