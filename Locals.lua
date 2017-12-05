local addonName, addon = ...

local L = {}
local locale = GetLocale();

L["HELP_INFO"] = "As you level up you will unlock new content such as new abilities, talent points and dungeons.\n\nLeft clicking the unlocks will open related windows and remove them from the list.\n\nLeft clicking or dragging abilities allows you to move them to your action bars.\n\nRight clicking the unlocks will remove them from the list."
L["HELP_INFO_CHART"] = "This chart gives an overview of your leveling progression and what is yet to come."
L["ERROR_OPEN_IN_COMBAT"] = "|cFFFFD100ILWhat:|r |cFFFF5555Can't open that during combat. It will open once you leave combat.|r";
L["TOOLTIP_TALENT"] = "You can pick a new talent.";
L["TOOLTIP_RIDING"]= "You can now learn this riding skill at a riding trainer.";
L["TOOLTIP_INSTANCE"] = "A new instance has opened up.";
L["TOOLTIP_PVP"] = "A new battleground is ready to be won.";
L["TOOLTIP_UI"] = "A new part of the UI has been unlocked.";
L["TOOLTIP_ZONE"] = "New land is ready to be explored.";
L["TOOLTIP_COMBAT"] = "|cFFFF5555Can't open during combat|r";
L["TOOLTIP_SPELLBOOK_ICON"] = "Unlocked content";
L["TOOLTIP_CLEARBUTTON"] = "Remove all unread unlocks."
L["OPTION_MINIMAP"] = "Minimap button"
L["OPTION_SPELLBOOK"] = "Spellbook button"
L["OPTION_POPUP"] = "Enable popup"
L["OPTION_TRACKERS"] = "Trackers"
L["EXAMPLE_ABILITY"] = "Example Ability"
L["EXAMPLE_DUNGEON"] = "Example Dungeon"
L["EXAMPLE_PASSIVE"] = "Example Passive"
L["POPUP_FORMAT"] = "%d |4unread unlock:unread unlocks;!"
L["TALENT_POINT"] = "Talent Point"
L["REQUIRES TRAINING"] = "Requires training"
L["INTERFACE_FEATURE"] = "Interface Feature"
L["UI_TALENTS"] = "Specialization & Talents"
L["UI_GROUP_FINDER"] = "Group Finder"
L["UI_GUIDE"] = "Adventure Guide"
L["UI_EQUIPMENT"] = "Equipment Manager"
L["DUNGEON"] = "Dungeon";
L["DUNGEON_HEROIC"] = "Heroic Dungeon";
L["DUNGEON_MYTHIC"] = "Mythic Dungeon";
L["RAID"] = "Raid";
L["BATTLEGROUND"] = "PvP Battleground";
L["WORLD_PVP"] = "World PvP";
L["BANNER_UNLOCKED"] = "You've unlocked..."
L["BANNER_NEXT"] = "Up next..."
L["NONEW_INFO"] = "You have reached the end of level specific unlocks!|n... for now."
L["NONEW_TITLE "] = "... everything!"
L["NEW"] = " New! "
L["MINIMAP_TOOLTIP"] = "Click to open."

L["TRACKER_SPELLS"] = "Spells"
L["TRACKER_TALENTS"] = "Talents"
L["TRACKER_DUNGEONS"] = "Dungeons"
L["TRACKER_RIDING"] = "Riding"
L["TRACKER_BATTLEGROUNDS"] = "Battlegrounds"
L["TRACKER_UI"] = "UI"
L["TRACKER_ZONES"] = "Zones"

L["RAIDS_CLASSIC"] = "Classic Raids"
L["HEROIC_OUTLAND"] = "Heroic: Outland Dungeons"
L["RAID_OUTLAND"] = "Outland Raids"
L["HEROIC_NORTHREND"] = "Heroic: Northrend Dungeons"
L["RAID_NORTHRED"] = "Northrend Raids"
L["HEROIC_CATACLYSM"] = "Heroic: Cataclysm Dungeons"
L["RAID_CATACLYSM"] = "Cataclysm Raids"
L["HEROIC_PANDARIA"] = "Heroic: Pandaria Dungeons"
L["RAID_PANDARIA"] = "Pandaria Raids"
L["HEROIC_DRAENOR"] = "Heroic: Draenor Dungeons"
L["RAID_DRAENOR"] = "Draenor Raids"
L["HEROIC_LEGION"] = "Heroic: Legion Dungeons"
L["MYTHIC_LEGION"] = "Mythic: Legion Dungeons"
L["RAID_LEGION"] = "Legion Raids"

