local addonName, addon = ...

local L = {}
local locale = GetLocale();

L["TOOLTIP_COMBAT"] = "|cFFFF5555Can't open during combat|r";
L["HELP_INFO"] = "As you level up you will unlock new content such as new abilities, talent points and dungeons.\n\nLeft clicking the unlocks will open related windows and remove them from the list.\n\nLeft clicking or dragging abilities allows you to move them to your action bars.\n\nRight clicking the unlocks will remove them from the list."
L["ERROR_OPEN_IN_COMBAT"] = "|cFFFFD100ILWhat:|r |cFFFF5555Can't open that during combat. It will open once you leave combat.|r";
L["TOOLTIP_TALENT"] = "You can pick a new talent.";
L["TOOLTIP_RIDING"]= "You can now learn this riding skill at a riding trainer.";
L["TOOLTIP_INSTANCE"] = "A new instance has opened up.";
L["TOOLTIP_PVP"] = "A new battleground is ready to be won.";
L["TOOLTIP_UI"] = "A new part of the UI has been unlocked.";
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

addon.L = L;
