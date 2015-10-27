
----------------------------------------
-- Variables
----------------------------------------

local addonName, _addonData = ...;
local _unlockScroller = nil;

local unlockedList = {};
local _classSkills = {};
local _talentLevels = {};
local _ridingSkills = {};
local _glyphLevels = {};
local _specLastLevel = {};
local _InstanceLevels = {};
local _PvPLevels = {};
local _classSpecs = {};
local _playerLeveled = false;
local _openedDuringCombat = false;
local DEBUGLEVEL = 1;
local DEBUGSPEC = nil;
local _debugMode = false;

_addonData.variables = {}
local _aVar = _addonData.variables;

_addonData.help = {}
local _help = _addonData.help;

local UNLOCKTYPE_SPELL = "spell";
local UNLOCKTYPE_TALENT = "talent";
local UNLOCKTYPE_GLYPH = "glyph";
local UNLOCKTYPE_DUNGEON = "instance";
local UNLOCKTYPE_PVP = "pvp";
local UNLOCKTYPE_RIDING = "riding";
local UNLOCKTYPE_TUTORIAL = "tutorial";
local UNLOCKS_PER_PAGE = 6;
local ICON_TALENT = "Interface/ICONS/Ability_Marksmanship";
local ICON_GLYPH = "Interface/ICONS/INV_Glyph_PrimeDruid";
_aVar.TBC_HEROIC = -1;
_aVar.WOTLK_HEROIC = -3;
_aVar.WOTLK_RAID = -4;
_aVar.CATA_HEROIC = -5;
_aVar.CATA_RAID = -6;
_aVar.MOP_HEROIC = -7;
_aVar.MOP_RAID = -8;
_aVar.WOD_HEROIC = -9;
_aVar.WOD_RAID = -10;
local HELP_INFO = "As you level up you will unlock new content such as new abilities, talent points and dungeons.\n\nLeft clicking the unlocks will open related windows and remove them from the list.\n\nLeft clicking or dragging abilities allows you to move them to your action bars.\n\nRight clicking the unlocks will remove them from the list."
local ERROR_OPEN_IN_COMBAT = "|cFFFFD100ILWhat:|r |cFFFF5555Can't open that during combat. It will open once you leave combat.|r";
local TOOLTIP_TALENT = "Left click to pick your new talent.";
local TOOLTIP_INSTANCE = "Left click to open the encounter\n journal for this instance.";
local TOOLTIP_GLYPH = "Left click to pick your new glyphs.";
local TOOLTIP_PVP = "Left click to open the\n battleground window.";
local TOOLTIP_COMBAT = "|cFFFF5555Can't open during combat|r";
local TOOLTIP_SPELLBOOK_ICON = "Unlocked content";

local UnlockContainer_HelpPlate = {
	FramePos = { x = 5,	y = -25 },
	FrameSize = { width = 440, height = 495	},
	[1] = { ButtonPos = { x = 200,	y = -95}, HighLightBox = { x = 20, y = -85, width = 405, height = 420 }, ToolTipDir = "DOWN", ToolTipText = HELP_INFO }
}

