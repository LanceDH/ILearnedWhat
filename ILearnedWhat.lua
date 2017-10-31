
----------------------------------------
-- Variables
----------------------------------------

local _addonName, _addonData = ...;
local _L = _addonData.L;
local _version = GetAddOnMetadata(_addonName, "version");

-- Globals to use in xml
ILW_BANNER_TEXT = _L["BANNER_UNLOCKED"];
ILW_TOOLTIP_CLEARBUTTON = _L["TOOLTIP_CLEARBUTTON"];
ILW_NONEW_INFO = _L["NONEW_INFO"];
ILW_NONEW_TITLE = _L["NONEW_TITLE "];

local ILWAddon = LibStub("AceAddon-3.0"):NewAddon(_addonName);
local ILWBroker = LibStub("LibDataBroker-1.1"):NewDataObject(_addonName, {
	type = "launcher",
	text = "I Learned What?",
	icon = "Interface/ICONS/Spell_Holy_SurgeOfLight",
	OnClick = function(self, button, down)
		if (InCombatLockdown()) then
			return;
		end
		if (ILW_UnlockContainer:IsShown()) then
			HideUIPanel(ILW_UnlockContainer);
		else
			ShowUIPanel(ILW_UnlockContainer);
		end
	end,
	OnTooltipShow = function(tt)
		tt:AddLine("I Learned What?", 1, 1, 1);
		if (InCombatLockdown()) then
			tt:AddLine(_L["TOOLTIP_COMBAT"]);
		else
			tt:AddLine(_L["MINIMAP_TOOLTIP"]);
		end
	end	
})
local _icon = LibStub("LibDBIcon-1.0")

local _defaults = {
	["global"] = {	
		showPopup = true,
		spellbook = true,
		minimap = {
			hide = false,
		},
		["trackers"] = {
			["Spells"] = true,
			["Talents"] = true,
			["Dungeons"] = true,
			["Riding"] = true,
			["UI"] = true,
			["Battlegrounds"] = true,
		}
	}
	,["char"] = {
		["unlockedList"] = {},
		["specLastLevel"] = {},
	}
}

local _trackers = {
		["Spells"] = true,
		["Talents"] = true,
		["Dungeons"] = true,
		["Riding"] = true,
		["Battlegrounds"] = true,
		["UI"] = true
	}


local _classSkills = {};
local _ridingSkills = {};
local _specLastLevel = {};
local _InstanceLevels = {};
local _PvPLevels = {};
local _classSpecs = {};
local _playerLeveled = false;
local _openedDuringCombat = false;



_addonData.help = {}
local _help = _addonData.help;

local UNLOCKTYPE_SPELL = 1;
local UNLOCKTYPE_TALENT = 2;
local UNLOCKTYPE_DUNGEON = 3;
local UNLOCKTYPE_RAID = 4;
local UNLOCKTYPE_PVP = 5;
local UNLOCKTYPE_RIDING = 6;
local UNLOCKTYPE_UI = 7;
local UNLOCKTYPE_TUTORIAL = 8;
local UNLOCKS_PER_PAGE = 6;
local ICON_TALENT = "Interface/ICONS/Ability_Marksmanship";
local ICON_UI = "Interface/ICONS/INV_Scroll_02";

local UNLOCK_SUBTYPE_TUTORIAL = 0;
local UNLOCK_SUBTYPE_UPCOMMING = 1;



local _helpPlate = {
	FramePos = { x = 5,	y = -25 },
	FrameSize = { width = 440, height = 495	},
	[1] = { ButtonPos = { x = 200,	y = -95}, HighLightBox = { x = 20, y = -85, width = 405, height = 420 }, ToolTipDir = "DOWN", ToolTipText = _L["HELP_INFO"] }
}
local _typeIcons = {
		[UNLOCKTYPE_SPELL] = {["left"] = 0.75, ["right"] = 0.8125, ["top"] = 0.4, ["bottom"] = 0.4629}
		,[UNLOCKTYPE_UI] = {["left"] = 0.8828, ["right"] = 0.945, ["top"] = 0.9277, ["bottom"] = 0.99}
		,[UNLOCKTYPE_DUNGEON] = {["left"] = 0.6875, ["right"] = 0.75, ["top"] = 0.2637, ["bottom"] = 0.326}
		,[UNLOCKTYPE_RAID] = {["left"] = 0.75, ["right"] = 0.8125, ["top"] = 0.2637, ["bottom"] = 0.326}
		,[UNLOCKTYPE_TALENT] = {["left"] = 0.1855, ["right"] = 0.248, ["top"] = 0.8066, ["bottom"] = 0.8691}
		--,[UNLOCKTYPE_PVP] = {["left"] = 0.75, ["right"] = 0.875, ["top"] = 0.875, ["bottom"] = 1}
		,[UNLOCKTYPE_PVP] = {["left"] = 0.1855, ["right"] = 0.248, ["top"] = 0.7441, ["bottom"] = 0.8066}
		,[UNLOCKTYPE_RIDING] = {["left"] = 0.6875, ["right"] = 0.75, ["top"] = 0.2012, ["bottom"] = 0.2637}
	};

