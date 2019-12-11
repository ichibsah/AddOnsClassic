-- Performs by clickig on a tab button
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
			info.text, info.hasArrow, info.menuList = "Dungeons", true, "Dungeons"
			UIDropDownMenu_AddButton(info)
			info.text, info.hasArrow, info.menuList = "Raids", true, "Raids"
			UIDropDownMenu_AddButton(info)
			info.text, info.hasArrow, info.menuList = "Quests", true, "Quests"
			UIDropDownMenu_AddButton(info)
			info.text, info.hasArrow, info.menuList = "PVP", true, "Battlegrounds";
			UIDropDownMenu_AddButton(info);
		elseif menuList == "Dungeons" then
			for c in pairs(content["dungeons"]) do
				info.text = content["dungeons"][c];
				info.func = function() LFGHelperDropList_OnClick(content["dungeons"][c], droplist) end;
				UIDropDownMenu_AddButton(info, level)
			end
		elseif menuList == "Raids" then
			for c in pairs(content["raids"]) do
				info.text = content["raids"][c];
				info.func = function() LFGHelperDropList_OnClick(content["raids"][c], droplist) end;
				UIDropDownMenu_AddButton(info, level)
			end
		elseif menuList == "Quests" then
			for c in pairs(content["quests"]) do
				info.text = content["quests"][c];
				info.func = function() LFGHelperDropList_OnClick(content["quests"][c], droplist) end;
				UIDropDownMenu_AddButton(info, level)
			end
		elseif menuList == "Battlegrounds" then
			for c in pairs(content["battlegrounds"]) do
				info.text = content["battlegrounds"][c];
				info.func = function() LFGHelperDropList_OnClick(content["battlegrounds"][c], droplist) end;
				UIDropDownMenu_AddButton(info, level);
			end
		end
	end);
end

-- Insert the quests int the table
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

-- returns a new table with all quests
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
-- local function LFGHelper_GetDungeons(LFGDungeons)
	-- table.insert(LFGDungeons, "Dungeon: Ragefire Chasm");
	-- table.insert(LFGDungeons, "Dungeon: Wailing Caverns");
	-- table.insert(LFGDungeons, "Dungeon: The Deadmines");
	-- table.insert(LFGDungeons, "Dungeon: Shadowfang Keep");
	-- table.insert(LFGDungeons, "Dungeon: Blackfathom Deeps");
	-- table.insert(LFGDungeons, "Dungeon: The Stockade");
	-- table.insert(LFGDungeons, "Dungeon: Gnomeregan");
	-- table.insert(LFGDungeons, "Dungeon: Razorfen Kraul");
	-- table.insert(LFGDungeons, "Dungeon: Scarlet Monastery (Graveyard)");	
	-- table.insert(LFGDungeons, "Dungeon: Scarlet Monastery (Libary)");
	-- table.insert(LFGDungeons, "Dungeon: Scarlet Monastery (Armory)");
	-- table.insert(LFGDungeons, "Dungeon: Scarlet Monastery (Cathedral)");
	-- table.insert(LFGDungeons, "Dungeon: Razorfen Downs");
	-- table.insert(LFGDungeons, "Dungeon: Uldaman");
	-- table.insert(LFGDungeons, "Dungeon: Zul'Farrak");
	-- table.insert(LFGDungeons, "Dungeon: Maraudon");
	-- table.insert(LFGDungeons, "Dungeon: Temple of Atal'Hakkar");
	-- table.insert(LFGDungeons, "Dungeon: Blackrock Depths");
	-- table.insert(LFGDungeons, "Dungeon: Lower Blackrock Spire");
	-- table.insert(LFGDungeons, "Dungeon: Upper Blackrock Spire");
	-- table.insert(LFGDungeons, "Dungeon: Dire Maul");
	-- table.insert(LFGDungeons, "Dungeon: Scholomance");
	-- table.insert(LFGDungeons, "Dungeon: Stratholme (Living)");
	-- table.insert(LFGDungeons, "Dungeon: Stratholme (Undead)");
	-- table.insert(LFGDungeons, "Raid: Molten Core");
	-- table.insert(LFGDungeons, "Raid: Onyxia");
	-- table.insert(LFGDungeons, "Raid: Zul'Gurub");
	-- table.insert(LFGDungeons, "Raid: Ruins of Ahn'Qiraj");
	-- table.insert(LFGDungeons, "Raid: Blackwing Lair");
	-- table.insert(LFGDungeons, "Raid: Ahn'Qiraj");
	-- table.insert(LFGDungeons, "Raid: Naxxramas");
-- end

-- returns a table with the dungeons
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
	table.insert(_dungeons, "Dungeon: Dire Maul North");
	table.insert(_dungeons, "Dungeon: Dire Maul East");
	table.insert(_dungeons, "Dungeon: Dire Maul West");
	table.insert(_dungeons, "Dungeon: Scholomance");
	table.insert(_dungeons, "Dungeon: Stratholme (Living)");
	table.insert(_dungeons, "Dungeon: Stratholme (Undead)");
	return _dungeons;
end

-- returns a table with the raids
local function LFGHelper_GetRaids()
	local _raids = {};
	table.insert(_raids, "Raid: Molten Core");
	table.insert(_raids, "Raid: Onyxia");
	table.insert(_raids, "Raid: Zul'Gurub");
	table.insert(_raids, "Raid: Ruins of Ahn'Qiraj");
	table.insert(_raids, "Raid: Blackwing Lair");
	table.insert(_raids, "Raid: Ahn'Qiraj");
	table.insert(_raids, "Raid: Naxxramas");
	return _raids;
end

-- returns a table with the battlegrounds
local function LFGHelper_GetBattlegrounds() 
	local _battlegrounds = {};
	table.insert(_battlegrounds, "PVP: Open World PVP");
	table.insert(_battlegrounds, "Battleground: [10-19] Warsong Gulch");
	table.insert(_battlegrounds, "Battleground: [20-29] Arathi Basin");
	table.insert(_battlegrounds, "Battleground: [51-60] Alterac Valley");
	return _battlegrounds;
