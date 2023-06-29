
local blips = {
    {title="NHS", colour=2, id=61, coords = vector3(310.90142822266,-595.93170166016,43.28398513794)},
    {title="NHS", colour=2, id=61, coords = vector3(1836.7548828125,3685.396484375,34.270084381104)},
    {title="NHS", colour=2, id=61, coords = vector3(-259.52655029296,6330.7192382812,32.427276611328)},
    {title="Police", colour=38, id=60, coords = vector3(447.35440063476,-977.54974365234,30.68967628479)},
}
   
   
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blips = AddBlipForCoord(info.coords)
        SetBlipSprite(info.blips, info.id)
        SetBlipDisplay(info.blips, 4)
        SetBlipScale(info.blips, 0.8)
        SetBlipAsShortRange(info.blips, true)
        SetBlipColour(info.blips, info.colour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info['title'])
        EndTextCommandSetBlipName(info.blips)
    end
end)
   
   