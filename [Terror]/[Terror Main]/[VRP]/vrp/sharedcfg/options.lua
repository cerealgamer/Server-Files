vRPConfig = {} -- Global variable for easy referencing. 

vRPConfig.MoneyUiEnabled = false; -- Set to false to disable Money in the top right corner. 
vRPConfig.SurvivalUiEnabled = false; -- Controls the UI under the healthbar.
vRPConfig.EnableComa = true; -- Controls the vRP coma on death.
vRPConfig.EnableFoodAndWater = false; -- Controls the food and water system.
vRPConfig.EnableHealthRegen = true; -- Controls the health regen. (Whether they regen health after taking damage do not disable if coma is enabled.)
vRPConfig.EnableBuyVehicles = true; -- Enables ability to buy vehicles from the RageUI Garages.  
vRPConfig.LoadPreviews = true; -- Controls the car previews with the RageUI Garages.
vRPConfig.VehicleStoreRadius = 250; -- Controls radius a vehicle can be stored from.
vRPConfig.LoseItemsOnDeath = true; -- Controls whether you lose inventory items on death.
vRPConfig.AllowMoreThenOneCar = true; -- Controls if you can have more than one car out.
vRPConfig.F10System = true; -- Logs warnings and can be accessed via F10 (Thanks to Rubbertoe98) (https://github.com/rubbertoe98/FiveM-Scripts/tree/master/vrp_punishments)
vRPConfig.ServerName = "TerrorRP" -- Controls the name that is displayed on warnings title etc.