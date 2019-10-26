local addon = FGI
local fn = addon.functions
local L = FGI:GetLocale()
local settings = L.settings
local size = settings.size
local color = addon.color
local interface = addon.interface
local GUI = LibStub("AceGUI-3.0")
local FastGuildInvite = addon.lib
local DB
local fontSize = fn.fontSize
local debug = fn.debug

local auto_decline = {}
addon.msgQueue = {}



local function btnText(frame)
	local text = frame.text
	text:ClearAllPoints()
	text:SetPoint("TOPLEFT", 5, -1)
	text:SetPoint("BOTTOMRIGHT", -5, 1)
end

local function playerHaveInvite(msg)
	local place = strfind(ERR_GUILD_INVITE_S,"%s",1,true)
	if (place) then
		local n = strsub(msg,place)
		local name = strsub(n,1,(strfind(n,"%s") or 2)-1)
		if format(ERR_GUILD_INVITE_S,name) == msg then
			return "invite",name
		end
	end
	
	place = strfind(ERR_GUILD_PLAYER_NOT_FOUND_S,"%s",1,true)
	if (place) then
		n = strsub(msg,place)
		name = strsub(n,1,(strfind(n,"%s") or 2)-2)
		if format(ERR_GUILD_PLAYER_NOT_FOUND_S,name) == msg then
			return "not_found", name
		end
	else
		place = strfind(ERR_CHAT_PLAYER_NOT_FOUND_S,"%s",1,true)
		if (place) then
			n = strsub(msg,place)
			name = strsub(n,1,(strfind(n,"%s") or 2)-2)
			if format(ERR_CHAT_PLAYER_NOT_FOUND_S,name) == msg then
				return "not_found", name
			end
		end
	end
	
	place = strfind(ERR_GUILD_DECLINE_AUTO_S,"%s",1,true)
	if (place) then
		n = strsub(msg,place)
		name = strsub(n,1,(strfind(n,"%s") or 2)-1)
		if format(ERR_GUILD_DECLINE_AUTO_S,name) == msg then
			return "auto_decline", name
		end
	end
	
	return "unregistered_event", name
end


interface.scanFrame = GUI:Create("ClearFrame")
local scanFrame = interface.scanFrame
scanFrame:SetTitle("FGI Scan")
scanFrame:SetWidth(size.scanFrameW)
scanFrame:SetHeight(size.scanFrameH)
scanFrame.title:SetScript('OnMouseUp', function(mover)
	local frame = mover:GetParent()
	frame:StopMovingOrSizing()
	local self = frame.obj
	local status = self.status or self.localstatus
	status.width = frame:GetWidth()
	status.height = frame:GetHeight()
	status.top = frame:GetTop()
	status.left = frame:GetLeft()
	
	local point, relativeTo,relativePoint, xOfs, yOfs = scanFrame.frame:GetPoint(1)
	DB.global.scanFrame = {}
	DB.global.scanFrame.point=point
	DB.global.scanFrame.relativeTo=relativeTo
	DB.global.scanFrame.relativePoint=relativePoint
	DB.global.scanFrame.xOfs=xOfs
	DB.global.scanFrame.yOfs=yOfs
end)

scanFrame.closeButton = GUI:Create('Button')
local frame = scanFrame.closeButton
frame:SetText('X')
frame:SetWidth(frame.frame:GetHeight())
fn:closeBtn(frame)
frame:SetCallback('OnClick', function()
	interface.scanFrame:Hide()
end)
scanFrame:AddChild(frame)


local function SetProgress(self, cur)
	local function modTime(time)
		--[[if time<60 then return time end
		local min, sec = math.floor(time/60), math.fmod(time, 60)
		sec = sec<10 and "0"..sec or sec
		return format("%u:%s", min, sec)]]
		return SecondsToTime(time)
	end
	cur = (cur or 70) - self.progressTexture.min
	-- local max = self.progressTexture.max - self.progressTexture.min
	local max = self.progressTexture.max
	local percent = math.round(math.progress(max, cur))/100
	self.progressTexture:SetWidth((self.frame:GetWidth()-10)*percent)
	
	-- local time = modTime(math.round(max - cur))
	local time = math.round(max - cur)
	-- self.statustext:SetText(self.statustext.placeholder:format(math.floor(percent*100), (max - cur)<=0 and "<1" or time))
	self.statustext:SetText(self.statustext.placeholder:format(math.floor(percent*100), cur, max))
end

scanFrame.progressBar = GUI:Create("ProgressBar")
local frame = scanFrame.progressBar
frame.SetProgress = SetProgress
frame:SetPlaceholder("%s%% %s/%s")
fontSize(frame.statustext)
frame:SetWidth(scanFrame.frame:GetWidth()-20)
frame:SetHeight(30)
--frame:SetMinMax(GetTime(),GetTime()+200)
scanFrame:AddChild(frame)
--frame:SetProgress(GetTime()+180)




scanFrame.invite = GUI:Create("Button")
local frame = scanFrame.invite
frame:SetText(format(L["Пригласить: %d"],0))
-- fontSize(frame.text)
btnText(frame)
frame:SetWidth(size.inviteBTN)
frame:SetHeight(40)
frame:SetCallback("OnClick", function(self)
	fn:invitePlayer()
end)
scanFrame:AddChild(frame)


