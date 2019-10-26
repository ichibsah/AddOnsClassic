
local function Tab_OnClick(self)
	local childs = {self:GetParent():GetChildren()};
	for c in pairs(childs) do
		if childs[c]:GetID() ~= 0 then
			childs[c].content:Hide();
		end
	end
	PanelTemplates_SetTab(self:GetParent(), self:GetID());	
	self.content:Show();
end

-- changes the text of the dropdown list's
local function LFGHelperDropList_OnClick(value, parent)
	UIDropDownMenu_SetText(parent, value);
	CloseDropDownMenus();
end

-- sets dropdown items
local function LFGHelperSetDropDownContent(content, droplist)
	UIDropDownMenu_Initialize(droplist, function(self, level, menuList)
		local info = UIDropDownMenu_CreateInfo();
		for i in pairs(content) do
			info.func = function() LFGHelperDropList_OnClick(content[i], droplist) end;
			info.text = content[i];
			UIDropDownMenu_AddButton(info);
		end
	end);
end

-- sets the dropdown items for dungeons and quests
local function LFGHelperDropDownMultiContent(content, droplist)
	UIDropDownMenu_Initialize(droplist, function(self, level, menuList)
		local info = UIDropDownMenu_CreateInfo();
		if level == 1 then
			info.text, info.hasArrow, info.menuList = "Dungeons & Raids", true, "Dungeons"
			UIDropDownMenu_AddButton(info)
			info.text, info.hasArrow, info.menuList = "Quests", true, "Quests"
			UIDropDownMenu_AddButton(info)
		elseif menuList == "Dungeons" then
			for c in pairs(content["dungeons"]) do
				info.text = content["dungeons"][c];
				info.func = function() LFGHelperDropList_OnClick(content["dungeons"][c], droplist) end;
				UIDropDownMenu_AddButton(info, level)
			end
		elseif menuList == "Quests" then
			for c in pairs(content["quests"]) do
				info.text = content["quests"][c];
				info.func = function() LFGHelperDropList_OnClick(content["quests"][c], droplist) end;
				UIDropDownMenu_AddButton(info, level)
			end
		end
	end);
end

-- loads the quests in a table
local function LFGHelper_GetQuests(Quests) 
	numEntries, numQuests = GetNumQuestLogEntries();
	for i = 1, numEntries, 1 do	
		questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily, questID = GetQuestLogTitle(i);
		if isHeader == false then
			-- print(questTitle);
			if questTag ~= nil then
				table.insert(Quests, "Quest: (" .. questTag .. ")" .. " " .. questTitle);
			else
				table.insert(Quests, "Quest: " .. questTitle);
			end
		end
	end
end

local function LFGHelper_GetQuests()
	local _quests = {};
	numEntries, numQuests = GetNumQuestLogEntries();
	for i = 1, numEntries, 1 do	
		questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily, questID = GetQuestLogTitle(i);
		if isHeader == false then
			-- print(questTitle);
			if questTag ~= nil then
				table.insert(_quests, "Quest: (" .. questTag .. ")" .. " " .. questTitle);
			else
				table.insert(_quests, "Quest: " .. questTitle);
			end
		end
	end
	
	return _quests;
end

-- loads the dungeons in a table
local function LFGHelper_GetDungeons(LFGDungeons)
	table.insert(LFGDungeons, "Dungeon: Ragefire Chasm");
	table.insert(LFGDungeons, "Dungeon: Wailing Caverns");
	table.insert(LFGDungeons, "Dungeon: The Deadmines");
	table.insert(LFGDungeons, "Dungeon: Shadowfang Keep");
	table.insert(LFGDungeons, "Dungeon: Blackfathom Deeps");
	table.insert(LFGDungeons, "Dungeon: The Stockade");
	table.insert(LFGDungeons, "Dungeon: Gnomeregan");
	table.insert(LFGDungeons, "Dungeon: Razorfen Kraul");
	table.insert(LFGDungeons, "Dungeon: Scarlet Monastery (Graveyard)");	
	table.insert(LFGDungeons, "Dungeon: Scarlet Monastery (Libary)");
	table.insert(LFGDungeons, "Dungeon: Scarlet Monastery (Armory)");
	table.insert(LFGDungeons, "Dungeon: Scarlet Monastery (Cathedral)");
	table.insert(LFGDungeons, "Dungeon: Razorfen Downs");
	table.insert(LFGDungeons, "Dungeon: Uldaman");
	table.insert(LFGDungeons, "Dungeon: Zul'Farrak");
	table.insert(LFGDungeons, "Dungeon: Maraudon");
	table.insert(LFGDungeons, "Dungeon: Temple of Atal'Hakkar");
	table.insert(LFGDungeons, "Dungeon: Blackrock Depths");
	table.insert(LFGDungeons, "Dungeon: Lower Blackrock Spire");
	table.insert(LFGDungeons, "Dungeon: Upper Blackrock Spire");
	table.insert(LFGDungeons, "Dungeon: Dire Maul");
	table.insert(LFGDungeons, "Dungeon: Scholomance");
	table.insert(LFGDungeons, "Dungeon: Stratholme (Living)");
	table.insert(LFGDungeons, "Dungeon: Stratholme (Undead)");
	table.insert(LFGDungeons, "Raid: Molten Core");
	table.insert(LFGDungeons, "Raid: Onyxia");
	table.insert(LFGDungeons, "Raid: Zul'Gurub");
	table.insert(LFGDungeons, "Raid: Ruins of Ahn'Qiraj");
	table.insert(LFGDungeons, "Raid: Blackwing Lair");
	table.insert(LFGDungeons, "Raid: Ahn'Qiraj");
	table.insert(LFGDungeons, "Raid: Naxxramas");
