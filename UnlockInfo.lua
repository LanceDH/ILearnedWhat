
local addonName, _addonData = ...;

local _aVar = _addonData.variables;

local STRING_PASSIVE = "Passive";
local STRING_TRAINING = "Requires training";
local STRING_DUNGEON = "Dungeon";
local STRING_DUNGEON_HEROIC = "Heroic Dungeon";
local STRING_RAID = "Raid";
local STRING_BATTLEGROUND = "PvP Battleground";
local STRING_WORLDPVP = "World PvP";

--------------------------
-- Talent Points
--------------------------

_addonData.Talents = {15, 30, 45, 60, 75, 90, 100};

--------------------------
-- Talent Points
--------------------------

_addonData.Glyphs = {25, 50, 75};

--------------------------
-- Riding
--------------------------

_addonData.Riding = {};
table.insert(_addonData.Riding, {["id"] = 33388, ["level"] = 20, ["subText"] = STRING_TRAINING}); -- Apprentice Riding
table.insert(_addonData.Riding, {["id"] = 33391, ["level"] = 40, ["subText"] = STRING_TRAINING}); -- Journeyman Riding
table.insert(_addonData.Riding, {["id"] = 34090, ["level"] = 60, ["subText"] = STRING_TRAINING}); -- Expert Riding
table.insert(_addonData.Riding, {["id"] = 34091, ["level"] = 70, ["subText"] = STRING_TRAINING}); -- Artisan Riding
table.insert(_addonData.Riding, {["id"] = 90265, ["level"] = 80, ["subText"] = STRING_TRAINING}); -- Master Riding
table.insert(_addonData.Riding, {["id"] = 90267, ["level"] = 60, ["subText"] = STRING_TRAINING}); -- Flight Master's License
table.insert(_addonData.Riding, {["id"] = 54197, ["level"] = 68, ["subText"] = STRING_TRAINING}); -- Cold Weather Flying
table.insert(_addonData.Riding, {["id"] = 115913, ["level"] = 85, ["subText"] = STRING_TRAINING}); -- Wisdom of the Four Winds
table.insert(_addonData.Riding, {["id"] = 191645, ["level"] = 90, ["subText"] = STRING_TRAINING}); -- Draenor Pathfinder

--------------------------
-- Instances
--------------------------

_addonData.Instances = {};

-- Vanilla
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Ragefire Chasm", ["level"] = 15, ["id"] = 226, ["icon"] = "Interface/LFGFRAME/LFGICON-RAGEFIRECHASM"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Deadmines", ["level"] = 15, ["id"] = 63, ["icon"] = "Interface/LFGFRAME/LFGICON-DEADMINES"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Wailing Caverns", ["level"] = 15, ["id"] = 240, ["icon"] = "Interface/LFGFRAME/LFGICON-WAILINGCAVERNS"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Shadowfang Keep", ["level"] = 16, ["id"] = 64, ["icon"] = "Interface/LFGFRAME/LFGICON-SHADOWFANGKEEP"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Blackfathom Deeps", ["level"] = 20, ["id"] = 227, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKFATHOMDEEPS"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Stormwind Stockade", ["level"] = 20, ["id"] = 238, ["icon"] = "Interface/LFGFRAME/LFGICON-STORMWINDSTOCKADES"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Gnomeregan", ["level"] = 24, ["id"] = 231, ["icon"] = "Interface/LFGFRAME/LFGICON-GNOMEREGAN"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Scarlet Halls", ["level"] = 26, ["id"] = 311, ["icon"] = "Interface/LFGFRAME/LFGICON-SCARLETMONASTERY"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Scarlet Monastery", ["level"] = 28, ["id"] = 316, ["icon"] = "Interface/LFGFRAME/LFGICON-SCARLETMONASTERY"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Maraudon: The Wicked Grotto", ["id"] = 232, ["level"] = 30, ["icon"] = "Interface/LFGFRAME/LFGICON-MARAUDON"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Razorfen Kraul", ["level"] = 30, ["id"] = 234, ["icon"] = "Interface/LFGFRAME/LFGICON-RAZORFENKRAUL"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Maraudon: Foulspore Cavern", ["level"] = 32, ["id"] = 232, ["icon"] = "Interface/LFGFRAME/LFGICON-MARAUDON"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Maraudon: Earth Song Falls", ["level"] = 34, ["id"] = 232, ["icon"] = "Interface/LFGFRAME/LFGICON-MARAUDON"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Uldaman", ["level"] = 35, ["id"] = 239, ["icon"] = "Interface/LFGFRAME/LFGICON-ULDAMAN"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Dire Maul: Warpwood Quarter", ["level"] = 36, ["id"] = 230, ["icon"] = "Interface/LFGFRAME/LFGICON-DIREMAUL"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Scholomance", ["level"] = 38, ["id"] = 246, ["icon"] = "Interface/LFGFRAME/LFGICON-SCHOLOMANCE"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Dire Maul: Capital Gardens", ["level"] = 39, ["id"] = 230, ["icon"] = "Interface/LFGFRAME/LFGICON-DIREMAUL"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Razorfen Downs", ["level"] = 40, ["id"] = 233, ["icon"] = "Interface/LFGFRAME/LFGICON-RAZORFENDOWNS"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Dire Maul: Gordok Commons", ["level"] = 42, ["id"] = 230, ["icon"] = "Interface/LFGFRAME/LFGICON-DIREMAUL"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Stratholme: Main Gate", ["level"] = 42, ["id"] = 236, ["icon"] = "Interface/LFGFRAME/LFGICON-STRATHOLME"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Zul'Farrak", ["id"] = 241, ["level"] = 44, ["icon"] = "Interface/LFGFRAME/LFGICON-ZULFARAK"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Stratholme: Service Entrance", ["id"] = 236, ["level"] = 46, ["icon"] = "Interface/LFGFRAME/LFGICON-STRATHOLME"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Blackrock Depths: Detention Block", ["level"] = 47, ["id"] = 228, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKROCKDEPTHS"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Sunken Temple", ["level"] = 50, ["id"] = 237, ["icon"] = "Interface/LFGFRAME/LFGICON-SUNKENTEMPLE"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Blackrock Depths: Upper City", ["level"] = 51, ["id"] = 228, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKROCKDEPTHS"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Lower Blackrock Spire", ["level"] = 55, ["id"] = 229, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKROCKSPIRE"});
table.insert(_addonData.Instances , {["subText"] = STRING_RAID, ["name"] = "Classic Raids", ["level"] = 60, ["icon"] = "Interface/LFGFRAME/LFGICON-MOLTENCORE"});
-- TBC
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Hellfire Ramparts", ["level"] = 58, ["id"] = 248, ["icon"] = "Interface/LFGFRAME/LFGICON-HELLFIRECITADEL"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Blood Furnace", ["level"] = 59, ["id"] = 256, ["icon"] = "Interface/LFGFRAME/LFGICON-HELLFIRECITADEL"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Slave Pens", ["level"] = 60, ["id"] = 260, ["icon"] = "Interface/LFGFRAME/LFGICON-COILFANG"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Underbog", ["level"] = 61, ["id"] = 262, ["icon"] = "Interface/LFGFRAME/LFGICON-COILFANG"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Mana-Tombs", ["level"] = 62, ["id"] = 250, ["icon"] = "Interface/LFGFRAME/LFGICON-AUCHINDOUN"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Auchenai Crypts", ["level"] = 63, ["id"] = 247, ["icon"] = "Interface/LFGFRAME/LFGICON-AUCHINDOUN"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Escape From Durnholde", ["level"] = 64, ["id"] = 251, ["icon"] = "Interface/LFGFRAME/LFGICON-CAVERNSOFTIME"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Sethekk Halls", ["level"] = 65, ["id"] = 252, ["icon"] = "Interface/LFGFRAME/LFGICON-AUCHINDOUN"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Mechanar", ["level"] = 67, ["id"] = 258, ["icon"] = "Interface/LFGFRAME/LFGICON-TEMPESTKEEP"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Shadow Labyrinth", ["level"] = 67, ["id"] = 253, ["icon"] = "Interface/LFGFRAME/LFGICON-AUCHINDOUN"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Shattered Halls", ["level"] = 67, ["id"] = 259, ["icon"] = "Interface/LFGFRAME/LFGICON-HELLFIRECITADEL"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Botanica", ["level"] = 67, ["id"] = 257, ["icon"] = "Interface/LFGFRAME/LFGICON-TEMPESTKEEP"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Steamvault", ["level"] = 67, ["id"] = 261, ["icon"] = "Interface/LFGFRAME/LFGICON-COILFANG"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Magisters' Terrace", ["level"] = 68, ["id"] = 249, ["icon"] = "Interface/LFGFRAME/LFGICON-MAGISTERSTERRACE"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Opening of the Dark Portal", ["level"] = 68, ["id"] = 255, ["icon"] = "Interface/LFGFRAME/LFGICON-CAVERNSOFTIME"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Arcatraz", ["level"] = 68, ["id"] = 254, ["icon"] = "Interface/LFGFRAME/LFGICON-TEMPESTKEEP"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON_HEROIC, ["name"] = "Heroic: Outland Dungeons", ["level"] = 70, ["id"] = _aVar.TBC_HEROIC, ["icon"] = "Interface/LFGFRAME/LFGICON-DUNGEON"});
table.insert(_addonData.Instances , {["subText"] = STRING_RAID, ["name"] = "Outland Raids", ["level"] = 70, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKTEMPLE"});
-- WotLK
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Utgarde Keep", ["level"] = 68, ["id"] = 285, ["icon"] = "Interface/LFGFRAME/LFGIcon-Utgarde"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Nexus", ["level"] = 69, ["id"] = 281, ["icon"] = "Interface/LFGFRAME/LFGIcon-TheNexus"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Azjol-Nerub", ["level"] = 70, ["id"] = 272, ["icon"] = "Interface/LFGFRAME/LFGIcon-AzjolNerub"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Ahn'Kahet: The Old Kingdom", ["level"] = 71, ["id"] = 271, ["icon"] = "Interface/LFGFRAME/LFGIcon-Ahnkalet"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Drak'Tharon Keep", ["level"] = 72, ["id"] = 273, ["icon"] = "Interface/LFGFRAME/LFGIcon-DrakTharon"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Violet Hold", ["level"] = 73, ["id"] = 283, ["icon"] = "Interface/LFGFRAME/LFGIcon-TheVioletHold"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Gundrak", ["level"] = 74, ["id"] = 274, ["icon"] = "Interface/LFGFRAME/LFGIcon-Gundrak"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Halls of Stone", ["level"] = 75, ["id"] = 277, ["icon"] = "Interface/LFGFRAME/LFGIcon-HallsofStone"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Halls of Lightning", ["level"] = 77, ["id"] = 275, ["icon"] = "Interface/LFGFRAME/LFGICON-HALLSOFLIGHTNING"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Oculus", ["level"] = 77, ["id"] = 282, ["icon"] = "Interface/LFGFRAME/LFGIcon-TheOculus"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Utgarde Pinnacle", ["level"] = 77, ["id"] = 286, ["icon"] = "Interface/LFGFRAME/LFGIcon-UtgardePinnacle"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Culling of Stratholme", ["level"] = 78, ["id"] = 279, ["icon"] = "Interface/LFGFRAME/LFGIcon-OldStratholme"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Trial of the Champion", ["level"] = 78, ["id"] = 284, ["icon"] = "Interface/LFGFRAME/LFGIcon-ArgentDungeon"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Forge of Souls", ["level"] = 80, ["id"] = 280, ["icon"] = "Interface/LFGFRAME/LFGIcon-TheForgeofSouls"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Pit of Saron", ["level"] = 80, ["id"] = 278, ["icon"] = "Interface/LFGFRAME/LFGIcon-PitofSaron"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Halls of Reflection", ["level"] = 80, ["id"] = 276, ["icon"] = "Interface/LFGFRAME/LFGIcon-HallsofReflection"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON_HEROIC, ["name"] = "Heroic: Northrend Dungeons", ["level"] = 80, ["id"] = _aVar.TBC_HEROIC, ["icon"] = "Interface/LFGFRAME/LFGICON-DUNGEON"});
table.insert(_addonData.Instances , {["subText"] = STRING_RAID, ["name"] = "Northrend Raids", ["level"] = 80, ["id"] = ILW_INSTANCEID_TBC_RAID, ["icon"] = "Interface/LFGFRAME/LFGIcon-IcecrownCitadel"});
-- Cataclysm
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Blackrock Caverns", ["level"] = 80, ["id"] = 66, ["icon"] = "Interface/LFGFRAME/LFGICON-BLACKROCKCAVERNS"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Throne of the Tides", ["level"] = 80, ["id"] = 65, ["icon"] = "Interface/LFGFRAME/LFGICON-THRONEOFTHETIDES"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Stonecore", ["level"] = 81, ["id"] = 67, ["icon"] = "Interface/LFGFRAME/LFGICON-THESTONECORE"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Vortex Pinnacle", ["level"] = 81, ["id"] = 68, ["icon"] = "Interface/LFGFRAME/LFGICON-THEVORTEXPINNACLE"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Lost City of the Tol'vir", ["level"] = 84, ["id"] = 69, ["icon"] = "Interface/LFGFRAME/LFGICON-LOSTCITYOFTOLVIR"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Halls of Origination", ["level"] = 84, ["id"] = 70, ["icon"] = "Interface/LFGFRAME/LFGICON-HALLSOFORIGINATION"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Grim Batol", ["level"] = 84, ["id"] = 71, ["icon"] = "Interface/LFGFRAME/LFGICON-GRIMBATOLRAID"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON_HEROIC, ["name"] = "Heroic: Cataclysm Dungeons", ["level"] = 85, ["id"] = _aVar.CATA_HEROIC, ["icon"] = "Interface/LFGFRAME/LFGICON-DUNGEON"});
table.insert(_addonData.Instances , {["subText"] = STRING_RAID, ["name"] = "Cataclysm Raids", ["level"] = 85, ["id"] = _aVar.CATA_RAID, ["icon"] = "Interface/LFGFRAME/LFGIcon-FallofDeathwing"});
-- Mist of Pandaria
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Stormstout Brewery", ["level"] = 85, ["id"] = 302, ["icon"] = "Interface/LFGFRAME/LFGIcon-StormstoutBrewery"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Temple of the Jade Serpent", ["level"] = 85, ["id"] = 313, ["icon"] = "Interface/LFGFRAME/LFGIcon-TempleoftheJadeSerpent"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Shado-Pan Monastery", ["level"] = 87, ["id"] = 312, ["icon"] = "Interface/LFGFRAME/LFGIcon-ShadowpanMonastery"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Mogu'Shan Palace", ["level"] = 87, ["id"] = 321, ["icon"] = "Interface/LFGFRAME/LFGIcon-MogushanPalace"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Gate of the Setting Sun", ["level"] = 88, ["id"] = 303, ["icon"] = "Interface/LFGFRAME/LFGIcon-GateoftheSettingSun"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Siege of Niuzao Temple", ["level"] = 88, ["id"] = 324, ["icon"] = "Interface/LFGFRAME/LFGIcon-SiegeofNizaoTemple"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON_HEROIC, ["name"] = "Heroic: Pandaria Dungeons", ["level"] = 90, ["id"] = _aVar.MOP_HEROIC, ["icon"] = "Interface/LFGFRAME/LFGICON-DUNGEON"});
table.insert(_addonData.Instances , {["subText"] = STRING_RAID, ["name"] = "Pandaria Raids", ["level"] = 90, ["id"] = _aVar.MOP_RAID, ["icon"] = "Interface/LFGFRAME/LFGIcon-OrgrimmarGates"});
-- WoD
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Bloodmaul Slag Mines", ["level"] = 90, ["id"] = 385, ["icon"] = "Interface/LFGFRAME/LFGIcon-BloodmaulSlagMines"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Iron Docks", ["level"] = 92, ["id"] = 558, ["icon"] = "Interface/LFGFRAME/LFGIcon-IronDocks"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Auchindoun", ["level"] = 94, ["id"] = 547, ["icon"] = "Interface/LFGFRAME/LFGIcon-AuchindounWOD"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Skyreach", ["level"] = 97, ["id"] = 476, ["icon"] = "Interface/LFGFRAME/LFGIcon-Skyreach"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Grimrail Depot", ["level"] = 100, ["id"] = 536, ["icon"] = "Interface/LFGFRAME/LFGIcon-GrimrailDepot"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Shadowmoon Burial Grounds", ["level"] = 100, ["id"] = 537, ["icon"] = "Interface/LFGFRAME/LFGIcon-ShadowmoonBurialGrounds"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "The Everbloom", ["level"] = 100, ["id"] = 556, ["icon"] = "Interface/LFGFRAME/LFGIcon-Everbloom"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON, ["name"] = "Upper Blackrock Spire", ["level"] = 100, ["id"] = 559, ["icon"] = "Interface/LFGFRAME/LFGIcon-UpperBlackrockSpire"});
table.insert(_addonData.Instances , {["subText"] = STRING_DUNGEON_HEROIC, ["name"] = "Heroic: Draenor Dungeons", ["level"] = 100, ["id"] = _aVar.WOD_HEROIC, ["icon"] = "Interface/LFGFRAME/LFGICON-DUNGEON"});
table.insert(_addonData.Instances , {["subText"] = STRING_RAID, ["name"] = "Draenor Raids", ["level"] = 100, ["id"] = _aVar.WOD_RAID, ["icon"] = "Interface/LFGFRAME/LFGICON-HELLFIRECITADELRAID"});