function ILW_ShowTutorialUnlocks(show)
	if (show and #unlockedList == 0) then
		table.insert(unlockedList, {["type"] = UNLOCKTYPE_TUTORIAL, ["level"] = 3, ["icon"] = "Interface/ICONS/spell_fire_fireball02", ["name"] = "Example Ability", ["subText"] = "Ability"});
		table.insert(unlockedList, {["type"] = UNLOCKTYPE_TUTORIAL, ["level"] = 5, ["icon"] = "Interface/ICONS/spell_frost_frostbolt02", ["name"] = "Example Ability", ["subText"] = "Ability"});
		table.insert(unlockedList, {["type"] = UNLOCKTYPE_TUTORIAL, ["level"] = 5, ["icon"] = "Interface/LFGFRAME/LFGICON-DIREMAUL", ["name"] = "Example Dungeon", ["subText"] = "Dungeon"});
		table.insert(unlockedList, {["type"] = UNLOCKTYPE_TUTORIAL, ["level"] = 7, ["icon"] = "Interface/ICONS/spell_nature_wispsplode", ["name"] = "Example Ability", ["subText"] = "Ability"});
		table.insert(unlockedList, {["type"] = UNLOCKTYPE_TUTORIAL, ["level"] = 7, ["icon"] = "Interface/ICONS/ability_mage_wintersgrasp", ["name"] = "Example Passive", ["subText"] = "Passive"});
	end
	
	if not show then
		for i=#unlockedList, 1, -1 do
			if (unlockedList[i]["type"] == UNLOCKTYPE_TUTORIAL) then
				table.remove(unlockedList, i);
			end
		end
	end
	
	ILW_ShowUnlockedContent();
end

function ILW_TutorialButton_OnClick()
	if ILW_HelpFrame:IsShown() then
		_help:HideTutorial();
		ILW_ShowTutorialUnlocks(false);
	else
		_help:ShowTutorial();
		ILW_ShowTutorialUnlocks(true);
	end
end

function ILW_Unlockbutton_OnClick(self, button)
	self:SetChecked(false);

	local nr = string.match(self:GetName(), "(%d+)");
	nr = nr + ((ILW_UnlockContainer.CurrentPage - 1) * UNLOCKS_PER_PAGE);
	table.remove(unlockedList, nr);
	
	-- Don't have to opent anything if it's right mouse
	if (button == "RightButton") then
		ILW_ShowUnlockedContent();
		return;
	-- Open spellbook if spell
	elseif (self.unlockType == UNLOCKTYPE_SPELL) then
		PickupSpell(self.unlockId);
	-- Open talents
	elseif (self.unlockType == UNLOCKTYPE_TALENT) then
		if (PlayerTalentFrame == nil or not PlayerTalentFrame:IsShown()) then
			ToggleTalentFrame();
		end
		PlayerTalentTab_OnClick(_G["PlayerTalentFrameTab2"]);
	-- Open glyphs
	elseif (self.unlockType == UNLOCKTYPE_GLYPH) then
		if (PlayerTalentFrame == nil or not PlayerTalentFrame:IsShown()) then
			ToggleTalentFrame();
		end
		PlayerTalentTab_OnClick(_G["PlayerTalentFrameTab3"]);
	-- Open encounter journal if instance
	elseif (self.unlockType == UNLOCKTYPE_DUNGEON ) then
		if (EncounterJournal == nil or not EncounterJournal:IsShown()) then
			ToggleEncounterJournal();
		end
		if (self.unlockId ~= nil) then
			-- actual instance
			if (self.unlockId > 0) then
				EncounterJournal_DisplayInstance(self.unlockId);
			elseif (self.unlockId == _addonData.variables.TBC_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 2)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _addonData.variables.WOTLK_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 3)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _addonData.variables.WOTLK_RAID) then
				EncounterJournal_TierDropDown_Select(_, 3)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _addonData.variables.CATA_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 4)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _addonData.variables.CATA_RAID) then
				EncounterJournal_TierDropDown_Select(_, 4)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _addonData.variables.MOP_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 5)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _addonData.variables.MOP_RAID) then
				EncounterJournal_TierDropDown_Select(_, 5)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _addonData.variables.WOD_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 6)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _addonData.variables.WOD_RAID) then
				EncounterJournal_TierDropDown_Select(_, 6)
				EJ_ContentTab_Select(3);
			end
		end
	elseif (self.unlockType == UNLOCKTYPE_PVP) then
		if (GroupFinderFrame == nil or not GroupFinderFrame:IsShown()) then
			PVEFrame_ToggleFrame();
		end
		PVEFrame_ShowFrame("PVPUIFrame", "HonorFrame");
	end
	
	ILW_ShowUnlockedContent();
end

local function ShowUnlockContainer()

	
	if InCombatLockdown() then 
		_openedDuringCombat = true;
		print(ERROR_OPEN_IN_COMBAT);
		return;
	else
		ILW_AlertPopup:Hide();
		ILW_SpellBookTab:SetChecked(true);
		ILW_UnlockContainer:Show();
		PlaySound("igSpellBookOpen");
	end
	
end

local function Popup_OnClick(self, button)
	if(button == "LeftButton") then
		ShowUnlockContainer();
	end
	self:Hide();
end

function ILW_ClearButton_OnClick()
	ILW_ResetEverything();
end

local function ToggleOptionFrame()

	if (ILW_UnlockContainerOptions:IsShown()) then
		ILW_UnlockContainerOptions:Hide();
	else
		ILW_UnlockContainerOptions:Show();
	end

end

function ILW_OptionsFrame_EnableBack(enabled)
	local color = 1;
	if not enabled then
		color = 0.5;
	end
	
	for i=1, 6 do
		local button = _G["ILW_UnlockContainerUnlock"..i];
		button:EnableMouse(enabled);
		button.IconTexture:SetVertexColor(color, color, color, 1);
		button.DigitBg:SetVertexColor(color, color, color, 1);
		button.SlotFrame:SetVertexColor(color, color, color, 1);
		button.Digit1:SetVertexColor(color, color, color, 1);
		button.Digit2:SetVertexColor(color, color, color, 1);
		button.Digit3:SetVertexColor(color, color, color, 1);
		button.EmptySlot:SetVertexColor(color, color, color, 1);
		button.TextBackground:SetVertexColor(color, color, color, 1);
		button.TextBackground2:SetVertexColor(color, color, color, 1);
		if enabled then
			button.SpellName:SetTextColor(1.0, 0.82, 0, 1);
		else
			button.SpellName:SetTextColor(0.5, 0.42, 0, 1);
		end
	end
	
	ILW_UnlockContainer.Clear:EnableMouse(enabled);
	ILW_UnlockContainer.Navigation.Prev:EnableMouse(enabled);
	ILW_UnlockContainer.Navigation.Next:EnableMouse(enabled);
	
	ILW_UnlockContainer.bg:SetVertexColor(color, color, color, 1);
	ILW_UnlockContainer.banner:SetVertexColor(color, color, color, 1);
end

function ILW_OptionsButton_OnClick()
	ToggleOptionFrame();
end

function ILW_UnlockButton_OnEnter(self, motion)
	self.NewText:SetText("");
	self.NewTextBG:Hide();
	self.data.read = true;
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	if (self.unlockType == UNLOCKTYPE_SPELL) then
		GameTooltip:SetSpellByID(self.unlockId);
	elseif (self.unlockType == UNLOCKTYPE_TALENT) then
		GameTooltip:SetText(TOOLTIP_TALENT);
	elseif (self.unlockType == UNLOCKTYPE_DUNGEON) then
		GameTooltip:SetText(TOOLTIP_INSTANCE);
	elseif (self.unlockType == UNLOCKTYPE_GLYPH) then
		GameTooltip:SetText(TOOLTIP_GLYPH);
	elseif (self.unlockType == UNLOCKTYPE_PVP) then
		GameTooltip:SetText(TOOLTIP_PVP);
	end
