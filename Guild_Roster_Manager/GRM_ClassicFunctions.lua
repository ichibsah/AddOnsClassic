-- CLASSIC Specific functions


-- ClubID create my own algorithm
GRM.CreateCustomGUIDValue = function( guildName )
    local result = 0;
    local nameByteArray = { string.byte ( guildName , 1 , -1 ) };
    for i = 1 , #nameByteArray do
        result = result + nameByteArray[i];
    end
    return result;
end

-- Method:          GRM.ClassicCheckForNewMember ( name )
-- What it Does:    Live checks when a player joins the guild and reports on it
-- Purpose:         For specific use on Classic. In Retail there is the new, vastly more efficient, community API. Here we aree forced to be somewhat limited.
GRM.ClassicCheckForNewMember = function ( name )
    local rosterName , rank , rankInd , level , zone , note , oNote , online , classFile , pts , rep , guid;
    local isFound = false;

    for i = 1 , GRM.GetNumGuildies() do
        rosterName , rank , rankInd , level , _ , zone , note , oNote , online , _ , classFile , pts , _ , _ , _ , rep , guid = GetGuildRosterInfo ( i );
        if name == rosterName then
            isFound = true;
            break;
        end
    end

    if isFound then           -- This means it shows successfully 1 found player...
        local race , sex;
        if guid ~= "" then
            race , sex = select ( 4 , GetPlayerInfoByGUID ( guid ) );
        end
        if race == nil or sex == nil then
            race , sex = select ( 4 , GetPlayerInfoByGUID ( guid ) );   -- Call a second time... sometimes the server is weird and the first call produces nil, but the immediate 2nd does respond.
            if race == nil or sex == nil then
                race = "";
                sex = 1;
            end
        end

        local info = {

        rosterName,
        rank, 
        rankInd,
        level,
        note,
        oNote,
        classFile,
        0,
        zone,
        pts,
        false,
        rep,
        true,
        0,              -- status is ZERO as in ONLINE
        guid,
        race,
        sex

        }

        GRM_G.changeHappenedExitScan = true;
        GRM.RecordJoinChanges ( info , GRM.GetClassColorRGB ( classFile , true ) .. GRM.SlimName ( name ) .. "|r" , true , select ( 2 , GRM.GetTimestamp() ) , true );

        -- Check Main Auto tagging...
        GRM.SetGuildInfoDetails();
        -- -- Delay for time to check "Unique Accounts" change...
        C_Timer.After ( 10 , function()               
            if GRM_G.DesignateMain then
                GRM.SetMain ( name , name , false , 0 );
                GRM.Report ( GRM.L ( "GRM Auto-Detect! {name} has joined the guild and will be set as Main" , GRM.GetClassifiedName ( name , true ) ) );
                if GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:IsVisible() then
                    GRM.RefreshAuditFrames ( true , true );
                end
            end
        end);

    elseif GRM_G.RejoinControlCheck <= 90 then
        GRM_G.RejoinControlCheck = GRM_G.RejoinControlCheck + 1;
        C_Timer.After ( 0.1 , function()
            -- Re-Check 1 time.
            GRM.ClassicCheckForNewMember( name );
        end);
        return;
    end

    GRM_G.RejoinControlCheck = 0;
end

-- Method:          GRM.GetParsedNameFromInviteAnnouncementWithoutServer ( string )
-- What it Does:    Parses out the player name from the system message of when a guildie joins the guild
-- Purpose:         In Classic the system message seems to not include the hyphen, so a new function needs to be used to determine the player.
GRM.GetParsedNameFromInviteAnnouncementWithoutServer = function ( text )
    local name = "";
    local index = 0;
    for i = 1 , GRM.GetNumGuildies() do
        name = GetGuildRosterInfo ( i );

        if string.find ( text , GRM.SlimName ( name ) , 1 , true ) ~= nil then      -- if not nil, name of a guildie matches that of the roster.
            -- NAME FOUND... break!
            index = i;
            break;
        end
    end
    return name , index;
end

-- Method:          GRM_UI.DisableFramesForClassic()
-- What it Does:    Disables option checkboxes that don't apply in Classic, but may be updated in the future.
-- Purpose:         Porting GRM to Classic needs to have this consideration for non-existent features, like the calendar, in the original Warcraft release.
GRM_UI.DisableFramesForClassic = function()

    if GRM_G.BuildVersion < 30000 then  -- Not introduced until WOTLK

        -- Event stuff
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText:SetTextColor ( 0.5 , 0.5 , 0.5 );
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText2:SetTextColor ( 0.5 , 0.5 , 0.5 );

        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButtonText:SetTextColor ( 0.5 , 0.5 , 0.5 );

        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetTextColor ( 0.5 , 0.5 , 0.5 );

        -- Levels
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Button:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor ( 0.5 , 0.5 , 0.5 );

        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Button:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor ( 0.5 , 0.5 , 0.5 );

        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Button:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor ( 0.5 , 0.5 , 0.5 );

        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Button:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor ( 0.5 , 0.5 , 0.5 );

        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Button:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor ( 0.5 , 0.5 , 0.5 );

        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Button:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor ( 0.5 , 0.5 , 0.5 );

        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Button:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor ( 0.5 , 0.5 , 0.5 );
    end
end

-- Method:          GRM.ClearRosterHighlights()
-- What it Does:    Unlocks the highlighted player of the guildRoster if any is selected
-- Purpose:         Needed to unlock the highlights properly so it is not confusing who is selected.
GRM.ClearRosterHighlights = function()
    SetGuildRosterSelection ( 0 );      -- If you do not clear the selection, it will just re-highlight the bar when it updates.
    for i = 1 , 13 do
        GetClickFrame ( "GuildFrameButton" .. i ):UnlockHighlight();
    end
end