end

-- initial libdb-icon
local lfgh_icon = LibStub("LibDBIcon-1.0");

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

-- returns a table with the current chat channel
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

-- insert the dungeons in the contex menu
function LFGHelper_InitDungeonUnitPopupMenu(menu)
	local dungeons = LFGHelper_GetDungeons();
	for i in pairs(dungeons) do
		UnitPopupButtons[menu .. "_DUNGEON_" .. dungeons[i]] = { text = dungeons[i] };
		table.insert(UnitPopupMenus[menu], menu .. "_DUNGEON_" .. dungeons[i]);
	end
end

function LFGHelper_InitQuests(menu)
	cQuests = LFGHelper_GetQuests();
	for i in pairs(cQuests) do
		UnitPopupButtons[menu .. "_QUEST_" .. cQuests[i]] = { text = cQuests[i] };
		table.insert(UnitPopupMenus[menu], menu .. "_QUEST_" .. cQuests[i]);
	end
end

-- whispers a message to a player
function LFGHelper_WhisperUnit(unit, message) 
	SendChatMessage(message, "WHISPER", "Common", unit);
end

local ChatChanel = {};
local LFGDungeons = {};
local Quests = {}
local MultiMenuDropDownContent = {};

local LFGMemberCountContent = {};
for i = 1, 40, 1 do
	table.insert(LFGMemberCountContent, i);
end

-- create the minimap contex menu
function LFGHelper_MiniMenue_Initial(self,level,menuList)
	print("LEVEL");
	local info = UIDropDownMenu_CreateInfo();
	if level == 1 then
		info.text = "LFG Helper Options";
		-- info.isTitle = true;
		-- info.isUninteractable = true;
		-- info.isSubsection = true;
		-- info.isSubsectionTitle = true;
		-- isSubsectionSeparator = false;
		UIDropDownMenu_AddButton(info);
	end
end

local LFGHelper_MiniMenue = CreateFrame("Frame", "Test_DropDown", UIParent, "UIDropDownMenuTemplate");
UIDropDownMenu_SetWidth(LFGHelper_MiniMenue, 200)
UIDropDownMenu_Initialize(LFGHelper_MiniMenue, LFGHelper_MiniMenue_Initial, "MENU");


-- create the contex menue items for the friends menu
UnitPopupButtons["LFG_HELPER"] = { text = "LFG Helper", isTitle = true, isUninteractable = true, isSubsection = true, isSubsectionTitle = true, isSubsectionSeparator = true };
UnitPopupButtons["LFM_TANK"] = { text = "Whisper LFM (|cffff0000Tank|r)", nested = 1 };
UnitPopupButtons["LFM_HEALER"] = { text = "Whisper LFM (|cff00ff00Heal|r)", nested = 1 };
UnitPopupButtons["LFM_DPS"] = { text = "Whisper LFM (|cffDA70D6DPS|r)", nested = 1 };
UnitPopupButtons["LFM_QUESTS"] = { text = "Whisper LFM Quest", nested = 1 };
UnitPopupButtons["LFG_HELPER_END"] = {  text = "", isTitle = true, isUninteractable = true, isSubsection = true, isSubsectionTitle = false, isSubsectionSeparator = true };
UnitPopupMenus["LFM_TANK"] = {};
UnitPopupMenus["LFM_HEALER"] = {};
UnitPopupMenus["LFM_DPS"] = {};
UnitPopupMenus["LFM_QUESTS"] = {};

LFGHelper_InitDungeonUnitPopupMenu("LFM_TANK");
LFGHelper_InitDungeonUnitPopupMenu("LFM_HEALER");
LFGHelper_InitDungeonUnitPopupMenu("LFM_DPS");
LFGHelper_InitQuests("LFM_QUESTS");

