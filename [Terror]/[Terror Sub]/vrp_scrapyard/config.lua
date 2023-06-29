cfg = {}
cfg.blipsenabled = false
cfg.perm = "player.phone" -- player.phone is default for everyone
cfg.currency = "£"

-- This is very important. The gunshops must go in order!
-- {x,y,z, heading}
cfg.gunshops = {
    [0] = { -- Paleto Bay
        ped = {1523.3735351563,-2149.6591796875,77.413009643555},
        marker = {1523.3735351563,-2149.6591796875,77.413009643555},
    },
} 

cfg.guns = {
    scrapyard = {
        {name = "Mosin", price = 500000, hash = "WEAPON_MOSIN"},
        {name = "AK-74", price = 700000, hash = "WEAPON_AK74"},
        {name = "HK-416", price = 650000, hash = "WEAPON_HK416"},
        {name = "SCAR-L", price = 825000, hash = "WEAPON_SCARL"},
        {name = "VESPER", price = 450000, hash = "WEAPON_VESPER"},
        {name = "AK-200", price = 700000, hash = "WEAPON_AK200"},
    }
}

return cfg