function ILW_ShowHelpUnlocks(show)
	local unlocklist = ILWAddon.db.char.unlockedList;
	
	-- when showing help, if there's no unlocks, show dummy unlocks
	if (show and #unlocklist == 0) then
		table.insert(unlocklist, {["type"] = UNLOCKTYPE_SPELL, ["level"] = 3, ["icon"] = "Interface/ICONS/spell_fire_fireball02", ["name"] = _L["EXAMPLE_ABILITY"] , ["subText"] = COMBATLOG_HIGHLIGHT_ABILITY, ["subType"] = UNLOCK_SUBTYPE_TUTORIAL});
		table.insert(unlocklist, {["type"] = UNLOCKTYPE_SPELL, ["level"] = 5, ["icon"] = "Interface/ICONS/spell_frost_frostbolt02", ["name"] = _L["EXAMPLE_ABILITY"] , ["subText"] = COMBATLOG_HIGHLIGHT_ABILITY, ["subType"] = UNLOCK_SUBTYPE_TUTORIAL});
		table.insert(unlocklist, {["type"] = UNLOCKTYPE_DUNGEON, ["level"] = 5, ["icon"] = "Interface/LFGFRAME/LFGICON-DIREMAUL", ["name"] = _L["EXAMPLE_DUNGEON"] , ["subText"] = CALENDAR_TYPE_DUNGEON, ["subType"] = UNLOCK_SUBTYPE_TUTORIAL});
		table.insert(unlocklist, {["type"] = UNLOCKTYPE_SPELL, ["level"] = 7, ["icon"] = "Interface/ICONS/spell_nature_wispsplode", ["name"] = _L["EXAMPLE_ABILITY"] , ["subText"] = COMBATLOG_HIGHLIGHT_ABILITY, ["subType"] = UNLOCK_SUBTYPE_TUTORIAL});
		table.insert(unlocklist, {["type"] = UNLOCKTYPE_SPELL, ["level"] = 7, ["icon"] = "Interface/ICONS/ability_mage_wintersgrasp", ["name"] = _L["EXAMPLE_PASSIVE"] , ["subText"] = SPELL_PASSIVE , ["subType"] = UNLOCK_SUBTYPE_TUTORIAL});
	end
	
	-- when hiding help, remove dummy unlocks
	if (not show and unlocklist) then
		for i=#unlocklist, 1, -1 do
			if (unlocklist[i]["subType"] == UNLOCK_SUBTYPE_TUTORIAL) then
				table.remove(unlocklist, i);
			end
		end
	end
	
	ILW_UnlockContainer:UpdateUnlockDisplay();
end

function ILW_TutorialButton_OnClick()
	if ILW_HelpFrame:IsShown() then
		_help:HideTutorial();
		ILW_ShowHelpUnlocks(false);
	else
		_help:ShowTutorial();
		ILW_ShowHelpUnlocks(true);
	end
end


local function GetPlayerSpec()
	if (GetSpecialization() ~= nil) then
		return GetSpecializationInfo(GetSpecialization());
	end
	
	return nil;
end


ILW_DATA_MIXIN = {};

function ILW_DATA_MIXIN:Initialize()
	self.unlockedList = ILWAddon.db.char.unlockedList;
	self.upcomming = {};
	self.upcommingLevel = 0;
	self.filteredList = {};
	
	self.quickFilters = {
			[UNLOCKTYPE_DUNGEON] = function() return ILWAddon.db.global.trackers["Dungeons"] end
			,[UNLOCKTYPE_RAID] = function() return ILWAddon.db.global.trackers["Dungeons"] end
			,[UNLOCKTYPE_PVP] = function() return ILWAddon.db.global.trackers["Battlegrounds"] end
			,[UNLOCKTYPE_RIDING] = function() return ILWAddon.db.global.trackers["Riding"] end
			,[UNLOCKTYPE_SPELL] = function() return ILWAddon.db.global.trackers["Spells"] end
			,[UNLOCKTYPE_TALENT] = function() return ILWAddon.db.global.trackers["Talents"] end
			,[UNLOCKTYPE_UI] = function() return ILWAddon.db.global.trackers["UI"] end
		}
end

function ILW_DATA_MIXIN:UpdateFilteredList()
	wipe(self.filteredList);
	for k, unlock in ipairs(self.unlockedList) do
		if (self.quickFilters[unlock.type]() or unlock.subType == UNLOCK_SUBTYPE_UPCOMMING) then
			table.insert(self.filteredList, unlock);
		end
	end
end

function ILW_DATA_MIXIN:AddUnlocksOfLevel(level, list)
		
	local trackOptions = ILWAddon.db.global.trackers
	local spec = GetPlayerSpec();
	local addedNew = false;
	local unlocks;
	list = list or self.unlockedList;
	
	if (spec ~= nil) then
		ILWAddon.db.char.specLastLevel[spec] = level;
	end
	
	-- Check for skills
	--if trackOptions.Spells then
		
		unlocks = _classSkills[level]
		if (unlocks) then
			for k, unlock in ipairs(unlocks) do
				-- always show if not spec specific
				if unlock.specs == nil then
					self:AddUnlock(list, UNLOCKTYPE_SPELL, unlock, level, nil)
					addedNew = true;
				-- Otherwise, if you have a spec, check if it's the same as yours
				elseif spec ~= nil then
					for specKey, cSpec in ipairs(unlock.specs) do
						if cSpec == GetPlayerSpec() then
							self:AddUnlock(list, UNLOCKTYPE_SPELL, unlock, level, spec)
							addedNew = true;
						end
					end
				end
			end
		end
	--end
	
	-- Check for talents
	--if trackOptions.Talents then
		if (_talentLevels[level]) then
			self:AddUnlock(list, UNLOCKTYPE_TALENT, nil, level);
			addedNew = true;
		end
	--end

	-- Check for riding skills
	--if trackOptions.Riding then
		unlocks = _ridingSkills[level]
		if (unlocks) then
			for k, unlock in ipairs(unlocks) do
				self:AddUnlock(list, UNLOCKTYPE_RIDING, unlock, level)
				addedNew = true;
			end
		end
	--end
	
	-- Check for UI
	--if trackOptions.UI then
		unlocks = _UIUnlocks[level]
		if (unlocks) then
			for k, unlock in ipairs(unlocks) do
				self:AddUnlock(list, UNLOCKTYPE_UI, unlock, level, unlock.func);
				addedNew = true;
			end
		end
	--end
	
	-- Check for dungeons
	--if trackOptions.Dungeons then
		unlocks = _InstanceLevels[level]
		if (unlocks) then
			for k, unlock in ipairs(unlocks) do
				self:AddUnlock(list, (unlock.isRaid and UNLOCKTYPE_RAID or UNLOCKTYPE_DUNGEON), unlock, level);
				addedNew = true;
			end
		end
	--end
	
	-- Check for PvP
	--if trackOptions.Battlegrounds then
		unlocks = _PvPLevels[level]
		if (unlocks) then
			for k, unlock in ipairs(unlocks) do
				self:AddUnlock(list, UNLOCKTYPE_PVP, unlock, level);
				addedNew = true;
			end
		end
	--end
	
	return addedNew;
end

function ILW_DATA_MIXIN:LoadUpcommingUnlocks()
	local level = UnitLevel("player");
	local maxLevel = 110;
	if (level == self.upcommingLevel) then return; end
	
	wipe(self.upcomming);
	self.upcommingLevel = level;
	
	while (level < maxLevel and #self.upcomming == 0) do
		level = level + 1;
		self:AddUnlocksOfLevel(level, self.upcomming)
	end
	
	if #self.upcomming > 0 then
		for k, unlock in ipairs(self.upcomming) do
			unlock.subType = UNLOCK_SUBTYPE_UPCOMMING;
			table.insert(self.unlockedList, unlock);
		end
	end
	
	self:UpdateFilteredList();
	
	return #self.upcomming, level;
end

function ILW_DATA_MIXIN:AddUnlock(list, typeID, unlock, level, extra)
	local id, icon, name, spec, subText, func;
	if unlock then
		id = unlock.id;
		icon = unlock.icon;
		name = unlock.name;
		--spec = extra;
		subText = unlock.subText;
	end
	if (typeID == UNLOCKTYPE_SPELL or typeID == UNLOCKTYPE_RIDING) then
		local spellName, rank, spellIcon, castingTime, minRange, maxRange, spellID = GetSpellInfo(unlock.id);
		local isRank = rank:match("%d");
		local isPassive = IsPassiveSpell(unlock.id);
		subText = ""
		
		if typeID == UNLOCKTYPE_SPELL then
			if (isRank) then
				subText = rank .. ", ";
			end
			if (isPassive) then
				subText = subText .. SPELL_PASSIVE;
			end
			if subText == "" then
				subText = COMBATLOG_HIGHLIGHT_ABILITY;
			end
			if (unlock.subText) then
				subText = subText .. (subText == "" and "" or ", ") .. unlock.subText;
			end
		elseif typeID == UNLOCKTYPE_RIDING then
			subText = _L["REQUIRES TRAINING"];
		end
		name = spellName;
		icon = spellIcon;
		spec = extra;
		
	elseif (typeID == UNLOCKTYPE_TALENT) then
		icon = ICON_TALENT;
		name = _L["TALENT_POINT"];
		subText = TALENT;
	
	elseif (typeID == UNLOCKTYPE_UI) then
		icon = ICON_UI;
		func = extra
	end
	
	table.insert(list, {["type"] = typeID, ["level"] = level, ["id"] = id, ["icon"] = icon, ["name"] = name ,["spec"] = spec, ["func"] = func, ["subText"] = subText});
	ILW_UnlockContainer:UpdateUnlockDisplay();
end

function ILW_DATA_MIXIN:CheckSpecMissedUnlocks(level, spec)

	if ILWAddon.db.global.trackers["Spells"] then
		local unlocks = _classSkills[level]
		if (unlocks) then
			for k, unlock in ipairs(unlocks) do
				if (unlock.specs) then
					local isForSpec = false;
					for specKey, cSpec in ipairs(unlock.specs) do
						if cSpec == GetPlayerSpec() then
							isForSpec = true;
							break;
						end
					end
					if (isForSpec) then
						self:AddUnlock(self.unlockedList, UNLOCKTYPE_SPELL, unlock, level, spec)
					end
				end
			end
		end
	end
	
end

function ILW_DATA_MIXIN:ClearUpcommingFromList()
	for i = #self.unlockedList, 1, -1 do
		if (self.unlockedList[i].subType == UNLOCK_SUBTYPE_UPCOMMING) then
			table.remove(self.unlockedList, i);
		end
	end
end






ILW_UNLOCK_MIXIN = {};

-- When the player clicks on the icon of an unlock
function ILW_UNLOCK_MIXIN:OnClick(button)
	-- prevent 'checked' visualf
	self:SetChecked(false);

	if (self.data.subType == UNLOCK_SUBTYPE_UPCOMMING) then
		return;
	end
	
	-- find the clicked unlock and remove it from the list
	local nr = string.match(self:GetName(), "(%d+)");
	nr = nr + ((ILW_UnlockContainer.Navigation.CurrentPage - 1) * UNLOCKS_PER_PAGE);
	table.remove(ILWAddon.db.char.unlockedList, nr);
	
	-- Don't have to open anything if it's right mouse
	if (button == "RightButton") then
		ILW_UnlockContainer:UpdateUnlockDisplay();
		return;
	-- Open spellbook if spell
	elseif (self.unlockType == UNLOCKTYPE_SPELL) then
		PickupSpell(self.unlockId);
	-- Open talents
	elseif (self.unlockType == UNLOCKTYPE_TALENT) then
		if (PlayerTalentFrame == nil) then
			LoadAddOn("Blizzard_TalentUI");
		end
		ShowUIPanel(PlayerTalentFrame);
	-- Open encounter journal if instance
	elseif (self.unlockType == UNLOCKTYPE_DUNGEON or self.unlockType == UNLOCKTYPE_RAID) then
		if (EncounterJournal == nil) then
			LoadAddOn("Blizzard_EncounterJournal");
		end
		ShowUIPanel(EncounterJournal);
		if (self.unlockId ~= nil) then
			
			-- id > 0 = specific instance so open journal to that instance
			-- otherwise see _aVar and open to instance list
			if (self.unlockId > 0) then
				-- actual instance so open journal to specific instance
				EncounterJournal_DisplayInstance(self.unlockId);
			elseif (self.unlockId == _aVar.CLASSIC_RAID) then
				EncounterJournal_TierDropDown_Select(_, 1)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.TBC_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 2)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.TBC_RAID) then
				EncounterJournal_TierDropDown_Select(_, 2)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.WOTLK_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 3)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.WOTLK_RAID) then
				EncounterJournal_TierDropDown_Select(_, 3)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.CATA_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 4)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.CATA_RAID) then
				EncounterJournal_TierDropDown_Select(_, 4)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.MOP_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 5)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.MOP_RAID) then
				EncounterJournal_TierDropDown_Select(_, 5)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.WOD_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 6)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.WOD_RAID) then
				EncounterJournal_TierDropDown_Select(_, 6)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.LEGION_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 7)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.LEGION_RAID) then
				EncounterJournal_TierDropDown_Select(_, 7)
				EJ_ContentTab_Select(3);
			end
		end
	elseif (self.unlockType == UNLOCKTYPE_PVP) then
		ShowUIPanel(PVEFrame);
		PVEFrame_ShowFrame("PVPUIFrame", "HonorFrame");
		-- if (GroupFinderFrame == nil or not GroupFinderFrame:IsShown()) then
			-- PVEFrame_ToggleFrame();
		-- end
		-- 
	elseif (self.unlockType == UNLOCKTYPE_UI) then
		if (self.data.func) then 
			self.data.func()
		end
		
	end
	
	ILW_UnlockContainer:UpdateUnlockDisplay();
