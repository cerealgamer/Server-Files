fx_version 'cerulean'
games {  'gta5' }

description "RP module/framework"

dependency "ghmattimysql"
dependency "vrp_mysql"

ui_page "gui/index.html"

shared_scripts {
  "sharedcfg/*"
}

-- RageUI
client_scripts {
	"rageui/RMenu.lua",
	"rageui/menu/RageUI.lua",
	"rageui/menu/Menu.lua",
	"rageui/menu/MenuController.lua",
	"rageui/components/*.lua",
	"rageui/menu/elements/*.lua",
	"rageui/menu/items/*.lua",
	"rageui/menu/panels/*.lua",
	"rageui/menu/panels/*.lua",
	"rageui/menu/windows/*.lua"
}

-- server scripts
server_scripts{ 
  "lib/utils.lua",
  "base.lua",
  "modules/sv_killfeed.lua",
  "modules/gui.lua",
  "modules/sv_inventory.lua",
  "modules/group.lua",
  "modules/admin.lua",
  "modules/survival.lua",
  "modules/player_state.lua",
  "modules/map.lua",
  "modules/money.lua",
  "modules/inventory.lua",
  "modules/identity.lua",
  "modules/business.lua",
  "modules/item_transformer.lua",
  "modules/emotes.lua",
  "modules/police.lua",
  "modules/home.lua",
  "modules/sv_lootbags.lua",
  "modules/home_components.lua",
  "modules/mission.lua",
  "modules/aptitude.lua",

  -- basic implementations
  "modules/basic_phone.lua",
  "modules/basic_atm.lua",
  "modules/basic_market.lua",
  "modules/basic_gunshop.lua",
  "modules/basic_garage.lua",
  "modules/basic_items.lua",
  "modules/basic_skinshop.lua",
  "modules/cloakroom.lua",
  "modules/paycheck.lua",
  "modules/LsCustoms.lua",
  "modules/server_commands.lua",
  "modules/sv_dealership.lua",
  "modules/sv_anticheat.lua",
  "modules/sv_discord.lua",
  "MergedServer/*",
  "modules/warningsystem.lua",
  -- "modules/hotkeys.lua"
}

-- client scripts
client_scripts{
  "cfg/atms.lua",
  "cfg/skinshops.lua",
  "cfg/garages.lua",
  "cfg/admin_menu.lua",
  "lib/utils.lua",
  "lib/cl_mouse.lua",
  "client/Tunnel.lua",
  "client/Proxy.lua",
  "client/base.lua",
  "utils/*",
  "client/iplloader.lua",
  "client/cl_killfeed.lua",
  "client/cl_inventory.lua",
  "client/gui.lua",
  "client/player_state.lua",
  "client/survival.lua",
  "client/map.lua",
  "client/identity.lua",
  "client/basic_garage.lua",
  "client/police.lua",
  "client/lockcar-client.lua",
  "client/admin.lua",
  "client/enumerators.lua",
  "client/inventory.lua",
  "client/clothing.lua",
  "client/atms.lua",
  "client/garages.lua",
  "client/adminmenu.lua",
  "client/cl_lootbags.lua",
  "client/LsCustomsMenu.lua",
  "client/LsCustoms.lua",
  "client/cl_redzones.lua",
  "client/cl_combat.lua",
  "client/cl_dealership.lua",
  "client/cl_noai.lua",
  "client/cl_antivdm.lua",
  "client/cl_vdm.lua",
  "client/cl_anticheat.lua",
  "client/cl_discord.lua",
  "MergedClient/*",
  "client/warningsystem.lua",
  "client/cl_crouch.lua",
  -- "hotkeys/hotkeys.lua"
}



-- client files
files{
  "cfg/client.lua",
  "gui/index.html",
  "gui/design.css",
  "gui/main.js",
  "gui/ogrp.main.js",
  "gui/ogrp.menu.js",
  "gui/ProgressBar.js",
  "gui/WPrompt.js",
  "gui/RequestManager.js",
  "gui/AnnounceManager.js",
  "gui/Div.js",
  "gui/dynamic_classes.js",
  "gui/fonts/Pdown.woff",
  "gui/fonts/GTA.woff"
}