end

local function LFGHelper_GetDungeons()
	local _dungeons = {};
	table.insert(_dungeons, "Dungeon: Ragefire Chasm");
	table.insert(_dungeons, "Dungeon: Wailing Caverns");
	table.insert(_dungeons, "Dungeon: The Deadmines");
	table.insert(_dungeons, "Dungeon: Shadowfang Keep");
	table.insert(_dungeons, "Dungeon: Blackfathom Deeps");
	table.insert(_dungeons, "Dungeon: The Stockade");
	table.insert(_dungeons, "Dungeon: Gnomeregan");
	table.insert(_dungeons, "Dungeon: Razorfen Kraul");
	table.insert(_dungeons, "Dungeon: Scarlet Monastery (Graveyard)");	
	table.insert(_dungeons, "Dungeon: Scarlet Monastery (Libary)");
	table.insert(_dungeons, "Dungeon: Scarlet Monastery (Armory)");
	table.insert(_dungeons, "Dungeon: Scarlet Monastery (Cathedral)");
	table.insert(_dungeons, "Dungeon: Razorfen Downs");
	table.insert(_dungeons, "Dungeon: Uldaman");
	table.insert(_dungeons, "Dungeon: Zul'Farrak");
	table.insert(_dungeons, "Dungeon: Maraudon");
	table.insert(_dungeons, "Dungeon: Temple of Atal'Hakkar");
	table.insert(_dungeons, "Dungeon: Blackrock Depths");
	table.insert(_dungeons, "Dungeon: Lower Blackrock Spire");
	table.insert(_dungeons, "Dungeon: Upper Blackrock Spire");
	table.insert(_dungeons, "Dungeon: Dire Maul");
	table.insert(_dungeons, "Dungeon: Scholomance");
	table.insert(_dungeons, "Dungeon: Stratholme (Living)");
	table.insert(_dungeons, "Dungeon: Stratholme (Undead)");
	table.insert(_dungeons, "Raid: Molten Core");
	table.insert(_dungeons, "Raid: Onyxia");
	table.insert(_dungeons, "Raid: Zul'Gurub");
	table.insert(_dungeons, "Raid: Ruins of Ahn'Qiraj");
	table.insert(_dungeons, "Raid: Blackwing Lair");
	table.insert(_dungeons, "Raid: Ahn'Qiraj");
	table.insert(_dungeons, "Raid: Naxxramas");
	return _dungeons;
end


-- loads the chat channels in a table
local function LFGHelper_GetChanels(ChatChanel)
	local RawChatChanels = {GetChannelList()};
	local ServerChanel = {EnumerateServerChannels()};

	for i in pairs(ServerChanel) do 
			table.insert(ChatChanel, ServerChanel[i]);
	end
	for i = 1, getn(RawChatChanels) / 3, 1 do
		table.insert(ChatChanel, RawChatChanels[i * 3 + 2]);
	end
end

local function LFGHelper_GetChanels()
	local _channel = {};
	local RawChatChanels = {GetChannelList()};
	local ServerChanel = {EnumerateServerChannels()};

	for i in pairs(ServerChanel) do 
			table.insert(_channel, ServerChanel[i]);
	end
	for i = 1, getn(RawChatChanels) / 3, 1 do
		table.insert(_channel, RawChatChanels[i * 3 + 2]);
	end
	
	return _channel;
end

local ChatChanel = {};
local LFGDungeons = {};
local Quests = {}
local MultiMenuDropDownContent = {};



local LFGMemberCountContent = {};
for i = 1, 40, 1 do
	table.insert(LFGMemberCountContent, i);
end

-- Create Frame UIPanelDialogTemplate
local LFG_MainFrame = CreateFrame("Frame", "LFG_MainFrame", UIParent, "BasicFrameTemplateWithInset");
LFG_MainFrame:SetSize(400,550);
LFG_MainFrame:SetPoint("TOPLEFT", 100, -100);
LFG_MainFrame:SetFrameStrata("HIGH");
LFG_MainFrame:RegisterEvent("ADDON_LOADED");
LFG_MainFrame:RegisterEvent("PLAYER_LOGOUT");
LFG_MainFrame:RegisterEvent("CHAT_MSG_CHANNEL");
LFG_MainFrame.numTabs  = 3;
LFG_MainFrame.text = LFG_MainFrame:CreateFontString(nil,"ARTWORK","GameFontHighlight");
LFG_MainFrame.text:SetPoint("TOPLEFT", 30, -5);
LFG_MainFrame.text:SetText("LFG Helper");
LFG_MainFrame:Hide();

-----------------------------------------------------------------------------------------------------------------------------------------
-- LF Member tab content
-----------------------------------------------------------------------------------------------------------------------------------------
local LFG_TAB_1 = CreateFrame("Button", "LFG_MainFrameTab1", LFG_MainFrame, "CharacterFrameTabButtonTemplate");
LFG_TAB_1:SetText("LF Member");
LFG_TAB_1:SetID(1);
LFG_TAB_1:SetPoint("BOTTOMLEFT", 10, -30);
LFG_TAB_1:SetScript("OnClick", Tab_OnClick);
LFG_TAB_1.content = CreateFrame("Frame", nil, LFG_MainFrame);
LFG_TAB_1.content:SetSize(400, 550);
LFG_TAB_1.content:SetPoint("CENTER");
-- LFG_TAB_1.content:Hide();
	