end

function ILW_UNLOCK_MIXIN:OnEnter(motion)
	-- hide the "New!" tag and mark as read to prevent animation
	self.NewText:SetText("");
	self.NewTextBG:Hide();
	self.data.read = true;
	
	-- show tooltip depending on type
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	if (self.unlockType == UNLOCKTYPE_SPELL) then
		GameTooltip:SetSpellByID(self.unlockId);
	else
		GameTooltip:SetText(self.data.name, 1, 1, 1);
		if (self.unlockType == UNLOCKTYPE_RIDING) then
			GameTooltip:AddLine(_L["TOOLTIP_RIDING"]);
		elseif (self.unlockType == UNLOCKTYPE_TALENT) then
			GameTooltip:AddLine(_L["TOOLTIP_TALENT"]);
		elseif (self.unlockType == UNLOCKTYPE_DUNGEON or self.unlockType == UNLOCKTYPE_RAID) then
			GameTooltip:AddLine(_L["TOOLTIP_INSTANCE"]);
		elseif (self.unlockType == UNLOCKTYPE_PVP) then
			GameTooltip:AddLine(_L["TOOLTIP_PVP"]);
		elseif (self.unlockType == UNLOCKTYPE_UI) then
			GameTooltip:AddLine(_L["TOOLTIP_UI"]);
		end
	end
	GameTooltip:Show();
