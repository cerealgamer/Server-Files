cfg = {}
cfg.blipsenabled = false
cfg.perm = "police.pc" -- player.phone is default for everyone
cfg.currency = "£"

-- This is very important. The gunshops must go in order!
-- {x,y,z, heading}
cfg.gunshops = {
    [0] = { -- Paleto Bay
    ped = {461.16909790039,-981.13897705078,30.689310073853},
    marker = {461.16909790039,-981.13897705078,30.689310073853},
    },
} 

cfg.guns = {
    police = {
        {name = "Baton", price = 0, hash = "WEAPON_NIGHTSTICK"},
        {name = "Tazer", price = 0, hash = "WEAPON_STUNGUN"},
        {name = "Bora", price = 0, hash = "WEAPON_BORA"},
        {name = "g36c", price = 0, hash = "WEAPON_g36c"},
        {name = "glock", price = 0, hash = "WEAPON_GLOCK"},
       -- {name = "MP5", price = 0, hash = "WEAPON_VESPER"},
        {name = "SIG", price = 0, hash = "WEAPON_SIGMPX"},

    }
}

return cfg