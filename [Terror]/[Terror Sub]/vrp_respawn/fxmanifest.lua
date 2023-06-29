fx_version 'adamant'
games { 'gta5' };



dependencies {
    "vrp",
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
    "@RageUI2/src/RMenu.lua",
    "@RageUI2/src/menu/RageUI.lua",
    "@RageUI2/src/menu/Menu.lua",
    "@RageUI2/src/menu/MenuController.lua",
    "@RageUI2/src/components/Audio.lua",
    "@RageUI2/src/components/Rectangle.lua",
    "@RageUI2/src/components/Screen.lua",
    "@RageUI2/src/components/Sprite.lua",
    "@RageUI2/src/components/Text.lua",
    "@RageUI2/src/components/Visual.lua",
    "@RageUI2/src/menu/elements/ItemsBadge.lua",
    "@RageUI2/src/menu/elements/ItemsColour.lua",
    "@RageUI2/src/menu/elements/PanelColour.lua",
    "@RageUI2/src/menu/items/UIButton.lua",
    "@RageUI2/src/menu/items/UICheckBox.lua",
    "@RageUI2/src/menu/items/UIList.lua",
    "@RageUI2/src/menu/items/UIProgress.lua",
    "@RageUI2/src/menu/items/UISlider.lua",
    "@RageUI2/src/menu/items/UISliderHeritage.lua",
    "@RageUI2/src/menu/items/UISliderProgress.lua",
    "@RageUI2/src/menu/panels/UIColourPanel.lua",
    "@RageUI2/src/menu/panels/UIGridPanel.lua",
    "@RageUI2/src/menu/panels/UIGridPanelHorizontal.lua",
    "@RageUI2/src/menu/panels/UIPercentagePanel.lua",
    "@RageUI2/src/menu/panels/UIStatisticsPanel.lua",
    "@RageUI2/src/menu/windows/UIHeritage.lua",
    "cl_respawn.lua",
}

server_scripts{ 
    "@vrp/lib/utils.lua",
    "sv_respawn.lua"
}


