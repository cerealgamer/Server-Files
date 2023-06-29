Redzones = {
  -- ["Bandit"] = { Coords = vector3(2384.8393554688,3080.80078125,48.162200927734), Radius = 0.0},
  ["Diamond"] = { Coords = vector3(3524.685546875,3722.6999511719,77.021446228027), Radius = 200.0 },
  ["Large Arms"] = { Coords = vector3(1341.2395019532,4328.4223632812,38.077922821044), Radius = 120.0 },
  ["Smeltery"] = { Coords = vector3(1095.5245361328,-1998.486328125,29.54412651062), Radius = 100.0},
  ["Rebel"] = { Coords = vector3(1457.4250488281,6308.064453125,63.868026733398), Radius = 130.0 }
}

Citizen.CreateThread(function()
  for ZoneName, ZoneData in pairs(Redzones) do
    local RedzoneBlip = AddBlipForRadius(ZoneData.Coords, ZoneData.Radius)
    SetBlipColour(RedzoneBlip, 1)
    SetBlipAlpha(RedzoneBlip, 100)
  end
end)
