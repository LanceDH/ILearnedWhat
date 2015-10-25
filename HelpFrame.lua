
local addonName, _addonData = ...;

local _help = _addonData.help;

local HELP_BUTTON_NORMAL_SIZE = 46;

--[[
local UnlockContainer_HelpPlate = {
	FramePos = { x = 5,	y = -22 },
	FrameSize = { width = 440, height = 500	},
	[1] = { ButtonPos = { x = 190,	y = -70},	HighLightBox = { x = 15, y = -65, width = 410, height = 420 },	ToolTipDir = "DOWN",	ToolTipText = HELP_INFO },
}
]]--

local function ShowTooltip()
	ILW_HelpFrame.Tooltip:Show();
	ILW_HelpFrame.Box:Hide();
	ILW_HelpFrame.GlowFrame:Show();
end

local function HideTooltip()
	ILW_HelpFrame.Tooltip:Hide();
	ILW_HelpFrame.Box:Show();
	ILW_HelpFrame.GlowFrame:Hide();
end

local function CreateButtonAnimation(self)
	self.animGroup_Show = self:CreateAnimationGroup();
	self.animGroup_Show.translate = self.animGroup_Show:CreateAnimation("Translation");
	self.animGroup_Show.translate:SetSmoothing("IN");
	self.animGroup_Show.alpha = self.animGroup_Show:CreateAnimation("Alpha");
	self.animGroup_Show.alpha:SetChange(-1);
	self.animGroup_Show.alpha:SetSmoothing("IN");
	self.animGroup_Show.parent = self;
end

local function ShowButtonAnimation(self)
	if self.animGroup_Show == nil then
		CreateButtonAnimation(self)
	end
	local point, relative, relPoint, xOff, yOff = self:GetPoint();
	self.animGroup_Show.translate:SetOffset( (-1*xOff), (-1*yOff) );
	self.animGroup_Show.translate:SetDuration(0.5);
	self.animGroup_Show.alpha:SetDuration(0.5);
	self.animGroup_Show:Play(true);
end

function _help:Initialise(parent, data)
	ILW_HelpFrame:SetParent(parent);
	ILW_HelpFrame:ClearAllPoints();
	ILW_HelpFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", data.FramePos.x, data.FramePos.y);
	ILW_HelpFrame:SetSize(data.FrameSize.width, data.FrameSize.height);

	local subData = data[1];
	ILW_HelpFrame.Box:ClearAllPoints();
	ILW_HelpFrame.Box:SetPoint("TOPLEFT", parent, "TOPLEFT", subData.HighLightBox.x, subData.HighLightBox.y);
	ILW_HelpFrame.Box:SetSize(subData.HighLightBox.width, subData.HighLightBox.height);
	
	ILW_HelpFrame.GlowFrame:ClearAllPoints();
	ILW_HelpFrame.GlowFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", subData.HighLightBox.x, subData.HighLightBox.y);
	ILW_HelpFrame.GlowFrame:SetSize(subData.HighLightBox.width, subData.HighLightBox.height);
	
	ILW_HelpFrame.Button:ClearAllPoints();
	ILW_HelpFrame.Button:SetPoint("TOPLEFT", parent, "TOPLEFT", subData.ButtonPos.x, subData.ButtonPos.y);
	ILW_HelpFrame.Button:SetSize(HELP_BUTTON_NORMAL_SIZE, HELP_BUTTON_NORMAL_SIZE);
	--ILW_HelpFrame.Button:SetScript("OnShow", function(self) Button_Onload(self) end);
	ILW_HelpFrame.Button:SetScript("OnShow", function(self) ShowButtonAnimation(self) end);
	ILW_HelpFrame.Button:SetScript("OnEnter", ShowTooltip);
	ILW_HelpFrame.Button:SetScript("OnLeave", HideTooltip);
	
	local tt = ILW_HelpFrame.Tooltip;
	tt:ClearAllPoints();
	tt:SetPoint("TOP", ILW_HelpFrame.Button, "BOTTOM", 0, -10);
	tt.Text:SetText(subData.ToolTipText);
	ILW_HelpFrame.Tooltip:SetHeight(tt.Text:GetHeight()+20);
	
end

function _help:ShowTutorial()

	ILW_HelpFrame:Show();

end

function _help:HideTutorial()
	ILW_HelpFrame:Hide();
end