end

function ILW_UNLOCK_MIXIN:Reset()
	local name = self:GetName();
	local iconTexture = _G[name.."IconTexture"];
	iconTexture:Hide();
	iconTexture:SetTexture("");
	self:Disable();
	--self:SetAlpha(0);
	HideUIPanel(self);
	self.SpellName:SetText("");
	self.SpellName:SetHeight(self.SpellName:GetStringHeight());
	self.unlockType = nil;
	self.SpellSubName:SetText("");
	self.unlockId = nil;
	self.read = false;
	self.new = true;
	self.animation:Stop();
	self.NewText:SetText("");
	self.NewTextBG:Hide();
	self.Level:Hide();
	self.DigitBg:Hide();
end

function ILW_UNLOCK_MIXIN:Update(unlock, showLevel)
	local name = self:GetName();
	local iconTexture = _G[name.."IconTexture"];
	self:SetAlpha(1);
	self:Enable();
	
	iconTexture:Show();
	iconTexture:SetTexture(unlock.icon);
	self.data = unlock;
	-- check if unlock has been read before.
	self.read = unlock.read;
	
	ShowUIPanel(self);
	
	self.SpellName:SetText(unlock.name);
	self.SpellName:Show();
	self.SpellName:SetHeight(self.SpellName:GetStringHeight());
	self.unlockType = unlock.type;
	self.unlockId = unlock.id;
	
	self.TypeIcon:SetTexCoord(0, 0, 0, 0);
	local coords = _typeIcons[self.unlockType];
	if coords then
		self.TypeIcon:SetTexCoord(coords.left, coords.right, coords.top, coords.bottom);
	end
	
	local subText = "";

	if (unlock.subText ~= nil) then
		subText = subText .. unlock.subText;
	end
	
	if (unlock.spec ~= nil) then
		local id, specName, description, icon, background, role, class = GetSpecializationInfoByID(unlock.spec);
		subText = subText ..", ".. specName;
	end
	
	self.SpellSubName:SetText(subText);
	self.SpellSubName:Show();
	self.SpellSubName:SetHeight(self.SpellSubName:GetStringHeight());
	
	-- Only show level for the first one
	if (showLevel) then
		self.DigitBg:Show();
		self.Level:Show();
		self.Level:SetText(unlock.level);
	end
	
	if (unlock.subType == UNLOCK_SUBTYPE_UPCOMMING) then
		iconTexture:SetDesaturated(true);
		self.SlotFrame:SetDesaturated(true);
		self.TypeIcon:SetDesaturated(true);
		self.Level:SetTextColor(0.7, 0.7, 0.7, 1);
		self.SpellName:SetTextColor(0.7, 0.7, 0.7, 1);
		self.DigitBg:SetVertexColor(1, 1, 1, 0.85);
		self.TextBackground:SetDesaturated(true);
		
	else
		iconTexture:SetDesaturated(false);
		self.SlotFrame:SetDesaturated(false);
		self.TypeIcon:SetDesaturated(false);
		self.Level:SetTextColor(1, 0.82, 0, 1);
		self.SpellName:SetTextColor(1, 0.82, 0, 1);
		self.DigitBg:SetVertexColor(1, 0.82, 0, 0.85);
		self.TextBackground:SetDesaturated(false);
		
		unlock.new = (unlock.new == nil and true or unlock.new );
		if (not self.read) then
			self.NewText:SetText(_L["NEW"]);
			self.NewTextBG:Show();
		end
		-- set unlock as read
		
		if unlock.new then
			self.animation:Play();
			unlock.new = false;
		end

	end
