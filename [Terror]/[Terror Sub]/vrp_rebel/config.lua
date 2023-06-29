cfg = {}
cfg.blipsenabled = false
cfg.perm = "player.phone" -- player.phone is default for everyone
cfg.currency = "£"

-- This is very important. The gunshops must go in order!
-- {x,y,z, heading}
cfg.gunshops = {
    [0] = { -- Paleto Bay
        ped = {2355.8374023438,3143.7854003906,48.208755493164},
        marker = {2355.8374023438,3143.7854003906,48.308755493164},
    },
} 

cfg.guns = {
    rebel = {
        {name = "Mosin", price = 400000, hash = "WEAPON_MOSIN"},
        {name = "AK-200", price = 500000, hash = "WEAPON_AK200"},
        {name = "AK-74 Kashnar", price = 500000, hash = "WEAPON_AK74KASHNAR"},
        {name = "M4A1", price = 825000, hash = "WEAPON_M4A1"},
        {name = "UZI", price = 450000, hash = "WEAPON_UZI"},
        {name = "Winchester-12", price = 450000, hash = "WEAPON_WINCHESTER12"},
        {name = "MP5", price = 450000, hash = "WEAPON_SPACEFLIGHTMP5"},

    }
}

return cfg