--[[

local function _help:HelpPlate_GetButton()
	local frame;
	local i = 1;
	for i=1, #HELP_PLATE_BUTTONS do
		local button = HELP_PLATE_BUTTONS[i];
		if ( not button:IsShown() ) then
			frame = button;
			break;
		end
	end

	if ( not frame ) then
		frame = CreateFrame( "Button", nil, HelpPlate, "HelpPlateButton" );
		frame.box = CreateFrame( "Frame", nil, HelpPlate, "HelpPlateBox" );
		frame.boxHighlight = CreateFrame( "Frame", nil, HelpPlate, "HelpPlateBoxHighlight" );
		table.insert( HELP_PLATE_BUTTONS, frame );
	end
	frame.tooltipDir = "RIGHT";
	frame:SetSize(HELP_BUTTON_NORMAL_SIZE, HELP_BUTTON_NORMAL_SIZE);

	return frame;
end

local function _help:HelpPlateBox_OnLoad(self)
	for i=1, #self.Textures do
		self.Textures[i]:SetVertexColor( 1, 0.82, 0 );
	end
end

local HELP_PLATE_CURRENT_PLATE = nil;
local function _help:HelpPlate_Show( self, parent, mainHelpButton, userToggled )
	if ( HELP_PLATE_CURRENT_PLATE ) then
		HelpPlate_Hide();
	end

	HELP_PLATE_CURRENT_PLATE = self;
	HELP_PLATE_CURRENT_PLATE.mainHelpButton = mainHelpButton;
	for i = 1, #self do
		if ( not self[i].MinLevel or (UnitLevel("player") >= self[i].MinLevel) ) then
			local button = HelpPlate_GetButton();
			button:ClearAllPoints();
			button:SetPoint( "TOPLEFT", HelpPlate, "TOPLEFT", self[i].ButtonPos.x, self[i].ButtonPos.y );
			button.tooltipDir = self[i].ToolTipDir;
			button.toolTipText = self[i].ToolTipText;
			button.viewed = false;
			button:Show();
			if ( not userToggled ) then
				button.BigI:Show();
				button.Ring:Show();
				button.Pulse:Play();
			else
				button.BigI:Hide();
				button.Ring:Hide();
				button.Pulse:Stop();
			end
			
			button.box:ClearAllPoints();
			button.box:SetSize( self[i].HighLightBox.width, self[i].HighLightBox.height );
			button.box:SetPoint( "TOPLEFT", HelpPlate, "TOPLEFT", self[i].HighLightBox.x, self[i].HighLightBox.y );
			button.box:Show();
			
			button.boxHighlight:ClearAllPoints();
			button.boxHighlight:SetSize( self[i].HighLightBox.width, self[i].HighLightBox.height );
			button.boxHighlight:SetPoint( "TOPLEFT", HelpPlate, "TOPLEFT", self[i].HighLightBox.x, self[i].HighLightBox.y );
			button.boxHighlight:Hide();
		end
	end
	HelpPlate:SetPoint( "TOPLEFT", parent, "TOPLEFT", self.FramePos.x, self.FramePos.y );
	HelpPlate:SetSize( self.FrameSize.width, self.FrameSize.height );
	HelpPlate.userToggled = userToggled;
	HelpPlate:Show();
end

local function _help:HelpPlate_Hide(userToggled)
	if (not userToggled) then
		for i = 1, #HELP_PLATE_BUTTONS do
			local button = HELP_PLATE_BUTTONS[i];
			button.tooltipDir = "RIGHT";
			button.box:Hide();
			button:Hide();
		end
		HELP_PLATE_CURRENT_PLATE = nil;
		HelpPlate:Hide();
		return
	end

	-- else animate out
	-- look in HelpPlate_Button_AnimGroup_Show_OnFinished for final cleanup code
	if ( HELP_PLATE_CURRENT_PLATE ) then
		for i = 1, #HELP_PLATE_BUTTONS do
			local button = HELP_PLATE_BUTTONS[i];
			button.tooltipDir = "RIGHT";
			if ( button:IsShown() ) then
				if ( button.animGroup_Show:IsPlaying() ) then
					button.animGroup_Show:Stop();
				end
				button.animGroup_Show:SetScript("OnFinished", HelpPlate_Button_AnimGroup_Show_OnFinished);
				button.animGroup_Show.translate:SetDuration(0.3);
				button.animGroup_Show.alpha:SetDuration(0.3);
				button.animGroup_Show:Play();
			end
		end
	end
end

local function _help:HelpPlate_IsShowing(plate)
	return (HELP_PLATE_CURRENT_PLATE == plate);
end

local function _help:Main_HelpPlate_Button_OnEnter(self)
	HelpPlateTooltip.ArrowRIGHT:Show();
	HelpPlateTooltip.ArrowGlowRIGHT:Show();
	HelpPlateTooltip:SetPoint("LEFT", self, "RIGHT", 10, 0);
	HelpPlateTooltip.Text:SetText(MAIN_HELP_BUTTON_TOOLTIP)
	HelpPlateTooltip:Show();
end

local function _help:Main_HelpPlate_Button_OnLeave(self)
	HelpPlateTooltip.ArrowRIGHT:Hide();
	HelpPlateTooltip.ArrowGlowRIGHT:Hide();
	HelpPlateTooltip:ClearAllPoints();
	HelpPlateTooltip:Hide();
end

local function _help:HelpPlate_Button_OnLoad(self)
	self.animGroup_Show = self:CreateAnimationGroup();
	self.animGroup_Show.translate = self.animGroup_Show:CreateAnimation("Translation");
	self.animGroup_Show.translate:SetSmoothing("IN");
	self.animGroup_Show.alpha = self.animGroup_Show:CreateAnimation("Alpha");
	self.animGroup_Show.alpha:SetChange(-1);
	self.animGroup_Show.alpha:SetSmoothing("IN");
	self.animGroup_Show.parent = self;
end

local function _help:HelpPlate_Button_AnimGroup_Show_OnFinished(self)
	-- hide the parent button
	self.parent:Hide();
	self:SetScript("OnFinished", nil);
	
	-- lets see if we can cleanup the help plate now.
	for i = 1, #HELP_PLATE_BUTTONS do
		local button = HELP_PLATE_BUTTONS[i];
		if ( button:IsShown() ) then
			return;
		end
	end

	-- we are done animating. lets hide everything
	for i = 1, #HELP_PLATE_BUTTONS do
		local button = HELP_PLATE_BUTTONS[i];
		button.box:Hide();
		button.boxHighlight:Hide();
	end

	HELP_PLATE_CURRENT_PLATE = nil;
	HelpPlate:Hide();
end

local function _help:HelpPlate_Button_OnShow(self)
	local point, relative, relPoint, xOff, yOff = self:GetPoint();
	self.animGroup_Show.translate:SetOffset( (-1*xOff), (-1*yOff) );
	self.animGroup_Show.translate:SetDuration(0.5);
	self.animGroup_Show.alpha:SetDuration(0.5);
	self.animGroup_Show:Play(true);
end

local function _help:HelpPlate_Button_OnEnter(self)
	HelpPlate_TooltipHide();

	if ( self.tooltipDir == "UP" ) then
		HelpPlateTooltip.ArrowUP:Show();
		HelpPlateTooltip.ArrowGlowUP:Show();
		HelpPlateTooltip:SetPoint("BOTTOM", self, "TOP", 0, 10);
	elseif ( self.tooltipDir == "DOWN" ) then
		HelpPlateTooltip.ArrowDOWN:Show();
		HelpPlateTooltip.ArrowGlowDOWN:Show();
		HelpPlateTooltip:SetPoint("TOP", self, "BOTTOM", 0, -10);
	elseif ( self.tooltipDir == "LEFT" ) then
		HelpPlateTooltip.ArrowLEFT:Show();
		HelpPlateTooltip.ArrowGlowLEFT:Show();
		HelpPlateTooltip:SetPoint("RIGHT", self, "LEFT", -10, 0);
	elseif ( self.tooltipDir == "RIGHT" ) then
		HelpPlateTooltip.ArrowRIGHT:Show();
		HelpPlateTooltip.ArrowGlowRIGHT:Show();
		HelpPlateTooltip:SetPoint("LEFT", self, "RIGHT", 10, 0);
	end
	HelpPlateTooltip.Text:SetText(self.toolTipText)
	HelpPlateTooltip:Show();
	self.box:Hide();
	self.boxHighlight:Show();
	self.Pulse:Stop();
	self.BigI:Hide();
	self.Ring:Hide();
end

local function _help:HelpPlate_Button_OnLeave(self)
	HelpPlate_TooltipHide();
	self.box:Show();
	self.boxHighlight:Hide();
	self.viewed = true;

	-- remind the player to use the main button to toggle the help plate
	-- but only if they didn't open it to begin with
	if ( not HelpPlate.userToggled ) then
		for i = 1, #HELP_PLATE_BUTTONS do
			local button = HELP_PLATE_BUTTONS[i];
			if ( button:IsShown() and not button.viewed ) then
				return;
			end
		end
		Main_HelpPlate_Button_OnEnter(HELP_PLATE_CURRENT_PLATE.mainHelpButton);
	end
end

local function _help:HelpPlate_TooltipHide()
	HelpPlateTooltip.ArrowUP:Hide();
	HelpPlateTooltip.ArrowGlowUP:Hide();
	HelpPlateTooltip.ArrowDOWN:Hide();
	HelpPlateTooltip.ArrowGlowDOWN:Hide();
	HelpPlateTooltip.ArrowLEFT:Hide();
	HelpPlateTooltip.ArrowGlowLEFT:Hide();
	HelpPlateTooltip.ArrowRIGHT:Hide();
	HelpPlateTooltip.ArrowGlowRIGHT:Hide();
	HelpPlateTooltip:ClearAllPoints();
	HelpPlateTooltip:Hide();
end

]]--