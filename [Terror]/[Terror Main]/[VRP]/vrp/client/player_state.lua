
-- periodic player state update

local state_ready = false

AddEventHandler("playerSpawned",function() -- delay state recording
  state_ready = false
  
  Citizen.CreateThread(function()
    Citizen.Wait(30000)
    state_ready = true
  end)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(30000)

    if IsPlayerPlaying(PlayerId()) and state_ready then
      local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
      vRPserver.updatePos({x,y,z})
      vRPserver.updateHealth({tvRP.getHealth()})
      vRPserver.updateArmour({GetPedArmour(PlayerPedId())})
      vRPserver.updateWeapons({tvRP.getWeapons()})
      vRPserver.updateCustomization({tvRP.getCustomization()})
    end
  end
end)

-- WEAPONS

-- def
local weapon_types = {
  "WEAPON_AK74",
  "WEAPON_AK200",
  "WEAPON_ARX",
  "WEAPON_VAL",
  "WEAPON_AUG",
  "WEAPON_BARRET",
  "WEAPON_BORA",
  "WEAPON_CAPSHIELD",
  "WEAPON_DEVGRU",
  "WEAPON_FNX",
  "WEAPON_G36K",
  "WEAPON_GLOCK17",
  "WEAPON_GLOCK2",
  "WEAPON_GLOCK",
  "WEAPON_GOLDDEAGLE",
  "WEAPON_HK416",
  "WEAPON_QBZ",
  "WEAPON_HK870",
  "WEAPON_AK74KASHNAR",
  "WEAPON_LVOAC",
  "WEAPON_M4A1",
  "WEAPON_M16A4",
  "WEAPON_SP1",
  "WEAPON_M203",
  "WEAPON_MOSIN",
  "WEAPON_MP5",
  "WEAPON_PT92",
  "WEAPON_REMINGTON700",
  "WEAPON_REMINGTON870",
  "WEAPON_RIFLEV2",
  "WEAPON_SCAR",
  "WEAPON_MCX",
  "WEAPON_SVD",
  "WEAPON_UMP",
  "WEAPON_UZI",
  "WEAPON_VESPER",
  "WEAPON_VOM",
  "WEAPON_DEAGLE",
  "WEAPON_WINCHESTER12"
}

function tvRP.getWeaponTypes()
  return weapon_types
end

function tvRP.getWeapons()
  local player = GetPlayerPed(-1)

  local ammo_types = {} -- remember ammo type to not duplicate ammo amount

  local weapons = {}
  for k,v in pairs(weapon_types) do
    local hash = GetHashKey(v)
    if HasPedGotWeapon(player,hash) then
      local weapon = {}
      weapons[v] = weapon

      local atype = Citizen.InvokeNative(0x7FEAD38B326B9F74, player, hash)
      if ammo_types[atype] == nil then
        ammo_types[atype] = true
        weapon.ammo = GetAmmoInPedWeapon(player,hash)
      else
        weapon.ammo = 0
      end
    end
  end

  return weapons
end

vRPclient = Proxy.getInterface("vRP")
function tvRP.giveWeapons(weapons,clear_before)
  local player = GetPlayerPed(-1)

  -- give weapons to player

  if clear_before then
    RemoveAllPedWeapons(player,true, 0)
  end

  for k,weapon in pairs(weapons) do
    local hash = GetHashKey(k)
    local ammo = weapon.ammo or 0

    vRPclient.allowWeapon({k, "-1"})
    GiveWeaponToPed(player, hash, ammo, false, 0)
  end
  return true
end

--[[
function tvRP.dropWeapon()
  SetPedDropsWeapon(GetPlayerPed(-1))
end
--]]

-- PLAYER CUSTOMIZATION

-- parse part key (a ped part or a prop part)
-- return is_proppart, index
local function parse_part(key)
  if type(key) == "string" and string.sub(key,1,1) == "p" then
    return true,tonumber(string.sub(key,2))
  else
    return false,tonumber(key)
  end
end

function tvRP.getDrawables(part)
  local isprop, index = parse_part(part)
  if isprop then
    return GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1),index)
  else
    return GetNumberOfPedDrawableVariations(GetPlayerPed(-1),index)
  end
end

function tvRP.getDrawableTextures(part,drawable)
  local isprop, index = parse_part(part)
  if isprop then
    return GetNumberOfPedPropTextureVariations(GetPlayerPed(-1),index,drawable)
  else
    return GetNumberOfPedTextureVariations(GetPlayerPed(-1),index,drawable)
  end
end

function tvRP.getCustomization()
  local ped = GetPlayerPed(-1)

  local custom = {}

  custom.modelhash = GetEntityModel(ped)

  -- ped parts
  for i=0,20 do -- index limit to 20
    custom[i] = {GetPedDrawableVariation(ped,i), GetPedTextureVariation(ped,i), GetPedPaletteVariation(ped,i)}
  end

  -- props
  for i=0,10 do -- index limit to 10
    custom["p"..i] = {GetPedPropIndex(ped,i), math.max(GetPedPropTextureIndex(ped,i),0)}
  end

  return custom
end

-- partial customization (only what is set is changed)
function tvRP.setCustomization(custom) -- indexed [drawable,texture,palette] components or props (p0...) plus .modelhash or .model
  local exit = TUNNEL_DELAYED() -- delay the return values

  Citizen.CreateThread(function() -- new thread
    if custom then
      local ped = GetPlayerPed(-1)
      local mhash = nil

      -- model
      if custom.modelhash ~= nil then
        mhash = custom.modelhash
      elseif custom.model ~= nil then
        mhash = GetHashKey(custom.model)
      end

      if mhash ~= nil then
        local i = 0
        while not HasModelLoaded(mhash) and i < 10000 do
          RequestModel(mhash)
          Citizen.Wait(10)
        end

        if HasModelLoaded(mhash) then
          -- changing player model remove weapons, so save it
          local weapons = tvRP.getWeapons()
          SetPlayerModel(PlayerId(), mhash)
          tvRP.giveWeapons(weapons,true, 0)
          SetModelAsNoLongerNeeded(mhash)
        end
      end

      ped = GetPlayerPed(-1)

      -- parts
      for k,v in pairs(custom) do
        if k ~= "model" and k ~= "modelhash" then
          local isprop, index = parse_part(k)
          if isprop then
            if v[1] < 0 then
              ClearPedProp(ped,index)
            else
              SetPedPropIndex(ped,index,v[1],v[2],v[3] or 2)
            end
          else
            SetPedComponentVariation(ped,index,v[1],v[2],v[3] or 2)
          end
        end
      end
    end

    exit({})
  end)
end

-- fix invisible players by resetting customization every minutes
--[[
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(60000)
    if state_ready then
      local custom = tvRP.getCustomization()
      custom.model = nil
      custom.modelhash = nil
      tvRP.setCustomization(custom)
    end
  end
end)
--]]

RegisterCommand("storeweapons", function()
  TriggerServerEvent("TRP:Storeweapon")
end)