table.insert(UnitPopupMenus["FRIEND"], #UnitPopupMenus["FRIEND"], "LFG_HELPER");
table.insert(UnitPopupMenus["FRIEND"], #UnitPopupMenus["FRIEND"], "LFM_TANK");
table.insert(UnitPopupMenus["FRIEND"], #UnitPopupMenus["FRIEND"], "LFM_HEALER");
table.insert(UnitPopupMenus["FRIEND"], #UnitPopupMenus["FRIEND"], "LFM_DPS");
table.insert(UnitPopupMenus["FRIEND"], #UnitPopupMenus["FRIEND"], "LFM_QUESTS");
table.insert(UnitPopupMenus["FRIEND"], #UnitPopupMenus["FRIEND"], "LFG_HELPER_END");

function LFGHelper_ContexMenuButton(self)
	local dropdownFrame = UIDROPDOWNMENU_INIT_MENU;
	local unitButton = self.value;
	
	if string.find(unitButton, "LFM_TANK_DUNGEON", 1, true) then
		message = LFG_Helper_Options["WhisperPattern"];
		dungeon = string.gsub(unitButton, "LFM_TANK_DUNGEON_", "");
		message = string.gsub(message, "%%unit%%", dropdownFrame.name);
		message = string.gsub(message, "%%dungeon%%", dungeon);
		message = string.gsub(message, "%%rule%%", "Tank");
		LFGHelper_WhisperUnit(dropdownFrame.name, message);
		return;
	end		
	
	if string.find(unitButton, "LFM_HEALER_DUNGEON", 1, true) then
		message = LFG_Helper_Options["WhisperPattern"];
		dungeon = string.gsub(unitButton, "LFM_HEALER_DUNGEON_", "");
		message = string.gsub(message, "%%unit%%", dropdownFrame.name);
		message = string.gsub(message, "%%dungeon%%", dungeon);
		message = string.gsub(message, "%%rule%%", "Healer");
		LFGHelper_WhisperUnit(dropdownFrame.name, message);
		return;
	end
	
	if string.find(unitButton, "LFM_DPS_DUNGEON", 1, true) then
		message = LFG_Helper_Options["WhisperPattern"];
		dungeon = string.gsub(unitButton, "LFM_DPS_DUNGEON_", "");
		message = string.gsub(message, "%%unit%%", dropdownFrame.name);
		message = string.gsub(message, "%%dungeon%%", dungeon);
		message = string.gsub(message, "%%rule%%", "DPS");
		LFGHelper_WhisperUnit(dropdownFrame.name, message);
		return;
	end
	
	if string.find(unitButton, "LFM_QUESTS_QUEST_", 1, true) then
		questName = string.gsub(unitButton, "LFM_QUESTS_QUEST_", "");
		message = "LFM " .. questName .. " /w me for invite";
		LFGHelper_WhisperUnit(dropdownFrame.name, message);
		return;
	end
	
end
hooksecurefunc("UnitPopup_OnClick",LFGHelper_ContexMenuButton)

-- Create queslog Button
QuestFrameExitButton:Hide();
local LFG_Questlog_Button = CreateFrame("Button", "LFG_Post_Button", QuestLogFrame, "UIPanelButtonTemplate");
LFG_Questlog_Button:SetText("LFG");
LFG_Questlog_Button:SetSize(QuestFrameExitButton:GetWidth(), QuestFrameExitButton:GetHeight());
LFG_Questlog_Button:SetPoint(QuestFrameExitButton:GetPoint());
LFG_Questlog_Button:SetScript("OnClick", function() LFGHelper_QuestLog_ButtonClick() end);

function LFGHelper_QuestLog_ButtonClick()
	if LFG_Helper_Options["ShortLFGChannel"] == "None" then
		print("|cffff0000".. "Error no channel selected - please select a channel in the option menue");
		return;
	end
	selectedQuestIndex = GetQuestLogSelection();
	questTitle = GetQuestLogTitle(selectedQuestIndex);
	message = "LFG/LFM " .. questTitle .. " /w me";
	local index = GetChannelName(UIDropDownMenu_GetText(Option_ShortLFG_Channel));
	SendChatMessage(message ,"CHANNEL" ,nil , index);
end

-- Create Frame UIPanelDialogTemplate
local LFG_MainFrame = CreateFrame("Frame", "LFG_MainFrame", UIParent, "BasicFrameTemplateWithInset");
LFG_MainFrame:SetSize(400,550);
LFG_MainFrame:SetPoint("TOPLEFT", 100, -100);
LFG_MainFrame:SetFrameStrata("HIGH");
LFG_MainFrame:RegisterEvent("ADDON_LOADED");
LFG_MainFrame:RegisterEvent("PLAYER_LOGOUT");
LFG_MainFrame:RegisterEvent("CHAT_MSG_CHANNEL");
LFG_MainFrame.numTabs  = 4;
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
	
	-- local String = LFG_Prefix_EditBox:GetText() .. " LF" .. UIDropDownMenu_GetText(LFG_Member_Count_DropDown) .. "M " .. LFG_COMB_EditBox:GetText() .. " \"" .. UIDropDownMenu_GetText(LFG_Dungeon_DropDown) .. "\"" .. rollestr .. " pref: (" .. ClassesString .. ") " .. LFG_Postfix_EditBox:GetText();
	newstr = LFM_Pattern;
	newstr = string.gsub(newstr, "%%prefix%%", LFG_Prefix_EditBox:GetText());
	newstr = string.gsub(newstr, "%%count%%", UIDropDownMenu_GetText(LFG_Member_Count_DropDown));
	newstr = string.gsub(newstr, "%%mid%%",  LFG_COMB_EditBox:GetText());
	newstr = string.gsub(newstr, "%%subject%%", '"' .. UIDropDownMenu_GetText(LFG_Dungeon_DropDown) .. '"');
	newstr = string.gsub(newstr, "%%rules%%", rollestr);
	newstr = string.gsub(newstr, "%%classes%%", ClassesString);
	newstr = string.gsub(newstr, "%%postfix%%", LFG_Postfix_EditBox:GetText());
	newstr = string.gsub(newstr, "  ", " ");
	newstr = string.gsub(newstr, "   ", " ");
	newstr = string.gsub(newstr, "   ", " ");
	newstr = string.gsub(newstr, "    ", " ");
	newstr = string.gsub(newstr, "     ", " ");
	
	
	local index = GetChannelName(UIDropDownMenu_GetText(LFG_ChatChanel_DropDown));
	SendChatMessage(newstr ,"CHANNEL" ,nil , index);
	LFG_Helper_LastMessage = newstr;
	
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

	-- local String = "";
	
	-- if LFM_Prefix_EditBox:GetText() ~= "" then
		-- String = String .. LFM_Prefix_EditBox:GetText() .. " ";
	-- end
	
	-- String = String .. englishClass .. " LEVEL " .. level .. " LFG ";
	
	-- if LFM_COMB_EditBox:GetText() ~= "" then
		-- String = String .. LFM_COMB_EditBox:GetText() .. " ";
	-- end
	
	-- String = String .. UIDropDownMenu_GetText(LFM_Dungeon_DropDown) .. " ";
	
	-- if LFM_Postfix_EditBox:GetText() ~= "" then
		-- String = String .. LFM_Postfix_EditBox:GetText();
	-- end
	
	newstr = LFG_Pattern;
	newstr = string.gsub(newstr, "%%prefix%%", LFM_Prefix_EditBox:GetText());
	newstr = string.gsub(newstr, "%%lvl%%", level);
	newstr = string.gsub(newstr, "%%class%%", localizedClass);
	newstr = string.gsub(newstr, "%%mid%%", LFM_COMB_EditBox:GetText());
	newstr = string.gsub(newstr, "%%subject%%", UIDropDownMenu_GetText(LFM_Dungeon_DropDown));
	newstr = string.gsub(newstr, "%%postfix%%", LFM_Postfix_EditBox:GetText());
	newstr = string.gsub(newstr, "  ", " ");
	newstr = string.gsub(newstr, "   ", " ");
	newstr = string.gsub(newstr, "   ", " ");
	newstr = string.gsub(newstr, "    ", " ");
	newstr = string.gsub(newstr, "     ", " ");
	
	
	local index = GetChannelName(UIDropDownMenu_GetText(LFM_ChatChanel_DropDown));
	SendChatMessage(newstr ,"CHANNEL" ,nil , index);
	LFG_Helper_LastMessage = newstr;
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

local LFG_Add_Options_PatternFrame = CreateFrame("Frame", "LFG_NotificationPatternFrame", LFG_TAB_3.content, "InsetFrameTemplate2");
LFG_Add_Options_PatternFrame:SetPoint("TOPLEFT", 20, -80);
LFG_Add_Options_PatternFrame:SetSize(355, 60);

local LFG_LFGPattern_CheckBox = CreateFrame("CheckButton", "LFG_LFGPattern_CheckBox", LFG_Add_Options_PatternFrame, "UICheckButtonTemplate");
LFG_LFGPattern_CheckBox:SetPoint("LEFT", 15, 0);
LFG_LFGPattern_CheckBox.text:SetText("LFG Notification");
LFG_LFGPattern_CheckBox:SetScript("OnClick", function() LFGHelper_Save(); end);

local LFG_LFMPattern_CheckBox = CreateFrame("CheckButton", "LFG_LFMPattern_CheckBox", LFG_Add_Options_PatternFrame, "UICheckButtonTemplate");
LFG_LFMPattern_CheckBox:SetPoint("LEFT", 150, 0);
LFG_LFMPattern_CheckBox.text:SetText("LFM Notification");
LFG_LFMPattern_CheckBox:SetScript("OnClick", function() LFGHelper_Save(); end);

local LFG_NotificationPatternFrame = CreateFrame("Frame", "LFG_NotificationPatternFrame", LFG_TAB_3.content, "InsetFrameTemplate2");
LFG_NotificationPatternFrame:SetPoint("TOPLEFT", 20, -150);
LFG_NotificationPatternFrame:SetSize(355, 200);

local LFG_NotificationPatternScrollFrame = CreateFrame("ScrollFrame", "TM_TalentTemplatePreviewScrollFrame", LFG_NotificationPatternFrame, "UIPanelScrollFrameTemplate");
LFG_NotificationPatternScrollFrame:SetPoint("TOPLEFT", 10, -10);
LFG_NotificationPatternScrollFrame:SetSize("315", "180");

local LFG_NotificationPatternScrollChild = CreateFrame("Frame", "LFG_NotificationPatternScrollChild", nil);
LFG_NotificationPatternScrollChild:SetSize("345", "800");
LFG_NotificationPatternScrollChild:SetPoint("TOPLEFT");
LFG_NotificationPatternScrollFrame:SetScrollChild(LFG_NotificationPatternScrollChild);

local LFG_Add_Notification_PatternFrame = CreateFrame("Frame", "LFG_NotificationPatternFrame", LFG_TAB_3.content, "InsetFrameTemplate2");
LFG_Add_Notification_PatternFrame:SetPoint("TOPLEFT", 20, -360);
LFG_Add_Notification_PatternFrame:SetSize(355, 40);

local LFG_NotificationAddPattern_EditBox = CreateFrame("EditBox", "LFG_NotificationAddPattern_EditBox", LFG_Add_Notification_PatternFrame, "InputBoxTemplate");
LFG_NotificationAddPattern_EditBox:SetPoint("TOPLEFT", 15, -5);
LFG_NotificationAddPattern_EditBox:SetSize(230, 30);
LFG_NotificationAddPattern_EditBox:SetText("");
LFG_NotificationAddPattern_EditBox:SetAutoFocus(false);

local LFG_NotificationAddPattern_Button = CreateFrame("Button", nil, LFG_Add_Notification_PatternFrame, "UIPanelButtonTemplate");
LFG_NotificationAddPattern_Button:SetPoint("TOPLEFT", 250, -10);
LFG_NotificationAddPattern_Button:SetSize(90, 22);
LFG_NotificationAddPattern_Button:SetText("add pattern");
LFG_NotificationAddPattern_Button:SetScript("OnClick", function() lfgh_create_notification_pattern(LFG_NotificationAddPattern_EditBox:GetText()); end);

local frames = {};
function LFG_createNotification(parent, headline, mCount, author, mode)
	local NotificationFrame = CreateFrame("Frame", nil, parent, "GlowBoxTemplate");
	NotificationFrame:SetSize(290, 100);
	NotificationFrame:SetFrameStrata("HIGH");
	local ticker = C_Timer.NewTicker(10, function() LFG_CloseNotification(NotificationFrame); end)
	local frameTable = {NotificationFrame, true};
		
	local localizedClass, englishClass, classIndex = UnitClass(author);
	
	local NotificationHeadline = CreateFrame("SimpleHTML", nil, NotificationFrame);
	NotificationHeadline:SetPoint("TOPLEFT", 10, -10);
	NotificationHeadline:SetFont('Fonts\\FRIZQT__.TTF', 8);
	NotificationHeadline:SetFont('h1', 'Fonts\\FRIZQT__.TTF', 12);
	NotificationHeadline:SetFont('h2', 'Fonts\\FRIZQT__.TTF', 10);
	NotificationHeadline:SetFont('h3', 'Fonts\\FRIZQT__.TTF', 8);
	NotificationHeadline:SetSize(250, 30);
	NotificationHeadline:SetText("<html><body><h1>[+".. mCount .. "] ".. headline .. "</h1><br/><h2>Author: " .. author .. "</h2></body></html>");
	NotificationHeadline:SetTextColor('h1', 244,220,0,1);
	
	-- local NotificationAuthor = CreateFrame("SimpleHTML", nil, NotificationFrame);
	-- NotificationAuthor:SetPoint("TOPLEFT", 10, -40);
	-- NotificationAuthor:SetFont('Fonts\\FRIZQT__.TTF', 10);
	-- NotificationAuthor:SetSize(250, 30);
	-- NotificationAuthor:SetText("<html><body><h1>Leader: " .. author .. "</h1></body></html>");
	
	if mode == "lfg" then
		local NotificationApplyBtn = CreateFrame("Button", nil, NotificationFrame, "UIPanelButtonTemplate");
		NotificationApplyBtn:SetPoint("RIGHT", -5, -30);
		NotificationApplyBtn:SetSize(120, 30);
		NotificationApplyBtn:SetText("Invite");
		NotificationApplyBtn:SetScript("OnClick", function() LFG_NoificationInvite(author, headline); end);
	else	
		local NotificationApplyBtn = CreateFrame("Button", nil, NotificationFrame, "UIPanelButtonTemplate");
		NotificationApplyBtn:SetPoint("RIGHT", -5, -30);
		NotificationApplyBtn:SetSize(120, 30);
		NotificationApplyBtn:SetText("Apply");
		NotificationApplyBtn:SetScript("OnClick", function() LFG_NoificationApply(author, headline); end);
	end
	
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

function LFG_NoificationInvite(player, headline)
	local level = UnitLevel("player");
	local localizedClass, englishClass, classIndex = UnitClass("player");
	local message = "Invite for " .. headline;
	
	SendChatMessage(message, "WHISPER", "Common", player);
	InviteUnit(player);
end

function LFG_ParseNotification(author, msg)
	lfg = string.find(msg, "LFG");
	lfm2 = string.find(msg, "LF(%d+)M");
	lfm = string.find(msg, "LFM");
	mCount = string.match(msg, "LF(%d+)M");
	dungeon = string.match(msg, '"(.+)"');

		
	if LFG_Notifications["lfm"] == true and lfm ~= nil then
		if lfg_pattern_contains(msg) == true then
			LFG_createNotification(LFG_NotificationFrame_ScrollChild, msg, 0, author, "lfm");
		end
	end
	
	if LFG_Notifications["lfm"] == true and lfm2 ~= nil then
		if lfg_pattern_contains(msg) == true then
			LFG_createNotification(LFG_NotificationFrame_ScrollChild, msg, mCount, author, "lfm");
		end
	end
	
	if LFG_Notifications["lfg"] == true and lfg ~= nil then
		if lfg_pattern_contains(msg) == true then
			LFG_createNotification(LFG_NotificationFrame_ScrollChild, msg, 0, author, "lfg");
		end
	end

end

function lfg_pattern_contains(msg) 
	if LFG_NotificationPattern ~= nil then
		for i in pairs(LFG_NotificationPattern) do
			if LFG_NotificationPattern[i]["state"] == true then
				local name = LFG_NotificationPattern[i]["name"];
				local mat = string.find(msg, name);
				if mat ~= nil then 
					return true;
				end
			end
		end
	end
	return false;
end

function lfg_pattern_change_state(name, state) 
	for i in pairs(LFG_NotificationPattern) do
		if LFG_NotificationPattern[i]["name"] == name then
			LFG_NotificationPattern[i]["state"] = state;
		end
	end
end

function lfg_pattern_change_state_by_id(id, state)
	LFG_NotificationPattern[id]["state"] = state;
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- Options
-----------------------------------------------------------------------------------------------------------------------------------------
local LFG_TAB_4 = CreateFrame("Button", "LFG_MainFrameTab4", LFG_MainFrame, "CharacterFrameTabButtonTemplate");
LFG_TAB_4:SetText("Options");
LFG_TAB_4:SetID(4);
LFG_TAB_4:SetPoint("BOTTOMLEFT", 280, -30);
LFG_TAB_4:SetScript("OnClick", Tab_OnClick);
LFG_TAB_4.content = CreateFrame("Frame", nil, LFG_MainFrame);
LFG_TAB_4.content:SetSize(400, 550);
LFG_TAB_4.content:SetPoint("CENTER");
LFG_TAB_4.content:Hide();

local Option_LFM_Pattern_Label = CreateFrame('SimpleHTML', 'LFM_COMB_Label', LFG_TAB_4.content);
Option_LFM_Pattern_Label:SetPoint("TOPLEFT", 30, -60);
Option_LFM_Pattern_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
Option_LFM_Pattern_Label:SetSize(200, 30);
Option_LFM_Pattern_Label:SetText("<html><body><p>LFM Text Pattern</p></body></html>");
Option_LFM_Pattern_Label:SetTextColor(244,220,0,1);

local Option_LFM_Pattern_EditBox = CreateFrame("EditBox", "LFM_COMB_EditBox", LFG_TAB_4.content, "InputBoxTemplate");
Option_LFM_Pattern_EditBox:SetPoint("TOPLEFT", 30, -80);
Option_LFM_Pattern_EditBox:SetSize(340, 30);
Option_LFM_Pattern_EditBox:SetText("");
Option_LFM_Pattern_EditBox:SetAutoFocus(false);

local Option_LFG_Pattern_Label = CreateFrame('SimpleHTML', 'LFM_COMB_Label', LFG_TAB_4.content);
Option_LFG_Pattern_Label:SetPoint("TOPLEFT", 30, -115);
Option_LFG_Pattern_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
Option_LFG_Pattern_Label:SetSize(200, 30);
Option_LFG_Pattern_Label:SetText("<html><body><p>LFG Text Pattern</p></body></html>");
Option_LFG_Pattern_Label:SetTextColor(244,220,0,1);

local Option_LFG_Pattern_EditBox = CreateFrame("EditBox", "LFM_COMB_EditBox", LFG_TAB_4.content, "InputBoxTemplate");
Option_LFG_Pattern_EditBox:SetPoint("TOPLEFT", 30, -135);
Option_LFG_Pattern_EditBox:SetSize(340, 30);
Option_LFG_Pattern_EditBox:SetText("");
Option_LFG_Pattern_EditBox:SetAutoFocus(false);

local Option_Whisper_Pattern_Label = CreateFrame('SimpleHTML', 'Option_Whisper_Pattern_Label', LFG_TAB_4.content);
Option_Whisper_Pattern_Label:SetPoint("TOPLEFT", 30, -170);
Option_Whisper_Pattern_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
Option_Whisper_Pattern_Label:SetSize(200, 30);
Option_Whisper_Pattern_Label:SetText("<html><body><p>Whisper Pattern</p></body></html>");
Option_Whisper_Pattern_Label:SetTextColor(244,220,0,1);

local Option_Whisper_Pattern_EditBox = CreateFrame("EditBox", "Option_Whisper_Pattern_EditBox", LFG_TAB_4.content, "InputBoxTemplate");
Option_Whisper_Pattern_EditBox:SetPoint("TOPLEFT", 30, -190);
Option_Whisper_Pattern_EditBox:SetSize(340, 30);
Option_Whisper_Pattern_EditBox:SetText("");
Option_Whisper_Pattern_EditBox:SetAutoFocus(false);

local Option_Save_Button = CreateFrame("Button", "Option_Save_Button", LFG_TAB_4.content, "UIPanelButtonTemplate");
Option_Save_Button:SetText("Save");
Option_Save_Button:SetSize(120, 30);
Option_Save_Button:SetPoint("BOTTOMLEFT", 260, 20);
Option_Save_Button:SetScript("OnClick", function() LFGHelper_Save() end);

local Option_reset_Button = CreateFrame("Button", "Option_reset_Button", LFG_TAB_4.content, "UIPanelButtonTemplate");
Option_reset_Button:SetText("Defual Values");
Option_reset_Button:SetSize(120, 30);
Option_reset_Button:SetPoint("BOTTOMLEFT", 140, 20);
Option_reset_Button:SetScript("OnClick", function() LFG_Helper_Restore_Options() end);

local Option_EnabdleShortLFG = CreateFrame("CheckButton", "Option_EnabdleShortLFG", LFG_TAB_4.content, "UICheckButtonTemplate");
Option_EnabdleShortLFG:SetPoint("TOPLEFT", 20, -245);
Option_EnabdleShortLFG.text:SetText("Enable questlog LFG button");
Option_EnabdleShortLFG:SetScript("OnClick", function() LFGHelper_Save(); LFGHelper_TriggerShortLFG(LFG_Helper_Options["EnableShortLFG"]); end);

local Option_ShortLFG_Label = CreateFrame('SimpleHTML', 'Option_ShortLFG_Label', LFG_TAB_4.content);
Option_ShortLFG_Label:SetPoint("TOPLEFT", 30, -292);
Option_ShortLFG_Label:SetFont('Fonts\\FRIZQT__.TTF', 10);
Option_ShortLFG_Label:SetSize(200, 30);
Option_ShortLFG_Label:SetText("<html><body><p>Standardt Channel</p></body></html>");
Option_ShortLFG_Label:SetTextColor(244,220,0,1);

local Option_ShortLFG_Channel = CreateFrame("FRAME", "Option_ShortLFG_Channel", LFG_TAB_4.content, "UIDropDownMenuTemplate")
Option_ShortLFG_Channel:SetPoint("TOPLEFT", 165, -285)
UIDropDownMenu_SetWidth(Option_ShortLFG_Channel, 170)
UIDropDownMenu_SetText(Option_ShortLFG_Channel, "Chat Channel")


function lfgh_create_notification_pattern(name)
	pattern = {};
	pattern["name"] = name;
	pattern["state"] = false;
	table.insert(LFG_NotificationPattern, pattern);
	create_notification_pattern();
end

local lfg_notantification_pattern_frames = {};
function create_notification_pattern_frame(name, state, parent, width, height, index) 
	LFG_Notification_Pattern_Frane = nil;
	i = index -1;
	if i == 0 then
		LFG_Notification_Pattern_Frane = CreateFrame("Frame", "LFG_Notification_Pattern_Option_" .. name, parent);
		LFG_Notification_Pattern_Frane:SetPoint("TOPLEFT", 0, -((i * height) + (i * 5)));
		LFG_Notification_Pattern_Frane:SetSize(width, height);
		LFG_Notification_Pattern_Frane:SetBackdropColor(0,0,0, 1);
	else
		LFG_Notification_Pattern_Frane = CreateFrame("Frame", "LFG_Notification_Pattern_Option_" .. name, parent);
		LFG_Notification_Pattern_Frane:SetPoint("TOPLEFT", 0, -((i * height) + (i * 5)));
		LFG_Notification_Pattern_Frane:SetSize(width, height);
		LFG_Notification_Pattern_Frane:SetBackdropColor(0,0,0, 1);
	end
	
	local LFG_Notification_Pattern_Option = CreateFrame("CheckButton", "LFG_Notification_Pattern_Option_" .. name, LFG_Notification_Pattern_Frane, "UICheckButtonTemplate");
	LFG_Notification_Pattern_Option:SetPoint("TOPLEFT", 0, 0);
	LFG_Notification_Pattern_Option.text:SetText(name);
	LFG_Notification_Pattern_Option:SetChecked(state);
	LFG_Notification_Pattern_Option:SetScript("OnClick", function() lfg_pattern_change_state_by_id(index, LFG_Notification_Pattern_Option:GetChecked()); create_notification_pattern(); end);
	
	table.insert(lfg_notantification_pattern_frames, LFG_Notification_Pattern_Frane);
end

function create_notification_pattern()
	
	for i in pairs(lfg_notantification_pattern_frames) do
		lfg_notantification_pattern_frames[i]:Hide();
	end
	
	wipe(lfg_notantification_pattern_frames);
	for i in pairs(LFG_NotificationPattern) do
		create_notification_pattern_frame(LFG_NotificationPattern[i]["name"], LFG_NotificationPattern[i]["state"], LFG_NotificationPatternScrollChild, 300, 20, i);
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
	
	LFG_Notifications = {};
	LFG_Notifications["acitve"] = LFG_Notification_EnableBtn:GetChecked();
	LFG_Notifications["lfg"] = LFG_LFGPattern_CheckBox:GetChecked();
	LFG_Notifications["lfm"] = LFG_LFMPattern_CheckBox:GetChecked();
	
	
	LFM_Pattern = Option_LFM_Pattern_EditBox:GetText();
	LFG_Pattern = Option_LFG_Pattern_EditBox:GetText();
	
	LFG_Helper_Options["WhisperPattern"] = Option_Whisper_Pattern_EditBox:GetText();
	LFG_Helper_Options["EnableShortLFG"] = Option_EnabdleShortLFG:GetChecked();
	LFG_Helper_Options["ShortLFGChannel"] = UIDropDownMenu_GetText(Option_ShortLFG_Channel);
end

function LFG_Helper_Restore_Options() 
	LFM_Pattern = "%prefix%" .. " LF%count%M " .. " %mid% " .. " %subject% " .. " %rules% pref: " .. "(%classes%)" .. " %postfix%";
	LFG_Pattern = "%prefix% " .. "[%lvl%] %class% " .. " LFG %mid% " .. " \"%subject%\" " .. " %postfix%";
	LFG_Helper_Options["WhisperPattern"] = "Hello %unit% we currently looking for a %rule% for \"%dungeon%\"";
	Option_LFM_Pattern_EditBox:SetText(LFM_Pattern);
	Option_LFG_Pattern_EditBox:SetText(LFG_Pattern);
	
	table.wipe(LFG_NotificationPattern);
	for i in pairs(LFGHelper_GetDungeons()) do
		pattern = {};
		pattern["name"] = LFGHelper_GetDungeons()[i];
		pattern["state"] = false;
		table.insert(LFG_NotificationPattern, pattern);
	end
			
	for i in pairs(LFGHelper_GetRaids()) do
		pattern = {};
		pattern["name"] = LFGHelper_GetRaids()[i];
		pattern["state"] = false;
		table.insert(LFG_NotificationPattern, pattern);
	end
			
	for i in pairs(LFGHelper_GetBattlegrounds()) do
		pattern = {};
		pattern["name"] = LFGHelper_GetBattlegrounds()[i];
		pattern["state"] = false;
		table.insert(LFG_NotificationPattern, pattern);
	end
	create_notification_pattern();
end

-- Register Minimap Button
local lfgh_addon = LibStub("AceAddon-3.0"):NewAddon("LFG-Helper", "AceConsole-3.0")
local lfghLDB = LibStub("LibDataBroker-1.1"):NewDataObject("LfgHelperObject", {
	type = "data source",
	text = "LFG-Helper",
	icon = "Interface/AddOns/LFG_Helper/Icons/MinimapButtonNormal",
	OnClick = function() LFM_MinimapBtn_OnClick() end,
})

-- Initialize the Button
function lfgh_addon:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("LFG_HelperDB", {
		profile = {
			minimap = {
				hide = false,
			},
		},
	})
		
	lfgh_icon:Register("LfgHelperObject", lfghLDB, self.db.profile.minimap)
end

-- Show the Icon
lfgh_icon:Show("LfgHelperObject")


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
			
			if LFG_Notifications == nil then
				LFG_Notifications = {};
			end
			
			if LFG_Notifications["acitve"] ~= nil then
				LFG_Notification_EnableBtn:SetChecked(LFG_Notifications["acitve"]);
			end		
			
			if LFG_Notifications["lfg"] ~= nil then
				LFG_LFGPattern_CheckBox:SetChecked(LFG_Notifications["lfg"]);
			end
			
			if LFG_Notifications["lfm"] ~= nil then
				LFG_LFMPattern_CheckBox:SetChecked(LFG_Notifications["lfm"]);
			end
			
		end	
		
		-- Load LFM options
		if LFM_Text_Values ~= nil then
			UIDropDownMenu_SetText(LFM_Dungeon_DropDown, LFM_Text_Values["Dungeon"]);
			LFM_Prefix_EditBox:SetText(LFM_Text_Values["Prefix"]);
			LFM_Postfix_EditBox:SetText(LFM_Text_Values["Postfix"]);
			LFM_COMB_EditBox:SetText(LFM_Text_Values["Comb"]);
		end
			
		if LFM_Pattern ~= nil then
			Option_LFM_Pattern_EditBox:SetText(LFM_Pattern);
		else
			LFM_Pattern = "%prefix%" .. " LF%count%M " .. " %mid% " .. " %subject% " .. " %rules% pref: " .. "(%classes%)" .. " %postfix%";
			Option_LFM_Pattern_EditBox:SetText(LFM_Pattern);
		end
		
		if LFG_Pattern ~= nil then
			Option_LFG_Pattern_EditBox:SetText(LFG_Pattern);
		else
			LFG_Pattern = "%prefix% " .. "[%lvl%] %class% " .. " LFG %mid% " .. " \"%subject%\" " .. " %postfix%"
			Option_LFG_Pattern_EditBox:SetText(LFG_Pattern);
		end
		
		-- Load Dropdown Values
		wipe(MultiMenuDropDownContent);
		MultiMenuDropDownContent = {};
		MultiMenuDropDownContent["dungeons"] = LFGHelper_GetDungeons();
		MultiMenuDropDownContent["raids"] = LFGHelper_GetRaids();
		MultiMenuDropDownContent["quests"] = LFGHelper_GetQuests();
		MultiMenuDropDownContent["battlegrounds"] = LFGHelper_GetBattlegrounds();
		
		wipe(ChatChanel);
		ChatChanel = LFGHelper_GetChanels();
		-- Load lfg droplist
		LFGHelperDropDownMultiContent(MultiMenuDropDownContent, LFG_Dungeon_DropDown);
		LFGHelperSetDropDownContent(ChatChanel, LFG_ChatChanel_DropDown);
		-- Load lfm droplist
		LFGHelperDropDownMultiContent(MultiMenuDropDownContent, LFM_Dungeon_DropDown);
		LFGHelperSetDropDownContent(ChatChanel, LFM_ChatChanel_DropDown);
		-- Load option droplist
		LFGHelperSetDropDownContent(ChatChanel, Option_ShortLFG_Channel);
								
		-- Load the option page values
		if LFG_Helper_Options ~= nil then
			Option_EnabdleShortLFG:SetChecked(LFG_Helper_Options["EnableShortLFG"]);
			UIDropDownMenu_SetText(Option_ShortLFG_Channel, LFG_Helper_Options["ShortLFGChannel"]);
			LFGHelper_TriggerShortLFG(LFG_Helper_Options["EnableShortLFG"]);
			
			-- if the "WhisperPattern" option not exist, create the normal value for it
			if LFG_Helper_Options["WhisperPattern"] == nil then
				LFG_Helper_Options["WhisperPattern"] = "Hello %unit% we currently looking for a %rule% for \"%dungeon%\"";
			end
			Option_Whisper_Pattern_EditBox:SetText(LFG_Helper_Options["WhisperPattern"]);	
			
		else
			LFG_Helper_Options = {};
			LFG_Helper_Options["EnableShortLFG"] = false;
			LFG_Helper_Options["ShortLFGChannel"] = "None";
			LFG_Helper_Options["WhisperPattern"] = "Hello %unit% we currently looking for %rule% for the dungeon %dungeon%";
			
			Option_EnabdleShortLFG:SetChecked(LFG_Helper_Options["EnableShortLFG"]);
			UIDropDownMenu_SetText(Option_ShortLFG_Channel, LFG_Helper_Options["ShortLFGChannel"]);
			LFGHelper_TriggerShortLFG(LFG_Helper_Options["EnableShortLFG"]);
			Option_Whisper_Pattern_EditBox:SetText(LFG_Helper_Options["WhisperPattern"]);
		end
		
		if LFG_NotificationPattern == nil then
			LFG_NotificationPattern = {};
			
			for i in pairs(LFGHelper_GetDungeons()) do
				pattern = {};
				pattern["name"] = LFGHelper_GetDungeons()[i];
				pattern["state"] = false;
				table.insert(LFG_NotificationPattern, pattern);
			end
			
			for i in pairs(LFGHelper_GetRaids()) do
				pattern = {};
				pattern["name"] = LFGHelper_GetRaids()[i];
				pattern["state"] = false;
				table.insert(LFG_NotificationPattern, pattern);
			end
			
			for i in pairs(LFGHelper_GetBattlegrounds()) do
				pattern = {};
				pattern["name"] = LFGHelper_GetBattlegrounds()[i];
				pattern["state"] = false;
				table.insert(LFG_NotificationPattern, pattern);
			end
			
			create_notification_pattern();
		else
			create_notification_pattern();	
		end
	end
	
	if event == "CHAT_MSG_CHANNEL" then
		if LFG_Notifications["acitve"] ~= nil and LFG_Notifications["acitve"] == true then
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
MinimapBtn:Hide();

function LFM_MinimapBtn_OnClick() 
	-- ToggleDropDownMenu(1, nil, LFGHelper_MiniMenue, "cursor", 3, -3);

	if LFG_MainFrame:IsShown() == false then
		LFG_MainFrame:Show();
		-- reload muli content table
		wipe(MultiMenuDropDownContent);
		MultiMenuDropDownContent = {};
		MultiMenuDropDownContent["dungeons"] = LFGHelper_GetDungeons();
		MultiMenuDropDownContent["raids"] = LFGHelper_GetRaids();
		MultiMenuDropDownContent["quests"] = LFGHelper_GetQuests();
		MultiMenuDropDownContent["battlegrounds"] = LFGHelper_GetBattlegrounds();
		-- reload channel table
		wipe(ChatChanel);
		ChatChanel = LFGHelper_GetChanels();
		-- reload lfg dropdowns
		LFGHelperDropDownMultiContent(MultiMenuDropDownContent, LFG_Dungeon_DropDown);
		LFGHelperSetDropDownContent(ChatChanel, LFG_ChatChanel_DropDown);
		-- reload lfm channel
		LFGHelperDropDownMultiContent(MultiMenuDropDownContent, LFM_Dungeon_DropDown);
		LFGHelperSetDropDownContent(ChatChanel, LFM_ChatChanel_DropDown);
		-- reload option channel
		LFGHelperSetDropDownContent(ChatChanel, Option_ShortLFG_Channel);
	else
		LFG_MainFrame:Hide();
	end
end

function LFGHelper_TriggerShortLFG(enabled)
	if enabled then
		QuestFrameExitButton:Hide();
		LFG_Questlog_Button:Show();
	else
		QuestFrameExitButton:Show();
		LFG_Questlog_Button:Hide();
	end
end

SLASH_LFGH1 = '/lfgh';
function SlashCmdList.LFGH(msg)
	
	if string.find(msg, "post") ~= nil then
		local chanelStr = string.gsub(msg, "post ", "");
		local channelTbl = {strsplit(";", chanelStr)};
		for i in pairs(channelTbl) do
			SendChatMessage(LFG_Helper_LastMessage , "CHANNEL", nil, channelTbl[i]); 
		end
		return
	end

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