local LFG_Dungeon_Label = CreateFrame('SimpleHTML', 'LFG_Dungeon_Label', LFG_TAB_1.content);
LFG_Dungeon_Label:SetPoint("TOPLEFT", 30, -50);
LFG_Dungeon_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
LFG_Dungeon_Label:SetSize(200, 30);
LFG_Dungeon_Label:SetText("<html><body><p>Looking for Dungeon:</p></body></html>");
LFG_Dungeon_Label:SetTextColor(244,220,0,1);

local LFG_Dungeon_DropDown = CreateFrame("FRAME", "LFG_Dungeon_DropDown", LFG_TAB_1.content, "UIDropDownMenuTemplate")
LFG_Dungeon_DropDown:SetPoint("TOPLEFT", 5, -65)
UIDropDownMenu_SetWidth(LFG_Dungeon_DropDown, 150)
UIDropDownMenu_SetText(LFG_Dungeon_DropDown, "Dungeon & Raids")

local LFG_MemberCount_Label = CreateFrame('SimpleHTML', 'LFG_MemberCount_Label', LFG_TAB_1.content);
LFG_MemberCount_Label:SetPoint("TOPLEFT", 210, -50);
LFG_MemberCount_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
LFG_MemberCount_Label:SetSize(200, 30);
LFG_MemberCount_Label:SetText("<html><body><p>Member Count</p></body></html>");
LFG_MemberCount_Label:SetTextColor(244,220,0,1);

local LFG_Member_Count_DropDown = CreateFrame("FRAME", "LFG_Member_Count_DropDown", LFG_TAB_1.content, "UIDropDownMenuTemplate")
LFG_Member_Count_DropDown:SetPoint("TOPLEFT", 185, -65)
UIDropDownMenu_SetWidth(LFG_Member_Count_DropDown, 150)
UIDropDownMenu_SetText(LFG_Member_Count_DropDown, "Member Count")
LFGHelperSetDropDownContent(LFGMemberCountContent, LFG_Member_Count_DropDown);

local LFG_Prefix_Label = CreateFrame('SimpleHTML', 'LFG_Prefix_Label', LFG_TAB_1.content);
LFG_Prefix_Label:SetPoint("TOPLEFT", 30, -100);
LFG_Prefix_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
LFG_Prefix_Label:SetSize(200, 30);
LFG_Prefix_Label:SetText("<html><body><p>Message Prefix</p></body></html>");
LFG_Prefix_Label:SetTextColor(244,220,0,1);

local LFG_Prefix_EditBox = CreateFrame("EditBox", "LFG_Prefix_EditBox", LFG_TAB_1.content, "InputBoxTemplate");
LFG_Prefix_EditBox:SetPoint("TOPLEFT", 30, -115);
LFG_Prefix_EditBox:SetSize(160, 30);
LFG_Prefix_EditBox:SetText("");
LFG_Prefix_EditBox:SetAutoFocus(false);

local LFG_Postfix_Label = CreateFrame('SimpleHTML', 'LFG_Postfix_Label', LFG_TAB_1.content);
LFG_Postfix_Label:SetPoint("TOPLEFT", 210, -100);
LFG_Postfix_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
LFG_Postfix_Label:SetSize(200, 30);
LFG_Postfix_Label:SetText("<html><body><p>Message Postfix</p></body></html>");
LFG_Postfix_Label:SetTextColor(244,220,0,1);

local LFG_Postfix_EditBox = CreateFrame("EditBox", "LFG_Postfix_EditBox", LFG_TAB_1.content, "InputBoxTemplate");
LFG_Postfix_EditBox:SetPoint("TOPLEFT", 210, - 115);
LFG_Postfix_EditBox:SetSize(160, 30);
LFG_Postfix_EditBox:SetText("");
LFG_Postfix_EditBox:SetAutoFocus(false);

local LFG_COMB_Label = CreateFrame('SimpleHTML', 'LFG_COMB_Label', LFG_TAB_1.content);
LFG_COMB_Label:SetPoint("TOPLEFT", 30, -150);
LFG_COMB_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
LFG_COMB_Label:SetSize(200, 30);
LFG_COMB_Label:SetText("<html><body><p>Comb / Midcontent Text</p></body></html>");
LFG_COMB_Label:SetTextColor(244,220,0,1);

local LFG_COMB_EditBox = CreateFrame("EditBox", "LFG_COMB_EditBox", LFG_TAB_1.content, "InputBoxTemplate");
LFG_COMB_EditBox:SetPoint("TOPLEFT", 30, -165);
LFG_COMB_EditBox:SetSize(340, 30);
LFG_COMB_EditBox:SetText("");
LFG_COMB_EditBox:SetAutoFocus(false);

local LFG_Class_Selection = CreateFrame("Frame", "LFG_Class_Selection", LFG_TAB_1.content ,"TranslucentFrameTemplate");
LFG_Class_Selection:SetSize(355, 300);
LFG_Class_Selection:SetPoint("TOPLEFT", 20, -200);