end




ILW_CORE_MIXIN = {}

function ILW_CORE_MIXIN:OnShow()
	HideUIPanel(ILW_AlertPopup);
	ILW_SpellBookTab:SetChecked(true);
	self:UpdateUnlockDisplay();
	--PlaySound("igSpellBookOpen");
	PlaySound(SOUNDKIT.IG_SPELLBOOK_OPEN);
end

function ILW_CORE_MIXIN:OnHide()
	--PlaySound("igSpellBookClose");
	HideUIPanel(ILW_HelpFrame);
	ILW_SpellBookTab:SetChecked(false);
	ILW_ShowHelpUnlocks(false);
	PlaySound(SOUNDKIT.IG_SPELLBOOK_CLOSE);
end

function ILW_CORE_MIXIN:OnLoad()

	self.dataProvider = CreateFromMixins(ILW_DATA_MIXIN);
	
	self:RegisterForDrag("LeftButton");
	self:SetScript("OnDragStart", self.StartMoving );
	self:SetScript("OnDragStop", self.StopMovingOrSizing);
	-- allows the player to close the frame using Esc like regular blizzard windows
	table.insert(UISpecialFrames, "ILW_UnlockContainer");
	UIPanelWindows["ILW_UnlockContainer"] = { area = "left", pushable = 4 };
	
	self.Navigation.CurrentPage = 1;
	
	for i=1, 6 do
		local button = _G["ILW_UnlockContainerUnlock"..i];
		button:RegisterForDrag("LeftButton");
		button:RegisterForClicks("LeftButtonUp", "RightButtonUp");
		button.read = false;
	end
	
	SetPortraitToTexture(ILW_UnlockContainerPortrait, "Interface\\ICONS\\Spell_Holy_SurgeOfLight");
	ILW_UnlockContainerTitleText:SetText("I Learned What?")
	ILW_UnlockContainerCloseButton:SetScript("OnMouseUp", function() ILW_SpellBookTab:SetChecked(false); end );
	
	ButtonFrameTemplate_HideButtonBar(self);
	ButtonFrameTemplate_HideAttic(self);
end

function ILW_CORE_MIXIN:OnMouseWheel(delta)
	if delta == 1 then
		self.Navigation:PrevPageButton_OnClick();
	else
		self.Navigation:NextPageButton_OnClick();
	end