--------------------------
-- Battlegrounds
--------------------------

_addonData.Pvp = {};

table.insert(_addonData.Pvp , {["subText"] = STRING_BATTLEGROUND, ["name"] = "Warsong Gulch", ["level"] = 10, ["icon"] = "Interface/ICONS/achievement_bg_winwsg"});
table.insert(_addonData.Pvp , {["subText"] = STRING_BATTLEGROUND, ["name"] = "Arathi Basin", ["level"] = 10, ["icon"] = "Interface/ICONS/achievement_bg_takexflags_ab"});
table.insert(_addonData.Pvp , {["subText"] = STRING_BATTLEGROUND, ["name"] = "Eye of the Storm", ["level"] = 35, ["icon"] = "Interface/ICONS/Achievement_Zone_Netherstorm_01"});
table.insert(_addonData.Pvp , {["subText"] = STRING_BATTLEGROUND, ["name"] = "Alterac Valley", ["level"] = 45, ["icon"] = "Interface/ICONS/achievement_bg_defendxtowers_av"});
table.insert(_addonData.Pvp , {["subText"] = STRING_BATTLEGROUND, ["name"] = "Strand of the Ancients", ["level"] = 65, ["icon"] = "Interface/LFGFRAME/LFGICON-STRANDOFTHEANCIENTS"});
table.insert(_addonData.Pvp , {["subText"] = STRING_BATTLEGROUND, ["name"] = "Battle for Gilneas", ["level"] = 75, ["icon"] = "Interface/LFGFRAME/LFGICON-THEBATTLEFORGILNEAS"});
table.insert(_addonData.Pvp , {["subText"] = STRING_BATTLEGROUND, ["name"] = "Twin Peaks", ["level"] = 75, ["icon"] = "Interface/LFGFRAME/LFGIcon-TwinPeaksBG"});
table.insert(_addonData.Pvp , {["subText"] = STRING_BATTLEGROUND, ["name"] = "Isle of Conquest", ["level"] = 75, ["icon"] = "Interface/LFGFRAME/LFGIcon-IsleOfConquest"});
table.insert(_addonData.Pvp , {["subText"] = STRING_WORLDPVP, ["name"] = "Wintergrasp", ["level"] = 75, ["icon"] = "Interface/ICONS/INV_EssenceOfWintergrasp"});
table.insert(_addonData.Pvp , {["subText"] = STRING_WORLDPVP, ["name"] = "Tol Barad", ["level"] = 85, ["icon"] = "Interface/ICONS/Achievement_Zone_TolBarad"});
table.insert(_addonData.Pvp , {["subText"] = STRING_BATTLEGROUND, ["name"] = "Deepwind Gorge", ["level"] = 90, ["icon"] = "Interface/LFGFRAME/LFGIcon-DeepwindGorge"});
table.insert(_addonData.Pvp , {["subText"] = STRING_BATTLEGROUND, ["name"] = "Silvershard Mines", ["level"] = 90, ["icon"] = "Interface/LFGFRAME/LFGIcon-SilvershardMines"});
table.insert(_addonData.Pvp , {["subText"] = STRING_BATTLEGROUND, ["name"] = "Temple of Kotmogu", ["level"] = 90, ["icon"] = "Interface/LFGFRAME/LFGIcon-TempleofKotmogu"});
table.insert(_addonData.Pvp , {["subText"] = STRING_WORLDPVP, ["name"] = "Ashran", ["level"] = 100, ["icon"] = "Interface/ICONS/Achievement_Zone_Ashran"});

--------------------------
-- Spells
--------------------------

--
-- MAGE
--

local mageSpecs = {};
table.insert(mageSpecs, 62); -- Arcana
table.insert(mageSpecs, 63); -- Fire
table.insert(mageSpecs, 64); -- Frost

local mageSkills = {};
table.insert(mageSkills, {["id"] = 122, ["level"] = 3}); -- Frost Nova
table.insert(mageSkills, {["id"] = 2136, ["level"] = 5}); -- Fire Blast
table.insert(mageSkills, {["id"] = 1953, ["level"] = 7}); -- Blink
table.insert(mageSkills, {["id"] = 2139, ["level"] = 8}); -- Counterspell
table.insert(mageSkills, {["id"] = 30451, ["level"] = 10, ["specs"] = {62}}); -- Arcane Blast
table.insert(mageSkills, {["id"] = 114664, ["level"] = 10, ["specs"] = {62}, ["subText"] = STRING_PASSIVE}); -- Arcane Charge
table.insert(mageSkills, {["id"] = 11366, ["level"] = 10, ["specs"] = {63}}); -- Pyroblast
table.insert(mageSkills, {["id"] = 31687, ["level"] = 10, ["specs"] = {64}}); -- Summon Water Elemental
table.insert(mageSkills, {["id"] = 44425, ["level"] = 12, ["specs"] = {62}}); -- Arcane Barrage
table.insert(mageSkills, {["id"] = 133, ["level"] = 12, ["specs"] = {63}}); -- Fireball
table.insert(mageSkills, {["id"] = 116, ["level"] = 12, ["specs"] = {64}}); -- Frostbolt
table.insert(mageSkills, {["id"] = 118, ["level"] = 14}); -- Polymorph
table.insert(mageSkills, {["id"] = 45438, ["level"] = 15}); -- Ice Block
table.insert(mageSkills, {["id"] = 12982, ["level"] = 16, ["specs"] = {64}, ["subText"] = STRING_PASSIVE}); -- Shatter
table.insert(mageSkills, {["id"] = 3565, ["level"] = 17}); -- Teleport: Darnassus
table.insert(mageSkills, {["id"] = 32271, ["level"] = 17}); -- Teleport: Exodar
table.insert(mageSkills, {["id"] = 3562, ["level"] = 17}); -- Teleport: Ironforge
table.insert(mageSkills, {["id"] = 3567, ["level"] = 17}); -- Teleport: Orgrimmar
table.insert(mageSkills, {["id"] = 32272, ["level"] = 17}); -- Teleport: Silvermoon
table.insert(mageSkills, {["id"] = 3561, ["level"] = 17}); -- Teleport: Stormwind
table.insert(mageSkills, {["id"] = 49359, ["level"] = 17}); -- Teleport: Theramore
table.insert(mageSkills, {["id"] = 3566, ["level"] = 17}); -- Teleport: Thunder Bluff
table.insert(mageSkills, {["id"] = 3563, ["level"] = 17}); -- Teleport: Undercity
table.insert(mageSkills, {["id"] = 1449, ["level"] = 18, ["specs"] = {62}}); -- Arcane Explosion
table.insert(mageSkills, {["id"] = 30455, ["level"] = 22, ["specs"] = {64}}); -- Ice Lance
table.insert(mageSkills, {["id"] = 12043, ["level"] = 22, ["specs"] = {62}}); -- Presence of Mind
table.insert(mageSkills, {["id"] = 2948, ["level"] = 22, ["specs"] = {63}}); -- Scorch
table.insert(mageSkills, {["id"] = 5143, ["level"] = 24, ["specs"] = {62}}); -- Arcane Missiles
table.insert(mageSkills, {["id"] = 112965, ["level"] = 24, ["specs"] = {64}, ["subText"] = STRING_PASSIVE}); -- Fingers of Frost
table.insert(mageSkills, {["id"] = 108853, ["level"] = 24, ["specs"] = {63}}); -- Inferno Blast
table.insert(mageSkills, {["id"] = 120, ["level"] = 28}); -- Cone of Cold
table.insert(mageSkills, {["id"] = 475, ["level"] = 29}); -- Remove Curse
table.insert(mageSkills, {["id"] = 130, ["level"] = 32}); -- Slow Fall
table.insert(mageSkills, {["id"] = 30482, ["level"] = 34, ["specs"] = {63}, ["subText"] = STRING_PASSIVE}); -- Molten Armor
table.insert(mageSkills, {["id"] = 117216, ["level"] = 36, ["specs"] = {63}, ["subText"] = STRING_PASSIVE}); -- Critical Mass
table.insert(mageSkills, {["id"] = 12472, ["level"] = 36, ["specs"] = {64}}); -- Icy Veins
table.insert(mageSkills, {["id"] = 31589, ["level"] = 36, ["specs"] = {62}}); -- Slow
table.insert(mageSkills, {["id"] = 42955, ["level"] = 38}); -- Conjure Refreshment
table.insert(mageSkills, {["id"] = 12051, ["level"] = 40, ["specs"] = {62}}); -- Evocation
table.insert(mageSkills, {["id"] = 11419, ["level"] = 42}); -- Portal: Darnassus
table.insert(mageSkills, {["id"] = 32266, ["level"] = 42}); -- Portal: Exodar
table.insert(mageSkills, {["id"] = 11416, ["level"] = 42}); -- Portal: Ironforge
table.insert(mageSkills, {["id"] = 11417, ["level"] = 42}); -- Portal: Orgrimmar
table.insert(mageSkills, {["id"] = 32267, ["level"] = 42}); -- Portal: Silvermoon
table.insert(mageSkills, {["id"] = 10059, ["level"] = 42}); -- Portal: Stormwind
table.insert(mageSkills, {["id"] = 49360, ["level"] = 42}); -- Portal: Theramore
table.insert(mageSkills, {["id"] = 11420, ["level"] = 42}); -- Portal: Thunder Bluff
table.insert(mageSkills, {["id"] = 11418, ["level"] = 42}); -- Portal: Undercity
table.insert(mageSkills, {["id"] = 2120, ["level"] = 44, ["specs"] = {63}}); -- Flamestrike
table.insert(mageSkills, {["id"] = 89744, ["level"] = 50, ["subText"] = STRING_PASSIVE}); -- Wizardry
table.insert(mageSkills, {["id"] = 10, ["level"] = 52, ["specs"] = {64}}); -- Blizzard
table.insert(mageSkills, {["id"] = 49361, ["level"] = 52}); -- Portal: Stonard
table.insert(mageSkills, {["id"] = 49358, ["level"] = 52}); -- Teleport: Stonard
table.insert(mageSkills, {["id"] = 7302, ["level"] = 54, ["specs"] = {64}, ["subText"] = STRING_PASSIVE}); -- Frost Armor
table.insert(mageSkills, {["id"] = 66, ["level"] = 56}); -- Invisibility
table.insert(mageSkills, {["id"] = 1459, ["level"] = 58}); -- Arcane Brilliance
table.insert(mageSkills, {["id"] = 12042, ["level"] = 62, ["specs"] = {62}}); -- Arcane Power
table.insert(mageSkills, {["id"] = 31661, ["level"] = 62, ["specs"] = {63}}); -- Dragon
table.insert(mageSkills, {["id"] = 84714, ["level"] = 62, ["specs"] = {64}}); -- Frozen Orb
table.insert(mageSkills, {["id"] = 33690, ["level"] = 62}); -- Teleport: Shattrath
table.insert(mageSkills, {["id"] = 35715, ["level"] = 62}); -- Teleport: Shattrath
table.insert(mageSkills, {["id"] = 30449, ["level"] = 64}); -- Spellsteal
table.insert(mageSkills, {["id"] = 44572, ["level"] = 66, ["specs"] = {64}}); -- Deep Freeze
table.insert(mageSkills, {["id"] = 33691, ["level"] = 66}); -- Portal: Shattrath
table.insert(mageSkills, {["id"] = 35717, ["level"] = 66}); -- Portal: Shattrath
table.insert(mageSkills, {["id"] = 120145, ["level"] = 71}); -- Ancient Teleport: Dalaran
table.insert(mageSkills, {["id"] = 53140, ["level"] = 71}); -- Teleport: Dalaran
table.insert(mageSkills, {["id"] = 43987, ["level"] = 72}); -- Conjure Refreshment Table
table.insert(mageSkills, {["id"] = 120146, ["level"] = 74}); -- Ancient Portal: Dalaran
table.insert(mageSkills, {["id"] = 117957, ["level"] = 74, ["subText"] = STRING_PASSIVE}); -- Nether Attunement
table.insert(mageSkills, {["id"] = 53142, ["level"] = 74}); -- Portal: Dalaran
table.insert(mageSkills, {["id"] = 44549, ["level"] = 77, ["specs"] = {64}, ["subText"] = STRING_PASSIVE}); -- Brain Freeze
table.insert(mageSkills, {["id"] = 11129, ["level"] = 80, ["specs"] = {63}}); -- Combustion
table.insert(mageSkills, {["id"] = 6117, ["level"] = 80, ["specs"] = {62}, ["subText"] = STRING_PASSIVE}); -- Mage Armor
table.insert(mageSkills, {["id"] = 76613, ["level"] = 80, ["specs"] = {64}, ["subText"] = STRING_PASSIVE}); -- Mastery: Icicles
table.insert(mageSkills, {["id"] = 12846, ["level"] = 80, ["specs"] = {63}, ["subText"] = STRING_PASSIVE}); -- Mastery: Ignite
table.insert(mageSkills, {["id"] = 76547, ["level"] = 80, ["specs"] = {62}, ["subText"] = STRING_PASSIVE}); -- Mastery: Mana Adept
table.insert(mageSkills, {["id"] = 61316, ["level"] = 80}); -- Dalaran Brilliance
table.insert(mageSkills, {["id"] = 80353, ["level"] = 84}); -- Time Warp
table.insert(mageSkills, {["id"] = 88345, ["level"] = 85}); -- Portal: Tol Barad
table.insert(mageSkills, {["id"] = 88346, ["level"] = 85}); -- Portal: Tol Barad
table.insert(mageSkills, {["id"] = 88342, ["level"] = 85}); -- Teleport: Tol Barad
table.insert(mageSkills, {["id"] = 88344, ["level"] = 85}); -- Teleport: Tol Barad
table.insert(mageSkills, {["id"] = 165359, ["level"] = 90, ["specs"] = {62}, ["subText"] = STRING_PASSIVE}); -- Arcane Mind
table.insert(mageSkills, {["id"] = 165360, ["level"] = 90, ["specs"] = {64}, ["subText"] = STRING_PASSIVE}); -- Ice Shards
table.insert(mageSkills, {["id"] = 165357, ["level"] = 90, ["specs"] = {63}, ["subText"] = STRING_PASSIVE}); -- Incineration
table.insert(mageSkills, {["id"] = 132620, ["level"] = 90}); -- Portal: Vale of Eternal Blossoms
table.insert(mageSkills, {["id"] = 132626, ["level"] = 90}); -- Portal: Vale of Eternal Blossoms
table.insert(mageSkills, {["id"] = 132621, ["level"] = 90}); -- Teleport: Vale of Eternal Blossoms
table.insert(mageSkills, {["id"] = 132627, ["level"] = 90}); -- Teleport: Vale of Eternal Blossoms
table.insert(mageSkills, {["id"] = 176246, ["level"] = 92}); -- Portal: Stormshield
table.insert(mageSkills, {["id"] = 176244, ["level"] = 92}); -- Portal: Warspear
table.insert(mageSkills, {["id"] = 176248, ["level"] = 92}); -- Teleport: Stormshield
table.insert(mageSkills, {["id"] = 176242, ["level"] = 92}); -- Teleport: Warspear

_addonData.MAGE = {};
_addonData.MAGE.Skills = mageSkills;
_addonData.MAGE.Specs = mageSpecs;

--
-- PALADIN
--

local paladinSpecs = {};
table.insert(paladinSpecs, 65); -- Holy
table.insert(paladinSpecs, 66); -- Protection
table.insert(paladinSpecs, 70); -- Retribution

