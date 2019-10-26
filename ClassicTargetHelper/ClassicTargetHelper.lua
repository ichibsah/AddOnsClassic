local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGOUT")
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "ClassicTargetHelper" then
        -- Our saved variables, if they exist, have been loaded at this point.
		if CTHspell == nil then
			CTHspell = 0
		end
		if CTmacroId == nil then
			CTmacroId = 0
		end
		if CTHicon == nil then
			CTHicon = 2
			DEFAULT_CHAT_FRAME:AddMessage("Classic Target Helper: Default icon set to Circle. /cthicon followed by icon name to change")
		end
    elseif event == "PLAYER_LOGOUT" then
        CTHspell = CTHspell
		CTmacroId = CTmacroId
		CTHicon = CTHicon
    end
end)
if CTHicon == nil then
	CTHicon = 2
	DEFAULT_CHAT_FRAME:AddMessage("Classic Target Helper: Default icon set to Circle. /cthicon followed by icon name to change")
end
local tmpMacroBody
if CTHspell == nil then
	CTHspell = 0
end
if CTmacroId == nil then
	CTmacroId = 0
end
SlashCmdList["CTH_SET"] = function(msg)
	-- define ability to cast (saved variable)
	CTHspell = msg
	DEFAULT_CHAT_FRAME:AddMessage(msg .. " set as your pull spell!")
end
SLASH_CTH_SET1 = "/cthspell"
SlashCmdList["CTH_CORE"] = function(msg)
	-- define macro text
	if CTHspell == 0 then
		tmpMacroBody = "/tar " .. msg .. "\n/run local i = " .. CTHicon .." if GetRaidTargetIndex(\"target\") ~= i then SetRaidTarget(\"target\", i) end\n/startattack\n/cleartarget [dead]"
		if CTmacroId == 0 then
			DEFAULT_CHAT_FRAME:AddMessage("Classic Target Helper: Target Macro set for " .. msg .. "! Place the macro onto your bars to get started. (Macro is character specific)", 0.0, 1.0, 1.0)
			DEFAULT_CHAT_FRAME:AddMessage("No pulling spell configured, type /cthspell followed by the name of the ability to enable. To disable this message type /cthspell none.", 1.0, 0.0, 0.0)
		else
			DEFAULT_CHAT_FRAME:AddMessage("Classic Target Helper: Target Macro set for " .. msg .. "!", 0.0, 1.0, 1.0)
			DEFAULT_CHAT_FRAME:AddMessage("No pulling spell configured, type /cthspell followed by the name of the ability to enable. To disable this message type /cthspell none.", 1.0, 0.0, 0.0)
		end
	elseif CTHspell == "none" then
		tmpMacroBody = "/tar " .. msg .. "\n/run local i = " .. CTHicon .." if GetRaidTargetIndex(\"target\") ~= i then SetRaidTarget(\"target\", i) end\n/startattack\n/cleartarget [dead]"
		if CTmacroId == 0 then
		DEFAULT_CHAT_FRAME:AddMessage("Classic Target Helper: Target Macro set for " .. msg .. "! Place the macro onto your bars to get started. (Macro is character specific)")
		else
		DEFAULT_CHAT_FRAME:AddMessage("Classic Target Helper: Target Macro set for " .. msg .. "!")
		end
	else
		tmpMacroBody = "/tar " .. msg .. "\n/run local i = " .. CTHicon .." if GetRaidTargetIndex(\"target\") ~= i then SetRaidTarget(\"target\", i) end\n/cast "
		tmpMacroBody = tmpMacroBody .. CTHspell .. "\n/cleartarget [dead]"
		if CTmacroId == 0 then
		DEFAULT_CHAT_FRAME:AddMessage("Classic Target Helper: Target Macro set for " .. msg .. "! Place the macro onto your bars to get started. (Macro is character specific)")
		else
		DEFAULT_CHAT_FRAME:AddMessage("Classic Target Helper: Target Macro set for " .. msg .. "!")
		end
	end
	-- check if macro exists
	if CTmacroId == 0 then
		-- create macro if not exists
		CTmacroId = CreateMacro("CT Helper", "INV_MISC_QUESTIONMARK", tmpMacroBody, 1)
	else
		-- edit macro if exists
		CTmacroId = EditMacro(CTmacroId, "CT Helper",  "INV_MISC_QUESTIONMARK", tmpMacroBody)
	end
end
SLASH_CTH_CORE1 = "/cth"

SlashCmdList["CTH_RESET"] = function(msg)
CTHspell = 0
CTmacroId = 0
CTHicon = 2
DEFAULT_CHAT_FRAME:AddMessage("Classic Target Helper: Addon settings have been reset! Please ensure to delete any macros before using the addon again.")
end
SLASH_CTH_RESET1 = "/cthreset"
function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
SlashCmdList["CTH_ICON"] = function(msg)
local c_str = firstToUpper(msg)
local c_tbl = {"Star", "Circle", "Diamond", "Triangle", "Moon", "Square", "Cross", "Skull"}
local i_changed = false
	for i,v in ipairs(c_tbl)
	do
		if v == c_str then
			CTHicon = i
			DEFAULT_CHAT_FRAME:AddMessage("Classic Target Helper: Default icon changed to " .. c_str, 0.0, 1.0, 1.0)
			i_changed = true
		end
	end
	if i_changed == false then
		DEFAULT_CHAT_FRAME:AddMessage("Classic Target Helper: Icon not changed, valid icons are Star, Circle, Diamond, Triangle, Moon, Square, Cross, Skull", 1.0, 0.0, 0.0)
	end

end
SLASH_CTH_ICON1 = "/cthicon"