end

function ILW_CORE_MIXIN:ClearButton_OnClick()
	local list = self.dataProvider.unlockedList 
	for i = #list, 1, -1 do
		if list[i].subType ~= UNLOCK_SUBTYPE_UPCOMMING then
			table.remove(list, i);
		end
	end
	self:UpdateUnlockDisplay();
end

function ILW_CORE_MIXIN:LevelUp(level)
	self.dataProvider:ClearUpcommingFromList();
	local newUnlocks = self.dataProvider:AddUnlocksOfLevel(level);
	if newUnlocks then
		self.dataProvider:UpdateFilteredList();
	end
	if (ILW_UnlockContainer:IsShown()) then
		self:UpdateUnlockDisplay();
	else 
		if (newUnlocks) then
			ILW_AlertPopup:Present();
		end
	end
end

function ILW_CORE_MIXIN:ResetButtons()
	for i=1, 6 do
		local button = _G["ILW_UnlockContainerUnlock"..i];
		button:Reset();
		
	end
	
	self.Navigation:Update();
end

function ILW_CORE_MIXIN:UpdateUnlockDisplay()
	if (not self:IsShown()) then return; end
	
	self:ResetButtons();
	self.dataProvider:UpdateFilteredList();
	local unlockedList = self.dataProvider.filteredList;
	if (#unlockedList == 0) then 
		self.dataProvider:LoadUpcommingUnlocks();
		self.dataProvider:UpdateFilteredList();
		
	end
	
	if (#unlockedList == 0) then
		self.NoNew:Show();
		self.Navigation:Update();
		return;
	else
		self.NoNew:Hide();
	end
	
	self.BannerText:SetText(_L["BANNER_UNLOCKED"]);
	-- If what we are currently showing are upcomming unlocks, change the title
	if (#unlockedList > 0 and unlockedList[1].subType == UNLOCK_SUBTYPE_UPCOMMING) then
		self.BannerText:SetText(_L["BANNER_NEXT"]);
	end
	
	local prevDisplayLevel = 0;
	local count = 1;
	local unlock = nil;
	local pageNr = self.Navigation.CurrentPage;
	local start = (pageNr-1) * UNLOCKS_PER_PAGE;
	local nrToShow = (#unlockedList-start) > 6 and 6 or #unlockedList-start;
	for i = start + 1, (start + nrToShow) do
		unlock = unlockedList[i];

			local button = _G["ILW_UnlockContainerUnlock"..count];
			button:Update(unlock, (unlock.level~=prevDisplayLevel));
			prevDisplayLevel = unlock.level;
			
			
		count = count +1;
	end

	self.Navigation:Update();
end




ILW_NAVIGATION_MIXIN = {};

function ILW_NAVIGATION_MIXIN:PrevPageButton_OnClick()
	if (self.CurrentPage == 1) then return; end
	--PlaySound("igAbiliityPageTurn");
	PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN);
	self.CurrentPage = self.CurrentPage - 1;
	self.Text:SetText("Page ".. self.CurrentPage);
	ILW_UnlockContainer:UpdateUnlockDisplay();
end

function ILW_NAVIGATION_MIXIN:NextPageButton_OnClick()
	if (self.CurrentPage >= ceil(#ILW_UnlockContainer.dataProvider.filteredList/UNLOCKS_PER_PAGE)) then return; end
	--PlaySound("igAbiliityPageTurn");
	PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN);
	self.CurrentPage = self.CurrentPage + 1;
	self.Text:SetText("Page ".. self.CurrentPage);
	ILW_UnlockContainer:UpdateUnlockDisplay();
end

function ILW_NAVIGATION_MIXIN:Update()
	local totalPages = ceil(#ILW_UnlockContainer.dataProvider.filteredList/UNLOCKS_PER_PAGE);

	if (totalPages > 0 and self.CurrentPage > totalPages) then
		self.CurrentPage = totalPages;
	elseif (totalPages == 0) then
		self.CurrentPage = 1;
	end

	self.Text:SetText("Page ".. self.CurrentPage);
	
	self.Prev:Enable();
	self.Next:Enable();

	-- disable prev on first page;
	if (self.CurrentPage == 1) then
		self.Prev:Disable();
	end

	-- disable next page if on last page
	if (totalPages == 0 or self.CurrentPage == totalPages) then
		self.Next:Disable();
	end
end




function ILWAddon:InitFilter(dd, level)
	local info = UIDropDownMenu_CreateInfo();
	info.keepShownOnClick = true;	

	if level == 1 then
		info.text = _L["OPTION_MINIMAP"];
		info.func = function(_, _, _, value)
						ILWAddon.db.global.minimap.hide = not value;
						if (ILWAddon.db.global.minimap.hide) then
							_icon:Hide(_addonName);
						else
							_icon:Show(_addonName);
						end
					end 
		info.checked = not ILWAddon.db.global.minimap.hide;
		info.isNotRadio = true;
		UIDropDownMenu_AddButton(info, level)
		
		info.text = _L["OPTION_SPELLBOOK"];
		info.func = function(_, _, _, value)
						ILWAddon.db.global.spellbook = value;
						if (ILWAddon.db.global.spellbook) then
							ShowUIPanel(ILW_SpellBookTab);
						else
							HideUIPanel(ILW_SpellBookTab);
						end
					end 
		info.checked = ILWAddon.db.global.spellbook;
		info.isNotRadio = true;
		UIDropDownMenu_AddButton(info, level)

		info.text = _L["OPTION_POPUP"];
		info.func = function(_, _, _, value)
						ILWAddon.db.global.showPopup = value;
					end 
		info.checked = ILWAddon.db.global.showPopup;
		info.isNotRadio = true;
		UIDropDownMenu_AddButton(info, level)
	
		info.checked = 	nil;
		info.isNotRadio = nil;
		info.func =  nil;
		info.hasArrow = true;
		info.notCheckable = true;
		
		info.text = _L["OPTION_TRACKERS"];
		info.value = 1;
		UIDropDownMenu_AddButton(info, level)
	else --if level == 2 then
		
		info.hasArrow = false;
		info.isNotRadio = true;
		info.notCheckable = true;
			
		info.text = CHECK_ALL
		info.func = function()
						ILWAddon:SetAllSourcesTo(true);
						UIDropDownMenu_Refresh(dd, 1, 2);
						ILW_UnlockContainer:UpdateUnlockDisplay();
					end
		UIDropDownMenu_AddButton(info, level)
		
		info.text = UNCHECK_ALL
		info.func = function()
						ILWAddon:SetAllSourcesTo(false);
						UIDropDownMenu_Refresh(dd, 1, 2);
						ILW_UnlockContainer:UpdateUnlockDisplay();
					end
		UIDropDownMenu_AddButton(info, level)

		
		info.notCheckable = false;
		for k, v in pairs(_trackers) do
			info.text = k;
			info.func = function(_, _, _, value)
								ILWAddon.db.global.trackers[k] = value;
								ILW_UnlockContainer:UpdateUnlockDisplay();
							end
			info.checked = function() return ILWAddon.db.global.trackers[k] end;
			UIDropDownMenu_AddButton(info, level);			
		end
	end
end

function ILWAddon:SetAllSourcesTo(enable)
	for k, v in pairs(ILWAddon.db.global.trackers) do
		ILWAddon.db.global.trackers[k] = enable;
	end
end





ILW_POPUP_MIXIN = {};

function ILW_POPUP_MIXIN:OnShow()
	self.animLightUp:Play();
end

function ILW_POPUP_MIXIN:OnClick(button)
	if(button == "LeftButton") then
		ShowUIPanel(ILW_UnlockContainer);
	end
	HideUIPanel(self)
end

function ILW_POPUP_MIXIN:Present()
	local list = ILW_UnlockContainer.dataProvider.filteredList;
	if (#list > 0 and list[1].subType == UNLOCK_SUBTYPE_UPCOMMING) then return; end;
	if (ILW_UnlockContainer:IsShown() or #list == 0 or not ILWAddon.db.global.showPopup or InCombatLockdown()) then return; end
	self.text:SetText(_L["POPUP_FORMAT"]:format(#list));
	ShowUIPanel(self);
end




local function CreateSpellbookIcon()

	local L_ILW_SpellBookTab = CreateFrame("CheckButton", "ILW_SpellBookTab", SpellBookSideTabsFrame, "SpellBookSkillLineTabTemplate");
	L_ILW_SpellBookTab:SetPoint("bottomleft", SpellBookSideTabsFrame, "bottomright", 0, 50);
	ShowUIPanel(L_ILW_SpellBookTab);
	-- overwrite scripts from template
	L_ILW_SpellBookTab:SetScript("OnEnter", function(self) 
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 0);
		GameTooltip:SetText(_L["TOOLTIP_SPELLBOOK_ICON"]);
	end);
	L_ILW_SpellBookTab:SetScript("OnClick", function() 
			if (ILW_UnlockContainer:IsShown()) then
				HideUIPanel(ILW_UnlockContainer);
			else
				ShowUIPanel(ILW_UnlockContainer);
			end
		end);

	L_ILW_SpellBookTab.icon = L_ILW_SpellBookTab:CreateTexture("ILW_SpellBookTabIcon");
	L_ILW_SpellBookTab.icon:SetPoint("center", L_ILW_SpellBookTab);
	L_ILW_SpellBookTab.icon:SetSize(32, 32);
	L_ILW_SpellBookTab.icon:SetTexture("Interface\\ICONS\\Spell_Holy_SurgeOfLight");
	
	
end

local function SpecChanged()
	local spec = GetPlayerSpec();
	local level = UnitLevel("player");
	
	if (spec == nil) then return; end
	
	-- local lastLevel = _specLastLevel[""..spec];
	local lastLevel = ILWAddon.db.char.specLastLevel[spec];
	lastLevel = (lastLevel or 1);
	
	-- add spec specific unlocks since last time the spec was used
	for i = (lastLevel + 1), level do
		--CheckSpecMissedUnlocks(i, spec);
		ILW_UnlockContainer.dataProvider:CheckSpecMissedUnlocks(i, spec);
	end
	
	-- sort unlocks by level to get new spec abilities in the right position
	table.sort(ILWAddon.db.char.unlockedList, function(a, b) return a.level < b.level end)

	ILWAddon.db.char.specLastLevel[spec] = level;
	
	ILW_UnlockContainer.dataProvider:UpdateFilteredList();
	if (not ILW_UnlockContainer:IsShown()) then
		ILW_AlertPopup:Present();
	end
	
	ILW_UnlockContainer:UpdateUnlockDisplay();
	
end

function ILWAddon:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("ILWDB", _defaults, true);
	_icon:Register(_addonName, ILWBroker, self.db.global.minimap);
	
	ILW_UnlockContainer.dataProvider:Initialize();
	if (not self.db.global.version) then
		wipe(ILW_UnlockContainer.dataProvider.unlockedList)
	end
	self.db.global.version = _version;
end

function ILWAddon:OnEnable()
	if (not ILWAddon.db.global.spellbook) then
		ILW_SpellBookTab:Hide();
	end
	
	local spec = GetPlayerSpec();
	if (spec ~= nil) then
		self.db.char.specLastLevel[spec] = UnitLevel("player");
	end
	
	UIDropDownMenu_Initialize(ILW_UnlockContainerOptionsDropDown, function(self, level) ILWAddon:InitFilter(self, level) end, "MENU");
	
	-- Get official names for dungeons, battlegounds and worldPVP zones
	-- This has to be done here as some info (mainly BGs) is not available before the addon is done loading.
	
	-- Get names for official instances
	for level, instances in pairs(_addonData.Instances) do
		for k, instance in ipairs(instances) do
			if (instance.subText == _L["DUNGEON"]) then
				instance.name = EJ_GetInstanceInfo(instance.id);
			end
		end
	end
	
	-- Official names
	for level, unlocks in pairs(_addonData.Pvp) do
		for k, unlock in ipairs(unlocks) do
			if (unlock.subText == _L["BATTLEGROUND"]) then
				unlock.name = GetBattlegroundInfo(unlock.id);
			elseif (unlock.subText == _L["WORLD_PVP"]) then
				unlock.name = select(2, GetWorldPVPAreaInfo(unlock.id));
			end
		end
	end
end

local L_ILWhat_LoadFrame = CreateFrame("FRAME", "ILWhat_LoadFrame"); 
ILWhat_LoadFrame:RegisterEvent("PLAYER_LEVEL_UP");
ILWhat_LoadFrame:RegisterEvent("PLAYER_REGEN_ENABLED");
ILWhat_LoadFrame:RegisterEvent("PLAYER_REGEN_DISABLED");
ILWhat_LoadFrame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED");
ILWhat_LoadFrame:RegisterEvent("ADDON_LOADED");
ILWhat_LoadFrame:RegisterEvent("PLAYER_LOGOUT");
ILWhat_LoadFrame:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)

function ILWhat_LoadFrame:PLAYER_LEVEL_UP(level, hp, mp, talentPoints, strength, agility, stamina, intellect, spirit)
	if InCombatLockdown() then
		_playerLeveled = true;
	else
		ILW_UnlockContainer:LevelUp(level);
	end
end

function ILWhat_LoadFrame:PLAYER_REGEN_DISABLED()
	ILW_AlertPopup:Hide();
	HideUIPanel(ILW_UnlockContainer);
end

function ILWhat_LoadFrame:PLAYER_REGEN_ENABLED()
	if _playerLeveled then
		ILW_UnlockContainer:LevelUp(UnitLevel("player"));
		_playerLeveled = false;
	end
	
	if _openedDuringCombat then
		ShowUnlockContainer();
		_openedDuringCombat = false;
	end
end

function ILWhat_LoadFrame:PLAYER_SPECIALIZATION_CHANGED(player)
	if(player == "player") then
		SpecChanged();
	end
end

function ILWhat_LoadFrame:PLAYER_LOGOUT(loadedAddon)
	ILW_ShowHelpUnlocks(false);
end

function ILWhat_LoadFrame:ADDON_LOADED(loadedAddon)
	if (loadedAddon ~= _addonName) then return; end
	
	ILWhat_LoadFrame:UnregisterEvent("ADDON_LOADED")
	
	_classSkills = _addonData.Skills;
	_classSpecs = _addonData.Specs;
	_talentLevels = _addonData.Talents;
	_InstanceLevels = _addonData.Instances;
	_PvPLevels = _addonData.Pvp;
	_ridingSkills = _addonData.Riding;
	_UIUnlocks = _addonData.UI;

	CreateSpellbookIcon();
	
	_help:Initialize(ILW_UnlockContainer, _helpPlate);

end

----------------------------------------
-- Slash Commands
----------------------------------------

SLASH_ILEARNEDWHAT1 = '/ilwhat';
SLASH_ILEARNEDWHAT2 = '/ilearnedwhat';
SLASH_ILEARNEDWHAT3 = '/ilw';
local function slashcmd(msg, editbox)
	-- wipe(ILW_UnlockContainer.dataProvider.unlockedList )
	-- for i=1, 110 do
		-- ILW_UnlockContainer:LevelUp(i)
	-- end
	-- print(ILW_UnlockContainer.dataProvider:LoadUpcommingUnlocks());
	if (ILW_UnlockContainer:IsShown()) then
		HideUIPanel(ILW_UnlockContainer);
	elseif(not InCombatLockdown()) then
		ShowUIPanel(ILW_UnlockContainer);
	end
end
SlashCmdList["ILEARNEDWHAT"] = slashcmd