local paladinSkills = {};
table.insert(paladinSkills, {["id"] = 105361, ["level"] = 3}); -- Seal of Command
table.insert(paladinSkills, {["id"] = 20271, ["level"] = 5}); -- Judgment
table.insert(paladinSkills, {["id"] = 853, ["level"] = 7}); -- Hammer of Justice
table.insert(paladinSkills, {["id"] = 85673, ["level"] = 9}); -- Word of Glory
table.insert(paladinSkills, {["id"] = 31935, ["level"] = 10, ["specs"] = {66}}); -- Avenger
table.insert(paladinSkills, {["id"] = 161608, ["level"] = 10, ["specs"] = {66}, ["subText"] = STRING_PASSIVE}); -- Bladed Armor
table.insert(paladinSkills, {["id"] = 53592, ["level"] = 10, ["specs"] = {66}, ["subText"] = STRING_PASSIVE}); -- Guarded by the Light
table.insert(paladinSkills, {["id"] = 112859, ["level"] = 10, ["specs"] = {65}, ["subText"] = STRING_PASSIVE}); -- Holy Insight
table.insert(paladinSkills, {["id"] = 20473, ["level"] = 10, ["specs"] = {65}}); -- Holy Shock
table.insert(paladinSkills, {["id"] = 158298, ["level"] = 10, ["specs"] = {66}, ["subText"] = STRING_PASSIVE}); -- Resolve
table.insert(paladinSkills, {["id"] = 105805, ["level"] = 10, ["specs"] = {66}, ["subText"] = STRING_PASSIVE}); -- Sanctuary
table.insert(paladinSkills, {["id"] = 53503, ["level"] = 10, ["specs"] = {70}, ["subText"] = STRING_PASSIVE}); -- Sword of Light
table.insert(paladinSkills, {["id"] = 85256, ["level"] = 10, ["specs"] = {70}}); -- Templar
table.insert(paladinSkills, {["id"] = 25780, ["level"] = 12}); -- Righteous Fury
table.insert(paladinSkills, {["id"] = 7328, ["level"] = 13}); -- Redemption
table.insert(paladinSkills, {["id"] = 19750, ["level"] = 14, ["specs"] = {65, 66, 70}}); -- Flash of Light
table.insert(paladinSkills, {["id"] = 62124, ["level"] = 15}); -- Reckoning
table.insert(paladinSkills, {["id"] = 633, ["level"] = 16}); -- Lay on Hands
table.insert(paladinSkills, {["id"] = 642, ["level"] = 18}); -- Divine Shield
table.insert(paladinSkills, {["id"] = 2812, ["level"] = 20, ["specs"] = {65}}); -- Denounce
table.insert(paladinSkills, {["id"] = 53595, ["level"] = 20, ["specs"] = {66, 70}}); -- Hammer of the Righteous
table.insert(paladinSkills, {["id"] = 119072, ["level"] = 20, ["specs"] = {66}}); -- Holy Wrath
table.insert(paladinSkills, {["id"] = 53551, ["level"] = 20, ["specs"] = {65}, ["subText"] = STRING_PASSIVE}); -- Sacred Cleansing
table.insert(paladinSkills, {["id"] = 4987, ["level"] = 20}); -- Cleanse
table.insert(paladinSkills, {["id"] = 66907, ["level"] = 20}); -- Argent Warhorse
table.insert(paladinSkills, {["id"] = 31801, ["level"] = 24, ["specs"] = {70}}); -- Seal of Truth
table.insert(paladinSkills, {["id"] = 498, ["level"] = 26}); -- Divine Protection
table.insert(paladinSkills, {["id"] = 82327, ["level"] = 28, ["specs"] = {65}}); -- Holy Radiance
table.insert(paladinSkills, {["id"] = 105424, ["level"] = 28, ["specs"] = {66}, ["subText"] = STRING_PASSIVE}); -- Judgments of the Wise
table.insert(paladinSkills, {["id"] = 20217, ["level"] = 30}); -- Blessing of Kings
table.insert(paladinSkills, {["id"] = 20165, ["level"] = 32}); -- Seal of Insight
table.insert(paladinSkills, {["id"] = 26573, ["level"] = 34, ["specs"] = {66}}); -- Consecration
table.insert(paladinSkills, {["id"] = 53385, ["level"] = 34, ["specs"] = {70}}); -- Divine Storm
table.insert(paladinSkills, {["id"] = 31868, ["level"] = 34, ["specs"] = {65, 70}, ["subText"] = STRING_PASSIVE}); -- Supplication
table.insert(paladinSkills, {["id"] = 96231, ["level"] = 36}); -- Rebuke
table.insert(paladinSkills, {["id"] = 24275, ["level"] = 38}); -- Hammer of Wrath
table.insert(paladinSkills, {["id"] = 53563, ["level"] = 39, ["specs"] = {65}}); -- Beacon of Light
table.insert(paladinSkills, {["id"] = 53600, ["level"] = 40, ["specs"] = {66}}); -- Shield of the Righteous
table.insert(paladinSkills, {["id"] = 66906, ["level"] = 40}); -- Argent Charger
table.insert(paladinSkills, {["id"] = 20154, ["level"] = 42, ["specs"] = {66, 70}}); -- Seal of Righteousness
table.insert(paladinSkills, {["id"] = 32223, ["level"] = 44, ["subText"] = STRING_PASSIVE}); -- Heart of the Crusader
table.insert(paladinSkills, {["id"] = 879, ["level"] = 46, ["specs"] = {70}}); -- Exorcism
table.insert(paladinSkills, {["id"] = 10326, ["level"] = 46}); -- Turn Evil
table.insert(paladinSkills, {["id"] = 1022, ["level"] = 48}); -- Hand of Protection
table.insert(paladinSkills, {["id"] = 85043, ["level"] = 50, ["specs"] = {66}, ["subText"] = STRING_PASSIVE}); -- Grand Crusader
table.insert(paladinSkills, {["id"] = 53576, ["level"] = 50, ["specs"] = {65}, ["subText"] = STRING_PASSIVE}); -- Infusion of Light
table.insert(paladinSkills, {["id"] = 86102, ["level"] = 50, ["specs"] = {66}, ["subText"] = STRING_PASSIVE}); -- Plate Specialization
table.insert(paladinSkills, {["id"] = 86103, ["level"] = 50, ["specs"] = {65}, ["subText"] = STRING_PASSIVE}); -- Plate Specialization
table.insert(paladinSkills, {["id"] = 86539, ["level"] = 50, ["specs"] = {70}, ["subText"] = STRING_PASSIVE}); -- Plate Specialization
table.insert(paladinSkills, {["id"] = 159374, ["level"] = 50, ["specs"] = {66}, ["subText"] = STRING_PASSIVE}); -- Shining Protector
table.insert(paladinSkills, {["id"] = 1044, ["level"] = 52}); -- Hand of Freedom
table.insert(paladinSkills, {["id"] = 121783, ["level"] = 54, ["specs"] = {70}}); -- Emancipate
table.insert(paladinSkills, {["id"] = 82326, ["level"] = 54, ["specs"] = {65}}); -- Holy Light
table.insert(paladinSkills, {["id"] = 88821, ["level"] = 56, ["specs"] = {65}, ["subText"] = STRING_PASSIVE}); -- Daybreak
table.insert(paladinSkills, {["id"] = 25956, ["level"] = 58, ["subText"] = STRING_PASSIVE}); -- Sanctity of Battle
table.insert(paladinSkills, {["id"] = 31821, ["level"] = 60, ["specs"] = {65}}); -- Devotion Aura
table.insert(paladinSkills, {["id"] = 1038, ["level"] = 66, ["specs"] = {66}}); -- Hand of Salvation
table.insert(paladinSkills, {["id"] = 31850, ["level"] = 70, ["specs"] = {66}}); -- Ardent Defender
table.insert(paladinSkills, {["id"] = 85222, ["level"] = 70, ["specs"] = {65}}); -- Light of Dawn
table.insert(paladinSkills, {["id"] = 20164, ["level"] = 70, ["specs"] = {70}}); -- Seal of Justice
table.insert(paladinSkills, {["id"] = 31842, ["level"] = 72, ["specs"] = {65}}); -- Avenging Wrath
table.insert(paladinSkills, {["id"] = 31884, ["level"] = 72, ["specs"] = {70}}); -- Avenging Wrath
table.insert(paladinSkills, {["id"] = 86659, ["level"] = 75, ["specs"] = {66}}); -- Guardian of Ancient Kings
table.insert(paladinSkills, {["id"] = 161800, ["level"] = 76, ["specs"] = {66}, ["subText"] = STRING_PASSIVE}); -- Riposte
table.insert(paladinSkills, {["id"] = 140333, ["level"] = 80, ["specs"] = {70}, ["subText"] = STRING_PASSIVE}); -- Absolve
table.insert(paladinSkills, {["id"] = 76671, ["level"] = 80, ["specs"] = {66}, ["subText"] = STRING_PASSIVE}); -- Mastery: Divine Bulwark
table.insert(paladinSkills, {["id"] = 76672, ["level"] = 80, ["specs"] = {70}, ["subText"] = STRING_PASSIVE}); -- Mastery: Hand of Light
table.insert(paladinSkills, {["id"] = 76669, ["level"] = 80, ["specs"] = {65}, ["subText"] = STRING_PASSIVE}); -- Mastery: Illuminated Healing
table.insert(paladinSkills, {["id"] = 167187, ["level"] = 80, ["specs"] = {70}, ["subText"] = STRING_PASSIVE}); -- Sanctity Aura
table.insert(paladinSkills, {["id"] = 6940, ["level"] = 80}); -- Hand of Sacrifice
table.insert(paladinSkills, {["id"] = 19740, ["level"] = 81}); -- Blessing of Might
table.insert(paladinSkills, {["id"] = 115675, ["level"] = 85, ["subText"] = STRING_PASSIVE}); -- Boundless Conviction
table.insert(paladinSkills, {["id"] = 165381, ["level"] = 90, ["specs"] = {70}, ["subText"] = STRING_PASSIVE}); -- Righteous Vengeance
table.insert(paladinSkills, {["id"] = 165375, ["level"] = 90, ["specs"] = {66}, ["subText"] = STRING_PASSIVE}); -- Sacred Duty
table.insert(paladinSkills, {["id"] = 165380, ["level"] = 90, ["specs"] = {65}, ["subText"] = STRING_PASSIVE}); -- Sanctified Light

_addonData.PALADIN = {};
_addonData.PALADIN.Skills = paladinSkills;
_addonData.PALADIN.Specs = paladinSpecs;

--
-- WARRIOR
--

local warriorSpecs = {};
table.insert(warriorSpecs, 71); -- Arms
table.insert(warriorSpecs, 72); -- Fury
table.insert(warriorSpecs, 73); -- Protection

local warriorSkills = {};
table.insert(warriorSkills, {["id"] = 100, ["level"] = 3}); -- Charge
table.insert(warriorSkills, {["id"] = 34428, ["level"] = 5}); -- Victory Rush
table.insert(warriorSkills, {["id"] = 5308, ["level"] = 7, ["specs"] = {72, 73}}); -- Execute
table.insert(warriorSkills, {["id"] = 163201, ["level"] = 7, ["specs"] = {71}}); -- Execute
table.insert(warriorSkills, {["id"] = 772, ["level"] = 7, ["specs"] = {71}}); -- Rend
table.insert(warriorSkills, {["id"] = 71, ["level"] = 9}); -- Defensive Stance
table.insert(warriorSkills, {["id"] = 161608, ["level"] = 10, ["specs"] = {73}, ["subText"] = STRING_PASSIVE}); -- Bladed Armor
table.insert(warriorSkills, {["id"] = 46915, ["level"] = 10, ["specs"] = {72}, ["subText"] = STRING_PASSIVE}); -- Bloodsurge
table.insert(warriorSkills, {["id"] = 23881, ["level"] = 10, ["specs"] = {72}}); -- Bloodthirst
table.insert(warriorSkills, {["id"] = 23588, ["level"] = 10, ["specs"] = {72}, ["subText"] = STRING_PASSIVE}); -- Crazed Berserker
table.insert(warriorSkills, {["id"] = 12294, ["level"] = 10, ["specs"] = {71}}); -- Mortal Strike
table.insert(warriorSkills, {["id"] = 158298, ["level"] = 10, ["specs"] = {73}, ["subText"] = STRING_PASSIVE}); -- Resolve
table.insert(warriorSkills, {["id"] = 12712, ["level"] = 10, ["specs"] = {71}, ["subText"] = STRING_PASSIVE}); -- Seasoned Soldier
table.insert(warriorSkills, {["id"] = 23922, ["level"] = 10, ["specs"] = {73}}); -- Shield Slam
table.insert(warriorSkills, {["id"] = 46953, ["level"] = 10, ["specs"] = {73}, ["subText"] = STRING_PASSIVE}); -- Sword and Board
table.insert(warriorSkills, {["id"] = 46917, ["level"] = 10, ["specs"] = {72}, ["subText"] = STRING_PASSIVE}); -- Titan
table.insert(warriorSkills, {["id"] = 122509, ["level"] = 10, ["specs"] = {73}, ["subText"] = STRING_PASSIVE}); -- Ultimatum
table.insert(warriorSkills, {["id"] = 29144, ["level"] = 10, ["specs"] = {73}, ["subText"] = STRING_PASSIVE}); -- Unwavering Sentinel
table.insert(warriorSkills, {["id"] = 355, ["level"] = 12}); -- Taunt
table.insert(warriorSkills, {["id"] = 13046, ["level"] = 14, ["specs"] = {72, 73}, ["subText"] = STRING_PASSIVE}); -- Enrage
table.insert(warriorSkills, {["id"] = 6343, ["level"] = 14, ["specs"] = {71, 73}}); -- Thunder Clap
table.insert(warriorSkills, {["id"] = 158836, ["level"] = 15, ["subText"] = STRING_PASSIVE}); -- Headlong Rush
table.insert(warriorSkills, {["id"] = 2565, ["level"] = 18, ["specs"] = {73}}); -- Shield Block
table.insert(warriorSkills, {["id"] = 100130, ["level"] = 18, ["specs"] = {72}}); -- Wild Strike
table.insert(warriorSkills, {["id"] = 156321, ["level"] = 18}); -- Shield Charge
table.insert(warriorSkills, {["id"] = 12323, ["level"] = 19, ["specs"] = {72}}); -- Piercing Howl
table.insert(warriorSkills, {["id"] = 57755, ["level"] = 22}); -- Heroic Throw
table.insert(warriorSkills, {["id"] = 6552, ["level"] = 24}); -- Pummel
table.insert(warriorSkills, {["id"] = 20243, ["level"] = 26, ["specs"] = {73}}); -- Devastate
table.insert(warriorSkills, {["id"] = 1680, ["level"] = 26, ["specs"] = {71, 72}}); -- Whirlwind
table.insert(warriorSkills, {["id"] = 85288, ["level"] = 30, ["specs"] = {72}}); -- Raging Blow
table.insert(warriorSkills, {["id"] = 6572, ["level"] = 30, ["specs"] = {73}}); -- Revenge
table.insert(warriorSkills, {["id"] = 115767, ["level"] = 32}); -- Deep Wounds
table.insert(warriorSkills, {["id"] = 1715, ["level"] = 36}); -- Hamstring
table.insert(warriorSkills, {["id"] = 12975, ["level"] = 38, ["specs"] = {73}}); -- Last Stand
table.insert(warriorSkills, {["id"] = 81099, ["level"] = 38, ["specs"] = {72}, ["subText"] = STRING_PASSIVE}); -- Single
table.insert(warriorSkills, {["id"] = 6673, ["level"] = 42}); -- Battle Shout
table.insert(warriorSkills, {["id"] = 871, ["level"] = 48, ["specs"] = {73}}); -- Shield Wall
table.insert(warriorSkills, {["id"] = 86101, ["level"] = 50, ["specs"] = {71}, ["subText"] = STRING_PASSIVE}); -- Plate Specialization
table.insert(warriorSkills, {["id"] = 86110, ["level"] = 50, ["specs"] = {72}, ["subText"] = STRING_PASSIVE}); -- Plate Specialization
table.insert(warriorSkills, {["id"] = 86535, ["level"] = 50, ["specs"] = {73}, ["subText"] = STRING_PASSIVE}); -- Plate Specialization
table.insert(warriorSkills, {["id"] = 5246, ["level"] = 52}); -- Intimidating Shout
table.insert(warriorSkills, {["id"] = 18499, ["level"] = 54}); -- Berserker Rage
table.insert(warriorSkills, {["id"] = 1160, ["level"] = 56, ["specs"] = {73}}); -- Demoralizing Shout
table.insert(warriorSkills, {["id"] = 118038, ["level"] = 56, ["specs"] = {71, 72}}); -- Die by the Sword
table.insert(warriorSkills, {["id"] = 12950, ["level"] = 58, ["specs"] = {72}, ["subText"] = STRING_PASSIVE}); -- Meat Cleaver
table.insert(warriorSkills, {["id"] = 84608, ["level"] = 60, ["specs"] = {73}, ["subText"] = STRING_PASSIVE}); -- Bastion of Defense
table.insert(warriorSkills, {["id"] = 12328, ["level"] = 60, ["specs"] = {71}}); -- Sweeping Strikes
table.insert(warriorSkills, {["id"] = 23920, ["level"] = 66}); -- Spell Reflection
table.insert(warriorSkills, {["id"] = 469, ["level"] = 68}); -- Commanding Shout
table.insert(warriorSkills, {["id"] = 3411, ["level"] = 72}); -- Intervene
table.insert(warriorSkills, {["id"] = 64382, ["level"] = 74}); -- Shattering Throw
table.insert(warriorSkills, {["id"] = 161798, ["level"] = 76, ["specs"] = {73}, ["subText"] = STRING_PASSIVE}); -- Riposte
table.insert(warriorSkills, {["id"] = 167188, ["level"] = 80, ["specs"] = {71, 72}, ["subText"] = STRING_PASSIVE}); -- Inspiring Presence
table.insert(warriorSkills, {["id"] = 76857, ["level"] = 80, ["specs"] = {73}, ["subText"] = STRING_PASSIVE}); -- Mastery: Critical Block
table.insert(warriorSkills, {["id"] = 76856, ["level"] = 80, ["specs"] = {72}, ["subText"] = STRING_PASSIVE}); -- Mastery: Unshackled Fury
table.insert(warriorSkills, {["id"] = 76838, ["level"] = 80, ["specs"] = {71}, ["subText"] = STRING_PASSIVE}); -- Mastery: Weapons Master
table.insert(warriorSkills, {["id"] = 167105, ["level"] = 81, ["specs"] = {71}}); -- Colossus Smash
table.insert(warriorSkills, {["id"] = 174926, ["level"] = 81, ["specs"] = {71, 72}}); -- Shield Barrier
table.insert(warriorSkills, {["id"] = 97462, ["level"] = 83, ["specs"] = {71, 72}}); -- Rallying Cry
table.insert(warriorSkills, {["id"] = 6544, ["level"] = 85}); -- Heroic Leap
table.insert(warriorSkills, {["id"] = 114192, ["level"] = 87, ["specs"] = {73}}); -- Mocking Banner
table.insert(warriorSkills, {["id"] = 1719, ["level"] = 87, ["specs"] = {71, 72}}); -- Recklessness
table.insert(warriorSkills, {["id"] = 159362, ["level"] = 90, ["specs"] = {73}, ["subText"] = STRING_PASSIVE}); -- Blood Craze
table.insert(warriorSkills, {["id"] = 165383, ["level"] = 90, ["specs"] = {72}, ["subText"] = STRING_PASSIVE}); -- Cruelty
table.insert(warriorSkills, {["id"] = 165393, ["level"] = 90, ["specs"] = {73}, ["subText"] = STRING_PASSIVE}); -- Shield Mastery
table.insert(warriorSkills, {["id"] = 165365, ["level"] = 90, ["specs"] = {71}, ["subText"] = STRING_PASSIVE}); -- Weapon Mastery

