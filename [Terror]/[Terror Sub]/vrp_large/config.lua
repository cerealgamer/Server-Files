cfg = {}
cfg.blipsenabled = false
cfg.perm = "player.phone" -- player.phone is default for everyone
cfg.currency = "£"

-- This is very important. The gunshops must go in order!
-- {x,y,z, heading}
cfg.gunshops = {
    [0] = { -- Paleto Bay
    ped = {1339.8641357422,4391.8813476563,44.343795776367},
    marker = {1339.8641357422,4391.8813476563,44.343795776367},
    },
} 

cfg.guns = {
    large = {
        {name = "Vesper", price = 300000, hash = "WEAPON_VESPER"},
        {name = "M203", price = 700000, hash = "WEAPON_M203"},
        {name = "Lvoac", price = 600000, hash = "WEAPON_LVOAC"},
        {name = "AUG", price = 600000, hash = "WEAPON_AUG"},
        {name = "HK-870", price = 0, hash = "WEAPON_HK870"},
        {name = "ARX", price = 0, hash = "WEAPON_ARX"},

    }
}

return cfg