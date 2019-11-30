local currentVersion = "1.1.2";

-- Create changelog frame
local LFG_Changelog_Frame = CreateFrame("Frame", "LFG_ChangeLog_Frame", UIParent, "UIPanelDialogTemplate");
LFG_Changelog_Frame:SetSize("500", "300");
LFG_Changelog_Frame:SetPoint("CENTER");
LFG_Changelog_Frame.text = LFG_Changelog_Frame:CreateFontString(nil,"ARTWORK","GameFontHighlight");
LFG_Changelog_Frame.text:SetPoint("TOPLEFT", 20, -8);
LFG_Changelog_Frame.text:SetText("|cffffff00 LFG Helper Changelog");
LFG_Changelog_Frame:SetFrameStrata("HIGH");
LFG_Changelog_Frame:RegisterEvent("ADDON_LOADED");
LFG_Changelog_Frame:Hide();

local LFG_Changelog_ScrollFrame = CreateFrame("ScrollFrame", "LFG_Changelog_ScrollFrame", LFG_Changelog_Frame, "UIPanelScrollFrameTemplate");
LFG_Changelog_ScrollFrame:SetPoint("TOPLEFT", 20, -30);
LFG_Changelog_ScrollFrame:SetSize("450", "260");

local LFG_Changelog_ScrollChild = CreateFrame("Frame", "LFG_Changelog_ScrollChild", nil);
LFG_Changelog_ScrollChild:SetSize("500", "800");
LFG_Changelog_ScrollChild:SetPoint("TOPLEFT");
LFG_Changelog_ScrollFrame:SetScrollChild(LFG_Changelog_ScrollChild);

local LFG_Changelog_SimpleHTML = CreateFrame('SimpleHTML', 'LFG_Changelog_SimpleHTML', LFG_Changelog_ScrollChild);
LFG_Changelog_SimpleHTML:SetPoint("TOPLEFT");
LFG_Changelog_SimpleHTML:SetFont('Fonts\\FRIZQT__.TTF', 11);
LFG_Changelog_SimpleHTML:SetFont('h1', 'Fonts\\FRIZQT__.TTF', 17);
LFG_Changelog_SimpleHTML:SetSize(450, 800);
LFG_Changelog_SimpleHTML:SetHyperlinkFormat("|cff71C671|H%s|h[%s]|h|r");

-- create the hyperlink frame
local lfg_hyperlink_frame = CreateFrame("Frame", "lfg_hyperlink_frame", LFG_Changelog_Frame, "TranslucentFrameTemplate");
lfg_hyperlink_frame:SetPoint("TOP",0, 100);
lfg_hyperlink_frame:SetSize(300, 75);
lfg_hyperlink_frame:Hide();

local lfg_hyperlink_editbox = CreateFrame("EditBox", "lfg_hyperlink_editbox", lfg_hyperlink_frame, "InputBoxTemplate");
lfg_hyperlink_editbox:SetPoint("CENTER", 0, 10);
lfg_hyperlink_editbox:SetSize(250, 30);
lfg_hyperlink_editbox:SetAutoFocus(false);

local lfg_hyperlink_closeBtn = CreateFrame("Button", "lfg_hyperlink_closeBtn", lfg_hyperlink_frame, "UIPanelButtonTemplate");
lfg_hyperlink_closeBtn:SetText("Close");
lfg_hyperlink_closeBtn:SetSize(100, 20);
lfg_hyperlink_closeBtn:SetPoint("BOTTOM", 0, 15);
lfg_hyperlink_closeBtn:SetScript("OnClick", function() LFGHelper_HyperlinkFrame_Close() end);

-- opens the hyperlink frame
function LFGHelper_Hyperlink(self, link, text, button)
	lfg_hyperlink_frame:Show();
	lfg_hyperlink_editbox:SetText(link);
end
LFG_Changelog_SimpleHTML:SetScript("OnHyperlinkClick", LFGHelper_Hyperlink)

-- closed the hyperlink frame
function LFGHelper_HyperlinkFrame_Close() 
	lfg_hyperlink_frame:Hide();
end

-- create a optionbutton to toggle the changelog
local Option_changelog_Button = CreateFrame("Button", "Option_changelog_Button", LFG_MainFrameTab4.content, "UIPanelButtonTemplate");
Option_changelog_Button:SetText("Changelog");
Option_changelog_Button:SetSize(120, 30);
Option_changelog_Button:SetPoint("BOTTOMLEFT", 20, 20);

-- frame events
function lfg_helper_changelog_onevent(self, event, arg1, arg2, ...)
	if event == "ADDON_LOADED" then
		
		-- LFG_Helper_Changelog = nil;
		
		-- create changelog table if it not exist
		if LFG_Helper_Changelog == nil then
			LFG_Helper_Changelog = {};
		end
		
		-- create new changelog if it not exist
		if LFG_Helper_Changelog[currentVersion] == nil then
			LFG_Helper_Changelog[currentVersion] = {};
			LFG_Helper_Changelog[currentVersion]["changelog"] = '<html><body><h1>Version: 1.1.0</h1><br/><h1>|cffff0000Major announcement|r</h1><p>I create a discord for my addons. The old link was broken this one is working fine. Please make sure to join the discord if you want report issues with the lfg-helper. You can join the discord with this url: <a href="https://discord.gg/Wt8sxhV">https://discord.gg/Wt8sxhV</a></p><br/><h1>|cffee4400New Features|r</h1><p>You have now a contex menu in your friend, guild and who list. You can send whisper messages to players.</p><br/><h1>|cffee4400Changes|r</h1><p>nothing changed so far :)</p><br/></body></html>';
			LFG_Helper_Changelog[currentVersion]["show"] = true;
			print("|cffffff00" .. "[LFG-Helper] New changelog aviable");
		end
		
		-- if the current version show = true then show the changelog frame
		if LFG_Helper_Changelog[currentVersion]["show"] == true then
			LFG_Changelog_SimpleHTML:SetText(LFG_Helper_Changelog[currentVersion]["changelog"]);
			LFG_Changelog_Frame:Show();
		end		
	end
end
LFG_Changelog_Frame:SetScript("OnEvent", lfg_helper_changelog_onevent);

-- frame closed event
function lfg_helper_changelog_closed() 
	LFG_Helper_Changelog[currentVersion]["show"] = false; 
end
LFG_ChangeLog_Frame:SetScript("OnHide", function() lfg_helper_changelog_closed() end);

-- toggle changelog frame from option tab
function lfg_helper_openChangeLog() 
	LFG_Changelog_SimpleHTML:SetText(LFG_Helper_Changelog[currentVersion]["changelog"]);
	LFG_Changelog_Frame:Show();
end
Option_changelog_Button:SetScript("OnClick", function() lfg_helper_openChangeLog() end);