local LFG_Class_Warrior = CreateFrame("CheckButton", "LFG_Class_Warrior", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Class_Warrior:SetPoint("TOPLEFT", 30, - 25);
LFG_Class_Warrior.text:SetText("Warrior");

local LFG_Class_Mage = CreateFrame("CheckButton", "LFG_Class_Mage", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Class_Mage:SetPoint("TOPLEFT", 210, - 25);
LFG_Class_Mage.text:SetText("Mage");

local LFG_Class_Priest = CreateFrame("CheckButton", "LFG_Class_Priest", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Class_Priest:SetPoint("TOPLEFT", 30, - 55);
LFG_Class_Priest.text:SetText("Priest");

local LFG_Class_Warlock = CreateFrame("CheckButton", "LFG_Class_Mage", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Class_Warlock:SetPoint("TOPLEFT", 210, - 55);
LFG_Class_Warlock.text:SetText("Warlock");

local LFG_Class_Rogue = CreateFrame("CheckButton", "LFG_Class_Rogue", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Class_Rogue:SetPoint("TOPLEFT", 30, - 85);
LFG_Class_Rogue.text:SetText("Rogue");

local LFG_Class_Druid = CreateFrame("CheckButton", "LFG_Class_Druid", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Class_Druid:SetPoint("TOPLEFT", 210, - 85);
LFG_Class_Druid.text:SetText("Druid");

local LFG_Class_Paladin = CreateFrame("CheckButton", "LFG_Class_Paladin", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Class_Paladin:SetPoint("TOPLEFT", 30, - 115);
LFG_Class_Paladin.text:SetText("Paladin");

local LFG_Class_Shaman = CreateFrame("CheckButton", "LFG_Class_Shaman", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Class_Shaman:SetPoint("TOPLEFT", 210, - 115);
LFG_Class_Shaman.text:SetText("Shaman");

local LFG_Class_Hunter = CreateFrame("CheckButton", "LFG_Class_Hunter", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Class_Hunter:SetPoint("TOPLEFT", 30, - 145);
LFG_Class_Hunter.text:SetText("Hunter");

local LFG_Class_ALL = CreateFrame("CheckButton", "LFG_Class_ALL", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Class_ALL:SetPoint("TOPLEFT", 210, - 145);
LFG_Class_ALL.text:SetText("All Classes");

local LFG_Tank = CreateFrame("CheckButton", "LFG_Tank", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Tank:SetPoint("TOPLEFT", 30, - 200);
LFG_Tank.text:SetText("Tank");

local LFG_Heal = CreateFrame("CheckButton", "LFG_Heal", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_Heal:SetPoint("TOPLEFT", 210, -200);
LFG_Heal.text:SetText("Heal");

local LFG_DPS = CreateFrame("CheckButton", "LFG_DPS", LFG_Class_Selection, "UICheckButtonTemplate");
LFG_DPS:SetPoint("TOPLEFT", 30, - 230);
LFG_DPS.text:SetText("DPS");


local LFG_Post_Button = CreateFrame("Button", "LFG_Post_Button", LFG_TAB_1.content, "UIPanelButtonTemplate");
LFG_Post_Button:SetText("Post Message");
LFG_Post_Button:SetSize(150, 30);
LFG_Post_Button:SetPoint("BOTTOMLEFT", 210, 20);
LFG_Post_Button:SetScript("OnClick", function() LFG_PostBtn_OnClick() end);

local LFG_ChatChanel_DropDown = CreateFrame("FRAME", "LFG_Dungeon_DropDown", LFG_TAB_1.content, "UIDropDownMenuTemplate")
LFG_ChatChanel_DropDown:SetPoint("BOTTOMLEFT", 10, 15)
UIDropDownMenu_SetWidth(LFG_ChatChanel_DropDown, 155)
UIDropDownMenu_SetText(LFG_ChatChanel_DropDown, "Chat Channel")

function LFG_PostBtn_OnClick() 
	local ClassesString = "";
	
	if LFG_Class_ALL:GetChecked() then
		ClassesString = ClassesString .. "All Classes";
	else
		if LFG_Class_Warrior:GetChecked() then
			ClassesString = ClassesString .. " Warrior,";
		end
	
		if LFG_Class_Mage:GetChecked() then
			ClassesString = ClassesString .. " Mage,";
		end
	
		if LFG_Class_Priest:GetChecked() then
			ClassesString = ClassesString .. " Priest,";
		end
	
		if LFG_Class_Warlock:GetChecked() then
			ClassesString = ClassesString .. " Warlock,";
		end
	
		if LFG_Class_Rogue:GetChecked() then
			ClassesString = ClassesString .. " Rogue,";
		end
	
		if LFG_Class_Druid:GetChecked() then
			ClassesString = ClassesString .. " Druid,";
		end
	
		if LFG_Class_Paladin:GetChecked() then
			ClassesString = ClassesString .. " Paladin,";
		end
	
		if LFG_Class_Shaman:GetChecked() then
			ClassesString = ClassesString .. " Shaman,";
		end
	
		if LFG_Class_Hunter:GetChecked() then
			ClassesString = ClassesString .. " Hunter,";
		end
		
		ClassesString = ClassesString:sub(1, -2)
		ClassesString = string.sub(ClassesString, 2)
	end
	
	local rollestr = "";
	
	if LFG_Tank:GetChecked() then
		rollestr = rollestr .. " Tank,"
	end
	
	if LFG_Heal:GetChecked() then
		rollestr = rollestr .. " Heal,"
	end

	if LFG_DPS:GetChecked() then
		rollestr = rollestr .. " DPS,"
	end
	
	rollestr = rollestr:sub(1, -2)
	
	local String = LFG_Prefix_EditBox:GetText() .. " LF" .. UIDropDownMenu_GetText(LFG_Member_Count_DropDown) .. "M " .. LFG_COMB_EditBox:GetText() .. " \"" .. UIDropDownMenu_GetText(LFG_Dungeon_DropDown) .. "\"" .. rollestr .. " pref: (" .. ClassesString .. ") " .. LFG_Postfix_EditBox:GetText();
	local index = GetChannelName(UIDropDownMenu_GetText(LFG_ChatChanel_DropDown));
	SendChatMessage(String ,"CHANNEL" ,nil , index);
	-- print(String);
	
	LFGHelper_Save();
		
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- LF Group tab content
-----------------------------------------------------------------------------------------------------------------------------------------
local LFG_TAB_2 = CreateFrame("Button", "LFG_MainFrameTab2", LFG_MainFrame, "CharacterFrameTabButtonTemplate");
LFG_TAB_2:SetText("LF Group");
LFG_TAB_2:SetID(2);
LFG_TAB_2:SetPoint("BOTTOMLEFT", 100, -30);
LFG_TAB_2:SetScript("OnClick", Tab_OnClick);
LFG_TAB_2.content = CreateFrame("Frame", nil, LFG_MainFrame);
LFG_TAB_2.content:SetSize(400, 550);
LFG_TAB_2.content:SetPoint("CENTER");
LFG_TAB_2.content:Hide();


local LFM_Dungeon_Label = CreateFrame('SimpleHTML', 'LFM_Dungeon_Label', LFG_TAB_2.content);
LFM_Dungeon_Label:SetPoint("TOPLEFT", 30, -50);
LFM_Dungeon_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
LFM_Dungeon_Label:SetSize(200, 30);
LFM_Dungeon_Label:SetText("<html><body><p>Looking for Dungeon:</p></body></html>");
LFM_Dungeon_Label:SetTextColor(244,220,0,1);

local LFM_Dungeon_DropDown = CreateFrame("FRAME", "LFM_Dungeon_DropDown", LFG_TAB_2.content, "UIDropDownMenuTemplate")
LFM_Dungeon_DropDown:SetPoint("TOPLEFT", 5, -65)
UIDropDownMenu_SetWidth(LFM_Dungeon_DropDown, 340)
UIDropDownMenu_SetText(LFM_Dungeon_DropDown, "Dungeon & Raids")

local LFM_Prefix_Label = CreateFrame('SimpleHTML', 'LFM_Prefix_Label', LFG_TAB_2.content);
LFM_Prefix_Label:SetPoint("TOPLEFT", 30, -115);
LFM_Prefix_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
LFM_Prefix_Label:SetSize(200, 30);
LFM_Prefix_Label:SetText("<html><body><p>Message Prefix</p></body></html>");
LFM_Prefix_Label:SetTextColor(244,220,0,1);

local LFM_Prefix_EditBox = CreateFrame("EditBox", "LFM_Prefix_EditBox", LFG_TAB_2.content, "InputBoxTemplate");
LFM_Prefix_EditBox:SetPoint("TOPLEFT", 30, - 130);
LFM_Prefix_EditBox:SetSize(160, 30);
LFM_Prefix_EditBox:SetText("");
LFM_Prefix_EditBox:SetAutoFocus(false);

local LFM_Postfix_Label = CreateFrame('SimpleHTML', 'LFM_Postfix_Label', LFG_TAB_2.content);
LFM_Postfix_Label:SetPoint("TOPLEFT", 210, -115);
LFM_Postfix_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
LFM_Postfix_Label:SetSize(200, 30);
LFM_Postfix_Label:SetText("<html><body><p>Message Postfix</p></body></html>");
LFM_Postfix_Label:SetTextColor(244,220,0,1);

local LFM_Postfix_EditBox = CreateFrame("EditBox", "LFM_Postfix_EditBox", LFG_TAB_2.content, "InputBoxTemplate");
LFM_Postfix_EditBox:SetPoint("TOPLEFT", 210, - 130);
LFM_Postfix_EditBox:SetSize(160, 30);
LFM_Postfix_EditBox:SetText("");
LFM_Postfix_EditBox:SetAutoFocus(false);

local LFM_COMB_Label = CreateFrame('SimpleHTML', 'LFM_COMB_Label', LFG_TAB_2.content);
LFM_COMB_Label:SetPoint("TOPLEFT", 30, -165);
LFM_COMB_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
LFM_COMB_Label:SetSize(200, 30);
LFM_COMB_Label:SetText("<html><body><p>Comb / Midcontent Text</p></body></html>");
LFM_COMB_Label:SetTextColor(244,220,0,1);

local LFM_COMB_EditBox = CreateFrame("EditBox", "LFM_COMB_EditBox", LFG_TAB_2.content, "InputBoxTemplate");
LFM_COMB_EditBox:SetPoint("TOPLEFT", 30, -180);
LFM_COMB_EditBox:SetSize(340, 30);
LFM_COMB_EditBox:SetText("");
LFM_COMB_EditBox:SetAutoFocus(false);

local LFM_Post_Button = CreateFrame("Button", "LFM_Post_Button", LFG_TAB_2.content, "UIPanelButtonTemplate");
LFM_Post_Button:SetText("Post Message");
LFM_Post_Button:SetSize(150, 30);
LFM_Post_Button:SetPoint("BOTTOMLEFT", 210, 20);
LFM_Post_Button:SetScript("OnClick", function() LFM_PostBtn_OnClick() end);

local LFM_ChatChanel_DropDown = CreateFrame("FRAME", "LFM_ChatChanel_DropDown", LFG_TAB_2.content, "UIDropDownMenuTemplate")
LFM_ChatChanel_DropDown:SetPoint("BOTTOMLEFT", 10, 15)
UIDropDownMenu_SetWidth(LFM_ChatChanel_DropDown, 155)
UIDropDownMenu_SetText(LFM_ChatChanel_DropDown, "Chat Channel")

function LFM_PostBtn_OnClick() 
	level = UnitLevel("player");
	localizedClass, englishClass, classIndex = UnitClass("player");
	local String = "";
	
	if LFM_Prefix_EditBox:GetText() ~= "" then
		String = String .. LFM_Prefix_EditBox:GetText() .. " ";
	end
	
	String = String .. englishClass .. " LEVEL " .. level .. " LFG ";
	
	if LFM_COMB_EditBox:GetText() ~= "" then
		String = String .. LFM_COMB_EditBox:GetText() .. " ";
	end
	
	String = String .. UIDropDownMenu_GetText(LFM_Dungeon_DropDown) .. " ";
	
	if LFM_Postfix_EditBox:GetText() ~= "" then
		String = String .. LFM_Postfix_EditBox:GetText();
	end
	
	local index = GetChannelName(UIDropDownMenu_GetText(LFM_ChatChanel_DropDown));
	SendChatMessage(String ,"CHANNEL" ,nil , index);
	
	-- print(String);
	LFGHelper_Save();
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- Notifications tab
-----------------------------------------------------------------------------------------------------------------------------------------
local LFG_TAB_3 = CreateFrame("Button", "LFG_MainFrameTab3", LFG_MainFrame, "CharacterFrameTabButtonTemplate");
LFG_TAB_3:SetText("Notifications");
LFG_TAB_3:SetID(3);
LFG_TAB_3:SetPoint("BOTTOMLEFT", 180, -30);
LFG_TAB_3:SetScript("OnClick", Tab_OnClick);
LFG_TAB_3.content = CreateFrame("Frame", nil, LFG_MainFrame);
LFG_TAB_3.content:SetSize(400, 550);
LFG_TAB_3.content:SetPoint("CENTER");
LFG_TAB_3.content:Hide();

local LFG_NotificationFrame = CreateFrame("ScrollFrame", nil, UIParent, "UIPanelScrollFrameTemplate");
LFG_NotificationFrame:SetPoint("TOPRIGHT", -100, -200)
LFG_NotificationFrame:SetSize(320, 600);

local LFG_NotificationFrame_ScrollChild = CreateFrame("Frame", nil, LFG_NotificationFrame);
LFG_NotificationFrame_ScrollChild:SetSize(320, 600);
LFG_NotificationFrame_ScrollChild:SetPoint("TOPLEFT");
LFG_NotificationFrame:SetScrollChild(LFG_NotificationFrame_ScrollChild);
LFG_NotificationFrame:SetClipsChildren(true);

local LFG_Notification_TestBtn = CreateFrame("Button", nil, LFG_TAB_3.content, "UIPanelButtonTemplate");
LFG_Notification_TestBtn:SetPoint("TOPLEFT", 220, -30);
LFG_Notification_TestBtn:SetSize(170, 30);
LFG_Notification_TestBtn:SetText("Create Test Notification");
LFG_Notification_TestBtn:SetScript("OnClick", function() LFG_createNotification(LFG_NotificationFrame_ScrollChild, "Example Headline", 4, "Testuser"); end);

local LFG_Notification_EnableBtn = CreateFrame("CheckButton", "LFG_Notification_EnableBtn", LFG_TAB_3.content, "UICheckButtonTemplate");
LFG_Notification_EnableBtn:SetPoint("TOPLEFT", 20, -30);
LFG_Notification_EnableBtn.text:SetText("Enable Notification's (beta)");
LFG_Notification_EnableBtn:SetScript("OnClick", function() LFGHelper_Save(); end);

local frames = {};
function LFG_createNotification(parent, headline, mCount, author)
	local NotificationFrame = CreateFrame("Frame", nil, parent, "GlowBoxTemplate");
	NotificationFrame:SetSize(290, 100);
	local ticker = C_Timer.NewTicker(10, function() LFG_CloseNotification(NotificationFrame); end)
	local frameTable = {NotificationFrame, true};
	
	local NotificationHeadline = CreateFrame("SimpleHTML", nil, NotificationFrame);
	NotificationHeadline:SetPoint("TOPLEFT", 10, -10);
	NotificationHeadline:SetFont('Fonts\\FRIZQT__.TTF', 12);
	NotificationHeadline:SetSize(200, 30);
	NotificationHeadline:SetText("<html><body><h1>[+".. mCount .. "] ".. headline .. "</h1></body></html>");
	NotificationHeadline:SetTextColor(244,220,0,1);
	
	local NotificationAuthor = CreateFrame("SimpleHTML", nil, NotificationFrame);
	NotificationAuthor:SetPoint("TOPLEFT", 10, -30);
	NotificationAuthor:SetFont('Fonts\\FRIZQT__.TTF', 10);
	NotificationAuthor:SetSize(200, 30);
	NotificationAuthor:SetText("<html><body><h1>Leader: " .. author .. "</h1></body></html>");
	
	local NotificationApplyBtn = CreateFrame("Button", nil, NotificationFrame, "UIPanelButtonTemplate");
	NotificationApplyBtn:SetPoint("CENTER", 0, -25);
	NotificationApplyBtn:SetSize(120, 30);
	NotificationApplyBtn:SetText("Apply");
	NotificationApplyBtn:SetScript("OnClick", function() LFG_NoificationApply(author, headline); end);
	
	table.insert(frames, frameTable);
	LFG_createNotificationList();
end

function LFG_CloseNotification(frame)
	for i in pairs(frames) do 
		if frames[i][1] == frame then
			frames[i][2] = false;
		end
	end
	LFG_createNotificationList();
end

function LFG_createNotificationList()
	local itemCount = 0;
	for i in pairs(frames) do
		if frames[i][2] == true then
			frames[i][1]:SetPoint("TOPLEFT", 0, -(itemCount * 100) - (itemCount * 15));
			itemCount = itemCount + 1;
		else
			frames[i][1]:Hide();
		end
	end
end

function LFG_NoificationApply(groupLeader, headline)
	local level = UnitLevel("player");
	local localizedClass, englishClass, classIndex = UnitClass("player");
	local message = "Hello, " .. englishClass .. " [" .. level .. "] want join your group for " .. headline;
	
	SendChatMessage(message, "WHISPER", "Common", groupLeader);
end

function LFG_ParseNotification(author, msg)
	mCount = string.match(msg, "LF(%d+)M");
	dungeon = string.match(msg, '"(.+)"');
	
	if mCount ~= nil and dungeon ~= nil then
		LFG_createNotification(LFG_NotificationFrame_ScrollChild, dungeon, mCount, author);
	end	
end

function LFGHelper_Save()
	LFG_Text_Values = {};
	LFG_Text_Values["Dungeon"] = UIDropDownMenu_GetText(LFG_Dungeon_DropDown);
	LFG_Text_Values["MemberCount"] = UIDropDownMenu_GetText(LFG_Member_Count_DropDown);
	LFG_Text_Values["Prefix"] = LFG_Prefix_EditBox:GetText();
	LFG_Text_Values["Postfix"] = LFG_Postfix_EditBox:GetText();
	LFG_Text_Values["Comb"] = LFG_COMB_EditBox:GetText();
	LFG_Text_Values["Chanel"] = UIDropDownMenu_GetText(LFG_ChatChanel_DropDown);
	
	LFG_Classes = {};
	LFG_Classes["Warrior"] = LFG_Class_Warrior:GetChecked();
	LFG_Classes["Mage"] = LFG_Class_Mage:GetChecked();
	LFG_Classes["Priest"] = LFG_Class_Priest:GetChecked();
	LFG_Classes["Warlock"] = LFG_Class_Warlock:GetChecked();
	LFG_Classes["Rogue"] = LFG_Class_Rogue:GetChecked();
	LFG_Classes["Druid"] = LFG_Class_Druid:GetChecked();
	LFG_Classes["Paladin"] = LFG_Class_Paladin:GetChecked();
	LFG_Classes["Shaman"] = LFG_Class_Shaman:GetChecked();
	LFG_Classes["Hunter"] = LFG_Class_Hunter:GetChecked();
	LFG_Classes["AllClasses"] = LFG_Class_ALL:GetChecked();
	
	LFG_Classes["Tank"] = LFG_Tank:GetChecked();
	LFG_Classes["Heal"] = LFG_Heal:GetChecked();
	LFG_Classes["DPS"] = LFG_DPS:GetChecked();
	
	LFM_Text_Values = {}
	LFM_Text_Values["Dungeon"] = UIDropDownMenu_GetText(LFM_Dungeon_DropDown);
	LFM_Text_Values["Prefix"] = LFM_Prefix_EditBox:GetText();
	LFM_Text_Values["Postfix"] = LFM_Postfix_EditBox:GetText();
	LFM_Text_Values["Comb"] = LFM_COMB_EditBox:GetText();
	
	LFG_Notifications = LFG_Notification_EnableBtn:GetChecked();
	-- print("saved");
	
end

function onevent(self, event, arg1, arg2, ...)
	if event == "ADDON_LOADED" then
		-- Load LFG options
		if LFG_Text_Values ~= nil and LFG_Classes ~= nil then
			UIDropDownMenu_SetText(LFG_Dungeon_DropDown, LFG_Text_Values["Dungeon"]);
			-- UIDropDownMenu_SetText(LFG_Quest_DropDown, LFG_Text_Values["Quest"]);
			UIDropDownMenu_SetText(LFG_Member_Count_DropDown, LFG_Text_Values["MemberCount"]);
			LFG_Prefix_EditBox:SetText(LFG_Text_Values["Prefix"]);
			LFG_Postfix_EditBox:SetText(LFG_Text_Values["Postfix"]);
			LFG_COMB_EditBox:SetText(LFG_Text_Values["Comb"]);
			UIDropDownMenu_SetText(LFG_ChatChanel_DropDown,LFG_Text_Values["Chanel"]);
		
			LFG_Class_Warrior:SetChecked(LFG_Classes["Warrior"]);
			LFG_Class_Mage:SetChecked(LFG_Classes["Mage"]);
			LFG_Class_Warlock:SetChecked(LFG_Classes["Warlock"]);
			LFG_Class_Rogue:SetChecked(LFG_Classes["Rogue"]);
			LFG_Class_Druid:SetChecked(LFG_Classes["Druid"]);
			LFG_Class_Paladin:SetChecked(LFG_Classes["Paladin"]);
			LFG_Class_Shaman:SetChecked(LFG_Classes["Shaman"]);
			LFG_Class_Hunter:SetChecked(LFG_Classes["Hunter"]);
			LFG_Class_Priest:SetChecked(LFG_Classes["Priest"]);
			
			if LFG_Classes["AllClasses"] ~= nil then
				LFG_Class_ALL:SetChecked(LFG_Classes["AllClasses"]);
			end
			
			if LFG_Classes["Tank"] ~= nil then
				LFG_Tank:SetChecked(LFG_Classes["Tank"]);
			end
			
			if LFG_Classes["Heal"] ~= nil then
				LFG_Heal:SetChecked(LFG_Classes["Heal"]);
			end
			
			if LFG_Classes["DPS"] ~= nil then
				LFG_DPS:SetChecked(LFG_Classes["DPS"]);
			end
			
			if LFG_Notifications ~= nil then
				LFG_Notification_EnableBtn:SetChecked(LFG_Notifications);
			end
		end	
		
		-- Load LFM options
		if LFM_Text_Values ~= nil then
			UIDropDownMenu_SetText(LFM_Dungeon_DropDown, LFM_Text_Values["Dungeon"]);
			LFM_Prefix_EditBox:SetText(LFM_Text_Values["Prefix"]);
			LFM_Postfix_EditBox:SetText(LFM_Text_Values["Postfix"]);
			LFM_COMB_EditBox:SetText(LFM_Text_Values["Comb"]);
		end
		
		-- Load Dropdown Values
		wipe(MultiMenuDropDownContent);
		MultiMenuDropDownContent = {};
		MultiMenuDropDownContent["dungeons"] = LFGHelper_GetDungeons();
		MultiMenuDropDownContent["quests"] = LFGHelper_GetQuests();
		
		wipe(ChatChanel);
		ChatChanel = LFGHelper_GetChanels();
		
		LFGHelperDropDownMultiContent(MultiMenuDropDownContent, LFG_Dungeon_DropDown);
		LFGHelperSetDropDownContent(ChatChanel, LFG_ChatChanel_DropDown);

		LFGHelperDropDownMultiContent(MultiMenuDropDownContent, LFM_Dungeon_DropDown);
		LFGHelperSetDropDownContent(ChatChanel, LFM_ChatChanel_DropDown);	
	end
	
	if event == "CHAT_MSG_CHANNEL" then
		if LFG_Notifications ~= nil and LFG_Notifications == true then
			LFG_ParseNotification(arg2, arg1);
		end
	end
	
end
LFG_MainFrame:SetScript("OnEvent", onevent);

-- Minimap button "Interface\\LFG_Helper\\Icons\\Logo"
local Visible = false;
local MinimapBtn = CreateFrame("Button", "MinimapBtn", Minimap);
MinimapBtn:SetNormalTexture(backdrop);
MinimapBtn:SetPoint("BOTTOMLEFT");
MinimapBtn:SetSize(32, 32);
MinimapBtn:SetNormalTexture("Interface/AddOns/LFG_Helper/Icons/MinimapButtonNormal")
MinimapBtn:SetHighlightTexture("Interface/AddOns/LFG_Helper/Icons/LogoHighliteBtn")
MinimapBtn:SetScript("OnClick", function() LFM_MinimapBtn_OnClick() end);
MinimapBtn:SetFrameStrata("HIGH");
MinimapBtn:IsMovable(true);

function LFM_MinimapBtn_OnClick() 
	if LFG_MainFrame:IsShown() == false then
		LFG_MainFrame:Show();
		-- reload muli content table
		wipe(MultiMenuDropDownContent);
		MultiMenuDropDownContent = {};
		MultiMenuDropDownContent["dungeons"] = LFGHelper_GetDungeons();
		MultiMenuDropDownContent["quests"] = LFGHelper_GetQuests();
		-- reload channel table
		wipe(ChatChanel);
		ChatChanel = LFGHelper_GetChanels();
		-- reload lfg dropdowns
		LFGHelperDropDownMultiContent(MultiMenuDropDownContent, LFG_Dungeon_DropDown);
		LFGHelperSetDropDownContent(ChatChanel, LFG_ChatChanel_DropDown);
		-- reload lfm channel
		LFGHelperDropDownMultiContent(MultiMenuDropDownContent, LFM_Dungeon_DropDown);
		LFGHelperSetDropDownContent(ChatChanel, LFM_ChatChanel_DropDown);
	else
		LFG_MainFrame:Hide();
	end
end

SLASH_LFGH1 = '/lfgh';
function SlashCmdList.LFGH(msg)
	LFG_MainFrame:Show();
	-- reload muli content table
	wipe(MultiMenuDropDownContent);
	MultiMenuDropDownContent = {};
	MultiMenuDropDownContent["dungeons"] = LFGHelper_GetDungeons();
	MultiMenuDropDownContent["quests"] = LFGHelper_GetQuests();
	-- reload channel table
	wipe(ChatChanel);
	ChatChanel = LFGHelper_GetChanels();
	-- reload lfg dropdowns
	LFGHelperDropDownMultiContent(MultiMenuDropDownContent, LFG_Dungeon_DropDown);
	LFGHelperSetDropDownContent(ChatChanel, LFG_ChatChanel_DropDown);
	-- reload lfm channel
	LFGHelperDropDownMultiContent(MultiMenuDropDownContent, LFM_Dungeon_DropDown);
	LFGHelperSetDropDownContent(ChatChanel, LFM_ChatChanel_DropDown);
end

