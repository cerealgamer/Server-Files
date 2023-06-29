fx_version 'adamant'
games { 'gta5' }

dependencies {
  'vrp',
  "RageUI"
}


client_scripts {
    "@RageUI/src/RMenu.lua",
    "@RageUI/src/menu/RageUI.lua",
    "@RageUI/src/menu/Menu.lua",
    "@RageUI/src/menu/MenuController.lua",
    "@RageUI/src/components/Audio.lua",
    "@RageUI/src/components/Rectangle.lua",
    "@RageUI/src/components/Screen.lua",
    "@RageUI/src/components/Sprite.lua",
    "@RageUI/src/components/Text.lua",
    "@RageUI/src/components/Visual.lua",
    "@RageUI/src/menu/elements/ItemsBadge.lua",
    "@RageUI/src/menu/elements/ItemsColour.lua",
    "@RageUI/src/menu/elements/PanelColour.lua",
    "@RageUI/src/menu/items/UIButton.lua",
    "@RageUI/src/menu/items/UICheckBox.lua",
    "@RageUI/src/menu/items/UIList.lua",
    "@RageUI/src/menu/items/UIProgress.lua",
    "@RageUI/src/menu/items/UISlider.lua",
    "@RageUI/src/menu/items/UISliderHeritage.lua",
    "@RageUI/src/menu/items/UISliderProgress.lua",
    "@RageUI/src/menu/panels/UIColourPanel.lua",
    "@RageUI/src/menu/panels/UIGridPanel.lua",
    "@RageUI/src/menu/panels/UIGridPanelHorizontal.lua",
    "@RageUI/src/menu/panels/UIPercentagePanel.lua",
    "@RageUI/src/menu/panels/UIStatisticsPanel.lua",
    "@RageUI/src/menu/windows/UIHeritage.lua",
    'cl_livery.lua',
    "lib/Proxy.lua",
    "lib/Tunnel.lua",
    "cl_police.lua",
    "cl_knifestore.lua",
    'cl_smallarms.lua',
    'cl_clothingshop.lua',
    'cl_barbershop.lua',
    'cl_market.lua',
    'cl_balaclava.lua',
    --'cl_turfs.lua',
    'bags2.lua',
    "cl_liverymenu.lua",
    "cl_weapondamage.lua",
    "cl_vehiclemenu.lua",
    "cl_weapondraw.lua",
    "cl_prisoncook.lua",
    "cl_cookprisonfood.lua",
    "cl_sellprisonfood.lua",
    "cl_callmenu.lua",
    "cl_locksdoors.lua",
    "cl_weaponsOnBack.lua",
    "cl_lockpick.lua",
    "cl_killfeedLogs.lua",
    "cl_locksmith.lua",
}

server_scripts {
    "@vrp/lib/utils.lua",
    "sv_smallarms.lua",
    "sv_market.lua",
    "sv_bags2.lua",
    "sv_prisoncook.lua",
    "sv_cookprisonfood.lua",
    "sv_sellprisonfood.lua",
    "sv_events.lua",
    "sv_callmenu.lua",
    "sv_police.lua",
    "sv_lockpick.lua",
    "sv_killfeedLogs.lua",
    "sv_locksmith.lua",
    "sv_knifestore.lua",
    "sv_shittybuywaps.lua"
}

shared_scripts {
  "config.lua"
}