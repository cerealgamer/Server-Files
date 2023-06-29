-- define items, see the Inventory API on github

-- define items, see the Inventory API on github

local cfg = {}
-- see the manual to understand how to create parametric items
-- idname = {name or genfunc, description or genfunc, genfunc choices or nil, weight or genfunc}
-- a good practice is to create your own item pack file instead of adding items here

 cfg.weapons = {
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
  "WEAPON_WINCHESTER12",
  "WEAPON_SV"
}



cfg.items = {
  ["15kg Backpack"] = {"15kg Backpack", "Backpack", nil, 5.00,"other"},
  ["30kg Backpack"] = {"30kg Backpack", "Backpack", nil, 5.00,"other"},
  ["40kg Backpack"] = {"40kg Backpack", "Backpack", nil, 5.00,"other"},
  ["60kg Backpack"] = {"60kg Backpack", "Backpack", nil, 5.00,"other"},
  ["Lockpick"] = {"Lockpick", "Lockpick", nil, 1.00,"other"},

  ["WEAPON_AK74"] = {"AK74","Bomb",nil,5.00,"weapon"},
  ["WEAPON_AK74_ammo"] = {"AK74 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_AK200"] = {"AK-200","Bomb",nil,5.00,"weapon"},
  ["WEAPON_AK200_ammo"] = {"AK-200 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_ARX"] = {"ARX","Bomb",nil,5.00,"weapon"},
  ["WEAPON_ARX_ammo"] = {"ARX Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_VAL"] = {"AS-VAL","Bomb",nil,5.00,"weapon"},
  ["WEAPON_VAL_ammo"] = {"AS-VAL Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_AUG"] = {"AUG","Bomb",nil,5.00,"weapon"},
  ["WEAPON_AUG_ammo"] = {"AUG Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_BARRET"] = {"Barret M98","Bomb",nil,7.50,"weapon"},
  ["WEAPON_BARRET_ammo"] = {"M98 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_BORA"] = {"Bora 12","Bomb",nil,7.50,"weapon"},
  ["WEAPON_BORA_ammo"] = {"Bora 12 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_DEVGRU"] = {"DEVGRU","Bomb",nil,5.00,"weapon"},
  ["WEAPON_DEVGRU_ammo"] = {"DEVGRU Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_FNX"] = {"FNX","Bomb",nil,5.00,"weapon"},
  ["WEAPON_FNX_ammo"] = {"FNX Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_G36K"] = {"G36K","Bomb",nil,5.00,"weapon"},
  ["WEAPON_G36K_ammo"] = {"G36K Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_GLOCK17"] = {"GLOCK17","Bomb",nil,5.00,"weapon"},
  ["WEAPON_GLOCK17_ammo"] = {"GLOCK17 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_GLOCK2"] = {"GLOCK 19","Bomb",nil,5.00,"weapon"},
  ["WEAPON_GLOCK2_ammo"] = {"GLOCK 19 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_GLOCK"] = {"GLOCK P80","Bomb",nil,5.00,"weapon"},
  ["WEAPON_GLOCK_ammo"] = {"GLOCK P80 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_GOLDDEAGLE"] = {"GOLD DEAGLE","Bomb",nil,5.00,"weapon"},
  ["WEAPON_GOLDDEAGLE_ammo"] = {"GOLD DEAGLE Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_HK416"] = {"HK416","Bomb",nil,5.00,"weapon"},
  ["WEAPON_HK416_ammo"] = {"HK416 Ammo","Bomb",nil,0.01,"ammo"},
  
  ["WEAPON_QBZ"] = {"HK417","Bomb",nil,5.00,"weapon"},
  ["WEAPON_QBZ_ammo"] = {"QBZ Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_HK870"] = {"HK870","Bomb",nil,5.00,"weapon"},
  ["WEAPON_HK870_ammo"] = {"HK870 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_AK74KASHNAR"] = {"AK74 KASHNAR","Bomb",nil,5.00,"weapon"},
  ["WEAPON_AK74KASHNAR_ammo"] = {"AK74 KASHNAR Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_LVOAC"] = {"LVOAC","Bomb",nil,5.00,"weapon"},
  ["WEAPON_LVOAC_ammo"] = {"LVOAC Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_M4A1"] = {"M4A1","Bomb",nil,5.00,"weapon"},
  ["WEAPON_M4A1_ammo"] = {"M4A1 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_M16A4"] = {"M16A4","Bomb",nil,5.00,"weapon"},
  ["WEAPON_M16A4_ammo"] = {"M16A4 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_MOSIN"] = {"MOSIN","Bomb",nil,7.50,"weapon"},
  ["WEAPON_MOSIN_ammo"] = {"MOSIN Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_SP1"] = {"SP1","Bomb",nil,5.00,"weapon"},
  ["WEAPON_SP1_ammo"] = {"SP1 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_M203"] = {"M203","Bomb",nil,5.00,"weapon"},
  ["WEAPON_M203_ammo"] = {"M203 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_MP5"] = {"MP5","Bomb",nil,5.00,"weapon"},
  ["WEAPON_MP5_ammo"] = {"MP5 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_PT92"] = {"PT92","Bomb",nil,5.00,"weapon"},
  ["WEAPON_PT92_ammo"] = {"PT92 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_REMINGTON700"] = {"REMINGTON 700","Bomb",nil,5.00,"weapon"},
  ["WEAPON_REMINGTON700_ammo"] = {"REMINGTON 700 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_REMINGTON870"] = {"REMINGTON 870","Bomb",nil,5.00,"weapon"},
  ["WEAPON_REMINGTON870_ammo"] = {"REMINGTON 870 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_RIFLEV2"] = {"RIFLE V2","Bomb",nil,5.00,"weapon"},
  ["WEAPON_RIFLEV2_ammo"] = {"RIFLE V2 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_SCAR"] = {"SCAR-L","Bomb",nil,5.00,"weapon"},
  ["WEAPON_SCAR_ammo"] = {"SCAR-L Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_MCX"] = {"SIG MCX","Bomb",nil,5.00,"weapon"},
  ["WEAPON_MCX_ammo"] = {"MCX Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_SVD"] = {"SVD Sniper Rifle","Bomb",nil,5.00,"weapon"},
  ["WEAPON_SVD_ammo"] = {"SVD Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_UMP"] = {"UMP 45","Bomb",nil,5.00,"weapon"},
  ["WEAPON_UMP_ammo"] = {"UMP 45 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_UZI"] = {"UZI","Bomb",nil,5.00,"weapon"},
  ["WEAPON_UZI_ammo"] = {"UZI Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_VESPER"] = {"VESPER","Bomb",nil,5.00,"weapon"},
  ["WEAPON_VESPER_ammo"] = {"VESPER Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_VOM"] = {"VOM Feuer","Bomb",nil,5.00,"weapon"},
  ["WEAPON_VOM_ammo"] = {"VOM Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_DEAGLE"] = {"White Tint Deagle","Bomb",nil,5.00,"weapon"},
  ["WEAPON_DEAGLE_ammo"] = {"White Tint Deagle Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_WINCHESTER12"] = {"WINCHESTER 12","Bomb",nil,5.00,"weapon"},
  ["WEAPON_WINCHESTER12_ammo"] = {"WINCHESTER 12 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_SV"] = {"SV98","Bomb",nil,7.50,"weapon"},
  ["WEAPON_SV_ammo"] = {"SV98 Ammo","Bomb",nil,0.01,"ammo"},

  ["WEAPON_CAPSHIELD"] = {"Captain America Shield","Bomb",nil,5.00,"weapon"},

  ["benzoilmetilecgonina"] = {"Benzoilmetilecgonina", "Some Benzoic acid ester.", nil, 0.01}, -- no choices
  ["seeds"] = {"Seeds", "Some Weed seeds.", nil, 0.01}, -- no choices
  ["harness"] = {"Harness", "Some Harness Lysergsäurediethylamid.", nil, 0.01}, -- no choices
  ["AK47"] = {"AK47", "A Russian masterpeice.", nil, 0.01}, -- no choices
  ["M4A1"] = {"M4A1", "Helps give non-Americans freedom.", nil, 0.01}, -- no choices
  ["credit"] = {"Stolen Credit Card", "Credit card.", nil, 0.01}, -- no choices
  ["driver"] = {"Driver license Card", "license card.", nil, 0.01}, -- no choices
  ["bank_money"] = {"Money of bank", "$.", nil, 0},
  ["trash"] = {"Trash", "It fucking stinks!", nil, 0},  -- no choices
  ["fake_id"] = {"Fake ID", "It just says Mcluvin.", nil, 0}, -- no choices
  ["police_report"] = {"Police Report", "Take it to the Bank Manager.", nil, 0},  -- no choices
  ["ems_report"] = {"EMS Report", "Take it to the Hospital.", nil, 0}, -- no choices
  ["cargo"] = {"Cargo", "Boxes full of porn.", nil, 0}, -- no choices
  ["Opium Poppy"] = {"Opium Poppy", "Boxes full of porn.", nil, 0}, -- no choices
  ["Crack Cocaine"] = {"Crack Cocaine", "Boxes full of porn.", nil, 0}, -- no choices
  ["Cocaine"] = {"Cocaine", "Boxes full of porn.", nil, 0}, -- no choices
  ["heroin"] = {"Heroin", "Boxes full of porn.", nil, 0},-- no choices
  ["doge"] = {"Doge", "Boxes full of porn.", nil, 0}, -- no choices
  ["dogecoin"] = {"Doge Coin", "Boxes full of porn.", nil, 0}, -- no choices
  ["unweed"] = {"Weed Bud", "Boxes full of porn.", nil, 0}, -- no choices
  ["weed"] = {"Weed", "Boxes full of porn.", nil, 0} -- no choices
}

-- load more items function
local function load_item_pack(name)
  local items = module("cfg/item/"..name)
  if items then
    for k,v in pairs(items) do
      cfg.items[k] = v
    end
  else
    print("[vRP] item pack ["..name.."] not found")
  end
end

-- PACKS
load_item_pack("required")
load_item_pack("food")
load_item_pack("drugs")

return cfg