end

function ILW_PrevPageButton_OnClick()
	if (ILW_UnlockContainer.CurrentPage == 1) then return; end
	PlaySound("igAbiliityPageTurn");
	ILW_UnlockContainer.CurrentPage = ILW_UnlockContainer.CurrentPage - 1;
	ILW_UnlockContainer.Navigation.Text:SetText("Page ".. ILW_UnlockContainer.CurrentPage);
	ILW_ShowUnlockedContent();
end

function ILW_NextPageButton_OnClick()
	if (ILW_UnlockContainer.CurrentPage >= ceil(#unlockedList/UNLOCKS_PER_PAGE)) then return; end
	PlaySound("igAbiliityPageTurn");
	ILW_UnlockContainer.CurrentPage = ILW_UnlockContainer.CurrentPage + 1;
	ILW_UnlockContainer.Navigation.Text:SetText("Page ".. ILW_UnlockContainer.CurrentPage);
	ILW_ShowUnlockedContent();
end

function UnlockContainer_OnMouseWheel(self, delta)
	if delta == 1 then
		ILW_PrevPageButton_OnClick();
	else
		ILW_NextPageButton_OnClick();
	end
end

local function GetPlayerLevel()
	if _debugMode then
		return DEBUGLEVEL;
	end
	
	return UnitLevel("player");
end

local function GetPlayerSpec()
	if _debugMode then
		return DEBUGSPEC;
	end
	
	if (GetSpecialization() ~= nil) then
		return GetSpecializationInfo(GetSpecialization());
	end
	
	return nil;
end

function ILW_UpdateNavigation()

	local totalPage = ceil(#unlockedList/UNLOCKS_PER_PAGE);

	if (totalPage > 0 and ILW_UnlockContainer.CurrentPage > totalPage) then
		ILW_UnlockContainer.CurrentPage = totalPage;
	end

	ILW_UnlockContainer.Navigation.Text:SetText("Page ".. ILW_UnlockContainer.CurrentPage);
	
	ILW_UnlockContainer.Navigation.Prev:Enable();
	ILW_UnlockContainer.Navigation.Next:Enable();

	-- disable prev on first page;
	if (ILW_UnlockContainer.CurrentPage == 1) then
		ILW_UnlockContainer.Navigation.Prev:Disable();
	end

	-- disable next page if on last page
	if (totalPage == 0 or ILW_UnlockContainer.CurrentPage == totalPage) then
		ILW_UnlockContainer.Navigation.Next:Disable();
	end
	
	--ILW_ShowUnlockedContent()
end

local function CreateUnlockAnimation(self)
	self.animation = self:CreateAnimationGroup();
	self.animation.translate = self.animation:CreateAnimation("Translation");
	self.animation.translate:SetSmoothing("IN");
	self.animation.alpha = self.animation:CreateAnimation("Alpha");
	self.animation.alpha:SetChange(-1);
	self.animation.alpha:SetSmoothing("IN");
	
end

local function PlayUnlockAnination(self)
	self.animation:SetScript("OnFinished", function() self.data.new = false; end);
	self.animation.translate:SetOffset(-50, 0);
	self.animation.translate:SetDuration(0.5);
	self.animation.alpha:SetDuration(0.5);
	self.animation:Play(true);
end

function ILW_CreateContainer()
	ILW_UnlockContainer:SetPoint("center", UIParent, "center", 0, 0);
	
	--ILW_UnlockContainer:Show();
	ILW_UnlockContainer:SetMovable(true);
	ILW_UnlockContainer:EnableMouse(true);
	ILW_UnlockContainer:SetClampedToScreen(true);
	ILW_UnlockContainer:SetToplevel(true)
	ILW_UnlockContainer:RegisterForDrag("LeftButton");
	ILW_UnlockContainer:SetScript("OnDragStart", ILW_UnlockContainer.StartMoving );
	ILW_UnlockContainer:SetScript("OnDragStop", ILW_UnlockContainer.StopMovingOrSizing);
	ILW_UnlockContainer.CurrentPage = 1;
	
	for i=1, 6 do
		local button = _G["ILW_UnlockContainerUnlock"..i];
		button:RegisterForDrag("LeftButton");
		button:RegisterForClicks("LeftButtonUp", "RightButtonUp");
		button.read = false;
		CreateUnlockAnimation(button);
		button:SetScript("OnShow", function(self) 
			if (button.new) then
				PlayUnlockAnination(self);
			end
			end);
	end
	
	SetPortraitToTexture(ILW_UnlockContainerPortrait, "Interface\\ICONS\\Spell_Holy_SurgeOfLight");
	ILW_UnlockContainerTitleText:SetText("I Learned What?")
	ILW_UnlockContainerCloseButton:SetScript("OnMouseUp", function() ILW_SpellBookTab:SetChecked(false); end );
	
	ButtonFrameTemplate_HideButtonBar(ILW_UnlockContainer);
	ButtonFrameTemplate_HideAttic(ILW_UnlockContainer);
	
	ILW_UpdateNavigation()
	
	return L_BGS_ContainerBG
end

local function ShowPopUp()
	if (#unlockedList == 0 or not ILW_UnlockContainerOptions.CBShowPopup:GetChecked()) then return; end
	ILW_AlertPopup:Show();
	ILW_AlertPopup:SetAlpha(1);
	ILW_AlertPopup.text:SetText(#unlockedList.." unread unlock" .. (#unlockedList == 1 and "" or "s") .."!")
end

local function CreatePopupAnimation(self)
	self.animationA = self:CreateAnimationGroup();
	self.animationA.alpha = self.animationA:CreateAnimation("Alpha");
	self.animationA.alpha:SetChange(-1);
	self.animationA.alpha:SetSmoothing("IN");
	self.animationB = self:CreateAnimationGroup();
	self.animationB.alpha = self.animationB:CreateAnimation("Alpha");
	self.animationB.alpha:SetChange(-1);
	self.animationB.alpha:SetSmoothing("OUT");
	
	self.animationA:SetScript("OnFinished", function() self.animationB:Play(); end);
	self.animationB:SetScript("OnFinished", function() self:Hide(); end);
end

local function PlayPopupAnimation(self)
	self:Show();
	if not self.animationA then
		CreatePopupAnimation(self)
	end
	self.animationA.alpha:SetDuration(0.3);
	self.animationB.alpha:SetDuration(0.3);
	self.animationA:Play(true);
end

local function ILW_CreatePopup()
	ILW_AlertPopup:SetPoint("center", UIParent, "center", 400, 0);
	ILW_AlertPopup:RegisterForDrag("LeftButton");
	ILW_AlertPopup:SetScript("OnDragStart", ILW_AlertPopup.StartMoving );
	ILW_AlertPopup:SetScript("OnDragStop", ILW_AlertPopup.StopMovingOrSizing);
	ILW_AlertPopup:SetScript("OnShow", function(self) PlayPopupAnimation(self.highlight) end );
	ILW_AlertPopup:SetScript("OnClick", function(self, button) Popup_OnClick(self, button);end );
	ILW_AlertPopup:RegisterForClicks("LeftButtonUp", "RightButtonUp");
end

local function ToggleUnlockedPage(show)
	if InCombatLockdown() then return; end
	
	if (show) then
		ShowUnlockContainer();
	else
		ILW_UnlockContainer:Hide();
	end

end

local function CreateSpellbookIcon()

	local L_ILW_SpellBookTab = CreateFrame("CheckButton", "ILW_SpellBookTab", SpellBookSideTabsFrame, "SpellBookSkillLineTabTemplate");
	L_ILW_SpellBookTab:SetPoint("bottomleft", SpellBookSideTabsFrame, "bottomright", 0, 50);
	L_ILW_SpellBookTab:Show();
	-- overwrite script from template
	L_ILW_SpellBookTab:SetScript("OnEnter", function(self) 
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 0);
		if InCombatLockdown() then
			GameTooltip:SetText(TOOLTIP_COMBAT);
		else
			GameTooltip:SetText(TOOLTIP_SPELLBOOK_ICON);
		end
	end);
	L_ILW_SpellBookTab:SetScript("OnClick", function() 
			if InCombatLockdown() then
				L_ILW_SpellBookTab:SetChecked(false);
			else
				ToggleUnlockedPage(not ILW_UnlockContainer:IsShown()); 
			end
		end);

	L_ILW_SpellBookTab.icon = L_ILW_SpellBookTab:CreateTexture("ILW_SpellBookTabIcon");
	L_ILW_SpellBookTab.icon:SetPoint("center", L_ILW_SpellBookTab);
	L_ILW_SpellBookTab.icon:SetSize(32, 32);
	L_ILW_SpellBookTab.icon:SetTexture("Interface\\ICONS\\Spell_Holy_SurgeOfLight");
	
	
end

local function DisplayUnlockLevel(button, level)
	
	level = tonumber(level);
	local digits = {button.Digit3, button.Digit2, button.Digit1};
	local digitCount = 3;
	local singleDigit = 0;
	button.DigitBg:Show();
	
	while level > 0 do
		singleDigit = level%10;
		local x = singleDigit%8;
		local y = floor(singleDigit/8);
		digits[digitCount]:Show();
		-- digits[digit]:SetTexCoord((x*0.25)+0.07, ((x+1) * 0.25)-0.07, y*0.3333, (y+1)*0.3333);
		digits[digitCount]:SetTexCoord((x*0.125)+0.01, ((x+1) * 0.125)-0.01, y*0.5, (y+1)*0.5);
		level = math.floor(level/10);
		digitCount = digitCount - 1;
	end
end

local function ResetButtons()
	for i=1, 6 do
		local button = _G["ILW_UnlockContainerUnlock"..i];
		local name = button:GetName();
		local iconTexture = _G[name.."IconTexture"];
		iconTexture:Hide();
		iconTexture:SetTexture("");
		button:Hide();
		button.SpellName:SetText("");
		button.SpellName:Show();
		button.SpellName:SetHeight(button.SpellName:GetStringHeight());
		button.unlockType = nil;
		button.SpellSubName:SetText("");
		button.SpellSubName:Hide()
		button.unlockId = nil;
		button.read = false;
		button.new = true;
		button.animation:Stop();
		button.NewText:SetText("");
		button.NewTextBG:Hide();
	end
	
	ILW_UpdateNavigation();
end

function ILW_ShowUnlockedContent()
	
	-- Only update when the main window is open
	if (not ILW_UnlockContainer:IsShown()) then return; end
	
	ResetButtons();
	
	local prevDisplayLevel = 0;
	local count = 1;
	local unlock = nil;
	local pageNr = ILW_UnlockContainer.CurrentPage;
	local start = (pageNr-1) * UNLOCKS_PER_PAGE;
	local nrToShow = (#unlockedList-start) > 6 and 6 or #unlockedList-start;
	for i = start + 1, (start + nrToShow) do
		unlock = unlockedList[i];

			local button = _G["ILW_UnlockContainerUnlock"..count];
			local name = button:GetName();
			local iconTexture = _G[name.."IconTexture"];
			iconTexture:Show();
			iconTexture:SetTexture(unlock.icon);
			button.data = unlock;
			-- check if unlock has been read before.
			button.read = unlock.read;
			
			button.new = (unlock.new == nil and true or unlock.new );
			--print(name, unlock.new, (unlock.new == nil),button.new)
			button:Show();
			if (not button.read) then
				button.NewText:SetText(" New! ");
				button.NewTextBG:Show();
			end
			button.SpellName:SetText(unlock.name);
			button.SpellName:Show();
			button.SpellName:SetHeight(button.SpellName:GetStringHeight());
			button.unlockType = unlock.type;
			button.DigitBg:Hide();
			button.Digit1:Hide();
			button.Digit2:Hide();
			button.Digit3:Hide();
			button.unlockId = unlock.id;
			
			local subText = "";
			
			if (unlock.subText ~= nil) then
				subText = subText .. unlock.subText;
			end
			
			if (unlock.spec ~= nil) then
				local id, specName, description, icon, background, role, class = GetSpecializationInfoByID(unlock.spec);
				subText = subText ..", ".. specName;
			end
			
			button.SpellSubName:SetText(subText);
			button.SpellSubName:Show();
			button.SpellSubName:SetHeight(button.SpellSubName:GetStringHeight());
			
			-- Only show level for the first one
			if (unlock.level ~= prevDisplayLevel) then
				DisplayUnlockLevel(button, unlock.level);
			end
			
			prevDisplayLevel = unlock.level;

			-- set unlock as read
			unlock.new = false;
			
		count = count +1;
	end
	
	if (#unlockedList == 0) then
		ILW_UnlockContainer.NoNew:Show();
	else
		ILW_UnlockContainer.NoNew:Hide();
	end
	
	ILW_UpdateNavigation();

end

local function GetUnlockListForLeveL(level)
	for k, v in ipairs(unlockedList) do
		if v.level == level then
			return v;
		end
	end
	local levelMap = {["level"] = level, ["unlocks"] = {}};
	table.insert(unlockedList, levelMap);
	for k, v in ipairs(unlockedList) do
		if v.level == level then
			return v;
		end
	end
	return nil;
end

local function AddUnlockedSkill(id, level, spec, subText, unlockType)
	local name, rank, icon, castingTime, minRange, maxRange, spellID = GetSpellInfo(id);

	if unlockType == nil then
		unlockType = UNLOCKTYPE_SPELL;
	end
	if subText == nil then
		subText = "Ability";
	end
	table.insert(unlockedList, {["type"] = unlockType, ["level"] = level, ["id"] = id, ["icon"] = icon, ["name"] = name ,["spec"] = spec, ["subText"] = subText});
	ILW_ShowUnlockedContent();
end

local function AddUnlockedTalent(level)
	table.insert(unlockedList, {["type"] = UNLOCKTYPE_TALENT, ["level"] = level, ["icon"] = ICON_TALENT, ["name"] = "Talent Point"});
	ILW_ShowUnlockedContent();
end

local function AddUnlockedGlyph(level)
	table.insert(unlockedList, {["type"] = UNLOCKTYPE_GLYPH, ["level"] = level, ["icon"] = ICON_GLYPH, ["name"] = "Glyphs", ["subText"] = "1 Major, 1 Minor"});
	ILW_ShowUnlockedContent();
end

local function AddUnlockInstance(instance, instanceType)
	table.insert(unlockedList, {["type"] = instanceType, ["level"] = instance.level, ["icon"] = instance.icon, ["name"] = instance.name, ["id"] = instance.id, ["subText"] = instance.subText});
	ILW_ShowUnlockedContent();
end

local function CheckLevelUnlocks(level)
	
	local _trackOptions = ILW_UnlockContainerOptions.Trackers;
	local spec = GetPlayerSpec();
	if (spec ~= nil) then
		_specLastLevel[""..spec] = level;
	end
	
	if _trackOptions.Spells:GetChecked() then
		-- Check for skills
		for k, v in ipairs(_classSkills) do
			if v.level == level then
				-- always show if not spec specific
				if v.specs == nil then
					AddUnlockedSkill(tonumber(v.id), level, nil, v.subText, UNLOCKTYPE_SPELL);
				
				-- Otherwise, if you have a spec, check if it's the same as yours    GetSpecialization()
				elseif DEBUGSPEC ~= nil then
					for specKey, spec in ipairs(v.specs) do
						if spec == DEBUGSPEC then
							AddUnlockedSkill(tonumber(v.id), level, spec, v.subText, UNLOCKTYPE_SPELL);
						end
					end
				end
			end
		end
	end
	
	if _trackOptions.Riding:GetChecked() then
		-- Check for riding skills
		for k, riding in ipairs(_ridingSkills) do
			if (riding.level == level) then
				AddUnlockedSkill(tonumber(riding.id), level, nil, riding.subText, UNLOCKTYPE_RIDING);
			end
		end
	end
	
	if _trackOptions.Talents:GetChecked() then
		-- Check for talents
		for k, talentLevel in ipairs(_talentLevels) do
			if (talentLevel == level) then
				AddUnlockedTalent(level);
			end
		end
	end
	
	if _trackOptions.Glyphs:GetChecked() then
		-- Check for Glyphs
		for k, glyphLevel in ipairs(_glyphLevels) do
			if (glyphLevel == level) then
				AddUnlockedGlyph(level);
			end
		end
	end
	
	if _trackOptions.Dungeons:GetChecked() then
		-- Check for dungeons
		for k, instance in ipairs(_InstanceLevels) do
			if (instance.level == level) then
				AddUnlockInstance(instance, UNLOCKTYPE_DUNGEON);
			end
		end
	end
	
	if _trackOptions.PvP:GetChecked() then
		-- Check for PvP
		for k, instance in ipairs(_PvPLevels) do
			if (instance.level == level) then
				AddUnlockInstance(instance, UNLOCKTYPE_PVP);
			end
		end
	end
	
	ShowPopUp();
end

local function CheckSpecMissedUnlocks(level, spec)
	for k, v in ipairs(_classSkills) do
		if v.level == level and v.specs ~= nil then
			for specKey, skillSpec in ipairs(v.specs) do
				if skillSpec == spec then
					AddUnlockedSkill(tonumber(v.id), level, spec, v.subText, UNLOCKTYPE_SPELL);
				end
			end
		end
	end
end

function ILW_ResetEverything()
	unlockedList = {};
	ILW_ShowUnlockedContent();
end

local function SpecChanged()
	local spec = GetPlayerSpec();
	local level = GetPlayerLevel();
	
	if (spec == nil) then return; end
	
	local lastLevel = _specLastLevel[""..spec];
	
	for i = (lastLevel + 1), level do
		CheckSpecMissedUnlocks(i, spec);
	end
	
	table.sort(unlockedList, function(a, b) return a.level < b.level end)
	
	_specLastLevel[""..spec] = level;
	
	if (not ILW_UnlockContainer:IsShown()) then
		ShowPopUp();
	end
	
	ILW_ShowUnlockedContent();
	
end

local function CreateDebug()
	
	ILWCreateDebugThingy();
	
	local L_ILW_DebugLevelUp = CreateFrame("Button", "ILW_DebugLevelUp", ILW_Debug, "UIPanelButtonTemplate");
	ILW_DebugLevelUp:SetWidth(66);
	ILW_DebugLevelUp:SetHeight(25)
	ILW_DebugLevelUp:SetPoint("bottomleft", ILW_Debug, "topleft", 0, -3);
	ILW_DebugLevelUp:Show();
	ILW_DebugLevelUp:SetText("Level up");
	ILW_DebugLevelUp:SetScript("OnClick",  function() 
		DEBUGLEVEL = DEBUGLEVEL + 1;
		if InCombatLockdown() then
			_playerLeveled = true;
		else
			CheckLevelUnlocks(GetPlayerLevel());
		end
		
	end)
	
	local L_ILW_DebugLevelUp = CreateFrame("Button", "ILW_DebugLevelUpTen", ILW_Debug, "UIPanelButtonTemplate");
	ILW_DebugLevelUpTen:SetWidth(67);
	ILW_DebugLevelUpTen:SetHeight(25)
	ILW_DebugLevelUpTen:SetPoint("left", ILW_DebugLevelUp, "right", 0, 0);
	ILW_DebugLevelUpTen:Show();
	ILW_DebugLevelUpTen:SetText("Level 10");
	ILW_DebugLevelUpTen:SetScript("OnClick",  function() 
		for i = 1, 10 do
			DEBUGLEVEL = DEBUGLEVEL + 1;
			
			if InCombatLockdown() then
				_playerLeveled = true;
			else
				CheckLevelUnlocks(GetPlayerLevel());
			end
		end
	end)
	
	local L_ILW_DebugLevelReset = CreateFrame("Button", "ILW_DebugLevelReset", ILW_Debug, "UIPanelButtonTemplate");
	ILW_DebugLevelReset:SetWidth(66);
	ILW_DebugLevelReset:SetHeight(25)
	ILW_DebugLevelReset:SetPoint("left", ILW_DebugLevelUpTen, "right", 0, 0);
	ILW_DebugLevelReset:Show();
	ILW_DebugLevelReset:SetText("Reset");
	ILW_DebugLevelReset:SetScript("OnClick",  function() 
		ILW_ResetEverything();
		CheckLevelUnlocks(GetPlayerLevel());
	end)
	
	local L_ILW_DebugSpec0 = CreateFrame("Button", "ILW_DebugSpec0", ILW_Debug, "UIPanelButtonTemplate");
	ILW_DebugSpec0:SetWidth(50);
	ILW_DebugSpec0:SetHeight(25)
	ILW_DebugSpec0:SetPoint("bottomleft", ILW_DebugLevelUp, "topleft", 0, -3);
	ILW_DebugSpec0:Show();
	ILW_DebugSpec0:SetText("None");
	ILW_DebugSpec0:SetScript("OnClick",  function() 
		ILW_ResetEverything();
		DEBUGSPEC = nil;
		CheckLevelUnlocks(GetPlayerLevel());
	end)
	local prevButton = ILW_DebugSpec0;
	
	for i = 1, #_classSpecs do
		local button = CreateFrame("Button", "ILW_DebugSpec"..i, ILW_Debug, "UIPanelButtonTemplate");
		button:SetWidth(150/#_classSpecs);
		button:SetHeight(25)
		button:SetPoint("left", prevButton, "right", 0, 0);
		button:Show();
		button:SetText(i);
		button:SetScript("OnClick",  function() 
			DEBUGSPEC = _classSpecs[i];
			SpecChanged();
			--CheckLevelUnlocks(GetPlayerLevel());
		end)
		
		prevButton = button;
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
		CheckLevelUnlocks(level);
	end
end

function ILWhat_LoadFrame:PLAYER_REGEN_DISABLED()
	ILW_AlertPopup:Hide();
	ILW_UnlockContainer:Hide();
end

function ILWhat_LoadFrame:PLAYER_REGEN_ENABLED()
	if _playerLeveled then
		CheckLevelUnlocks(GetPlayerLevel());
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
	
	ILW_ShowTutorialUnlocks(false);
	
	ILW_SavedData = {};
	ILW_SavedData.specLastLevel = _specLastLevel;
	ILW_SavedData.unlockedList = unlockedList;
	ILW_SavedData.options = {};
	ILW_SavedData.options.enablePopup = ILW_UnlockContainerOptions.CBShowPopup:GetChecked();
	
	local t = ILW_UnlockContainerOptions.Trackers;
	ILW_SavedData.options.trackers = {};
	ILW_SavedData.options.trackers.Spells = t.Spells:GetChecked()
	ILW_SavedData.options.trackers.Riding = t.Riding:GetChecked()
	ILW_SavedData.options.trackers.Talents = t.Talents:GetChecked()
	ILW_SavedData.options.trackers.Glyphs = t.Glyphs:GetChecked()
	ILW_SavedData.options.trackers.Dungeons = t.Dungeons:GetChecked()
	ILW_SavedData.options.trackers.PvP = t.PvP:GetChecked()
end

function ILWhat_LoadFrame:ADDON_LOADED(loadedAddon)
	if (loadedAddon ~= addonName) then return; end
	
	ILWhat_LoadFrame:UnregisterEvent("ADDON_LOADED")
	
	for k, v in pairs(_addonData) do
		if k == select(2, UnitClass("player")) then
			_classSkills = v.Skills;
			_classSpecs = v.Specs;
		end
	end
	
	for k, v in ipairs(_classSpecs) do
		_specLastLevel[""..v] = 1;
	end
	
	_talentLevels = _addonData.Talents;
	_InstanceLevels = _addonData.Instances;
	_PvPLevels = _addonData.Pvp;
	_glyphLevels = _addonData.Glyphs;
	_ridingSkills = _addonData.Riding;
	
	ILW_CreateContainer();
	ILW_CreatePopup()
	CreateSpellbookIcon();
	
	_help:Initialise(ILW_UnlockContainer, UnlockContainer_HelpPlate);
	
	if (_debugMode) then
		CreateDebug();
		ShowUnlockContainer();
	end
	
	-- If there's no saved data, ignore the rest
	if (ILW_SavedData == nil) then return; end

	-- load the levels, otherwise check level and spec
	if (ILW_SavedData.specLastLevel ~= nil) then
		for k, v in pairs(ILW_SavedData.specLastLevel) do
			_specLastLevel[""..k] = v;
		end
	else
		local spec = GetPlayerSpec();
		if (spec ~= nil) then
			_specLastLevel[""..spec] = GetPlayerLevel();
		end
	end
	
	-- load tracker settings
	if (ILW_SavedData.options ~= nil) then
		ILW_UnlockContainerOptions.CBShowPopup:SetChecked(ILW_SavedData.options.enablePopup);
		
		local oT = ILW_UnlockContainerOptions.Trackers;
		local sT = ILW_SavedData.options.trackers;
		oT.Spells:SetChecked(sT.Spells);
		oT.Riding:SetChecked(sT.Riding);
		oT.Talents:SetChecked(sT.Talents);
		oT.Glyphs:SetChecked(sT.Glyphs);
		oT.Dungeons:SetChecked(sT.Dungeons);
		oT.PvP:SetChecked(sT.PvP);
	end
	
	-- check for previous unread messages
	if (ILW_SavedData.unlockedList ~= nil) then
		unlockedList = ILW_SavedData.unlockedList;
		ILW_ShowUnlockedContent();
		ShowPopUp();
	end
	
	ILW_ShowUnlockedContent();
	
end

----------------------------------------
-- Slash Commands
----------------------------------------

SLASH_ILEARNEDWHAT1 = '/ilwhat';
local function slashcmd(msg, editbox)
	if msg == 'options' then
		ShowUnlockContainer();
		ILW_UnlockContainerOptions:Show();
	else
		ShowUnlockContainer();
	end
end
SlashCmdList["ILEARNEDWHAT"] = slashcmd


-- Debug help
----------------------------------------------
local DEFAULT_BG = "Interface\\DialogFrame\\UI-DialogBox-Background"
local DEFAULT_EDGEFILE = "Interface\\DialogFrame\\UI-DialogBox-Border"
local mainEdgefile = nill
local DEFAULT_LOCKVERTEX_OFF = 0.5
local DEFAULT_LOCKVERTEX_ON = 0.8
local _updateTimer = 0

local function debug_updatext()
	local text = ""
	
	text = text .. "Level: ".. GetPlayerLevel() .. "\n"; 
	text = text .. "\n"; 
	if (GetPlayerSpec() ~= nil) then
		text = text .. "Spec: ".. GetPlayerSpec() .. " (".. select(2, GetSpecializationInfoByID(GetPlayerSpec())) ..")"; 
	else
		text = text .. "Spec: None";
		
	end
	text = text .. "\n"; 
	text = text .. "# Pages: " .. ceil(#unlockedList/UNLOCKS_PER_PAGE);
	text = text .. "\n";
	text = text .. "Alpha: " .. ILW_AlertPopup:GetAlpha();
	text = text .. "\n";
	text = text .. "Shown: " .. (ILW_AlertPopup:IsShown() and "true" or "false");
	text = text .. "\n";
	for spec, level in pairs(_specLastLevel) do
		text = text .. select(2, GetSpecializationInfoByID(spec)) .. ": " .. level;
		text = text .. "\n"; 
	end
	
	ILW_Debug.text:SetText(text)
	ILW_Debug:SetHeight(ILW_Debug.text:GetStringHeight()+20)
end

local function UpdateMainFrameBG()
	if ILW_Debug:IsMouseEnabled() then
		mainEdgefile = DEFAULT_EDGEFILE
	else
		mainEdgefile = nill
	end
	ILW_Debug:SetBackdrop({bgFile = DEFAULT_BG,
      edgeFile = mainEdgefile,
	  tileSize = 0, edgeSize = 16,
      insets = { left = 3, right = 3, top = 3, bottom = 3 }
	  })
end

local function DebugToggleLockbutton() 
	if ILW_Debug:IsMouseEnabled() then
		ILW_Debug_MoveButton.tex:SetVertexColor(DEFAULT_LOCKVERTEX_OFF, DEFAULT_LOCKVERTEX_OFF, DEFAULT_LOCKVERTEX_OFF )
		PlaySound("igMainMenuOptionCheckBoxOff");
		ILW_Debug:EnableMouse(false)
			
	else	
		ILW_Debug_MoveButton.tex:SetVertexColor(DEFAULT_LOCKVERTEX_ON, DEFAULT_LOCKVERTEX_ON, DEFAULT_LOCKVERTEX_ON )
		PlaySound("igMainMenuOptionCheckBoxOn");
		ILW_Debug:EnableMouse(true)
			
	end
		UpdateMainFrameBG()
end


function ILWCreateDebugThingy()
local L_ILW_Debug = CreateFrame("frame", "ILW_Debug", UIParent)

ILW_Debug:EnableMouse(true)
UpdateMainFrameBG()
ILW_Debug:SetFrameLevel(5)
ILW_Debug:SetMovable(true)
ILW_Debug:SetPoint("Center", 250, 0)
ILW_Debug:RegisterForDrag("LeftButton")
ILW_Debug:SetScript("OnDragStart", ILW_Debug.StartMoving )
ILW_Debug:SetScript("OnDragStop", ILW_Debug.StopMovingOrSizing)
ILW_Debug.text = ILW_Debug:CreateFontString(nil, nil, "GameFontNormal")
ILW_Debug.text:SetPoint("topleft", 10, -10)
ILW_Debug.text:SetJustifyH("left")
ILW_Debug:SetWidth(200)
ILW_Debug:SetHeight(ILW_Debug.text:GetStringHeight()+20)
ILW_Debug:SetClampedToScreen(true)
ILW_Debug:SetScript("OnUpdate", function(self,elapsed) 
	_updateTimer = _updateTimer + elapsed
	if _updateTimer >= 0.5 then
		debug_updatext()
		_updateTimer = 0
	end
	end)
ILW_Debug:Show()


local L_ILW_Debug_MoveButton = CreateFrame("Button", "ILW_Debug_MoveButton", ILW_Debug)
ILW_Debug_MoveButton:SetWidth(8)
ILW_Debug_MoveButton:SetHeight(8)
ILW_Debug_MoveButton:SetPoint("topright", ILW_Debug, "topright", -5, -5)
ILW_Debug_MoveButton:Show()
ILW_Debug_MoveButton.tex = ILW_Debug_MoveButton:CreateTexture("ILW_Debug_MoveButton_Tex")
ILW_Debug_MoveButton.tex:SetTexture("Interface\\COMMON\\UI-ModelControlPanel")
ILW_Debug_MoveButton.tex:SetPoint("center", ILW_Debug_MoveButton)
ILW_Debug_MoveButton.tex:SetTexCoord(18/64, 36/64, 37/128, 53/128)
ILW_Debug_MoveButton.tex:SetSize(8,8)
ILW_Debug_MoveButton.tex:SetVertexColor(.8, .8, .8 ) 



ILW_Debug_MoveButton:SetScript("OnClick",  function() 
	DebugToggleLockbutton()
	
end)
ILW_Debug_MoveButton:SetScript("OnEnter",  function() 
	ILW_Debug_MoveButton.tex:SetVertexColor(1, 1, 1 )
	
end)
end