scanFrame.pausePlayFilter = CreateFrame("Frame")
local frame = scanFrame.pausePlayFilter
frame:RegisterEvent("CHAT_MSG_SYSTEM")
frame:SetScript("OnEvent", function(_,_,msg)
	local type, name = playerHaveInvite(msg)
	if not name then return end
	if type == "not_found" then
		DB.realm.alreadySended[name] = nil
		debug(format(ERR_GUILD_PLAYER_NOT_FOUND_S, name).." "..L["Игрок не добавлен в список исключений."], color.yellow)
	elseif type == "auto_decline" then
		debug(format(ERR_CHAT_PLAYER_NOT_FOUND_S, name), color.yellow)
		auto_decline[name] = true
	elseif type == "invite" then
		local list = addon.search.inviteList
		local msg = DB.realm.messageList[DB.realm.curMessage]
		if DB.global.inviteType == 2 then
			C_Timer.After(1, function() if not auto_decline[name] and addon.msgQueue[name] then fn:sendWhisper(msg, name); addon.msgQueue[name] = nil end end)
		end
	end
end)


scanFrame.pausePlayLabel = GUI:Create("TLabel")
local frame = scanFrame.pausePlayLabel
frame:SetWidth(38)
frame:SetHeight(40)
frame.label:SetJustifyH("CENTER")
frame.frame:SetFrameStrata("TOOLTIP")
frame:SetText('')
frame.timer = 0
fontSize(frame.label, nil, 18)
scanFrame:AddChild(frame)

scanFrame.pausePlay = GUI:Create("Button")
local frame = scanFrame.pausePlay
frame:SetWidth(38)
frame:SetHeight(40)
frame.frame.pause = true
frame.frame:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
frame:SetCallback("OnClick", function(self)
	if not fn:inGuildCanInvite() then return print(L["Вы не состоите в гильдии или у вас нет прав для приглашения."]) end
	scanFrame.pausePlay:SetDisabled(true)
	scanFrame.pausePlayLabel.timer = FGI_SCANINTERVALTIME
	scanFrame.pausePlayLabel.frame:SetFrameStrata("TOOLTIP")
	scanFrame.pausePlayLabel.frame:Show()
	C_Timer.NewTicker(1, function()
		local n = scanFrame.pausePlayLabel.timer
		scanFrame.pausePlayLabel.timer = scanFrame.pausePlayLabel.timer-1
		scanFrame.pausePlayLabel:SetText(scanFrame.pausePlayLabel.timer)
		if scanFrame.pausePlayLabel.timer == 0 then scanFrame.pausePlayLabel.frame:Hide() end
	end, FGI_SCANINTERVALTIME)
	scanFrame.pausePlayLabel:SetText(scanFrame.pausePlayLabel.timer)
	fn:nextSearch()
end)
scanFrame:AddChild(frame)






scanFrame.clear = GUI:Create("Button")
local frame = scanFrame.clear
frame:SetText(L["Сбросить"])
-- fontSize(frame.text)
btnText(frame)
frame:SetWidth(size.clearBTN)
frame:SetHeight(40)
frame:SetCallback("OnClick", function()
	scanFrame.invite:SetText(format(L["Пригласить: %d"],0))
	local resume = addon.search.state == "start"
	if resume then
		scanFrame.pausePlay.frame:Click()
	end
	addon.search.inviteList = {}
	addon.search.state = "stop"
	addon.search.progress = 1
	addon.search.timeShift = 0
	addon.search.tempSendedInvites = {}
	addon.search.whoQueryList = {}
	
	scanFrame.progressBar:SetMinMax(0, 1)
	scanFrame.progressBar:SetProgress(0)
	
	
	if resume then
		C_Timer.After(FGI_SCANINTERVALTIME+1, function() scanFrame.pausePlay.frame:Click() end)
	else
		addon.search.state = "stop"
	end
end)
scanFrame:AddChild(frame)



local frame = CreateFrame('Frame')
frame:RegisterEvent('PLAYER_LOGIN')
frame:SetScript('OnEvent', function()
	DB = addon.DB
	if DB.global.scanFrame then
		interface.scanFrame:ClearAllPoints()
		interface.scanFrame:SetPoint(DB.global.scanFrame.point, UIParent, DB.global.scanFrame.relativePoint, DB.global.scanFrame.xOfs, DB.global.scanFrame.yOfs)
	else
		interface.scanFrame:SetPoint("CENTER", UIParent)
	end
	C_Timer.After(0.1, function()
	scanFrame.closeButton:ClearAllPoints()
	scanFrame.closeButton:SetPoint("CENTER", scanFrame.frame, "TOPRIGHT", -8, -8)
	
	scanFrame.progressBar:ClearAllPoints()
	scanFrame.progressBar:SetPoint("TOP", scanFrame.frame, "TOP", 0, -25)
	
	scanFrame.invite:ClearAllPoints()
	scanFrame.invite:SetPoint("TOPLEFT", scanFrame.progressBar.frame, "BOTTOMLEFT", 4, 0)
	
	scanFrame.pausePlay:ClearAllPoints()
	scanFrame.pausePlay:SetPoint("LEFT", scanFrame.invite.frame, "RIGHT", 2, 0)
	
	scanFrame.pausePlayLabel:ClearAllPoints()
	scanFrame.pausePlayLabel:SetPoint("CENTER", scanFrame.pausePlay.frame, "CENTER", 0, 0)
	
	scanFrame.clear:ClearAllPoints()
	scanFrame.clear:SetPoint("LEFT", scanFrame.pausePlay.frame, "RIGHT", 2, 0)
	
	
	scanFrame:Hide()
	end)
end)
