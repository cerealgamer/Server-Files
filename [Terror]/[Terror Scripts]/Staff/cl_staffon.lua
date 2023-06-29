TerrorRPStaffClientT = {}
Tunnel.bindInterface("TerrorRP_Staff",TerrorRPStaffClientT)
Proxy.addInterface("TerrorRP_Staff",TerrorRPStaffClientT)
TerrorRPStaffServer = Tunnel.getInterface("TerrorRP_Staff","TerrorRP_Staff")
vRP = Proxy.getInterface("vRP")


staffon = false

useCustomScale = false

clothing = {

}

props = {

}

armour = 0

function TerrorRPStaffClientT.DeleteVehicle()
  DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
end

function TerrorRPStaffClientT.CheckBMX()
  local ped = PlayerPedId()
  if IsPedInAnyVehicle(ped, atGetIn) then
    return  vRP.notify({"~r~You can't be in a vehicle dummy"})
  end
  if IsPedDeadOrDying(ped, 1) == true then
    return  vRP.notify({"~r~Errr... You are a bit dead"})
  end

  local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.2, 0.5))
  local veh = "BMX"
  vehiclehash = GetHashKey(veh)
  RequestModel(vehiclehash)

  Citizen.CreateThread(function()
    local waiting = 0
    while not HasModelLoaded(vehiclehash) do
      waiting = waiting + 100
      Citizen.Wait(100)
      if waiting > 5000 then
        vRP.notify({"~r~Could not load the vehicle model in time, a crash was prevented."})
        break
      end
    end
    TriggerEvent("TerrorRP:playNitroAnim")
    Wait(6500)
    ClearPedTasks(PlayerPedId())
    local important =   CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
    end)
end

function TerrorRPStaffClientT.StaffOn()
  TriggerEvent("TerrorRP:FIXCLIENT", source, "1")
  staffon = true
  local ped = PlayerPedId()
  SetEntityHealth(ped, 180)
  SetEntityMaxHealth(ped, 180)
  armour = GetPedArmour(ped)
  SetPedArmour(ped, 0)
  TriggerServerEvent("TerrorRP:STAFFONREV")
  for i=0,11 do -- save outfit
    clothing[i] = { GetPedDrawableVariation(ped, i), GetPedTextureVariation(ped, i), GetPedPaletteVariation(ped, i) }
  end

  for i=0,7 do
    props[i] = { GetPedPropIndex(ped, i), GetPedPropTextureIndex(ped, i) }
  end

  for i=1,11 do
    drawable = 0
    if i == 3 then
      drawable = 15
    elseif i == 4 then
      drawable = 61
    elseif i == 6 then
      drawable = 34
    elseif i == 8 then
      drawable = 15
    elseif i == 11 then
      drawable = 252
    elseif i == 0 then
      drawable = 8
    end
   if drawable ~= 0 then
    SetPedComponentVariation(ped, i, drawable, 0, 0)
   end
  end
    SetPedCanRagdoll(PlayerPedId(), false)
    TriggerEvent("ConflictCore:HideArmour")
    local hash = GetEntityModel(PlayerPedId())
    if hash == 1885233650 then                     -- Male
      SetPedComponentVariation(ped, 11, 313, 1, 0)  -- Jacket
      SetPedComponentVariation(ped, 4, 61, 2, 0)   -- Legs
      SetPedComponentVariation(ped, 6, 6, 0, 0)    -- Shoes
      SetPedComponentVariation(ped, 8, 159, 0, 0)  -- Undershirt
      -- SetPedComponentVariation(ped, 3, 1, 0, 0) -- Torso
      SetPedComponentVariation(ped, 3, 1, 0, 0)    -- Hands
      SetPedPropIndex(ped, 0, 49, 0, true)         -- Hat
      SetPlayerInvincible(ped, true)
    else                                           -- Female
      SetPedComponentVariation(ped, 11, 53, 0, 0)  -- jacket
      SetPedComponentVariation(ped, 4, 27, 2, 0)   -- Legs
      SetPedComponentVariation(ped, 6, 11, 3, 0)   -- hoes
      SetPedComponentVariation(ped, 8, 36, 0, 0)   -- undershirt
      SetPedComponentVariation(ped, 3, 96, 0, 0)   -- torso
      SetPlayerInvincible(ped, true)
    end
    while staffon do
      Citizen.Wait(0)
      local ped = PlayerPedId()
      SetEntityInvincible(PlayerPedId(),true)
      SetEntityHealth(PlayerPedId(),200)
      BeginTextCommandPrint("STRING");
      AddTextComponentString("~r~Remember to /return");
      EndTextCommandPrint(1, true);
    end
end


function TerrorRPStaffClientT.StaffOff()
  if not staffon then
    return vRP.notify({"~r~You are not on duty."})
  end
  staffon = false
  local ped = PlayerPedId()
  SetEntityInvincible(ped,false, 0)
  for i=0,11 do
    item = clothing[i]
    SetPedComponentVariation(ped, i, item[1], item[2], item[3])
  end
  SetPedCanRagdoll(PlayerPedId(), true)
  for i=0,7 do
    item = props[i]
    if GetEntityModel(ped) == 1885233650 then
      if tostring(json.encode(item)) == "[-1,-1]" then
        SetPedPropIndex(ped, 0, 8, 4,2)
      elseif tostring(json.encode(item)) ~= "[-1,-1]" then
        SetPedPropIndex(ped, i, item[1], item[2], true)
      end
    elseif GetEntityModel(ped) == -1667301416 then
      if tostring(json.encode(item)) == "[-1,-1]" then
        ClearPedProp(ped, 0)
      elseif tostring(json.encode(item)) ~= "[-1,-1]" then
        SetPedPropIndex(ped, i, item[1], item[2], true)
      end
    end
  end
  SetPedArmour(ped, armour)
  TriggerEvent("ConflictCore:ShowArmour")
end