if locale == "deDE" then
	-- for k, v in pairs(L) do
		-- L[k] = "|cFFFF00FF" .. v .. "|r"
	-- end
end


if locale == "zhTW" then
	L["BANNER_NEXT"] = "即將解鎖..."
L["BANNER_UNLOCKED"] = "已經解鎖..."
L["BATTLEGROUND"] = "PvP 戰場"
L["DUNGEON"] = "地城"
L["DUNGEON_HEROIC"] = "英雄地城"
L["DUNGEON_MYTHIC"] = "傳奇地城"
L["ERROR_OPEN_IN_COMBAT"] = "|cFFFFD100我學會了什麼：|r|cFFFF5555戰鬥中無法使用，戰鬥結束後會自動開啟。|r"
L["EXAMPLE_ABILITY"] = "範例技能"
L["EXAMPLE_DUNGEON"] = "範例地城"
L["EXAMPLE_PASSIVE"] = "範例被動技能"
L["HELP_INFO"] = "升級時會解鎖新的內容，像是新的技能、天賦點數和地城。\n\n左鍵點擊解鎖的內容會開啟相關視窗，並且將之從清單中移除。\n\n左鍵點擊或拖曳技能可以將技能移動到快捷列上。\n\n右鍵點擊解鎖的內容會將之從清單中移除。"
L["HELP_INFO_CHART"] = "這個進度表可以看到升級過程中即將解鎖的內容。"
L["HEROIC_CATACLYSM"] = "英雄：浩劫與重生地城"
L["HEROIC_DRAENOR"] = "英雄：德拉諾地城"
L["HEROIC_LEGION"] = "英雄：軍臨天下地城"
L["HEROIC_NORTHREND"] = "英雄：北裂境地城"
L["HEROIC_OUTLAND"] = "英雄：外域地城"
L["HEROIC_PANDARIA"] = "英雄：潘達利亞地城"
L["INTERFACE_FEATURE"] = "介面功能"
L["MINIMAP_TOOLTIP"] = "點一下開啟。"
L["MYTHIC_LEGION"] = "傳奇：軍臨天下地城"
L["NEW"] = " 新的! "
L["NONEW_INFO"] = "這個等級的所有內容都已經解鎖!|n... 在目前的版本。"
L["NONEW_TITLE "] = "... 全部!"
L["OPTION_MINIMAP"] = "小地圖按鈕"
L["OPTION_POPUP"] = "啟用彈出視窗"
L["OPTION_SPELLBOOK"] = "法術書按鈕"
L["OPTION_TRACKERS"] = "追蹤"
L["POPUP_FORMAT"] = "%d |4個未讀的解鎖內容:個未讀的解鎖內容;!"
L["RAID"] = "團隊"
L["RAID_CATACLYSM"] = "浩劫與重生團隊"
L["RAID_DRAENOR"] = "德拉諾團隊"
L["RAID_LEGION"] = "軍臨天下團隊"
L["RAID_NORTHRED"] = "北裂境地團隊"
L["RAID_OUTLAND"] = "外域團隊"
L["RAID_PANDARIA"] = "潘達利亞團隊"
L["RAIDS_CLASSIC"] = "經典團隊"
L["REQUIRES TRAINING"] = "需要訓練師"
L["TALENT_POINT"] = "天賦點數"
L["TOOLTIP_CLEARBUTTON"] = "移除所有未讀的解鎖內容。"
L["TOOLTIP_COMBAT"] = "|cFFFF5555戰鬥中無法開啟|r"
L["TOOLTIP_INSTANCE"] = "開啟新的地城。"
L["TOOLTIP_PVP"] = "可以在新的戰場獲得勝利。"
L["TOOLTIP_RIDING"] = "可以和騎術訓練師學習這個騎術。"
L["TOOLTIP_SPELLBOOK_ICON"] = "解鎖的內容"
L["TOOLTIP_TALENT"] = "新的天賦可以選擇。"
L["TOOLTIP_UI"] = "解鎖介面的新功能。"
L["TRACKER_BATTLEGROUNDS"] = "戰場"
L["TRACKER_DUNGEONS"] = "地城"
L["TRACKER_RIDING"] = "團隊"
L["TRACKER_SPELLS"] = "法術"
L["TRACKER_TALENTS"] = "天賦"
L["TRACKER_UI"] = "功能"
L["UI_EQUIPMENT"] = "裝備管理員"
L["UI_GROUP_FINDER"] = "隊伍搜尋器"
L["UI_GUIDE"] = "冒險指南"
L["UI_TALENTS"] = "專精 & 天賦"
L["WORLD_PVP"] = "世界 PvP"
end

addon.L = L;