_addonData.WARRIOR = {};
_addonData.WARRIOR.Skills = warriorSkills;
_addonData.WARRIOR.Specs = warriorSpecs;

--
-- DRUID
--

local druidSpecs = {};
table.insert(druidSpecs, 102); -- Balance
table.insert(druidSpecs, 103); -- Feral
table.insert(druidSpecs, 104); -- Guardian
table.insert(druidSpecs, 105); -- Restoration

local druidSkills = {};
table.insert(druidSkills, {["id"] = 8921, ["level"] = 3}); -- Moonfire
table.insert(druidSkills, {["id"] = 774, ["level"] = 4}); -- Rejuvenation
table.insert(druidSkills, {["id"] = 1822, ["level"] = 6, ["specs"] = {103}}); -- Rake
table.insert(druidSkills, {["id"] = 768, ["level"] = 6}); -- Cat Form
table.insert(druidSkills, {["id"] = 125972, ["level"] = 6, ["subText"] = STRING_PASSIVE}); -- Feline Grace
table.insert(druidSkills, {["id"] = 22568, ["level"] = 6}); -- Ferocious Bite
table.insert(druidSkills, {["id"] = 5215, ["level"] = 6}); -- Prowl
table.insert(druidSkills, {["id"] = 5221, ["level"] = 6}); -- Shred
table.insert(druidSkills, {["id"] = 5487, ["level"] = 8}); -- Bear Form
table.insert(druidSkills, {["id"] = 6795, ["level"] = 8}); -- Growl
table.insert(druidSkills, {["id"] = 33917, ["level"] = 8}); -- Mangle
table.insert(druidSkills, {["id"] = 161608, ["level"] = 10, ["specs"] = {104}, ["subText"] = STRING_PASSIVE}); -- Bladed Armor
table.insert(druidSkills, {["id"] = 108299, ["level"] = 10, ["specs"] = {102, 105}, ["subText"] = STRING_PASSIVE}); -- Killer Instinct
table.insert(druidSkills, {["id"] = 92364, ["level"] = 10, ["specs"] = {105}, ["subText"] = STRING_PASSIVE}); -- Malfurion
table.insert(druidSkills, {["id"] = 6807, ["level"] = 10, ["specs"] = {104}}); -- Maul
table.insert(druidSkills, {["id"] = 17073, ["level"] = 10, ["specs"] = {105}, ["subText"] = STRING_PASSIVE}); -- Natural Healing
table.insert(druidSkills, {["id"] = 112857, ["level"] = 10, ["specs"] = {102, 105}, ["subText"] = STRING_PASSIVE}); -- Natural Insight
table.insert(druidSkills, {["id"] = 33873, ["level"] = 10, ["specs"] = {103, 104}, ["subText"] = STRING_PASSIVE}); -- Nurturing Instinct
table.insert(druidSkills, {["id"] = 158298, ["level"] = 10, ["specs"] = {104}, ["subText"] = STRING_PASSIVE}); -- Resolve
table.insert(druidSkills, {["id"] = 62606, ["level"] = 10, ["specs"] = {104}}); -- Savage Defense
table.insert(druidSkills, {["id"] = 2912, ["level"] = 10, ["specs"] = {102}}); -- Starfire
table.insert(druidSkills, {["id"] = 18562, ["level"] = 10, ["specs"] = {105}}); -- Swiftmend
table.insert(druidSkills, {["id"] = 16931, ["level"] = 10, ["specs"] = {104}, ["subText"] = STRING_PASSIVE}); -- Thick Hide
table.insert(druidSkills, {["id"] = 5217, ["level"] = 10, ["specs"] = {103}}); -- Tiger
table.insert(druidSkills, {["id"] = 16870, ["level"] = 10}); -- Clearcasting
table.insert(druidSkills, {["id"] = 339, ["level"] = 10}); -- Entangling Roots
table.insert(druidSkills, {["id"] = 78674, ["level"] = 12, ["specs"] = {102}}); -- Starsurge
table.insert(druidSkills, {["id"] = 50769, ["level"] = 12}); -- Revive
table.insert(druidSkills, {["id"] = 85101, ["level"] = 14, ["specs"] = {105}, ["subText"] = STRING_PASSIVE}); -- Meditation
table.insert(druidSkills, {["id"] = 18960, ["level"] = 14}); -- Teleport: Moonglade
table.insert(druidSkills, {["id"] = 106832, ["level"] = 14}); -- Thrash
table.insert(druidSkills, {["id"] = 24858, ["level"] = 16, ["specs"] = {102}}); -- Moonkin Form
table.insert(druidSkills, {["id"] = 783, ["level"] = 16}); -- Travel Form
table.insert(druidSkills, {["id"] = 8936, ["level"] = 18, ["specs"] = {105}}); -- Regrowth
table.insert(druidSkills, {["id"] = 52610, ["level"] = 18, ["specs"] = {103}}); -- Savage Roar
table.insert(druidSkills, {["id"] = 164815, ["level"] = 18}); -- Sunfire
table.insert(druidSkills, {["id"] = 127663, ["level"] = 20, ["specs"] = {102}}); -- Astral Communion
table.insert(druidSkills, {["id"] = 1079, ["level"] = 20, ["specs"] = {103}}); -- Rip
table.insert(druidSkills, {["id"] = 88423, ["level"] = 22, ["specs"] = {105}}); -- Nature
table.insert(druidSkills, {["id"] = 2782, ["level"] = 22, ["specs"] = {102, 103, 104}}); -- Remove Corruption
table.insert(druidSkills, {["id"] = 106785, ["level"] = 22, ["specs"] = {103}}); -- Swipe
table.insert(druidSkills, {["id"] = 1850, ["level"] = 24}); -- Dash
table.insert(druidSkills, {["id"] = 16974, ["level"] = 26, ["specs"] = {103}, ["subText"] = STRING_PASSIVE}); -- Predatory Swiftness
table.insert(druidSkills, {["id"] = 93399, ["level"] = 26, ["specs"] = {102}, ["subText"] = STRING_PASSIVE}); -- Shooting Stars
table.insert(druidSkills, {["id"] = 5185, ["level"] = 26}); -- Healing Touch
table.insert(druidSkills, {["id"] = 770, ["level"] = 28, ["specs"] = {103, 104}}); -- Faerie Fire
table.insert(druidSkills, {["id"] = 48500, ["level"] = 28, ["specs"] = {105}}); -- Living Seed
table.insert(druidSkills, {["id"] = 78675, ["level"] = 28, ["specs"] = {102}}); -- Solar Beam
table.insert(druidSkills, {["id"] = 77758, ["level"] = 28}); -- Thrash
table.insert(druidSkills, {["id"] = 106830, ["level"] = 28}); -- Thrash
table.insert(druidSkills, {["id"] = 132158, ["level"] = 30, ["specs"] = {105}}); -- Nature
table.insert(druidSkills, {["id"] = 16961, ["level"] = 30}); -- Primal Fury
table.insert(druidSkills, {["id"] = 135288, ["level"] = 32, ["specs"] = {104}, ["subText"] = STRING_PASSIVE}); -- Tooth and Claw
table.insert(druidSkills, {["id"] = 33763, ["level"] = 36, ["specs"] = {105}}); -- Lifebloom
table.insert(druidSkills, {["id"] = 5225, ["level"] = 36}); -- Track Humanoids
table.insert(druidSkills, {["id"] = 33745, ["level"] = 38, ["specs"] = {104}}); -- Lacerate
table.insert(druidSkills, {["id"] = 179333, ["level"] = 38, ["specs"] = {102}, ["subText"] = STRING_PASSIVE}); -- Nature
table.insert(druidSkills, {["id"] = 16864, ["level"] = 38, ["specs"] = {103}, ["subText"] = STRING_PASSIVE}); -- Omen of Clarity
table.insert(druidSkills, {["id"] = 113043, ["level"] = 38, ["specs"] = {105}, ["subText"] = STRING_PASSIVE}); -- Omen of Clarity
table.insert(druidSkills, {["id"] = 48484, ["level"] = 40, ["specs"] = {103, 104}, ["subText"] = STRING_PASSIVE}); -- Infected Wounds
table.insert(druidSkills, {["id"] = 22812, ["level"] = 44, ["specs"] = {102, 104, 105}}); -- Barkskin
table.insert(druidSkills, {["id"] = 17007, ["level"] = 46, ["specs"] = {103}, ["subText"] = STRING_PASSIVE}); -- Leader of the Pack
table.insert(druidSkills, {["id"] = 106952, ["level"] = 48, ["specs"] = {103, 104}}); -- Berserk
table.insert(druidSkills, {["id"] = 86093, ["level"] = 50, ["specs"] = {105}, ["subText"] = STRING_PASSIVE}); -- Leather Specialization
table.insert(druidSkills, {["id"] = 86096, ["level"] = 50, ["specs"] = {104}, ["subText"] = STRING_PASSIVE}); -- Leather Specialization
table.insert(druidSkills, {["id"] = 86097, ["level"] = 50, ["specs"] = {103}, ["subText"] = STRING_PASSIVE}); -- Leather Specialization
table.insert(druidSkills, {["id"] = 86104, ["level"] = 50, ["specs"] = {102}, ["subText"] = STRING_PASSIVE}); -- Leather Specialization
table.insert(druidSkills, {["id"] = 61336, ["level"] = 56, ["specs"] = {103, 104}}); -- Survival Instincts
table.insert(druidSkills, {["id"] = 20484, ["level"] = 56}); -- Rebirth
table.insert(druidSkills, {["id"] = 165962, ["level"] = 58}); -- Flight Form
table.insert(druidSkills, {["id"] = 2908, ["level"] = 60}); -- Soothe
table.insert(druidSkills, {["id"] = 1126, ["level"] = 62}); -- Mark of the Wild
table.insert(druidSkills, {["id"] = 102342, ["level"] = 64, ["specs"] = {105}}); -- Ironbark
table.insert(druidSkills, {["id"] = 106839, ["level"] = 64, ["specs"] = {103, 104}}); -- Skull Bash
table.insert(druidSkills, {["id"] = 112071, ["level"] = 68, ["specs"] = {102}}); -- Celestial Alignment
table.insert(druidSkills, {["id"] = 22842, ["level"] = 68}); -- Frenzied Regeneration
table.insert(druidSkills, {["id"] = 740, ["level"] = 74, ["specs"] = {105}}); -- Tranquility
table.insert(druidSkills, {["id"] = 48505, ["level"] = 76, ["specs"] = {102}}); -- Starfall
table.insert(druidSkills, {["id"] = 48438, ["level"] = 76, ["specs"] = {105}}); -- Wild Growth
table.insert(druidSkills, {["id"] = 33786, ["level"] = 78}); -- Cyclone
table.insert(druidSkills, {["id"] = 77495, ["level"] = 80, ["specs"] = {105}, ["subText"] = STRING_PASSIVE}); -- Mastery: Harmony
table.insert(druidSkills, {["id"] = 155783, ["level"] = 80, ["specs"] = {104}, ["subText"] = STRING_PASSIVE}); -- Mastery: Primal Tenacity
table.insert(druidSkills, {["id"] = 77493, ["level"] = 80, ["specs"] = {103}, ["subText"] = STRING_PASSIVE}); -- Mastery: Razor Claws
table.insert(druidSkills, {["id"] = 77492, ["level"] = 80, ["specs"] = {102}, ["subText"] = STRING_PASSIVE}); -- Mastery: Total Eclipse
table.insert(druidSkills, {["id"] = 33605, ["level"] = 82, ["specs"] = {102}, ["subText"] = STRING_PASSIVE}); -- Astral Showers
table.insert(druidSkills, {["id"] = 22570, ["level"] = 82, ["specs"] = {103}}); -- Maim
table.insert(druidSkills, {["id"] = 88747, ["level"] = 84, ["specs"] = {102}}); -- Wild Mushroom
table.insert(druidSkills, {["id"] = 145205, ["level"] = 84, ["specs"] = {105}}); -- Wild Mushroom
table.insert(druidSkills, {["id"] = 106898, ["level"] = 84}); -- Stampeding Roar
table.insert(druidSkills, {["id"] = 145518, ["level"] = 88, ["specs"] = {105}}); -- Genesis
table.insert(druidSkills, {["id"] = 165386, ["level"] = 90, ["specs"] = {102}, ["subText"] = STRING_PASSIVE}); -- Lunar Guidance
table.insert(druidSkills, {["id"] = 165374, ["level"] = 90, ["specs"] = {105}, ["subText"] = STRING_PASSIVE}); -- Naturalist
table.insert(druidSkills, {["id"] = 165372, ["level"] = 90, ["specs"] = {103}, ["subText"] = STRING_PASSIVE}); -- Sharpened Claws
table.insert(druidSkills, {["id"] = 165387, ["level"] = 90, ["specs"] = {104}, ["subText"] = STRING_PASSIVE}); -- Survival of the Fittest
table.insert(druidSkills, {["id"] = 159232, ["level"] = 90, ["specs"] = {104}, ["subText"] = STRING_PASSIVE}); -- Ursa Major

_addonData.DRUID = {};
_addonData.DRUID.Skills = druidSkills;
_addonData.DRUID.Specs = druidSpecs;

--
-- DEATH KNIGHT
--

local dkSpecs = {};
table.insert(dkSpecs, 250); -- Blood
table.insert(dkSpecs, 251); -- Frost
table.insert(dkSpecs, 252); -- Unholy

