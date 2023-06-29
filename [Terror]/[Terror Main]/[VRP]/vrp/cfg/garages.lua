local cfg = {}
-- define garage types with their associated vehicles
-- (vehicle list: https://wiki.fivem.net/wiki/Vehicles)

-- each garage type is an associated list of veh_name/veh_definition 
-- they need a _config property to define the blip and the vehicle type for the garage (each vtype allow one vehicle to be spawned at a time, the default vtype is "default")
-- this is used to let the player spawn a boat AND a car at the same time for example, and only despawn it in the correct garage
-- _config: vtype, blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.rent_factor = 0.1 -- 10% of the original price if a rent
cfg.sell_factor = 0.75 -- sell for 75% of the original price
--this is the limit amount that you can put when you are trying to sell your personall vehicle to another player
cfg.limit = 100000000


cfg.garage_types = {
  ["Fisher's Boat"] = {
    _config = {vtype="Boat",blipid=427,blipcolor=28,permissions={"fisher.vehicle"}},
    ["suntrap"] = {"Fisher's boat",0, "Your favorite boat!"}
  },
  
  ["Standard Vehicles"] = {  -- 15k price cap
    _config = {vtype="Car",blipid=50,blipcolor=4},
    ["xkgt"] = {"Xkgt",0, ""},
    ["GT2RS"] = {"GT2RS",0, ""},
    ["ktm530"] = {"ktm530", 0, ""},
  },
  ["VIP Vehicles"] = {
    _config = {vtype="Car",blipid=50,blipcolor=4},
    ["xkgt"] = {"Xkgt",0, ""},
    ["GT2RS"] = {"GT2RS",0, ""},
    ["ktm530"] = {"ktm530", 0, ""},
  },
  ["Rank Vehicles"] = {
    _config = {vtype="Car",blipid=56,blipcolor=38,permissions={"rank.cars"}},
    ["Callum's Car"] = {"zn20",0, ""},
    ["Dodge Tracks Raid"] = {"raid",0, ""},
    ["mattrackx3"] = {"mattrackx3",0, ""},
  },
  ["Police Vehicles"] = {
    _config = {vtype="Car",blipid=56,blipcolor=38,permissions={"police.vehicle"}},
    ["jagrsmarked"] = {"INT Jaguar RS",0, "police"},
    ["polexplorer1"] = {"INT Ford Explorer",0, "police"},
    ["polm2"] = {"INT BMW M2",0, "police"},
    ["polm5"] = {"INT BMW M5",0, "police"},
    ["poltouring"] = {"INT BMW Touring",0, "police"},
    ["polx5"] = {"INT BMW X5",0, "police"},
    ["polxt660"] = {"INT Bike",0, "police"},
    ["polfordwagonmarked"] = {"Ford Wagon",0, "police"},
    ["polfordwagonunmarked"] = {"Ford Wagon Unmarked",0, "police"},
    ["polmitsubishi"] = {"Mitsuhishi Evo 9",0, "police"},
    ["tflvan"] = {"TFL Van",0, "police"},
    ["polvxr"] = {"Vauxhall Insignia VXR",0, "police"},
    ["apex3"] = {"PCSO Volkswagen",0, "police"},
    ["police4"] = {"Unmarked BMW X5",0, "police"},
    ["policeb"] = {"Police Bike",0, "police"},
    ["polsaloon"] = {"Police Saloon",0, "police"},
    ["polvol40"] = {"Volvo V40 Area Patrol",0, "police"},
    ["bmwx5red"] = {"SCO BMW X5 red",0, "police"},
    ["pola6"] = {"SCO Audi A6",0, "police"},
    ["polrange"] = {"SCO Range Rover Marked",0, "police"},
    ["polrange2"] = {"SCO Range Rover Unmarked",0, "police"},
    ["sco19unmarkedx5"] = {"SCO BMW X5 Unmarked",0, "police"},
    ["polsco19"] = {"SCO BMW X5 Marked",0, "police"},
    ["wf20"] = {"SCO WF20 Armoured Car",0, "police"}
  },
  ["Police Cadet"] = {
    _config = {vtype="Car",blipid=56,blipcolor=38,permissions={"Cadet.vehicle"}},
    ["police7"] = {"police",0, "police"}
  },
  ["FBI"] = {
    _config = {vtype="Car",blipid=56,blipcolor=38,permissions={"Bounty.vehicle"}},
    ["fbi"] = {"Unmarked",0, "police"}
  },
  ["Ambulance Service"] = {
    _config = {vtype="Car",blipid=50,blipcolor=3,permissions={"emergency.vehicle"}},
    ["newnhsskoda"] = {"Medic Skoda",0, "police"},
    ["nhsbmw2series"] = {"BMW 2 Series",0, "police"},
    ["nhsfiatvan"] = {"FIAT Van",0, "police"},
    ["nhsford"] = {"Medic Ford",0, "police"},
    ["nhsmercedes2"] = {"Mercedes Ambulance",0, "police"},
    ["nhsvol"] = {"Volvo",0, "police"},   
    ["nhsskoda"] = {"Original Skoda",0, "police"},   
    ["newnhsbmw2series_hi"] = {"HEMS BMW 2 Series",0, "police"},
    ["nhsvolvo"] = {"HEMS Volvo",0, "police"},
    ["nhsx5f15"] = {"HEMS X5 F15",0, "police"},
    ["nhsbike"] = {"HART Dirtbike",0, "police"},
    ["nhsmountainambulance"] = {"Mountain Ambulance",0, "police"},
    ["nhsx5"] = {"BMW X5",0, "police"},   
    ["nhsskodavrs"] = {"Skoda Octavia VRS Estate",0, "police"},   
    ["nhsv70"] = {"Volvo V70",0, "police"}
  },
  ["Police Helicopters"] = {
    _config = {vtype="Heli",blipid=43,blipcolor=38,radius=5.1,permissions={"police.vehicle"}},
    ["npas"] = {"NPAS-01",0, "emergency"},
    ["mh60"] = {"MH 60 Special Operations",0, "emergency"}
  },
  ["EMS Helicopter"] = {
    _config = {vtype="Heli",blipid=43,blipcolor=1,radius=5.1,permissions={"emergency.vehicle"}},
    ["supervolito2"] = {"EMS",0, "emergency"}
  },
  ["Mafia Garage"] = {
    _config = {vtype="Car",blipid=50,blipcolor=3,permissions={"mafia.vehicle"}},
	["infernus"] = {"Infernus", 0, ""}, -- THIS IS JUST AN EXAMPLE , ADD MORE IF YOU WANT.
  ["SaleemC63"] = {"SaleemC63", 0, ""},
  },
  ["Pilot Las Santos"] = {
    _config = {vtype="Plane",blipid=16,blipcolor=30,permissions={"pilot.vehicle"}},
    ["jet"] = {"Boeing 747",0, "jet"}
  },
  ["Helicopters"] = {
    _config = {vtype="Heli",blipid=16,blipcolor=30,permissions={"player.phone"}},
  },
  ["Air H"] = {
    _config = {vtype="Heli",blipid=43,blipcolor=30,permissions={"air.vehicle"}},
     ["volatus"] = {"Helicopter",0, "volatus"}
  }, 
  ["Uber"] = {
    _config = {vtype="Car",blipid=50,blipcolor=81,permissions={"uber.vehicle"}},
    ["surge"] = {"Surge",0, "surge"}
  },
  ["UPS"] = {
    _config = {vtype="Car",blipid=85,blipcolor=81,permissions={"ups.vehicle"}},
    ["boxville4"] = {"Delivery",0, "boxville4"}
  },
  ["Lawyer"] = {
    _config = {vtype="Car",blipid=50,blipcolor=7,permissions={"Lawyer.vehicle"}},
    ["panto"] = {"Panto", 0, "panto"}
  },
  ["Delivery Driver"] = {
    _config = {vtype="Car",blipid=85,blipcolor=31,permissions={"delivery.vehicle"}},
    ["faggio3"] = {"faggio3",0, "faggio3"}
  },  
  ["Mechanic"] = {
    _config = {vtype="Car",blipid=50,blipcolor=31,permissions={"repair.vehicle"}},
    ["towtruck2"] = {"towtruck2",0, "towtruck2"},
	["utillitruck3"] = {"Utility Truck",0, "utillitruck3"}
  },
  ["Bank Driver"] = {
    _config = {vtype="Car",blipid=67,blipcolor=4,permissions={"bankdriver.vehicle"}},
    ["stockade"] = {"stockade",0, "stockade"}
  },
  ["Trash Collector"] = {
    _config = {vtype="Car",blipid=67,blipcolor=4,permissions={"trash.vehicle"}},
    ["trash"] = {"Truck",0, "trash"}
  },
  ["Medical Driver"] = {
    _config = {vtype="Car",blipid=67,blipcolor=4,permissions={"medical.vehicle"}},
    ["pony2"] = {"Medical Weed Van",0, "pony2"}
  }

  --[[
    ["category name"] = {
      _config = {vtype="Car",blipid=67,blipcolor=4,permissions={"medical.vehicle"}},
      ["spawncode"] = {"vehiclename",0, "pony2"}
    }
  
    That example above is how you create your own categories. It's that easy :D
  ]]
  
  
}

-- {garage_vehicle_type,x,y,z}
cfg.garages = {
  {"Car", 1589.1396484375,6441.4052734375,25.130432128906},
  {"Car", 129.57, 6417.0, 31.32},
  {"Car", -340.11, 6144.76, 31.49},
  {"Car", 236.72, -786.69, 30.62},
  {"Car", 144.89, -1073.33, 29.29},
  {"Car", -343.72, -690.11, 32.76},
  {"Car", -45.162105560303,-1113.51171875,26.435789108276},
  {"Car", -334.17, -1460.99, 30.51},
  {"Car", -957.09, -2593.45, 13.85},
  {"Car", 1027.03, -3209.5, 5.87},
  {"Car", 710.52, -1069.91, 22.33},
  {"Car", -379.17, -111.68, 38.7},
  {"Car", 462.98, -1691.2, 29.28},
  {"Car", -1478.02, -503.91, 32.81},
  {"Car", -1479.67, -661.05, 28.94},
  {"Car", -407.89, 1186.56, 325.56},
  {"Car", 1369.71, 1147.47, 113.76},
  {"Car", 1870.04, 2593.27, 45.67},
  {"Car", 1767.28, 3346.3, 40.88},
  {"Car", 1956.67, 3772.12, 32.2},
  {"Car", 1709.98, 3768.9, 34.36},
  {"Car", 1421.36, 3609.27, 34.97},
  {"Car", -1139.71, 2663.65, 18.04},
  {"Car", -2529.25, 2339.41, 33.06},
  {"Car", 2147.8, 4802.23, 41.23},
  {"Car", 1695.67, 4942.92, 42.3},
  {"Car", 2580.07, 411.52, 108.46},
  {"Car", -2342.93, 286.35, 169.47},
  {"Car", 2786.95, 3483.52, 55.15},
  {"Car", -2198.67, 4257.09, 47.9},
  {"Car", -764.73, 5538.23, 33.49},
  {"Car", 713.45, 4174.52, 40.71},
  {"Car", 361.86, 2636.0, 44.5},
  {"Car", -1909.99, 2039.75, 140.74},
  {"Car", -1542.52, 1372.28, 125.57},
  {"Car", 499.78, 5593.61, 795.47},
  {"Car", -326.57, -2737.72, 6.02},
  {"Car", 885.02, -40.29, 78.76},
  {"Car", -2148.3610839844,-389.49792480468,13.27170753479},
  {"Car", 1540.3184814453,-2172.2060546875,77.418266296387},
  {"Car", -1567.4689941406,-1027.8215332032,13.0179977417},
  {"Car", -1424.1965332032,-956.92852783204,7.2084398269654},
  {"Car", -585.46759033204,-1795.3696289062,22.89291381836},
  {"Car", 945.34802246094,-2108.9724121094,30.530275344848},
  {"Car", 1152.4929199218,-482.14837646484,65.966651916504},
  {"Car", 361.49603271484,276.7993774414,103.23014831542},
  {"Car", -333.7925415039,295.1039428711,85.860633850098},
  {"Car", -3145.6398925782,1086.4655761718,20.690309524536},
  {"Car", -488.00637817382,597.48742675782,125.7096786499},
  {"Car", 2544.3898925782,2619.9348144532,37.944816589356},
  {"Car", 231.3556213379,1175.0581054688,225.4598083496},
  {"Car", 96.75863647461,-1402.7351074218,29.190948486328},
  {"Car", -443.28369140625,6035.2651367188,31.34055519104},
  {"Car", 1868.7182617188,3695.8071289062,33.571998596192},
  {"Car", 650.03259277344,-10.622005462646,82.800819396972},
  {"Car", 447.0803527832,-1020.1317749024,28.517087936402},
  {"Car", -1063.8640136718,-867.49835205078,4.943377494812},
  {"Car", -1322.5515136718,450.78497314454,99.671432495118},
  {"Car", -851.54016113282,796.72265625,192.60139465332},
  {"Car", 175.11833190918,484.53677368164,142.38960266114},
  {"Car", 627.88305664062,622.40325927734,128.91111755372},
  {"Car", 412.92449951172,-643.5853881836,28.500185012818},
  {"Car", 291.19, -336.5, 44.92},
  {"Car",768.86297607422,-1410.4896240234,26.502605438232},
  {"Heli",449.30340576172,-981.24963378906,43.69165802002}, -- Main PD
  {"Heli",1770.2171630859,3239.5561523438,42.13171005249}, -- Sandy Shores
  {"Heli",-475.24264526367,5988.7353515625,31.336685180664}, -- Paleto Bay
  {"Heli",449.30340576172,-981.24963378906,43.69165802002}, -- Main PD
  {"Heli",1770.2171630859,3239.5561523438,42.13171005249}, -- Sandy Shores
  {"Heli",-475.24264526367,5988.7353515625,31.336685180664}, -- Paleto Bay  
  {"Car",-343.22875976562,-926.90423583984,31.080631256104},
  {"Heli",2128.9069824219,4806.134765625,41.168750762939},
  {"Heli",-745.14343261719,-1468.5361328125,5.0005240440369},
  {"Heli",1734.9053955078,3297.9689941406,41.223503112793}
}

return cfg