local dkSkills = {};
table.insert(dkSkills, {["id"] = 161608, ["level"] = 10, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Bladed Armor
table.insert(dkSkills, {["id"] = 81136, ["level"] = 10, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Crimson Scourge
table.insert(dkSkills, {["id"] = 51160, ["level"] = 10, ["specs"] = {252}, ["subText"] = STRING_PASSIVE}); -- Ebon Plaguebringer
table.insert(dkSkills, {["id"] = 56835, ["level"] = 10, ["specs"] = {252}, ["subText"] = STRING_PASSIVE}); -- Reaping
table.insert(dkSkills, {["id"] = 158298, ["level"] = 10, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Resolve
table.insert(dkSkills, {["id"] = 59057, ["level"] = 10, ["specs"] = {251}, ["subText"] = STRING_PASSIVE}); -- Rime
table.insert(dkSkills, {["id"] = 49509, ["level"] = 10, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Scent of Blood
table.insert(dkSkills, {["id"] = 86524, ["level"] = 50, ["subText"] = STRING_PASSIVE}); -- Plate Specialization
table.insert(dkSkills, {["id"] = 54637, ["level"] = 55, ["specs"] = {251}, ["subText"] = STRING_PASSIVE}); -- Blood of the North
table.insert(dkSkills, {["id"] = 50034, ["level"] = 55, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Blood Rites
table.insert(dkSkills, {["id"] = 49143, ["level"] = 55, ["specs"] = {251}, ["subText"] = STRING_PASSIVE}); -- Frost Strike
table.insert(dkSkills, {["id"] = 49184, ["level"] = 55, ["specs"] = {251}}); -- Howling Blast
table.insert(dkSkills, {["id"] = 50887, ["level"] = 55, ["specs"] = {251}, ["subText"] = STRING_PASSIVE}); -- Icy Talons
table.insert(dkSkills, {["id"] = 50371, ["level"] = 55, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Improved Blood Presence
table.insert(dkSkills, {["id"] = 86113, ["level"] = 55, ["specs"] = {251}, ["subText"] = STRING_PASSIVE}); -- Plate Specialization
table.insert(dkSkills, {["id"] = 86536, ["level"] = 55, ["specs"] = {252}, ["subText"] = STRING_PASSIVE}); -- Plate Specialization
table.insert(dkSkills, {["id"] = 86537, ["level"] = 55, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Plate Specialization
table.insert(dkSkills, {["id"] = 91107, ["level"] = 55, ["specs"] = {252}, ["subText"] = STRING_PASSIVE}); -- Unholy Might
table.insert(dkSkills, {["id"] = 50029, ["level"] = 55, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Veteran of the Third War
table.insert(dkSkills, {["id"] = 50842, ["level"] = 55}); -- Blood Boil
table.insert(dkSkills, {["id"] = 55078, ["level"] = 55}); -- Blood Plague
table.insert(dkSkills, {["id"] = 47541, ["level"] = 55}); -- Death Coil
table.insert(dkSkills, {["id"] = 50977, ["level"] = 55}); -- Death Gate
table.insert(dkSkills, {["id"] = 49576, ["level"] = 55}); -- Death Grip
table.insert(dkSkills, {["id"] = 55095, ["level"] = 55}); -- Frost Fever
table.insert(dkSkills, {["id"] = 48266, ["level"] = 55}); -- Frost Presence
table.insert(dkSkills, {["id"] = 45477, ["level"] = 55}); -- Icy Touch
table.insert(dkSkills, {["id"] = 45462, ["level"] = 55}); -- Plague Strike
table.insert(dkSkills, {["id"] = 53343, ["level"] = 55}); -- Rune of Razorice
table.insert(dkSkills, {["id"] = 53428, ["level"] = 55}); -- Runeforging
table.insert(dkSkills, {["id"] = 46584, ["level"] = 56, ["specs"] = {252}}); -- Raise Dead
table.insert(dkSkills, {["id"] = 49998, ["level"] = 56}); -- Death Strike
table.insert(dkSkills, {["id"] = 48263, ["level"] = 57}); -- Blood Presence
table.insert(dkSkills, {["id"] = 47528, ["level"] = 57}); -- Mind Freeze
table.insert(dkSkills, {["id"] = 54447, ["level"] = 57}); -- Rune of Spellbreaking
table.insert(dkSkills, {["id"] = 53342, ["level"] = 57}); -- Rune of Spellshattering
table.insert(dkSkills, {["id"] = 56222, ["level"] = 58, ["specs"] = {250}}); -- Dark Command
table.insert(dkSkills, {["id"] = 49020, ["level"] = 58, ["specs"] = {251}}); -- Obliterate
table.insert(dkSkills, {["id"] = 55090, ["level"] = 58, ["specs"] = {252}}); -- Scourge Strike
table.insert(dkSkills, {["id"] = 45524, ["level"] = 58}); -- Chains of Ice
table.insert(dkSkills, {["id"] = 47476, ["level"] = 58}); -- Strangulate
table.insert(dkSkills, {["id"] = 49572, ["level"] = 60, ["specs"] = {252}, ["subText"] = STRING_PASSIVE}); -- Shadow Infusion
table.insert(dkSkills, {["id"] = 55610, ["level"] = 60, ["specs"] = {251, 252}, ["subText"] = STRING_PASSIVE}); -- Unholy Aura
table.insert(dkSkills, {["id"] = 178819, ["level"] = 60, ["subText"] = STRING_PASSIVE}); -- Dark Succor
table.insert(dkSkills, {["id"] = 43265, ["level"] = 60}); -- Death and Decay
table.insert(dkSkills, {["id"] = 53331, ["level"] = 60}); -- Rune of Lichbane
table.insert(dkSkills, {["id"] = 51986, ["level"] = 61, ["subText"] = STRING_PASSIVE}); -- On a Pale Horse
table.insert(dkSkills, {["id"] = 85948, ["level"] = 62, ["specs"] = {252}}); -- Festering Strike
table.insert(dkSkills, {["id"] = 48792, ["level"] = 62}); -- Icebound Fortitude
table.insert(dkSkills, {["id"] = 51128, ["level"] = 63, ["specs"] = {251}, ["subText"] = STRING_PASSIVE}); -- Killing Machine
table.insert(dkSkills, {["id"] = 48982, ["level"] = 64, ["specs"] = {250}}); -- Rune Tap
table.insert(dkSkills, {["id"] = 49530, ["level"] = 64, ["specs"] = {252}, ["subText"] = STRING_PASSIVE}); -- Sudden Doom
table.insert(dkSkills, {["id"] = 48265, ["level"] = 64}); -- Unholy Presence
table.insert(dkSkills, {["id"] = 50385, ["level"] = 65, ["specs"] = {251}}); -- Improved Frost Presence
table.insert(dkSkills, {["id"] = 57330, ["level"] = 65}); -- Horn of Winter
table.insert(dkSkills, {["id"] = 3714, ["level"] = 66}); -- Path of Frost
table.insert(dkSkills, {["id"] = 51271, ["level"] = 68, ["specs"] = {251}}); -- Pillar of Frost
table.insert(dkSkills, {["id"] = 48707, ["level"] = 68}); -- Anti
table.insert(dkSkills, {["id"] = 111673, ["level"] = 69}); -- Control Undead
table.insert(dkSkills, {["id"] = 63560, ["level"] = 70, ["specs"] = {252}}); -- Dark Transformation
table.insert(dkSkills, {["id"] = 81164, ["level"] = 70, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Will of the Necropolis
table.insert(dkSkills, {["id"] = 53344, ["level"] = 70}); -- Rune of the Fallen Crusader
table.insert(dkSkills, {["id"] = 81127, ["level"] = 72, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Sanguine Fortitude
table.insert(dkSkills, {["id"] = 61999, ["level"] = 72}); -- Raise Ally
table.insert(dkSkills, {["id"] = 62158, ["level"] = 72}); -- Rune of the Stoneskin Gargoyle
table.insert(dkSkills, {["id"] = 49028, ["level"] = 74, ["specs"] = {250}}); -- Dancing Rune Weapon
table.insert(dkSkills, {["id"] = 81333, ["level"] = 74, ["specs"] = {251}, ["subText"] = STRING_PASSIVE}); -- Might of the Frozen Wastes
table.insert(dkSkills, {["id"] = 49206, ["level"] = 74, ["specs"] = {252}}); -- Summon Gargoyle
table.insert(dkSkills, {["id"] = 66192, ["level"] = 74, ["specs"] = {251}, ["subText"] = STRING_PASSIVE}); -- Threat of Thassarian
table.insert(dkSkills, {["id"] = 50392, ["level"] = 75, ["specs"] = {252}, ["subText"] = STRING_PASSIVE}); -- Improved Unholy Presence
table.insert(dkSkills, {["id"] = 161797, ["level"] = 76, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Riposte
table.insert(dkSkills, {["id"] = 55233, ["level"] = 76, ["specs"] = {250}}); -- Vampiric Blood
table.insert(dkSkills, {["id"] = 47568, ["level"] = 76}); -- Empower Rune Weapon
table.insert(dkSkills, {["id"] = 49222, ["level"] = 78, ["specs"] = {250}}); -- Bone Shield
table.insert(dkSkills, {["id"] = 77513, ["level"] = 80, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Mastery: Blood Shield
table.insert(dkSkills, {["id"] = 77515, ["level"] = 80, ["specs"] = {252}, ["subText"] = STRING_PASSIVE}); -- Mastery: Dreadblade
table.insert(dkSkills, {["id"] = 77514, ["level"] = 80, ["specs"] = {251}, ["subText"] = STRING_PASSIVE}); -- Mastery: Frozen Heart
table.insert(dkSkills, {["id"] = 155522, ["level"] = 80, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Power of the Grave
table.insert(dkSkills, {["id"] = 42650, ["level"] = 80}); -- Army of the Dead
table.insert(dkSkills, {["id"] = 77575, ["level"] = 81}); -- Outbreak
table.insert(dkSkills, {["id"] = 77606, ["level"] = 85}); -- Dark Simulacrum
table.insert(dkSkills, {["id"] = 114866, ["level"] = 87, ["specs"] = {250}}); -- Soul Reaper
table.insert(dkSkills, {["id"] = 130735, ["level"] = 87, ["specs"] = {251}}); -- Soul Reaper
table.insert(dkSkills, {["id"] = 130736, ["level"] = 87}); -- Soul Reaper
table.insert(dkSkills, {["id"] = 165395, ["level"] = 90, ["specs"] = {252}, ["subText"] = STRING_PASSIVE}); -- Necrosis
table.insert(dkSkills, {["id"] = 165394, ["level"] = 90, ["specs"] = {250}, ["subText"] = STRING_PASSIVE}); -- Runic Strikes

_addonData.DEATHKNIGHT = {};
_addonData.DEATHKNIGHT.Skills = dkSkills;
_addonData.DEATHKNIGHT.Specs = dkSpecs;

--
-- HUNTER
--

local hunterSpecs = {};
table.insert(hunterSpecs, 253); -- Beast Mastery
table.insert(hunterSpecs, 254); -- Marksmanship
table.insert(hunterSpecs, 255); -- Survival

local hunterSkills = {};
table.insert(hunterSkills, {["id"] = 56641, ["level"] = 3}); -- Steady Shot
table.insert(hunterSkills, {["id"] = 1494, ["level"] = 4}); -- Track Beasts
table.insert(hunterSkills, {["id"] = 19878, ["level"] = 4}); -- Track Demons
table.insert(hunterSkills, {["id"] = 19879, ["level"] = 4}); -- Track Dragonkin
table.insert(hunterSkills, {["id"] = 19880, ["level"] = 4}); -- Track Elementals
table.insert(hunterSkills, {["id"] = 19882, ["level"] = 4}); -- Track Giants
table.insert(hunterSkills, {["id"] = 19885, ["level"] = 4}); -- Track Hidden
table.insert(hunterSkills, {["id"] = 19883, ["level"] = 4}); -- Track Humanoids
table.insert(hunterSkills, {["id"] = 19884, ["level"] = 4}); -- Track Undead
table.insert(hunterSkills, {["id"] = 5116, ["level"] = 8}); -- Concussive Shot
table.insert(hunterSkills, {["id"] = 19434, ["level"] = 10, ["specs"] = {254}}); -- Aimed Shot
table.insert(hunterSkills, {["id"] = 53270, ["level"] = 10, ["specs"] = {253}, ["subText"] = STRING_PASSIVE}); -- Exotic Beasts
table.insert(hunterSkills, {["id"] = 53301, ["level"] = 10, ["specs"] = {255}}); -- Explosive Shot
table.insert(hunterSkills, {["id"] = 34026, ["level"] = 10, ["specs"] = {253}}); -- Kill Command
table.insert(hunterSkills, {["id"] = 164856, ["level"] = 10, ["specs"] = {255}, ["subText"] = STRING_PASSIVE}); -- Survivalist
table.insert(hunterSkills, {["id"] = 63458, ["level"] = 10, ["specs"] = {255}, ["subText"] = STRING_PASSIVE}); -- Trap Mastery
table.insert(hunterSkills, {["id"] = 1462, ["level"] = 10}); -- Beast Lore
table.insert(hunterSkills, {["id"] = 83242, ["level"] = 10}); -- Call Pet 2
table.insert(hunterSkills, {["id"] = 93321, ["level"] = 10, ["subText"] = STRING_PASSIVE}); -- Control Pet
table.insert(hunterSkills, {["id"] = 2641, ["level"] = 10}); -- Dismiss Pet
table.insert(hunterSkills, {["id"] = 1515, ["level"] = 10}); -- Tame Beast
table.insert(hunterSkills, {["id"] = 6991, ["level"] = 11}); -- Feed Pet
table.insert(hunterSkills, {["id"] = 781, ["level"] = 14}); -- Disengage
table.insert(hunterSkills, {["id"] = 6197, ["level"] = 16}); -- Eagle Eye
table.insert(hunterSkills, {["id"] = 34483, ["level"] = 20, ["specs"] = {254}, ["subText"] = STRING_PASSIVE}); -- Careful Aim
table.insert(hunterSkills, {["id"] = 34954, ["level"] = 20, ["specs"] = {253}, ["subText"] = STRING_PASSIVE}); -- Go for the Throat
table.insert(hunterSkills, {["id"] = 147362, ["level"] = 22}); -- Counter Shot
table.insert(hunterSkills, {["id"] = 115939, ["level"] = 24, ["specs"] = {253}}); -- Beast Cleave
table.insert(hunterSkills, {["id"] = 5118, ["level"] = 24}); -- Aspect of the Cheetah
table.insert(hunterSkills, {["id"] = 2643, ["level"] = 24}); -- Multi
table.insert(hunterSkills, {["id"] = 1499, ["level"] = 28}); -- Freezing Trap
table.insert(hunterSkills, {["id"] = 19623, ["level"] = 30, ["specs"] = {253}, ["subText"] = STRING_PASSIVE}); -- Frenzy
table.insert(hunterSkills, {["id"] = 82692, ["level"] = 32, ["specs"] = {253}}); -- Focus Fire
table.insert(hunterSkills, {["id"] = 5384, ["level"] = 32}); -- Feign Death
table.insert(hunterSkills, {["id"] = 53351, ["level"] = 35, ["specs"] = {253, 254}}); -- Kill Shot
table.insert(hunterSkills, {["id"] = 19801, ["level"] = 35}); -- Tranquilizing Shot
table.insert(hunterSkills, {["id"] = 13813, ["level"] = 38}); -- Explosive Trap
table.insert(hunterSkills, {["id"] = 1543, ["level"] = 38}); -- Flare
table.insert(hunterSkills, {["id"] = 19506, ["level"] = 39, ["subText"] = STRING_PASSIVE}); -- Trueshot Aura
table.insert(hunterSkills, {["id"] = 19574, ["level"] = 40, ["specs"] = {253}}); -- Bestial Wrath
table.insert(hunterSkills, {["id"] = 8737, ["level"] = 40, ["subText"] = STRING_PASSIVE}); -- Mail
table.insert(hunterSkills, {["id"] = 83243, ["level"] = 42}); -- Call Pet 3
table.insert(hunterSkills, {["id"] = 34477, ["level"] = 42}); -- Misdirection
table.insert(hunterSkills, {["id"] = 53260, ["level"] = 43, ["specs"] = {253}, ["subText"] = STRING_PASSIVE}); -- Cobra Strikes
table.insert(hunterSkills, {["id"] = 35110, ["level"] = 45, ["specs"] = {254}, ["subText"] = STRING_PASSIVE}); -- Bombardment
table.insert(hunterSkills, {["id"] = 13809, ["level"] = 46}); -- Ice Trap
table.insert(hunterSkills, {["id"] = 77769, ["level"] = 48}); -- Trap Launcher
table.insert(hunterSkills, {["id"] = 3674, ["level"] = 50, ["specs"] = {255}}); -- Black Arrow
table.insert(hunterSkills, {["id"] = 86538, ["level"] = 50, ["subText"] = STRING_PASSIVE}); -- Black Arrow
table.insert(hunterSkills, {["id"] = 20736, ["level"] = 52}); -- Distracting Shot
table.insert(hunterSkills, {["id"] = 3045, ["level"] = 54, ["specs"] = {254}}); -- Rapid Fire
table.insert(hunterSkills, {["id"] = 19387, ["level"] = 55, ["specs"] = {255}, ["subText"] = STRING_PASSIVE}); -- Entrapment
table.insert(hunterSkills, {["id"] = 13159, ["level"] = 56}); -- Aspect of the Pack
table.insert(hunterSkills, {["id"] = 56315, ["level"] = 58, ["specs"] = {253}, ["subText"] = STRING_PASSIVE}); -- Kindred Spirits
table.insert(hunterSkills, {["id"] = 53209, ["level"] = 60, ["specs"] = {254}}); -- Chimaera Shot
table.insert(hunterSkills, {["id"] = 83244, ["level"] = 62}); -- Call Pet 4
table.insert(hunterSkills, {["id"] = 53253, ["level"] = 63, ["specs"] = {253}, ["subText"] = STRING_PASSIVE}); -- Invigoration
table.insert(hunterSkills, {["id"] = 87935, ["level"] = 68, ["specs"] = {255}, ["subText"] = STRING_PASSIVE}); -- Serpent Sting
table.insert(hunterSkills, {["id"] = 53271, ["level"] = 74}); -- Master
table.insert(hunterSkills, {["id"] = 19263, ["level"] = 78}); -- Deterrence
table.insert(hunterSkills, {["id"] = 76658, ["level"] = 80, ["specs"] = {255}, ["subText"] = STRING_PASSIVE}); -- Mastery: Essence of the Viper
table.insert(hunterSkills, {["id"] = 76657, ["level"] = 80, ["specs"] = {253}, ["subText"] = STRING_PASSIVE}); -- Mastery: Master of Beasts
table.insert(hunterSkills, {["id"] = 76659, ["level"] = 80, ["specs"] = {254}, ["subText"] = STRING_PASSIVE}); -- Mastery: Sniper Training
table.insert(hunterSkills, {["id"] = 77767, ["level"] = 81, ["specs"] = {253, 255}}); -- Cobra Shot
table.insert(hunterSkills, {["id"] = 83245, ["level"] = 82}); -- Call Pet 5
table.insert(hunterSkills, {["id"] = 51753, ["level"] = 85}); -- Camouflage
table.insert(hunterSkills, {["id"] = 165389, ["level"] = 90, ["specs"] = {253}, ["subText"] = STRING_PASSIVE}); -- Animal Handler
table.insert(hunterSkills, {["id"] = 165378, ["level"] = 90, ["specs"] = {254}, ["subText"] = STRING_PASSIVE}); -- Lethal Shots
table.insert(hunterSkills, {["id"] = 165396, ["level"] = 90, ["specs"] = {255}, ["subText"] = STRING_PASSIVE}); -- Lightning Reflexes

_addonData.HUNTER = {};
_addonData.HUNTER.Skills = hunterSkills;
_addonData.HUNTER.Specs = hunterSpecs;

--
-- PRIEST
--

local priestSpecs = {};
table.insert(priestSpecs, 256); -- Disciplin
table.insert(priestSpecs, 257); -- Holy
table.insert(priestSpecs, 258); -- Shadow

local priestSkills = {};
table.insert(priestSkills, {["id"] = 589, ["level"] = 3}); -- Shadow Word: Pain
table.insert(priestSkills, {["id"] = 81782, ["level"] = 5}); -- Power Word: Barrier
table.insert(priestSkills, {["id"] = 17, ["level"] = 5}); -- Power Word: Shield
table.insert(priestSkills, {["id"] = 2061, ["level"] = 7}); -- Flash Heal
table.insert(priestSkills, {["id"] = 52798, ["level"] = 10, ["specs"] = {256}, ["subText"] = STRING_PASSIVE}); -- Borrowed Time
table.insert(priestSkills, {["id"] = 47517, ["level"] = 10, ["specs"] = {256}, ["subText"] = STRING_PASSIVE}); -- Grace
table.insert(priestSkills, {["id"] = 88625, ["level"] = 10, ["specs"] = {257}}); -- Holy Word: Chastise
table.insert(priestSkills, {["id"] = 95860, ["level"] = 10, ["specs"] = {256}, ["subText"] = STRING_PASSIVE}); -- Meditation
table.insert(priestSkills, {["id"] = 95861, ["level"] = 10, ["specs"] = {257}, ["subText"] = STRING_PASSIVE}); -- Meditation
table.insert(priestSkills, {["id"] = 15407, ["level"] = 10, ["specs"] = {258}}); -- Mind Flay
table.insert(priestSkills, {["id"] = 47540, ["level"] = 10, ["specs"] = {256}}); -- Penance
table.insert(priestSkills, {["id"] = 47536, ["level"] = 10, ["specs"] = {256}, ["subText"] = STRING_PASSIVE}); -- Rapture
table.insert(priestSkills, {["id"] = 87336, ["level"] = 10, ["specs"] = {256, 257}, ["subText"] = STRING_PASSIVE}); -- Spiritual Healing
table.insert(priestSkills, {["id"] = 14914, ["level"] = 18, ["specs"] = {256, 257}}); -- Holy Fire
table.insert(priestSkills, {["id"] = 2006, ["level"] = 18}); -- Resurrection
table.insert(priestSkills, {["id"] = 132157, ["level"] = 20, ["specs"] = {256}}); -- Holy Nova
table.insert(priestSkills, {["id"] = 88684, ["level"] = 20}); -- Holy Word: Serenity
table.insert(priestSkills, {["id"] = 2944, ["level"] = 21, ["specs"] = {258}}); -- Devouring Plague
table.insert(priestSkills, {["id"] = 8092, ["level"] = 21, ["specs"] = {258}}); -- Mind Blast
table.insert(priestSkills, {["id"] = 95740, ["level"] = 21, ["specs"] = {258}, ["subText"] = STRING_PASSIVE}); -- Shadow Orbs
table.insert(priestSkills, {["id"] = 527, ["level"] = 22, ["specs"] = {256, 257}}); -- Purify
table.insert(priestSkills, {["id"] = 21562, ["level"] = 22}); -- Power Word: Fortitude
table.insert(priestSkills, {["id"] = 47515, ["level"] = 24, ["specs"] = {256}, ["subText"] = STRING_PASSIVE}); -- Divine Aegis
table.insert(priestSkills, {["id"] = 15473, ["level"] = 24, ["specs"] = {258}}); -- Shadowform
table.insert(priestSkills, {["id"] = 586, ["level"] = 24}); -- Fade
table.insert(priestSkills, {["id"] = 49868, ["level"] = 26, ["specs"] = {258}, ["subText"] = STRING_PASSIVE}); -- Mind Quickening
table.insert(priestSkills, {["id"] = 139, ["level"] = 26, ["specs"] = {257}}); -- Renew
table.insert(priestSkills, {["id"] = 528, ["level"] = 26}); -- Dispel Magic
table.insert(priestSkills, {["id"] = 34914, ["level"] = 28, ["specs"] = {258}}); -- Vampiric Touch
table.insert(priestSkills, {["id"] = 48045, ["level"] = 28}); -- Mind Sear
table.insert(priestSkills, {["id"] = 45243, ["level"] = 30, ["specs"] = {256, 257}, ["subText"] = STRING_PASSIVE}); -- Focused Will
table.insert(priestSkills, {["id"] = 20711, ["level"] = 30, ["specs"] = {257}, ["subText"] = STRING_PASSIVE}); -- Spirit of Redemption
table.insert(priestSkills, {["id"] = 9484, ["level"] = 32}); -- Shackle Undead
table.insert(priestSkills, {["id"] = 2060, ["level"] = 34, ["specs"] = {256, 257}}); -- Heal
table.insert(priestSkills, {["id"] = 63733, ["level"] = 34, ["specs"] = {257}, ["subText"] = STRING_PASSIVE}); -- Serendipity
table.insert(priestSkills, {["id"] = 1706, ["level"] = 34}); -- Levitate
table.insert(priestSkills, {["id"] = 126135, ["level"] = 36, ["specs"] = {257}}); -- Lightwell
table.insert(priestSkills, {["id"] = 81749, ["level"] = 38, ["specs"] = {256}, ["subText"] = STRING_PASSIVE}); -- Atonement
table.insert(priestSkills, {["id"] = 78203, ["level"] = 42, ["specs"] = {258}, ["subText"] = STRING_PASSIVE}); -- Shadowy Apparitions
table.insert(priestSkills, {["id"] = 2096, ["level"] = 42}); -- Mind Vision
table.insert(priestSkills, {["id"] = 34433, ["level"] = 42}); -- Shadowfiend
table.insert(priestSkills, {["id"] = 81662, ["level"] = 44, ["specs"] = {256}, ["subText"] = STRING_PASSIVE}); -- Evangelism
table.insert(priestSkills, {["id"] = 73510, ["level"] = 44, ["specs"] = {258}}); -- Mind Spike
table.insert(priestSkills, {["id"] = 596, ["level"] = 46, ["specs"] = {256, 257}}); -- Prayer of Healing
table.insert(priestSkills, {["id"] = 32379, ["level"] = 46, ["specs"] = {258}}); -- Shadow Word: Death
table.insert(priestSkills, {["id"] = 32546, ["level"] = 48, ["specs"] = {257}}); -- Binding Heal
table.insert(priestSkills, {["id"] = 89745, ["level"] = 50, ["subText"] = STRING_PASSIVE}); -- Archangel
table.insert(priestSkills, {["id"] = 81700, ["level"] = 50, ["specs"] = {256}}); -- Archangel
table.insert(priestSkills, {["id"] = 34861, ["level"] = 50, ["specs"] = {257}}); -- Circle of Healing
table.insert(priestSkills, {["id"] = 15487, ["level"] = 52, ["specs"] = {256, 258}}); -- Silence
table.insert(priestSkills, {["id"] = 6346, ["level"] = 54}); -- Fear Ward
table.insert(priestSkills, {["id"] = 81209, ["level"] = 56, ["specs"] = {257}}); -- Chakra: Chastise
table.insert(priestSkills, {["id"] = 81206, ["level"] = 56, ["specs"] = {257}}); -- Chakra: Sanctuary
table.insert(priestSkills, {["id"] = 81208, ["level"] = 56, ["specs"] = {257}}); -- Chakra: Serenity
table.insert(priestSkills, {["id"] = 33206, ["level"] = 58, ["specs"] = {256}}); -- Pain Suppression
table.insert(priestSkills, {["id"] = 47585, ["level"] = 60, ["specs"] = {258}}); -- Dispersion
table.insert(priestSkills, {["id"] = 95649, ["level"] = 64, ["specs"] = {257}, ["subText"] = STRING_PASSIVE}); -- Rapid Renewal
table.insert(priestSkills, {["id"] = 33076, ["level"] = 68}); -- Prayer of Mending
table.insert(priestSkills, {["id"] = 47788, ["level"] = 70, ["specs"] = {257}}); -- Guardian Spirit
table.insert(priestSkills, {["id"] = 62618, ["level"] = 70, ["specs"] = {256}}); -- Power Word: Barrier
table.insert(priestSkills, {["id"] = 32375, ["level"] = 72}); -- Mass Dispel
table.insert(priestSkills, {["id"] = 64044, ["level"] = 74, ["specs"] = {258}}); -- Psychic Horror
table.insert(priestSkills, {["id"] = 64843, ["level"] = 78, ["specs"] = {257}}); -- Divine Hymn
table.insert(priestSkills, {["id"] = 15286, ["level"] = 78, ["specs"] = {258}}); -- Vampiric Embrace
table.insert(priestSkills, {["id"] = 77485, ["level"] = 80, ["specs"] = {257}, ["subText"] = STRING_PASSIVE}); -- Mastery: Echo of Light
table.insert(priestSkills, {["id"] = 77486, ["level"] = 80, ["specs"] = {258}, ["subText"] = STRING_PASSIVE}); -- Mastery: Mental Anguish
table.insert(priestSkills, {["id"] = 77484, ["level"] = 80, ["specs"] = {256}, ["subText"] = STRING_PASSIVE}); -- Mastery: Shield Discipline
table.insert(priestSkills, {["id"] = 73325, ["level"] = 84}); -- Leap of Faith
table.insert(priestSkills, {["id"] = 165362, ["level"] = 90, ["specs"] = {257}, ["subText"] = STRING_PASSIVE}); -- Divine Providence
table.insert(priestSkills, {["id"] = 165376, ["level"] = 90, ["specs"] = {256}, ["subText"] = STRING_PASSIVE}); -- Enlightenment
table.insert(priestSkills, {["id"] = 165370, ["level"] = 90, ["specs"] = {258}, ["subText"] = STRING_PASSIVE}); -- Mastermind

_addonData.PRIEST = {};
_addonData.PRIEST.Skills = priestSkills;
_addonData.PRIEST.Specs = priestSpecs;

--
-- ROGUE
--

local rogueSpecs = {};
table.insert(rogueSpecs, 259); -- Assassination
table.insert(rogueSpecs, 260); -- Combat
table.insert(rogueSpecs, 261); -- Subtlety

local rogueSkills = {};
table.insert(rogueSkills, {["id"] = 2098, ["level"] = 3}); -- Eviscerate
table.insert(rogueSkills, {["id"] = 1784, ["level"] = 5}); -- Stealth
table.insert(rogueSkills, {["id"] = 8676, ["level"] = 6}); -- Ambush
table.insert(rogueSkills, {["id"] = 5277, ["level"] = 8}); -- Evasion
table.insert(rogueSkills, {["id"] = 84601, ["level"] = 10, ["specs"] = {259}, ["subText"] = STRING_PASSIVE}); -- Assassin's Resolve
table.insert(rogueSkills, {["id"] = 13877, ["level"] = 10, ["specs"] = {260}}); -- Blade Flurry
table.insert(rogueSkills, {["id"] = 79152, ["level"] = 10, ["specs"] = {261}, ["subText"] = STRING_PASSIVE}); -- Energetic Recovery
table.insert(rogueSkills, {["id"] = 91023, ["level"] = 10, ["specs"] = {261}, ["subText"] = STRING_PASSIVE}); -- Find Weakness
table.insert(rogueSkills, {["id"] = 16511, ["level"] = 10, ["specs"] = {261}}); -- Hemorrhage
table.insert(rogueSkills, {["id"] = 14117, ["level"] = 10, ["specs"] = {259}, ["subText"] = STRING_PASSIVE}); -- Improved Poisons
table.insert(rogueSkills, {["id"] = 31223, ["level"] = 10, ["specs"] = {261}, ["subText"] = STRING_PASSIVE}); -- Master of Subtlety
table.insert(rogueSkills, {["id"] = 1329, ["level"] = 10, ["specs"] = {259}}); -- Mutilate
table.insert(rogueSkills, {["id"] = 31220, ["level"] = 10, ["specs"] = {261}, ["subText"] = STRING_PASSIVE}); -- Sinister Calling
table.insert(rogueSkills, {["id"] = 61329, ["level"] = 10, ["specs"] = {260}, ["subText"] = STRING_PASSIVE}); -- Vitality
table.insert(rogueSkills, {["id"] = 2823, ["level"] = 10}); -- Deadly Poison
table.insert(rogueSkills, {["id"] = 6770, ["level"] = 12}); -- Sap
table.insert(rogueSkills, {["id"] = 5171, ["level"] = 14}); -- Slice and Dice
table.insert(rogueSkills, {["id"] = 921, ["level"] = 15}); -- Pick Pocket
table.insert(rogueSkills, {["id"] = 73651, ["level"] = 16}); -- Recuperate
table.insert(rogueSkills, {["id"] = 1766, ["level"] = 18}); -- Kick
table.insert(rogueSkills, {["id"] = 51667, ["level"] = 20, ["specs"] = {259}, ["subText"] = STRING_PASSIVE}); -- Cut to the Chase
table.insert(rogueSkills, {["id"] = 32645, ["level"] = 20, ["specs"] = {259}}); -- Envenom
table.insert(rogueSkills, {["id"] = 84617, ["level"] = 20, ["specs"] = {260}}); -- Revealing Strike
table.insert(rogueSkills, {["id"] = 3408, ["level"] = 20}); -- Crippling Poison
table.insert(rogueSkills, {["id"] = 1776, ["level"] = 22}); -- Gouge
table.insert(rogueSkills, {["id"] = 1804, ["level"] = 24}); -- Pick Lock
table.insert(rogueSkills, {["id"] = 2983, ["level"] = 26}); -- Sprint
table.insert(rogueSkills, {["id"] = 1725, ["level"] = 28}); -- Distract
table.insert(rogueSkills, {["id"] = 35551, ["level"] = 30, ["specs"] = {260}, ["subText"] = STRING_PASSIVE}); -- Combat Potency
table.insert(rogueSkills, {["id"] = 14183, ["level"] = 30, ["specs"] = {261}}); -- Premeditation
table.insert(rogueSkills, {["id"] = 14190, ["level"] = 30, ["specs"] = {259}, ["subText"] = STRING_PASSIVE}); -- Seal Fate
table.insert(rogueSkills, {["id"] = 1833, ["level"] = 30}); -- Cheap Shot
table.insert(rogueSkills, {["id"] = 113742, ["level"] = 30, ["subText"] = STRING_PASSIVE}); -- Swiftblade
table.insert(rogueSkills, {["id"] = 8679, ["level"] = 30}); -- Wound Poison
table.insert(rogueSkills, {["id"] = 14161, ["level"] = 32, ["specs"] = {260}, ["subText"] = STRING_PASSIVE}); -- Ruthlessness
table.insert(rogueSkills, {["id"] = 1856, ["level"] = 34}); -- Vanish
table.insert(rogueSkills, {["id"] = 2094, ["level"] = 38}); -- Blind
table.insert(rogueSkills, {["id"] = 13750, ["level"] = 40, ["specs"] = {260}}); -- Adrenaline Rush
table.insert(rogueSkills, {["id"] = 53, ["level"] = 40, ["specs"] = {261}}); -- Backstab
table.insert(rogueSkills, {["id"] = 121152, ["level"] = 40, ["specs"] = {259}, ["subText"] = STRING_PASSIVE}); -- Blindside
table.insert(rogueSkills, {["id"] = 111240, ["level"] = 40, ["specs"] = {259}}); -- Dispatch
table.insert(rogueSkills, {["id"] = 408, ["level"] = 40}); -- Kidney Shot
table.insert(rogueSkills, {["id"] = 2836, ["level"] = 42}); -- Detect Traps
table.insert(rogueSkills, {["id"] = 1966, ["level"] = 44}); -- Feint
table.insert(rogueSkills, {["id"] = 1943, ["level"] = 46, ["specs"] = {259, 261}}); -- Rupture
table.insert(rogueSkills, {["id"] = 79134, ["level"] = 46, ["specs"] = {259}, ["subText"] = STRING_PASSIVE}); -- Venomous Wounds
table.insert(rogueSkills, {["id"] = 703, ["level"] = 48}); -- Garrote
table.insert(rogueSkills, {["id"] = 1860, ["level"] = 48, ["subText"] = STRING_PASSIVE}); -- Safe Fall
table.insert(rogueSkills, {["id"] = 51701, ["level"] = 50, ["specs"] = {261}, ["subText"] = STRING_PASSIVE}); -- Honor Among Thieves
table.insert(rogueSkills, {["id"] = 86092, ["level"] = 50, ["specs"] = {261}, ["subText"] = STRING_PASSIVE}); -- Leather Specialization
table.insert(rogueSkills, {["id"] = 58423, ["level"] = 54, ["specs"] = {259, 261}, ["subText"] = STRING_PASSIVE}); -- Relentless Strikes
table.insert(rogueSkills, {["id"] = 31224, ["level"] = 58}); -- Cloak of Shadows
table.insert(rogueSkills, {["id"] = 84654, ["level"] = 60, ["specs"] = {260}, ["subText"] = STRING_PASSIVE}); -- Bandit
table.insert(rogueSkills, {["id"] = 79147, ["level"] = 60, ["specs"] = {261}, ["subText"] = STRING_PASSIVE}); -- Sanguinary Vein
table.insert(rogueSkills, {["id"] = 31209, ["level"] = 62, ["subText"] = STRING_PASSIVE}); -- Fleet Footed
table.insert(rogueSkills, {["id"] = 51723, ["level"] = 66, ["specs"] = {259, 261}}); -- Fan of Knives
table.insert(rogueSkills, {["id"] = 14185, ["level"] = 68}); -- Preparation
table.insert(rogueSkills, {["id"] = 5938, ["level"] = 74}); -- Shiv
table.insert(rogueSkills, {["id"] = 114018, ["level"] = 76}); -- Shroud of Concealment
table.insert(rogueSkills, {["id"] = 57934, ["level"] = 78}); -- Tricks of the Trade
table.insert(rogueSkills, {["id"] = 51690, ["level"] = 80, ["specs"] = {260}}); -- Killing Spree
table.insert(rogueSkills, {["id"] = 76808, ["level"] = 80, ["specs"] = {261}, ["subText"] = STRING_PASSIVE}); -- Mastery: Executioner
table.insert(rogueSkills, {["id"] = 76806, ["level"] = 80, ["specs"] = {260}, ["subText"] = STRING_PASSIVE}); -- Mastery: Main Gauche
table.insert(rogueSkills, {["id"] = 76803, ["level"] = 80, ["specs"] = {259}, ["subText"] = STRING_PASSIVE}); -- Mastery: Potent Poisons
table.insert(rogueSkills, {["id"] = 51713, ["level"] = 80, ["specs"] = {261}}); -- Shadow Dance
table.insert(rogueSkills, {["id"] = 79140, ["level"] = 80, ["specs"] = {259}}); -- Vendetta
table.insert(rogueSkills, {["id"] = 121411, ["level"] = 83}); -- Crimson Tempest
table.insert(rogueSkills, {["id"] = 76577, ["level"] = 85}); -- Smoke Bomb
table.insert(rogueSkills, {["id"] = 165390, ["level"] = 90, ["specs"] = {259}, ["subText"] = STRING_PASSIVE}); -- Master Poisoner

_addonData.ROGUE = {};
_addonData.ROGUE.Skills = rogueSkills;
_addonData.ROGUE.Specs = rogueSpecs;

--
-- SHAMAN
--

local shamanSpecs = {};
table.insert(shamanSpecs, 262); -- Elemental
table.insert(shamanSpecs, 263); -- Enhancement
table.insert(shamanSpecs, 264); -- Restoration

local shamanSkills = {};
table.insert(shamanSkills, {["id"] = 73899, ["level"] = 3}); -- Primal Strike
table.insert(shamanSkills, {["id"] = 8042, ["level"] = 6, ["specs"] = {262}}); -- Earth Shock
table.insert(shamanSkills, {["id"] = 8004, ["level"] = 7}); -- Healing Surge
table.insert(shamanSkills, {["id"] = 324, ["level"] = 8}); -- Lightning Shield
table.insert(shamanSkills, {["id"] = 86629, ["level"] = 10, ["specs"] = {263}, ["subText"] = STRING_PASSIVE}); -- Dual Wield
table.insert(shamanSkills, {["id"] = 60188, ["level"] = 10, ["specs"] = {262}, ["subText"] = STRING_PASSIVE}); -- Elemental Fury
table.insert(shamanSkills, {["id"] = 29000, ["level"] = 10, ["specs"] = {262}, ["subText"] = STRING_PASSIVE}); -- Elemental Reach
table.insert(shamanSkills, {["id"] = 10400, ["level"] = 10, ["specs"] = {263}, ["subText"] = STRING_PASSIVE}); -- Flametongue
table.insert(shamanSkills, {["id"] = 60103, ["level"] = 10, ["specs"] = {263}}); -- Lava Lash
table.insert(shamanSkills, {["id"] = 95862, ["level"] = 10, ["specs"] = {264}, ["subText"] = STRING_PASSIVE}); -- Meditation
table.insert(shamanSkills, {["id"] = 30814, ["level"] = 10, ["specs"] = {263}, ["subText"] = STRING_PASSIVE}); -- Mental Quickness
--table.insert(shamanSkills, {["id"] = 51522, ["level"] = 10, ["specs"] = {263}, ["subText"] = STRING_PASSIVE}); -- Primal Wisdom
table.insert(shamanSkills, {["id"] = 16213, ["level"] = 10, ["specs"] = {264}, ["subText"] = STRING_PASSIVE}); -- Restorative Waves
table.insert(shamanSkills, {["id"] = 61295, ["level"] = 10, ["specs"] = {264}}); -- Riptide
table.insert(shamanSkills, {["id"] = 62099, ["level"] = 10, ["specs"] = {262}, ["subText"] = STRING_PASSIVE}); -- Shamanism
table.insert(shamanSkills, {["id"] = 112858, ["level"] = 10, ["specs"] = {264}, ["subText"] = STRING_PASSIVE}); -- Spiritual Insight
table.insert(shamanSkills, {["id"] = 123099, ["level"] = 10, ["specs"] = {262}, ["subText"] = STRING_PASSIVE}); -- Spiritual Insight
table.insert(shamanSkills, {["id"] = 51490, ["level"] = 10, ["specs"] = {262}}); -- Thunderstorm
table.insert(shamanSkills, {["id"] = 8050, ["level"] = 12}); -- Flame Shock
table.insert(shamanSkills, {["id"] = 370, ["level"] = 12}); -- Purge
table.insert(shamanSkills, {["id"] = 2008, ["level"] = 14}); -- Ancestral Spirit
table.insert(shamanSkills, {["id"] = 2645, ["level"] = 15}); -- Ghost Wolf
table.insert(shamanSkills, {["id"] = 3599, ["level"] = 16}); -- Searing Totem
table.insert(shamanSkills, {["id"] = 57994, ["level"] = 16}); -- Wind Shear
table.insert(shamanSkills, {["id"] = 77130, ["level"] = 18, ["specs"] = {264}}); -- Purify Spirit
table.insert(shamanSkills, {["id"] = 51886, ["level"] = 18}); -- Cleanse Spirit
table.insert(shamanSkills, {["id"] = 16282, ["level"] = 20, ["specs"] = {263}, ["subText"] = STRING_PASSIVE}); -- Flurry
table.insert(shamanSkills, {["id"] = 88766, ["level"] = 20, ["specs"] = {262}, ["subText"] = STRING_PASSIVE}); -- Fulmination
table.insert(shamanSkills, {["id"] = 52127, ["level"] = 20, ["specs"] = {264}}); -- Water Shield
table.insert(shamanSkills, {["id"] = 8056, ["level"] = 22}); -- Frost Shock
table.insert(shamanSkills, {["id"] = 546, ["level"] = 24}); -- Water Walking
table.insert(shamanSkills, {["id"] = 974, ["level"] = 26, ["specs"] = {264}}); -- Earth Shield
table.insert(shamanSkills, {["id"] = 17364, ["level"] = 26, ["specs"] = {263}}); -- Stormstrike
table.insert(shamanSkills, {["id"] = 2484, ["level"] = 26}); -- Earthbind Totem
table.insert(shamanSkills, {["id"] = 421, ["level"] = 28}); -- Chain Lightning
table.insert(shamanSkills, {["id"] = 166221, ["level"] = 30, ["specs"] = {263}, ["subText"] = STRING_PASSIVE}); -- Enhanced Weapons
table.insert(shamanSkills, {["id"] = 33757, ["level"] = 30, ["specs"] = {263}, ["subText"] = STRING_PASSIVE}); -- Windfury
table.insert(shamanSkills, {["id"] = 5394, ["level"] = 30}); -- Healing Stream Totem
table.insert(shamanSkills, {["id"] = 36936, ["level"] = 30}); -- Totemic Recall
table.insert(shamanSkills, {["id"] = 20608, ["level"] = 32, ["subText"] = STRING_PASSIVE}); -- Reincarnation
table.insert(shamanSkills, {["id"] = 51505, ["level"] = 34, ["specs"] = {262, 264}}); -- Lava Burst
table.insert(shamanSkills, {["id"] = 556, ["level"] = 34}); -- Astral Recall
table.insert(shamanSkills, {["id"] = 8190, ["level"] = 36, ["specs"] = {263}}); -- Magma Totem
table.insert(shamanSkills, {["id"] = 6196, ["level"] = 36}); -- Far Sight
table.insert(shamanSkills, {["id"] = 8177, ["level"] = 38}); -- Grounding Totem
table.insert(shamanSkills, {["id"] = 16196, ["level"] = 40, ["specs"] = {264}, ["subText"] = STRING_PASSIVE}); -- Resurgence
table.insert(shamanSkills, {["id"] = 8737, ["level"] = 40, ["subText"] = STRING_PASSIVE}); -- Mail
table.insert(shamanSkills, {["id"] = 1064, ["level"] = 44, ["specs"] = {264}}); -- Chain Heal
table.insert(shamanSkills, {["id"] = 1535, ["level"] = 44, ["specs"] = {263}}); -- Fire Nova
table.insert(shamanSkills, {["id"] = 77756, ["level"] = 50, ["specs"] = {262}, ["subText"] = STRING_PASSIVE}); -- Lava Surge
table.insert(shamanSkills, {["id"] = 51530, ["level"] = 50, ["specs"] = {263}, ["subText"] = STRING_PASSIVE}); -- Maelstrom Weapon
table.insert(shamanSkills, {["id"] = 86099, ["level"] = 50, ["specs"] = {263}, ["subText"] = STRING_PASSIVE}); -- Mail Specialization
table.insert(shamanSkills, {["id"] = 86100, ["level"] = 50, ["specs"] = {264}, ["subText"] = STRING_PASSIVE}); -- Mail Specialization
table.insert(shamanSkills, {["id"] = 86108, ["level"] = 50, ["specs"] = {262}, ["subText"] = STRING_PASSIVE}); -- Mail Specialization
table.insert(shamanSkills, {["id"] = 51564, ["level"] = 50, ["specs"] = {264}, ["subText"] = STRING_PASSIVE}); -- Tidal Waves
table.insert(shamanSkills, {["id"] = 86529, ["level"] = 50, ["subText"] = STRING_PASSIVE}); -- Mail Specialization
table.insert(shamanSkills, {["id"] = 8143, ["level"] = 54}); -- Tremor Totem
table.insert(shamanSkills, {["id"] = 2062, ["level"] = 58}); -- Earth Elemental Totem
table.insert(shamanSkills, {["id"] = 61882, ["level"] = 60, ["specs"] = {262}}); -- Earthquake
table.insert(shamanSkills, {["id"] = 51533, ["level"] = 60, ["specs"] = {263}}); -- Feral Spirit
table.insert(shamanSkills, {["id"] = 77472, ["level"] = 60, ["specs"] = {264}}); -- Healing Wave
table.insert(shamanSkills, {["id"] = 58875, ["level"] = 60, ["specs"] = {263}}); -- Spirit Walk
table.insert(shamanSkills, {["id"] = 73920, ["level"] = 60}); -- Healing Rain
table.insert(shamanSkills, {["id"] = 108269, ["level"] = 63}); -- Capacitor Totem
table.insert(shamanSkills, {["id"] = 108280, ["level"] = 65, ["specs"] = {264}}); -- Healing Tide Totem
table.insert(shamanSkills, {["id"] = 30823, ["level"] = 65, ["specs"] = {262, 263}}); -- Shamanistic Rage
table.insert(shamanSkills, {["id"] = 2894, ["level"] = 66}); -- Fire Elemental Totem
table.insert(shamanSkills, {["id"] = 98008, ["level"] = 70, ["specs"] = {264}}); -- Spirit Link Totem
table.insert(shamanSkills, {["id"] = 2825, ["level"] = 70}); -- Bloodlust
--table.insert(shamanSkills, {["id"] = 32182, ["level"] = 70}); -- Heroism
table.insert(shamanSkills, {["id"] = 51514, ["level"] = 75}); -- Hex
table.insert(shamanSkills, {["id"] = 77226, ["level"] = 80, ["specs"] = {264}, ["subText"] = STRING_PASSIVE}); -- Mastery: Deep Healing
table.insert(shamanSkills, {["id"] = 77223, ["level"] = 80, ["specs"] = {263}, ["subText"] = STRING_PASSIVE}); -- Mastery: Enhanced Elements
table.insert(shamanSkills, {["id"] = 170374, ["level"] = 80, ["specs"] = {262}, ["subText"] = STRING_PASSIVE}); -- Mastery: Molten Earth
table.insert(shamanSkills, {["id"] = 116956, ["level"] = 80, ["subText"] = STRING_PASSIVE}); -- Grace of Air
table.insert(shamanSkills, {["id"] = 73680, ["level"] = 81, ["specs"] = {263}}); -- Unleash Elements
table.insert(shamanSkills, {["id"] = 165462, ["level"] = 81, ["specs"] = {262}}); -- Unleash Flame
table.insert(shamanSkills, {["id"] = 79206, ["level"] = 85, ["specs"] = {262, 264}}); -- Spiritwalker
table.insert(shamanSkills, {["id"] = 114050, ["level"] = 87, ["specs"] = {262}}); -- Ascendance
table.insert(shamanSkills, {["id"] = 114051, ["level"] = 87, ["specs"] = {263}}); -- Ascendance
table.insert(shamanSkills, {["id"] = 114052, ["level"] = 87, ["specs"] = {264}}); -- Ascendance
table.insert(shamanSkills, {["id"] = 165399, ["level"] = 90, ["specs"] = {262}, ["subText"] = STRING_PASSIVE}); -- Elemental Overload
table.insert(shamanSkills, {["id"] = 165368, ["level"] = 90, ["specs"] = {263}, ["subText"] = STRING_PASSIVE}); -- Lightning Strikes
table.insert(shamanSkills, {["id"] = 165391, ["level"] = 90, ["specs"] = {264}, ["subText"] = STRING_PASSIVE}); -- Purification

_addonData.SHAMAN = {};
_addonData.SHAMAN.Skills = shamanSkills;
_addonData.SHAMAN.Specs = shamanSpecs;

--
-- WARLOCK
--

local warlockSpecs = {};
table.insert(warlockSpecs, 265); -- Affliction
table.insert(warlockSpecs, 266); -- Demonology
table.insert(warlockSpecs, 267); -- Destruction

local warlockSkills = {};
table.insert(warlockSkills, {["id"] = 172, ["level"] = 3}); -- Corruption
table.insert(warlockSkills, {["id"] = 689, ["level"] = 7, ["specs"] = {265, 266}}); -- Drain Life
table.insert(warlockSkills, {["id"] = 697, ["level"] = 8}); -- Summon Voidwalker
table.insert(warlockSkills, {["id"] = 6201, ["level"] = 9}); -- Create Healthstone
table.insert(warlockSkills, {["id"] = 108647, ["level"] = 10, ["specs"] = {267}, ["subText"] = STRING_PASSIVE}); -- Burning Embers
table.insert(warlockSkills, {["id"] = 116858, ["level"] = 10, ["specs"] = {267}}); -- Chaos Bolt
table.insert(warlockSkills, {["id"] = 111546, ["level"] = 10, ["specs"] = {267}, ["subText"] = STRING_PASSIVE}); -- Chaotic Energy
table.insert(warlockSkills, {["id"] = 17962, ["level"] = 10, ["specs"] = {267}}); -- Conflagrate
table.insert(warlockSkills, {["id"] = 108869, ["level"] = 10, ["specs"] = {266}, ["subText"] = STRING_PASSIVE}); -- Decimation
table.insert(warlockSkills, {["id"] = 104315, ["level"] = 10, ["specs"] = {266}, ["subText"] = STRING_PASSIVE}); -- Demonic Fury
table.insert(warlockSkills, {["id"] = 124913, ["level"] = 10, ["specs"] = {266}, ["subText"] = STRING_PASSIVE}); -- Doom
table.insert(warlockSkills, {["id"] = 29722, ["level"] = 10, ["specs"] = {267}}); -- Incinerate
table.insert(warlockSkills, {["id"] = 103958, ["level"] = 10, ["specs"] = {266}}); -- Metamorphosis
table.insert(warlockSkills, {["id"] = 122351, ["level"] = 10, ["specs"] = {266}, ["subText"] = STRING_PASSIVE}); -- Molten Core
table.insert(warlockSkills, {["id"] = 108558, ["level"] = 10, ["specs"] = {265}, ["subText"] = STRING_PASSIVE}); -- Nightfall
table.insert(warlockSkills, {["id"] = 30108, ["level"] = 10, ["specs"] = {265}}); -- Unstable Affliction
table.insert(warlockSkills, {["id"] = 93375, ["level"] = 10, ["subText"] = STRING_PASSIVE}); -- Control Demon
table.insert(warlockSkills, {["id"] = 755, ["level"] = 11, ["specs"] = {265, 266}}); -- Health Funnel
table.insert(warlockSkills, {["id"] = 109151, ["level"] = 12, ["specs"] = {266}}); -- Demonic Leap
table.insert(warlockSkills, {["id"] = 348, ["level"] = 12, ["specs"] = {267}}); -- Immolate
table.insert(warlockSkills, {["id"] = 6353, ["level"] = 13, ["specs"] = {266}}); -- Soul Fire
table.insert(warlockSkills, {["id"] = 5782, ["level"] = 14}); -- Fear
table.insert(warlockSkills, {["id"] = 114635, ["level"] = 15, ["specs"] = {267}}); -- Ember Tap
table.insert(warlockSkills, {["id"] = 1454, ["level"] = 16, ["specs"] = {265, 266}}); -- Life Tap
table.insert(warlockSkills, {["id"] = 20707, ["level"] = 18}); -- Soulstone
table.insert(warlockSkills, {["id"] = 105174, ["level"] = 19, ["specs"] = {266}}); -- Hand of Gul
table.insert(warlockSkills, {["id"] = 117198, ["level"] = 19, ["specs"] = {265}, ["subText"] = STRING_PASSIVE}); -- Soul Shards
table.insert(warlockSkills, {["id"] = 74434, ["level"] = 19, ["specs"] = {265}}); -- Soulburn
table.insert(warlockSkills, {["id"] = 5784, ["level"] = 20}); -- Felsteed
table.insert(warlockSkills, {["id"] = 712, ["level"] = 20}); -- Summon Succubus
table.insert(warlockSkills, {["id"] = 5740, ["level"] = 21, ["specs"] = {267}}); -- Rain of Fire
table.insert(warlockSkills, {["id"] = 27243, ["level"] = 21, ["specs"] = {265}}); -- Seed of Corruption
table.insert(warlockSkills, {["id"] = 1949, ["level"] = 22, ["specs"] = {266}}); -- Hellfire
table.insert(warlockSkills, {["id"] = 126, ["level"] = 22}); -- Eye of Kilrogg
table.insert(warlockSkills, {["id"] = 103103, ["level"] = 24, ["specs"] = {265}}); -- Drain Soul
table.insert(warlockSkills, {["id"] = 5697, ["level"] = 24}); -- Unending Breath
table.insert(warlockSkills, {["id"] = 101976, ["level"] = 27, ["subText"] = STRING_PASSIVE}); -- Soul Harvest
table.insert(warlockSkills, {["id"] = 691, ["level"] = 29}); -- Summon Felhunter
table.insert(warlockSkills, {["id"] = 1098, ["level"] = 31}); -- Enslave Demon
table.insert(warlockSkills, {["id"] = 114592, ["level"] = 32, ["specs"] = {266}, ["subText"] = STRING_PASSIVE}); -- Wild Imps
table.insert(warlockSkills, {["id"] = 710, ["level"] = 32}); -- Banish
table.insert(warlockSkills, {["id"] = 980, ["level"] = 36, ["specs"] = {265}}); -- Agony
table.insert(warlockSkills, {["id"] = 80240, ["level"] = 36, ["specs"] = {267}}); -- Havoc
table.insert(warlockSkills, {["id"] = 23161, ["level"] = 40}); -- Dreadsteed
table.insert(warlockSkills, {["id"] = 30146, ["level"] = 42, ["specs"] = {266}}); -- Summon Felguard
table.insert(warlockSkills, {["id"] = 698, ["level"] = 42}); -- Ritual of Summoning
table.insert(warlockSkills, {["id"] = 17877, ["level"] = 47, ["specs"] = {267}}); -- Shadowburn
table.insert(warlockSkills, {["id"] = 1122, ["level"] = 49}); -- Summon Infernal
table.insert(warlockSkills, {["id"] = 86091, ["level"] = 50, ["subText"] = STRING_PASSIVE}); -- Nethermancy	
table.insert(warlockSkills, {["id"] = 109784, ["level"] = 54, ["specs"] = {267}, ["subText"] = STRING_PASSIVE}); -- Aftermath
table.insert(warlockSkills, {["id"] = 108683, ["level"] = 54, ["specs"] = {267}}); -- Fire and Brimstone
table.insert(warlockSkills, {["id"] = 119898, ["level"] = 56}); -- Command Demon
table.insert(warlockSkills, {["id"] = 18540, ["level"] = 58}); -- Summon Doomguard
table.insert(warlockSkills, {["id"] = 48181, ["level"] = 60, ["specs"] = {265}}); -- Haunt
table.insert(warlockSkills, {["id"] = 104773, ["level"] = 64}); -- Unending Resolve
table.insert(warlockSkills, {["id"] = 29858, ["level"] = 66}); -- Soulshatter
table.insert(warlockSkills, {["id"] = 29893, ["level"] = 68}); -- Create Soulwell
table.insert(warlockSkills, {["id"] = 117896, ["level"] = 69, ["specs"] = {267}, ["subText"] = STRING_PASSIVE}); -- Backdraft
table.insert(warlockSkills, {["id"] = 48018, ["level"] = 76}); -- Demonic Circle: Summon
table.insert(warlockSkills, {["id"] = 48020, ["level"] = 76}); -- Demonic Circle: Teleport
table.insert(warlockSkills, {["id"] = 120451, ["level"] = 79, ["specs"] = {267}}); -- Flames of Xoroth
table.insert(warlockSkills, {["id"] = 86121, ["level"] = 79, ["specs"] = {265}}); -- Soul Swap
table.insert(warlockSkills, {["id"] = 77220, ["level"] = 80, ["specs"] = {267}, ["subText"] = STRING_PASSIVE}); -- Mastery: Emberstorm
table.insert(warlockSkills, {["id"] = 77219, ["level"] = 80, ["specs"] = {266}, ["subText"] = STRING_PASSIVE}); -- Mastery: Master Demonologist
table.insert(warlockSkills, {["id"] = 77215, ["level"] = 80, ["specs"] = {265}, ["subText"] = STRING_PASSIVE}); -- Mastery: Potent Afflictions
table.insert(warlockSkills, {["id"] = 166928, ["level"] = 80, ["subText"] = STRING_PASSIVE}); -- Blood Pact
table.insert(warlockSkills, {["id"] = 109773, ["level"] = 82}); -- Dark Intent
table.insert(warlockSkills, {["id"] = 113858, ["level"] = 84, ["specs"] = {267}}); -- Dark Soul: Instability
table.insert(warlockSkills, {["id"] = 113861, ["level"] = 84, ["specs"] = {266}}); -- Dark Soul: Knowledge
table.insert(warlockSkills, {["id"] = 113860, ["level"] = 84, ["specs"] = {265}}); -- Dark Soul: Misery
table.insert(warlockSkills, {["id"] = 111771, ["level"] = 87}); -- Demonic Gateway
table.insert(warlockSkills, {["id"] = 165392, ["level"] = 90, ["specs"] = {266}, ["subText"] = STRING_PASSIVE}); -- Demonic Tactics
table.insert(warlockSkills, {["id"] = 165363, ["level"] = 90, ["specs"] = {267}, ["subText"] = STRING_PASSIVE}); -- Devastation
table.insert(warlockSkills, {["id"] = 165367, ["level"] = 90, ["specs"] = {265}, ["subText"] = STRING_PASSIVE}); -- Eradication

_addonData.WARLOCK = {};
_addonData.WARLOCK.Skills = warlockSkills;
_addonData.WARLOCK.Specs = warlockSpecs;

--
-- MONK
--

local monkSpecs = {};
table.insert(monkSpecs, 268); -- Brewmaster
table.insert(monkSpecs, 269); -- Windwalker
table.insert(monkSpecs, 270); -- Mistweaver

local monkSkills = {};
table.insert(monkSkills, {["id"] = 100787, ["level"] = 3}); -- Tiger Palm
table.insert(monkSkills, {["id"] = 109132, ["level"] = 5}); -- Roll
table.insert(monkSkills, {["id"] = 100784, ["level"] = 7}); -- Blackout Kick
table.insert(monkSkills, {["id"] = 161608, ["level"] = 10, ["specs"] = {268}, ["subText"] = STRING_PASSIVE}); -- Bladed Armor
table.insert(monkSkills, {["id"] = 117967, ["level"] = 10, ["specs"] = {268}, ["subText"] = STRING_PASSIVE}); -- Brewmaster Training
table.insert(monkSkills, {["id"] = 137384, ["level"] = 10, ["specs"] = {269}, ["subText"] = STRING_PASSIVE}); -- Combo Breaker
table.insert(monkSkills, {["id"] = 139598, ["level"] = 10, ["specs"] = {270}, ["subText"] = STRING_PASSIVE}); -- Crane Style Techniques
table.insert(monkSkills, {["id"] = 115180, ["level"] = 10, ["specs"] = {268}}); -- Dizzying Haze
table.insert(monkSkills, {["id"] = 124146, ["level"] = 10, ["specs"] = {268, 269}, ["subText"] = STRING_PASSIVE}); -- Dual Wield
table.insert(monkSkills, {["id"] = 113656, ["level"] = 10, ["specs"] = {269}}); -- Fists of Fury
table.insert(monkSkills, {["id"] = 121278, ["level"] = 10, ["specs"] = {270}, ["subText"] = STRING_PASSIVE}); -- Mana Meditation
table.insert(monkSkills, {["id"] = 158298, ["level"] = 10, ["specs"] = {268}, ["subText"] = STRING_PASSIVE}); -- Resolve
table.insert(monkSkills, {["id"] = 115175, ["level"] = 10, ["specs"] = {270}}); -- Soothing Mist
table.insert(monkSkills, {["id"] = 154436, ["level"] = 10, ["specs"] = {270}}); -- Stance of the Spirited Crane
table.insert(monkSkills, {["id"] = 115069, ["level"] = 10, ["specs"] = {268}}); -- Stance of the Sturdy Ox
table.insert(monkSkills, {["id"] = 115070, ["level"] = 10, ["specs"] = {270}}); -- Stance of the Wise Serpent
table.insert(monkSkills, {["id"] = 116645, ["level"] = 10, ["specs"] = {270}, ["subText"] = STRING_PASSIVE}); -- Teachings of the Monastery
table.insert(monkSkills, {["id"] = 120272, ["level"] = 10, ["subText"] = STRING_PASSIVE}); -- Tiger Strikes
table.insert(monkSkills, {["id"] = 121253, ["level"] = 11, ["specs"] = {268}}); -- Keg Smash
table.insert(monkSkills, {["id"] = 116694, ["level"] = 12}); -- Surging Mist
table.insert(monkSkills, {["id"] = 115546, ["level"] = 14}); -- Provoke
table.insert(monkSkills, {["id"] = 124682, ["level"] = 16, ["specs"] = {270}}); -- Enveloping Mist
table.insert(monkSkills, {["id"] = 115181, ["level"] = 18, ["specs"] = {268}}); -- Breath of Fire
table.insert(monkSkills, {["id"] = 101545, ["level"] = 18, ["specs"] = {269}}); -- Flying Serpent Kick
table.insert(monkSkills, {["id"] = 115178, ["level"] = 18}); -- Resuscitate
table.insert(monkSkills, {["id"] = 128595, ["level"] = 20, ["specs"] = {269}, ["subText"] = STRING_PASSIVE}); -- Combat Conditioning
table.insert(monkSkills, {["id"] = 115451, ["level"] = 20, ["specs"] = {270}, ["subText"] = STRING_PASSIVE}); -- Internal Medicine
table.insert(monkSkills, {["id"] = 115450, ["level"] = 20}); -- Detox
table.insert(monkSkills, {["id"] = 126892, ["level"] = 20}); -- Zen Pilgrimage
table.insert(monkSkills, {["id"] = 115921, ["level"] = 22, ["specs"] = {270}}); -- Legacy of the Emperor
table.insert(monkSkills, {["id"] = 122470, ["level"] = 22, ["specs"] = {269}}); -- Touch of Karma
table.insert(monkSkills, {["id"] = 115080, ["level"] = 22}); -- Touch of Death
table.insert(monkSkills, {["id"] = 115151, ["level"] = 24, ["specs"] = {270}}); -- Renewing Mist
table.insert(monkSkills, {["id"] = 115203, ["level"] = 24}); -- Fortifying Brew
table.insert(monkSkills, {["id"] = 116092, ["level"] = 26, ["specs"] = {269}, ["subText"] = STRING_PASSIVE}); -- Afterlife
table.insert(monkSkills, {["id"] = 115295, ["level"] = 26, ["specs"] = {268}}); -- Guard
table.insert(monkSkills, {["id"] = 115072, ["level"] = 26}); -- Expel Harm
table.insert(monkSkills, {["id"] = 116095, ["level"] = 28, ["specs"] = {269}}); -- Disable
table.insert(monkSkills, {["id"] = 137562, ["level"] = 30}); -- Nimble Brew
table.insert(monkSkills, {["id"] = 126895, ["level"] = 30}); -- Zen Pilgrimage: Return
table.insert(monkSkills, {["id"] = 116705, ["level"] = 32}); -- Spear Hand Strike
table.insert(monkSkills, {["id"] = 128938, ["level"] = 36, ["specs"] = {268}, ["subText"] = STRING_PASSIVE}); -- Brewing: Elusive Brew
table.insert(monkSkills, {["id"] = 115308, ["level"] = 36, ["specs"] = {268}}); -- Elusive Brew
table.insert(monkSkills, {["id"] = 115288, ["level"] = 36, ["specs"] = {269}}); -- Energizing Brew
table.insert(monkSkills, {["id"] = 115078, ["level"] = 44}); -- Paralysis
table.insert(monkSkills, {["id"] = 126060, ["level"] = 45, ["specs"] = {268}, ["subText"] = STRING_PASSIVE}); -- Desperate Measures
table.insert(monkSkills, {["id"] = 154555, ["level"] = 45, ["specs"] = {270}, ["subText"] = STRING_PASSIVE}); -- Focus and Harmony
table.insert(monkSkills, {["id"] = 101546, ["level"] = 46}); -- Spinning Crane Kick
table.insert(monkSkills, {["id"] = 120224, ["level"] = 50, ["specs"] = {270}, ["subText"] = STRING_PASSIVE}); -- Leather Specialization
table.insert(monkSkills, {["id"] = 120225, ["level"] = 50, ["specs"] = {268}, ["subText"] = STRING_PASSIVE}); -- Leather Specialization
table.insert(monkSkills, {["id"] = 120227, ["level"] = 50, ["specs"] = {269}, ["subText"] = STRING_PASSIVE}); -- Leather Specialization
table.insert(monkSkills, {["id"] = 116849, ["level"] = 50, ["specs"] = {270}}); -- Life Cocoon
table.insert(monkSkills, {["id"] = 117952, ["level"] = 54}); -- Crackling Jade Lightning
table.insert(monkSkills, {["id"] = 123766, ["level"] = 56, ["specs"] = {270}, ["subText"] = STRING_PASSIVE}); -- Brewing: Mana Tea
table.insert(monkSkills, {["id"] = 123980, ["level"] = 56, ["specs"] = {269}, ["subText"] = STRING_PASSIVE}); -- Brewing: Tigereye Brew
table.insert(monkSkills, {["id"] = 124502, ["level"] = 56, ["specs"] = {268}, ["subText"] = STRING_PASSIVE}); -- Gift of the Ox
table.insert(monkSkills, {["id"] = 115294, ["level"] = 56, ["specs"] = {270}}); -- Mana Tea
table.insert(monkSkills, {["id"] = 107428, ["level"] = 56, ["specs"] = {269, 270}}); -- Rising Sun Kick
table.insert(monkSkills, {["id"] = 116740, ["level"] = 56, ["specs"] = {269}}); -- Tigereye Brew
table.insert(monkSkills, {["id"] = 116670, ["level"] = 62, ["specs"] = {270}}); -- Uplift
table.insert(monkSkills, {["id"] = 115460, ["level"] = 64, ["specs"] = {270}}); -- Detonate Chi
table.insert(monkSkills, {["id"] = 116680, ["level"] = 66, ["specs"] = {270}}); -- Thunder Focus Tea
table.insert(monkSkills, {["id"] = 115315, ["level"] = 70, ["specs"] = {268}}); -- Summon Black Ox Statue
table.insert(monkSkills, {["id"] = 115313, ["level"] = 70, ["specs"] = {270}}); -- Summon Jade Serpent Statue
table.insert(monkSkills, {["id"] = 119582, ["level"] = 75, ["specs"] = {268}}); -- Purifying Brew
table.insert(monkSkills, {["id"] = 137639, ["level"] = 75, ["specs"] = {269}}); -- Storm
table.insert(monkSkills, {["id"] = 115310, ["level"] = 78, ["specs"] = {270}}); -- Revival
table.insert(monkSkills, {["id"] = 115636, ["level"] = 80, ["specs"] = {269}, ["subText"] = STRING_PASSIVE}); -- Mastery: Bottled Fury
table.insert(monkSkills, {["id"] = 117906, ["level"] = 80, ["specs"] = {268}, ["subText"] = STRING_PASSIVE}); -- Mastery: Elusive Brawler
table.insert(monkSkills, {["id"] = 117907, ["level"] = 80, ["specs"] = {270}, ["subText"] = STRING_PASSIVE}); -- Mastery: Gift of the Serpent
table.insert(monkSkills, {["id"] = 166916, ["level"] = 80, ["specs"] = {269}, ["subText"] = STRING_PASSIVE}); -- Windflurry
table.insert(monkSkills, {["id"] = 116781, ["level"] = 81, ["specs"] = {268, 269}}); -- Legacy of the White Tiger
table.insert(monkSkills, {["id"] = 115176, ["level"] = 82, ["specs"] = {268, 269}}); -- Zen Meditation
table.insert(monkSkills, {["id"] = 101643, ["level"] = 87}); -- Transcendence
table.insert(monkSkills, {["id"] = 119996, ["level"] = 87}); -- Transcendence: Transfer
table.insert(monkSkills, {["id"] = 165398, ["level"] = 90, ["specs"] = {269}, ["subText"] = STRING_PASSIVE}); -- Battle Trance
table.insert(monkSkills, {["id"] = 165379, ["level"] = 90, ["specs"] = {268}, ["subText"] = STRING_PASSIVE}); -- Ferment
table.insert(monkSkills, {["id"] = 165397, ["level"] = 90, ["specs"] = {270}, ["subText"] = STRING_PASSIVE}); -- Jade Mists

_addonData.MONK = {};
_addonData.MONK.Skills = monkSkills;
_addonData.MONK.Specs = monkSpecs;

