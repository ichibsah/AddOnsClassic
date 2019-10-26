
-- INSTRUCTIONS FOR LOCALIZATION

-- 1 ) Please avoid the "SYSTEM MESSAGES" as those are necessary for the addon code to properly identify and parse them. those are already complete.
-- 2 ) Any statement that "= true" needs to still be translated. Just remove the 'true' and replace it with the proper translation, in quotations 
--     Please include the {name} for where the player names should appear, as well as the few instances {num} needs to be included (referring to number)
-- 3 ) If appropriate, in the context of the sentence, please keep the spacing properly.
-- 4 ) Report any issues to Arkaan on CurseForge or Discord. -- You can also find me Battle.net @  DNADissector#1958   (US)
-- 5 ) THANK YOU SO MUCH FOR ADDING THIS TRANSLATION WORK!!! I will ensure you are mentioned in the release notes and at the top of this header for your contribution

-- Data insert points:
--  {name} and {name2}
--  {num}
--  {custom1} and {custom2}

    -- EXAMPLE NOTATION (English to Spanish)

    -- GRM_L["{name}'s Anniversary!"] = "Aniversario de {name}"

-- WARNING!!! 
-- DO NOT UPDATE GRM IF YOU HAVE NOT BACKED UP YOUR TRANSLATION WORK!!! Twitch and other services will overwrite your work without warning when they update!!!
-- WARNING!!!

    ---------------------------------
    -- BEGIN TRANSLATION WORK HERE --
    ---------------------------------

GRML.SpanishEU = function()

    -- SET YOUR OWN CUSTOM SLASH COMMAND FOR GRM
    GRM_L["/XXXX"] = true            -- /grm will always work, now you can make your own acronym that fits your language.

    GRM_L["German"] = "Alemán"
	GRM_L["English"] = "Inglés"
	GRM_L["French"] = "Francés"
	GRM_L["Italian"] = "Italiano"
	GRM_L["Russian"] = "Ruso"
	GRM_L["SpanishMX"] = "Español (MX)"
	GRM_L["SpanishEU"] = "Español (ЕU)"
    GRM_L["Portuguese"] = "Portugués (EU)"
    GRM_L["PortugueseBR"] = "Portugués (BR)"
	GRM_L["Korean"] = "Coreano"
	GRM_L["MandarinCN"] = "Mandarín (China)"
    GRM_L["MandarinTW"] = "Mandarín (Taiwán)"
    GRM_L["Dutch"] = "Holandés"
    GRM_L["Danish"] = "Danés"

    -- PLAYER MAIN ROSTER DETAILS WINDOW
    GRM_L["Level: "] = "Nivel: "
    GRM_L["Level"] = "Nivel"
    GRM_L["Note:"] = "Nota:"
    GRM_L["Note"] = "Nota"
    GRM_L["Officer's Note:"] = "Nota de oficial:"
    GRM_L["Officer's Note"] = "Nota de oficial"
    GRM_L["Zone:"] = "Zona:"
    GRM_L["(main)"] = true
    GRM_L["( Main )"] = true                                -- Context: This one is used on player data window, the other is smaller used in the alts list...
    GRM_L["Set as Main"] = true
    GRM_L["Set as Alt"] = true
    GRM_L["Remove"] = true
    GRM_L["Please Type the Name of the alt"] = true
    GRM_L["Promoted:"] = true
    GRM_L["Unknown"] = true                                                                 -- Context: The date of their promotion is "Unknown"
    GRM_L["Click here to set a Public Note"] = true
    GRM_L["Unable to Edit Public Note at Rank"] = true
    GRM_L["Click here to set an Officer's Note"] = true
    GRM_L["Unable to Edit Officer Note at Rank"] = true
    GRM_L["Unable to View Officer Note at Rank"] = true
    GRM_L["Online"] = true
    GRM_L["( Active )"] = true                       -- I included the parentheses here as I am not sure if any languages abstain from them, or use other notation. Feel free to remove if necessary
    GRM_L["( AFK )"] = true
    GRM_L["( Busy )"] = true
    GRM_L["( Mobile )"] = true
    GRM_L["( Offline )"] = true
    GRM_L["Set Join Date"] = true
    GRM_L["Edit Promo Date"] = true
    GRM_L["Edit Join Date"] = true
    GRM_L["Set Promo Date"] = true
    GRM_L["In Group"] = true                            -- Context: "Player is already In Group with you"
    GRM_L["Group Invite"] = true
    GRM_L["No Invite"] = true
    GRM_L["Group Invite"] = true
    GRM_L["Date Promoted?"] = true
    GRM_L["Last Online"] = true
    GRM_L["Time In:"] = true                            -- Context: "Time In" the current zone...
    GRM_L["Date Joined"] = true
    GRM_L["Join Date?"] = true
    GRM_L["Player Was Previously Banned!"] = true
    GRM_L["Ignore Ban"] = true
    GRM_L["Player Alts"] = true
    GRM_L["Add Alt"] = true
    GRM_L["Choose Alt"] = true
    GRM_L["(Press Tab)"] = true
    GRM_L["Shift-Mouseover Name On Roster Also Works"] = true
    GRM_L["Guild Log"] = true
    GRM_L["Guild"] = true

    -- TOOLTIPS
    GRM_L["Rank History"] = true 
    GRM_L["Time at Rank:"] = true
    GRM_L["Right-Click to Edit"] = true
    GRM_L["Left Guild"] = true
    GRM_L["Membership History"] = true
    GRM_L["Joined:"] = true                             -- as in "Joined" the guild
    GRM_L["Joined"] = true
    GRM_L["Left:"] = true                               -- as in, "Left" the guild
    GRM_L["Rejoined:"] = true                           -- as in, "Rejoined" the guild
    GRM_L["Rejoined"] = true
    GRM_L["Reset Data!"] = true
    GRM_L["Notify When Player is Active"] = true
    GRM_L["Notify When Player Goes Offline"] = true
    GRM_L["Notify When Player Comes Online"] = true
    GRM_L["Edit Date"] = true
    GRM_L["Clear History"] = true
    GRM_L["Options"] = true
    GRM_L["Cancel"] = true
            
    -- LOG
    GRM_L["LOG"] = true                                                     -- Context - The guild Log shorthand for the tab
    GRM_L["Guild Roster Event Log"] = true
    GRM_L["Clear Log"] = true
    GRM_L["Really Clear the Guild Log?"] = true
    GRM_L["{name} DEMOTED {name2}"] = true
    GRM_L["{name} PROMOTED {name2}"] = true
    GRM_L["{name} KICKED {name2} from the Guild!"] = true
    GRM_L["kicked"] = true
    GRM_L["{name} has Left the guild"] = true
    GRM_L["{name} INVITED {name2} to the guild."] = true
    GRM_L["{name} has BANNED {name2} and all linked alts from the guild!"] = true
    GRM_L["{name} has BANNED {name2} from the guild!"] = true
    GRM_L["Reason Banned:"] = true
    GRM_L["has Left the guild"] = true                                      -- Context: PlayerName "has left the guild"
    GRM_L["ALTS IN GUILD:"] = true                                          -- Context: This appears If a person leaves the guild and there are still alts in the guild. It is like - "ALTS IN GUILD: Arkaan, Chris, Matt, and 4 others.""
    GRM_L["Player no longer on Server"] = true
    GRM_L["{name} PROMOTED {name2} from {custom1} to {custom2}"] = true
    GRM_L["{name} has been PROMOTED from {custom1} to {custom2}"] = true
    GRM_L["{name} DEMOTED {name2} from {custom1} to {custom2}"] = true
    GRM_L["{name} has been DEMOTED from {custom1} to {custom2}"] = true
    GRM_L["(+ {num} More)"] = true                                          -- Context: Referencing num of alts if player leaves guild, that are stil in it. Example "ALTS IN GUILD: Christ, Matt, Sarah (and 4 more)"
    GRM_L["{name} has Been in the Guild {num} Times Before"] = true
    GRM_L["{name} is Returning for the First Time."] = true
    GRM_L["None Given"] = true                                              -- Context: No reason given for player ban. This is displayed when a player was banned, but the addon users did not input a reason why.
    GRM_L["WARNING!"] = true                                                -- Context: WARNING - banned player rejoined the guild!
    GRM_L["{name} REJOINED the guild but was previously BANNED!"] = true
    GRM_L["(Invited by: {name})"] = true
    GRM_L["Invited By: {name}"] = true
    GRM_L["Date of Ban:"] = true
    GRM_L["Date Originally Joined:"] = true
    GRM_L["Old Guild Rank:"] = true
    GRM_L["Reason:"] = true
    GRM_L["Additional Notes:"] = true
    GRM_L["{name} has REINVITED {name2} to the guild"] = true
    GRM_L["(LVL: {num})"] = true                                            -- Context: LVL means Player Level - so Ex: (LVL: 110)
    GRM_L["{name} has REJOINED the guild"] = true
    GRM_L["{name} has JOINED the guild!"] = true
    GRM_L["Date Left:"] = true
    GRM_L["{name} has Leveled to {num}"] = true
    GRM_L["Leveled to"] = true                                             -- For parsing the message, please include the string found in previous "has leveled to" message
    GRM_L["(+{num} levels)"] = true                                         -- Context: Person gained more than one level, hence the plural
    GRM_L["(+{num} level)"] = true                                          -- Context: Person gains a level, just one level.
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" was Added"] = true           -- Of note, the \" in the text here will just appear as " in-game. The \" notation is telling the program not to end the string, but to include quotation
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" was Removed"] = true
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" to \"{custom2}\""] = true    -- Context: "Arkaan's PUBLIC Note: "ilvl 920" to "Beast Mode ilvl 960""  -- Changing of the note. custom1 = old note, custom2 = new note
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" was Added"] = true
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" was Removed"] = true
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" to \"{custom2}\""] = true
    GRM_L["Guild Rank Renamed from {custom1} to {custom2}"] = true
    GRM_L["{name} has Name-Changed to {name2}"] = true
    GRM_L["{name} has Come ONLINE after being INACTIVE for {num}"] = true
    GRM_L["{name } Seems to Have Name-Changed, but their New Name was Hard to Determine"] = true
    GRM_L["It Could Be One of the Following:"] = true
    GRM_L["{name} has been OFFLINE for {num}. Kick Recommended!"] = true
    GRM_L["({num} ago)"] = true                                             -- Context: (5 minutes ago) or (5 months 24 days ago) -- the {num} will automatically include the time-passed date.
    GRM_L["{name}'s Guild has Name-Changed to \"{name2}\""] = true
    GRM_L["{name} will be celebrating {num} year in the Guild! ( {custom1} )"] = true            -- {custom1} will reference the DATE. Ex: "Arkaan will be celebrating 1 year in the Guild! ( 1 May )" - SINGULAR
    GRM_L["{name} will be celebrating {num} years in the Guild! ( {custom1} )"] = true           -- Same thing but PLURAL - "years" in stead of "year"
    GRM_L["Promotions"] = true
    GRM_L["Demotions"] = true

    -- EVENTS WINDOW
    GRM_L["EVENTS"] = true                                          -- Events tab
    GRM_L["{name}'s Anniversary!"] = true
    GRM_L["{name}'s Birthday!"] = true
    GRM_L["Please Select Event to Add to Calendar"] = true
    GRM_L["No Calendar Events to Add"] = true
    GRM_L["Event Calendar Manager"] = true
    GRM_L["Event:"] = true
    GRM_L["Description:"] = true
    GRM_L["Add to\nCalendar"] = true
    GRM_L["Ignore Event"] = true
    GRM_L["No Player Event Has Been Selected"] = true
    GRM_L["Event Added to Calendar: {custom1}"] = true              -- Custom1 = the title of the event, like "Arkaan's Anniversary"
    GRM_L["Please Select Event to Add to Calendar"] = true
    GRM_L["No Calendar Events to Add"] = true
    GRM_L["{name}'s event has already been added to the calendar!"] = true
    GRM_L["Please wait {num} more seconds to Add Event to the Calendar!"] = true
    GRM_L["{name}'s Event Removed From the Que!"] = true
    GRM_L["Full Description:"] = true

    -- BAN WINDOW
    GRM_L["BAN LIST"] = true                                        -- Ban List Tab
    GRM_L["Reason Banned?"] = true
    GRM_L["Click \"YES\" When Done"] = true                         -- Of note, the \" is how you notate for quotations to actually appear. Adjust as needed
    GRM_L["Select a Player"] = true
    GRM_L["Player Selected"] = true
    GRM_L["{name}(Still in Guild)"] = true
    GRM_L["(Still in Guild)"] = true                                -- same as previous, just formatting simplicity...
    GRM_L["No Ban Reason Given"] = true
    GRM_L["Reason:"] = true                                         -- Context: As in, "Reason Banned"
    GRM_L["Total Banned:"] = true
    GRM_L["Rank"] = true
    GRM_L["Ban Date"] = true
    GRM_L["No Players Have Been Banned from Your Guild"] = true
    GRM_L["Remove Ban"] = true
    GRM_L["Add Player to Ban List"] = true
    GRM_L["Server:"] = true
    GRM_L["Class:"] = true
    GRM_L["Reason:"] = true
    GRM_L["It is |CFFFF0000CRITICAL|r the player's name and server are spelled correctly for accurate tracking and notifications."] = true
    GRM_L["Submit Ban"] = true
    GRM_L["Confirm"] = true
    GRM_L["Cancel"] = true
    GRM_L["Add"] = true                                         -- Context: "Add" player to ban list
    GRM_L["Confirm Ban for the Following Player?"] = true
    GRM_L["Please Enter a Valid Player Name"] = true            -- Player Name
    GRM_L["Please Enter a Valid Server Name"] = true            -- Server Name
    GRM_L["Please Select a Player to Unban!"] = true
    GRM_L["{name} - Ban List"] = true                           -- Context: "GuildName - Ban List"
    GRM_L["No Reason Given"] = true

    -- ADDON USERS WINDOW
    GRM_L["SYNC USERS"] = true
    GRM_L["Ok!"] = true
    GRM_L["Their Rank too Low"] = true
    GRM_L["Your Rank too Low"] = true
    GRM_L["Outdated Version"] = true
    GRM_L["You Need Updated Version"] = true
    GRM_L["Player Sync Disabled"] = true
    GRM_L["No Guildie Online With Addon."] = true
    GRM_L["ONE Person is Online. Recommend It!"] = true
    GRM_L["{num} others are Online! Recommend It!"] = true
    GRM_L["GRM Sync Info"] = true
    GRM_L["Ver: {custom1}"] = true                                  -- Context:  Ver: R1.125  - Ver is short for Version
    GRM_L["Name:"] = true
    GRM_L["Version"] = true
    GRM_L["Sync"] = true
    GRM_L["Your Sync is Currently Disabled"] = true

    -- OPTIONS WINDOW
    GRM_L["Add Join Date to:  |cffff0000Officer Note|r"] = true         -- Context: Please keep |cffff0000 for color coding of the text, and the |r to signify the end of color change
    GRM_L["Add Join Date to:  Officer Note"] = true
    GRM_L["Public Note"] = true
    GRM_L["Scanning Roster:"] = true
    GRM_L["Guild Rank Restricted:"] = true
    GRM_L["Sync:"] = true
    -- Options window -- of note, these are very concise statements. They may need to be adjusted properly in the Options window for proper spacing, so verify they look ok after translating.
    GRM_L["Slash Commands"] = true
    GRM_L["Trigger scan for changes manually"] = true
    GRM_L["Trigger sync one time manually"] = true
    GRM_L["Centers all Windows"] = true
    GRM_L["Slash command info"] = true
    GRM_L["Resets ALL data"] = true
    GRM_L["Report addon ver"] = true                                    -- Ver is short for Version
    GRM_L["Resets Guild data"] = true
    GRM_L["Show at Logon"] = true
    GRM_L["Only Show if Log Changes"] = true
    
    -- This do need to be translated still
    GRM_L["Before Scan Timer"] = "Scan for Changes Every"                  -- Context: "Scan for Changes Every 10 Seconds" -- There will be a number added here and may require custom positioning, so please provide full statement and Arkaan will allign
    GRM_L["After Scan Timer"] = "Seconds"
    GRM_L["Before Inactive Timer"] = "Report Inactive Return if Player Offline"
    GRM_L["After Inactive Timer"] = "Days"

    GRM_L["Reactivating SCAN for Guild Member Changes..."] = true
    GRM_L["Deactivating SCAN of Guild Member Changes..."] = true
    GRM_L["Due to server data restrictions, a scan interval must be at least 10 seconds or more!"] = true
    GRM_L["Please choose an scan interval 10 seconds or higher!"] = true
    GRM_L["{num} is too Low!"] = true
    GRM_L["The Current Lvl Cap is {num}."] = true
    GRM_L["Kick Inactive Player Reminder at"] = true        -- Context: "Kick Inactive Player Reminder at X Months" - Again, allignment will need to be adjusted for options UI, so please post
    GRM_L["Please choose a month between 1 and 99"] = true
    GRM_L["Sync BAN List With Guildies at Rank"] = true     -- Context: "Sync Ban List with Guildies at Rank [DROPDOWNMENU OF RANKS] or Higher" - Please show where dropdown menu should be pinned
    GRM_L["or Higher"] = true                               -- Context: Look at the above statement. Show where this needs to go in regards to dropdown menu of rank selection in Options
    GRM_L["Restore Defaults"] = true
    GRM_L["Please choose between 1 and 180 days!"] = true
    GRM_L["Announce Events"] = true                         -- Context: "Announce Events X number of days in advance" -- the X is the editbox to modify number of days. Please include the location of where to pin that.
    GRM_L["Days in Advance"] = true
    GRM_L["Please choose between 1 and 28 days!"] = true
    GRM_L["Add Events to Calendar"] = true
    GRM_L["SYNC Changes With Guildies at Rank"] = true      -- Context: at Rank [DROPDOWNRANKSELECTION] or Higher. - Please note where to place dropdown box in the position of the sentence.
    GRM_L["Reactivating Data SYNC with Guildies..."] = true
    GRM_L["Deactivating Data SYNC with Guildies..."] = true
    GRM_L["Display Sync Update Messages"] = true
    GRM_L["Only Sync With Up-to-Date Addon Users"] = true
    GRM_L["Only Announce Anniversaries if Listed as 'Main'"] = true
    GRM_L["Leveled"] = true
    GRM_L["Min:"] = true                                    -- Context: As in, the Minimum level to report or announce when player levels up
    GRM_L["Inactive Return"] = true
    GRM_L["resetall"] = true
    GRM_L["resetguild"] = true
    GRM_L["Notify When Players Request to Join the Guild"] = true
    --Side chat/log controls - Of note, limited spacing
    GRM_L["Name Change"] = true
    GRM_L["Rank Renamed"] = true
    GRM_L["Event Announce"] = true
    GRM_L["Left"] = true                        -- Context: As in, "Left" the guild...
    GRM_L["Recommendations"] = true
    GRM_L["Banned"] = true
    GRM_L["To Chat:"] = true                    -- Context: "To Chat Message frame -- in regards to announcing events like when a player leveled"
    GRM_L["To Log:"] = true                     -- Context: To show it in the guild log.
    GRM_L["Display Changes"] = true
    GRM_L["Syncing too fast may cause disconnects!"] = true
    GRM_L["Speed:"] = true                      -- Context: Speed that the sync takes place.
    GRM_L["Show 'Main' Name in Chat"] = true

    -- AUDIT WINDOW
    GRM_L["AUDIT"] = true                                               -- Audit Tab name
    GRM_L["No Date Set"] = true
    GRM_L["Main"] = true
    GRM_L["Main or Alt?"] = true
    GRM_L["Alt"] = true
    GRM_L["Total Incomplete: {num} / {custom1}"] = true                 -- Context: Total Incomeplete: 50 / 100    (50 out of 100)
    GRM_L["Mains:\n{num}"] = true                                        -- Context: Number of "main" toons
    GRM_L["Unique Accounts:\n{num}"] = true
    GRM_L["All Complete"] = true                                        -- Context: All dates have been added and are known, thus it states it is "All Complete"
    GRM_L["Set Incomplete to Unknown"] = true                           -- Context: Implied to set ALL incomplete to unknown
    GRM_L["Clear All Unknown"] = true
    GRM_L["Please Wait {num} more Seconds"] = true
    GRM_L["Guild Data Audit"] = true
    GRM_L["Name"] = true
    GRM_L["Join Date"] = true
    GRM_L["Promo Date"] = true
    GRM_L["Main/Alt"] = true
    GRM_L["Click Player to Edit"] = true
    GRM_L["Only Show Incomplete Guildies"] = true

    -- ADDON SYSTEM MESSAGES
    GRM_L["Guild Roster Manager"] = true
    GRM_L["GRM:"] = true                                                                -- Abbreviation for "Guild Roster Manager"
    GRM_L["(Ver:"] = true                                                               -- Ver: is short for Version:
    GRM_L["GRM Updated:"] = true
    GRM_L["Configuring Guild Roster Manager for {name} for the first time."] = true
    GRM_L["Reactivating Auto SCAN for Guild Member Changes..."] = true
    GRM_L["Reactivating Data Sync..."] = true
    GRM_L["Notification Set:"] = true
    GRM_L["Report When {name} is ACTIVE Again!"] = true
    GRM_L["Report When {name} Comes Online!"] = true
    GRM_L["Report When {name} Goes Offline!"] = true
    GRM_L["A new version of Guild Roster Manager is Available!"] = true
    GRM_L["Please Upgrade!"] = true
    GRM_L["Player Does Not Have a Time Machine!"] = true
    GRM_L["Please choose a valid DAY"] = true
    GRM_L["{name} has been Removed from the Ban List."] = true
    GRM_L["{num} Players Have Requested to Join the Guild."] = true
    GRM_L["A Player Has Requested to Join the Guild."] = true
    GRM_L["Click Link to Open Recruiting Window:"] = true
    GRM_L["Guild Recruits"] = true
    GRM_L["Scanning for Guild Changes Now. One Moment..."] = true
    GRM_L["Breaking current Sync with {name}."] = true
    GRM_L["Breaking current Sync with the Guild..."] = true
    GRM_L["Initializing Sync Action. One Moment..."] = true
    GRM_L["No Players Currently Online to Sync With..."] = true
    GRM_L["No Addon Users Currently Compatible for FULL Sync."] = true
    GRM_L["SYNC is currently not possible! Unable to Sync with guildies when guild chat is restricted."] = true
    GRM_L["There are No Current Applicants Requesting to Join the Guild."] = true
    GRM_L["The Applicant List is Unavailable Without Having Invite Privileges."] = true
    GRM_L["Manual Scan Complete"] = true
    GRM_L["Analyzing guild for the first time..."] = true
    GRM_L["Building Profiles on ALL \"{name}\" members"] = true                 -- {name} will be the Guild Name, for context
    GRM_L["NOTIFICATION:"] = true                                               -- Context:  "Notification: Player is no longer AFK"
    GRM_L["{name} is now ONLINE!"] = true
    GRM_L["{name} is now OFFLINE!"] = true
    GRM_L["{name} is No Longer AFK or Busy!"] = true
    GRM_L["{name} is No Longer AFK or Busy, but they Went OFFLINE!"] = true
    GRM_L["{name} is Already in Your Group!"] = true
    GRM_L["GROUP NOTIFICATION:"] = true
    GRM_L["Players Offline:"] = true
    GRM_L["Players AFK:"] = true
    GRM_L["40 players have already been invited to this Raid!"] = true
    GRM_L["Player should try to obtain group invite privileges."] = true
    GRM_L["{name}'s saved data has been wiped!"] = true
    GRM_L["Re-Syncing {name}'s Guild Data..."] = true
    GRM_L["Wiping all Saved Roster Data Account Wide! Rebuilding from Scratch..."] = true
    GRM_L["Wiping all saved Guild data! Rebuilding from scratch..."] = true
    GRM_L["There are No Log Entries to Delete, silly {name}!"] = true
    GRM_L["Guild Log has been RESET!"] = true
    GRM_L["{name} is now set as \"main\""] = true
    GRM_L["{name} is no longer set as \"main\""] = true
    GRM_L["Reset All of {name}'s Data?"] = true
    
    -- /grm help
    GRM_L["Opens Guild Log Window"] = true
    GRM_L["Resets ALL saved data"] = true
    GRM_L["Resets saved data only for current guild"] = true
    GRM_L["Re-centers the Log window"] = true
    GRM_L["Triggers manual re-sync if sync is enabled"] = true
    GRM_L["Does a one-time manual scan for changes"] = true
    GRM_L["Displays current Addon version"] = true
    GRM_L["Opens Guild Recruitment Window"] = true
    GRM_L["WARNING! complete hard wipe, including settings, as if addon was just installed."] = true;

    -- General Misc UI
    GRM_L["Really Clear All Account-Wide Saved Data?"] = true
    GRM_L["Really Clear All Guild Saved Data?"] = true
    GRM_L["Yes!"] = true
    GRM_L["Ban Player?"] = true
    GRM_L["Ban the Player's {num} alts too?"] = true      -- Plural number of alts
    GRM_L["Ban the Player's {num} alt too?"] = true     -- Singular number of alts, just 1
    GRM_L["Please Click \"Yes\" to Ban the Player!"] = true

    -- Sync Messages
    GRM_L["{name} updated {name2}'s Join Date."] = true
    GRM_L["{name} updated {name2}'s Promotion Date."] = true
    GRM_L["\"{custom1}\" event added to the calendar by {name}"] = true
    GRM_L["{name} updated {name2}'s list of Alts."] = true
    GRM_L["{name} removed {name2}'s from {custom1}'s list of Alts."] = true
    GRM_L["{name} set {name2} to be 'Main'"] = true
    GRM_L["{name} has changed {name2} to be listed as an 'alt'"] = true
    GRM_L["{name} has Removed {name2} from the Ban List."] = true
    GRM_L["{name} has been BANNED from the guild!"] = true
    GRM_L["{name} has been UN-BANNED from the guild!"] = true
    GRM_L["Initiating Sync with {name} Instead!"] = true
    GRM_L["Sync Failed with {name}..."] = true
    GRM_L["The Player Appears to Be Offline."] = true
    GRM_L["There Might be a Problem With Their Sync"] = true
    GRM_L["While not ideal, Ask Them to /reload to Fix It and Please Report the Issue to Addon Creator"] = true
    GRM_L["Manually Syncing Data With Guildies Now... One Time Only."] = true
    GRM_L["Syncing Data With Guildies Now..."] = true
    GRM_L["(Loading screens may cause sync to fail)"] = true
    GRM_L["Sync With Guildies Complete..."] = true
    GRM_L["Manual Sync With Guildies Complete..."] = true
    GRM_L["No Players Currently Online to Sync With. Re-Disabling Sync..."] = true
    GRM_L["{name} tried to Sync with you, but their addon is outdated."] = true
    GRM_L["Remind them to update!"] = true

    
    -- ERROR MESSAGES
    GRM_L["Notification Has Already Been Arranged..."] = true
    GRM_L["Failed to add alt for unknown reason. Try closing Roster window and retrying!"] = true
    GRM_L["{name} is Already Listed as an Alt."] = true
    GRM_L["{name} cannot become their own alt!"] = true
    GRM_L["Player Cannot Add Themselves as an Alt"] = true
    GRM_L["Player Not Found"] = true
    GRM_L["Please try again momentarily... Updating the Guild Event Log as we speak!"] = true
    GRM_L["Invalid Command: Please type '/grm help' for More Info!"] = true
    GRM_L["{name} is not currently in a guild. Unable to Proceed!"] = true
    GRM_L["Addon does not currently support more than 75 alts!"] = true
    GRM_L["Please choose a VALID character to set as an Alt"] = true
    GRM_L["Please choose a character to set as alt."] = true
    GRM_L["GRM ERROR:"] = true
    GRM_L["Com Message too large for server"] = true                    -- Context: "Com message" is short-hand for "Communications message" - this is a technical error on syncing data.
    GRM_L["Prefix:"] = true
    GRM_L["Msg:"] = true                                                -- Context: Msg is short for Message
    GRM_L["Unable to register prefix > 16 characters: {name}"] = true   -- Context: The {name} is the string code for the prefix. This is for debugging.


    --SLASH COMMANDS
    -- These are generally written in general shorthand. The original commands will ALWAYS work, but if there is one that makes more sense in your language, please feel free to modify
    GRM_L["clearall"] = true                        -- Context: In regards, "Clear All" saved data account wide 
    GRM_L["clearguild"] = true                      -- Context: In regards, "Clear All" saved data from ONLY the current guild.
    GRM_L["hardreset"] = true                       -- Context: In regards, "Hard Reset" ALL data account wide, including wiping player settings
    GRM_L["help"] = true                            -- Context: "help" with info on the how to use addon
    GRM_L["version"] = true                         -- Context: "version" of the addon
    GRM_L["center"] = true                          -- Context: "center" the movable addon window back to center of screen
    GRM_L["sync"] = true                            -- Context: "sync" the data between players one time now.
    GRM_L["scan"] = true                            -- Context: "scan" for guild roster changes one time now.
    GRM_L["clearall"] = true                        -- Context: In regards, "Clear All" saved data
    GRM_L["recruit"] = true                         -- Context: Open the roster "recruit" window where people request to join guild

    -- CLASSES
    GRM_L["Deathknight"] = "Caballero de la Muerte"
    GRM_L["Demonhunter"] = "Cazador de demonios"
    GRM_L["Druid"] = "Druida"
    GRM_L["Hunter"] = "Cazador"
    GRM_L["Mage"] = "Mago"
    GRM_L["Monk"] = "Monje"
    GRM_L["Paladin"] = "Paladín"
    GRM_L["Priest"] = "Sacerdote"
    GRM_L["Rogue"] = "Pícaro"
    GRM_L["Shaman"] = "Chamán"
    GRM_L["Warlock"] = "Brujo"
    GRM_L["Warrior"] = "Guerrero"

    -- TIME AND DATES
    GRM_L["1 Mar"] = "1 mar"                           -- This date is used in a specific circumstance. If someone's anniversary/bday landed on a leap year (Feb 29th), it defaults to the 1st of March on non-leap year
    -- Full Month Name
    GRM_L["January"] = "enero"
    GRM_L["February"] = "febrero"
    GRM_L["March"] = "marzo"
    GRM_L["April"] = "abril"
    GRM_L["May"] = "mayo"
    GRM_L["June"] = "junio"
    GRM_L["July"] = "julio"
    GRM_L["August"] = "agosto"
    GRM_L["September"] = "setiembre"
    GRM_L["October"] = "octubre"
    GRM_L["November"] = "noviembre"
    GRM_L["December"] = "diciembre"
    -- Shorthand Month
    GRM_L["Jan"] = "ene"
    GRM_L["Feb"] = "feb"
    GRM_L["Mar"] = "mar"
    GRM_L["Apr"] = "abr"
    GRM_L["May"] = "may"
    GRM_L["Jun"] = "jun"
    GRM_L["Jul"] = "jul"
    GRM_L["Aug"] = "ago"
    GRM_L["Sep"] = "set"
    GRM_L["Oct"] = "oct"
    GRM_L["Nov"] = "nov"
    GRM_L["Dec"] = "dic"
    -- Time Notifcation
    GRM_L["Seconds"] = true
    GRM_L["Second"] = true
    GRM_L["Minutes"] = true
    GRM_L["Minute"] = true
    GRM_L["Hours"] = true
    GRM_L["Hour"] = true
    GRM_L["Days"] = true
    GRM_L["Day"] = true
    GRM_L["Months"] = true
    GRM_L["Month"] = true
    GRM_L["Years"] = true
    GRM_L["Year"] = true
    GRM_L["HourBreak"] = ":"            -- Context, in English, and many languages, 11am = 11:00 -- or in French, 11h00   - the hour break is the ":" or the "h" 

    GRM_L["am"] = true
    GRM_L["pm"] = true
    GRM_L["24HR_Notation"] = "";        -- if someone is using 24hr time notation in your country, instead of 12hr, how do you notate it? In English, there is no am/pm (though "hours" is technically right, but unnecessary)

    GRM_L["{num} year"] = true
    GRM_L["{num} years"] = true
    GRM_L["{num} month"] = true
    GRM_L["{num} months"] = true
    GRM_L["{num} day"] = true
    GRM_L["{num} days"] = true
    GRM_L["< 1 day"] = true

    GRM_L["{num} yr"] = true
    GRM_L["{num} yrs"] = true
    GRM_L["{num} mo"] = true
    GRM_L["{num} mos"] = true
    GRM_L["{num} hr"] = true
    GRM_L["{num} hrs"] = true
    GRM_L["< 1 hour"] = true
    GRM_L["{num} {custom1}"] = true     -- Context: This is a placeholder for ANY generic time data -- Ex:  "1 year" or "15 months" - The translation is set this is just to set the orientation of the number properly.

    -- MISC Punctuation
    GRM_L[","] = true                               -- I know in some Asia languages, a comma is not used, but something similar, for example.

    -- Updates 1.126
    GRM_L["General"] = true
    GRM_L["General:"] = true
    GRM_L["Scan"] = true
    GRM_L["Help"] = true
    GRM_L["UI"] = true                              -- UI for User Interface. Abbreviation for changing custom UI featuers, like coloring of <M> main
    GRM_L["Officer"] = true                         -- as in, "Officer" rank
    GRM_L["Open Addon Window"] = true
    GRM_L["Sync Addon Settings on All Alts in Same Guild"] = true
    GRM_L["Show Minimap Button"] = true
    GRM_L["Player is Not Currently in a Guild"] = true
    -- tooltips
    GRM_L["|CFFE6CC7FClick|r to open GRM"] = true                           -- Please maintain the color coding
    GRM_L["|CFFE6CC7FRight-Click|r and drag to move this button."] = true   -- Likewise, maintain color coding
    GRM_L["|CFFE6CC7FRight-Click|r to Reset to 100%"] = true                -- for the Options slider tooltip
    GRM_L["|CFFE6CC7FRight-Click|r to Sync Join Date with Alts"] = true
    GRM_L["|CFFE6CC7FRight-Click|r to Set Notification of Status Change"] = true
    -- tooltip end
    GRM_L["GRM"] = true
    GRM_L["Include Unknown as Incomplete"] = true                           -- Context: Unknown in the Audit Tab will be hidden if filtering out complete players
    GRM_L["You Do Not Have Permission to Add Events to Calendar"] = true
    GRM_L["Please Select Which Join Date to Sync"] = true
    GRM_L["Sync All Alts to {name}'s Join Date"] = true
    GRM_L["Sync All Alts to the Earliest Join Date: {name}"] = true
    GRM_L["Sync All Alts to {name}'s |cffff0000(main)|r Join Date"] = true  -- The coloring ensures that "(main)" maintains the RED color. Please keep it consistent if relevant to your language.
    GRM_L["Join Date of All Alts is Currently Synced"] = true

    -- Update 1.130
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to Hide this Button."] = true
    GRM_L["Invited By:"] = true
    GRM_L["To avoid storage bloat, a maximum of 2 save points is currently possible. Please remove one before Continuing."] = true
    GRM_L["Error: Guild Not Found..."] = true
    GRM_L["Debugger Start"] = true;

    -- Update 1.136
    GRM_L["To avoid storage bloat, a maximum of 2 guild save points is currently possible. Please remove one before continuing"] = true
    GRM_L["Backup Point Removed for Guild \"{name}\""] = true
    GRM_L["Backup Point Restored for Guild \"{name}\""] = true
    GRM_L["Backup Point Set for Guild \"{name}\""] = true
    GRM_L["Backup"] = true
    GRM_L["Horde"] = true
    GRM_L["Alliance"] = true
    GRM_L["Creation Date"] = true
    GRM_L["Members"] = true
    GRM_L["Backup {num}:"] = true           -- As in, the number of backups... so "Backup 1:"
    GRM_L["None"] = true
    GRM_L["Restore"] = true
    GRM_L["Set Backup"] = true
    GRM_L["Memory Usage: {num} MB"] = true          -- MB references the number of MegaBytes of memory used.

    -- Update 1.137
    GRM_L["GRM: Unable to Create Backup for a Guild With Unknown Creation Date! Log into that guild on any alt to update old database."] = true
    GRM_L["Enable Auto-Backup Once Every"] = true
    GRM_L["Auto {num}:"] = true
    GRM_L["Please Choose a Time Interval Between 1 and 99 Days!"] = true
    GRM_L["Really restore {name} Backup Point?"] = true
    GRM_L["Check All"] = true

    -- Update 1.139
    GRM_L["Right-Click for options to remove this guild from the addon database completely"] = true
    GRM_L["Player Cannot Purge the Guild Data they are Currently In!!!"] = true
    GRM_L["To reset your current guild data type '/grm clearguild'"] = true
    GRM_L["Click Here to Remove all traces of this guild, or hit ESC"] = true
    GRM_L["{name} has been removed from the database."] = true              -- The Guild Name has been removed from the database

    -- update 1.141
    GRM_L["You will still share your data with the guild, but you are currently only accepting incoming changes from rank \"{name}\" or higher"] = true    -- Reminder, the backslash before a quotation denotes the string NOT to close, but to include the quotation in display txt
    GRM_L["Only Restrict Incoming Player Data to Rank Threshold, not Outgoing"] = true
    GRM_L["Total Entries: {num}"] = true
    GRM_L["Search Filter"] = true

    -- update 1.142
    GRM_L["Choose Color:"] = true
    GRM_L["Format:"] = true
    GRM_L["RGB Values Must be Between 1 and 255."] = true

    -- Update 1.143
    GRM_L["The Log is Currently Empty for This Guild"] = true
    GRM_L["Building Log for Export..."] = true
    GRM_L["Open Log Tools"] = true
    GRM_L["Hide Log Tools"] = true
    GRM_L["Numbered Lines"] = true
    GRM_L["Export Log"] = true
    GRM_L["Clear Lines:"] = true
    GRM_L["Enable Ctrl-Shift-Click Line Removal"] = true
    GRM_L["To"] = true                                      -- Clear Lines:  50 To 100     -- It stands between 2 edit boxes as its own fontstring, so work with that.
    GRM_L["Confirm Clear"] = true
    GRM_L["Please Select Range of Lines from the Log You Wish to Remove"] = true
    GRM_L["Please put the lowest number in the first box"] = true
    GRM_L["Line selection is not valid"] = true
    GRM_L["Really Clear lines {custom1} to {custom2}?"] = true
    GRM_L["Enabling Line Numbers... Please choose within the given range"] = true
    GRM_L["Ctrl-C to Copy <> Ctrl-P to Paste <> Ctrl-A to Select All"] = true
    GRM_L["Language Selection:"] = true
    GRM_L["{num} phrases still need translation to {name}"] = true                  -- Ex: 300 phrases still need translation to German

    -- update 1.145
    GRM_L["You currently are at {num} non-Battletag friends. To fully take advantage of all of GRM features, please consider clearing some room."] = true
    GRM_L["Clear Space on Friends List to Find Online Status"] = true
    GRM_L["Offline"] = true
    GRM_L["{name} has requested to join the guild and is currently ONLINE!"] = true

    -- Update 1.146
    GRM_L["Really Clear line {num}?"] = true
    GRM_L["Font has been Reset to DEFAULT."] = true
    GRM_L["Font Selection:"] = true
    GRM_L["Font Scale:"] = true
    GRM_L["Example"] = true
    GRM_L["Right-Click to Reset to 100%"] = true

    -- Update 1.147
    GRM_L["|CFFE6CC7FClick|r to open Player Window"] = true
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to Search the Log for Player"] = true

    -- Update 1.1480
    GRM_L["Custom Notes:"] = true
    GRM_L["GRM Debugging Enabled."] = true
    GRM_L["GRM Debugging Disabled."] = true
    GRM_L["Please type \"/grm debug 10\" to report 10 events (or any number)"] = true        -- Please keep the \"/grm debug 10)\" in-tact for slash command to work
    GRM_L["Format: \"/grm debug 10\""] = true                                                                  -- "" Likewise
    GRM_L["Error: Debug Command not recognized."] = true
    GRM_L["You may want to temporarily disable SYNC in the options if you are debugging another feature."] = true
    GRM_L["Sync Custom Notes"] = true
    GRM_L["Default Custom Note Rank Minimum"] = true
    GRM_L["Reset Default Custom Note Restrictions for ALL Guildies"] = true
    GRM_L["Reset to Default"] = true
    GRM_L["Reset"] = true
    GRM_L["|CFF00CCFFDefault Selection For All Players"] = true
    GRM_L["Each Guildie Can Still be Manually Configured"] = true
    GRM_L["Does NOT apply to Ban List or Custom Note"] = true
    GRM_L["Custom note Rank reset to default \"{name}\" (or higher)"] = true
    GRM_L["If sync was manually disabled for specific guildies, this does NOT enabled it."] = true
    GRM_L["Custom note default settings for Rank and Sync have been reset."] = true
    GRM_L["Custom note Sync has been reset to default"] = true
    GRM_L["Click here to set Custom Notes"] = true
    GRM_L["|CFF00CCFFCustom Note Defaults:"] = true
    GRM_L["|CFFE6CC7FLeft-Click|r to ONLY reset all to default rank"] = true
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to reset BOTH sync and rank defaults"] = true
    GRM_L["|CFFE6CC7FCtrl-Left-Click|r to re-enable custom note sync for all"] = true
    GRM_L["Custom Note Sync Disabled in Settings"] = true
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" was Added"] = true
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" was Removed"] = true
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" to \"{custom2}\""] = true
    GRM_L["Custom Note"] = true
    GRM_L["Syncing Outgoing Data."] = true
    GRM_L["|CFFE6CC7FClick|r to Change Rank Restriction"] = true
    GRM_L["|CFFE6CC7FClick|r to Change Day"] = true
    GRM_L["|CFFE6CC7FClick|r to Change Month"] = true;
    GRM_L["|CFFE6CC7FClick|r to Change Year"] = true;
    GRM_L["Edited by {name}"] = true
    GRM_L["Note Removed by {name}"] = true
    GRM_L["|CFFFF0000Player No Longer in Guild"] = true
    GRM_L["|CFF00CCFFMinimum Rank to Sync: Player Data, Custom Notes, Ban List"] = true
    GRM_L["Warning! Ban List rank threshold is below the overall sync rank. Changing from \"{name}\" to \"{name2}\""] = true
    GRM_L["Warning! Custom Note rank threshold is below the overall sync rank. Changing default from \"{name}\" to \"{name2}\""] = true
    GRM_L["Custom Note Default Rank is Also Being Set to \"{name}\""] = true
    GRM_L["|CFF00CCFFSync filter can be set tighter for the Ban List"] = true
    GRM_L["Warning! Unable to select a Ban List rank below \"{name}\""] = true
    GRM_L["Warning! Custom Note rank filter must be below \"{name}\""] = true
    GRM_L["Setting to match core filter rank"] = true
    GRM_L["Warning! \"{name}\" is the lowest rank that can receive this custom note.\nCheck the options menu to adjust overall settings."] = true

    -- R1.1482
    GRM_L["Shift-Click Name On Roster Also Works"] = true
    GRM_L["Tooltip Scale:"] = true
    GRM_L["|CFFE6CC7FLeft-Click|r to Change the Language"] = true
    GRM_L["|CFFE6CC7FLeft-Click|r to Change Display Format"] = true
    GRM_L["|CFFE6CC7FLeft-Click|r to Change the Font"] = true
    GRM_L["Unfortunately each player's data will need to be manually reconfigured."] = true
    GRM_L["{num} custom {custom1} removed that matched text:"] = true                           -- custom1 = "note" or the plural "notes"
    GRM_L["notes"] = true
    GRM_L["Please add specific text, in quotations, to match"] = true

    -- R1.1490
    GRM_L["You will still share some outgoing data with the guild"] = true
    GRM_L["Unable to properly locate guild for backup"] = true

    -- R1.1500
    GRM_L["It's almost time to celebrate {name}'s Birthday!"] = true          -- Custom1 is the actual date.  Like "1 Mar '18"
    GRM_L["Unique accounts pull from the server is known to be faulty"] = true
    GRM_L["Use only as an estimate. Hopefully Blizz fixes this soon"] = true
    GRM_L["{name}'s Anniversary!"] = true
    GRM_L["{name}'s Birthday!"] = true
    GRM_L["Guild member for over {num} year"] = true
    GRM_L["Guild member for over {num} years"] = true   -- the plural version!
    GRM_L["Add Upcoming Events to the Calendar"] = true
    GRM_L["Player rank unable to add events to calendar"] = true
    GRM_L["Anniversaries, Birthdays, and Other Events can be added with permission"] = true

    -- R1.1510
    GRM_L["Check the \"Sync Users\" tab to find out why!"] = true
    GRM_L["Time as Member:"] = true
    GRM_L["|CFFE6CC7FClick|r to select player event"] = true
    GRM_L["|CFFE6CC7FClick Again|r to open Player Window"] = true
    GRM_L["Timestamp Format:"] = true
    GRM_L["Hour Format:"] = true
    GRM_L["24 Hour"] = true
    GRM_L["12 Hour (am/pm)"] = true
    GRM_L["Enable Fade on Tab Change"] = true
    GRM_L["Confirm Custom Note"] = true

    -- R1.1520
    GRM_L["A new rank has been added to the guild!"] = true
    GRM_L["{num} new ranks have been added to the guild!"] = true
    GRM_L["The guild has removed a rank!"] = true
    GRM_L["{num} guild ranks have been removed!" ] = true
    GRM_L["Edit Ban"] = true
    GRM_L["Please Select a Player to Edit their Ban!"] = true
    GRM_L["Update Ban"] = true
    GRM_L["{name}'s Ban Info has Been Updated!"] = true

    -- R1.1530
    GRM_L["{name} plays the {custom1} class, not {custom2}."] = true             -- Example: Arkaan plays the Hunter class, not Paladin.
    GRM_L["{num} Items Updated"] = true
    GRM_L["You Currently Have Disabled Adding Events to Calendar"] = true

    -- R1.20
    GRM_L["|CFFE6CC7FHold Shift|r to view more alt details."] = true                -- "Hold Shift to view more alt details" is the phrase, but the |CFF|r is the text coloring hex code. Please keep it in there on the keyboard command coloring
    GRM_L["|CFFE6CC7FClick|r to view more alt details."] = true
    GRM_L["|CFFE6CC7FShift-Click|r to keep alt details open."] = true               -- The same can be said here. ^^
    GRM_L["|CFFE6CC7FClick|r to flip player name ordering"] = true                  -- and the reset...
    GRM_L["|CFFE6CC7FClick|r to sort Join Dates by Newest"] = true
    GRM_L["|CFFE6CC7FClick|r to sort Join Dates by Oldest"] = true
    GRM_L["|CFFE6CC7FClick|r to sort Promotion Dates by Newest"] = true
    GRM_L["|CFFE6CC7FClick|r to sort Promotion Dates by Oldest"] = true
    GRM_L["|CFFE6CC7FClick|r to sort all Mains first"] = true
    GRM_L["|CFFE6CC7FClick|r to sort all Alts first."] = true
    GRM_L["{name}'s Profile is Being Built. One Moment..."] = true
    GRM_L["There are {num} players requesting to join your guild. You only have room for {custom1} more friends. Please consider cleaning up your friend and recruitment lists."] = true;
    GRM_L["{name}'s Alts"] = true                                   -- Like "Arkaan's Alts"
    GRM_L["Online:  {num}/{custom1}"] = true                         -- As in "Online: 3/59"
    GRM_L["Next"] = true                                            -- This means to Advance forward to the "next" one. It is used on recruitment window to move to NEXT online player.
    GRM_L["Previous"] = true                                        -- Same context as the "next" except this one goes back to the one before.
    GRM_L["There are currently no ONLINE recruits."] = true
    GRM_L["There are currently no more players in that direction."] = true
    GRM_L["You have reached the end of the list"] = true
    GRM_L["You have reached the top of the list"] = true
    GRM_L["Auto Open Window"] = true
    GRM_L["Only if a player is online and you are not in combat"] = true
    GRM_L["Recruit window will open when combat ends."] = true
    GRM_L["GRM window will open when combat ends."] = true

    -- R1.24
    GRM_L["This also will change the <Alt> format to match"] = true
    GRM_L["M"] = true                                           -- Of note, the "M" is short for "Main" and this is the reference to the main tag on alts in guild chat. For use in the Main tagging <M> (M) etc...
    GRM_L["A"] = true           
    GRM_L["<M>"] = true                                         -- <M> appears for "Main"
    GRM_L["<A>"] = true                                         -- This is the "Alt" tag on the Add Alt side window. For use in the Alt tagging <A> (A) etc...

    -- R1.25
    GRM_L["NG"] = true                                          -- Stands for "Non-guildie" and can be in the context of calendar invites... it explains why some might have tags and others not... They might not be in your guild
    GRM_L["Include \"Joined:\" tag with the date."] = true                                          -- the \" is so you include the qutoations in the actual text. You need them or it closes the phrase.
    GRM_L["Joined: {name}"] = true                                                                  -- {name} is actually in reference to the Data Format... So "Joined: 22 May '18"   {name} = "22 May '18"
    GRM_L["GRM Auto-Detect! {name} has joined the guild and will be set as Main"] = true            -- Main auto-detect message

    -- R1.26
    GRM_L["Click to Disable Sync of Custom Note"] = true
    GRM_L["Click to Enable Sync of Custom Note"] = true
    GRM_L["Sync is Currently Disabled"] = true
    GRM_L["Custom Note Sync is Currently Disabled"] = true
    GRM_L["|CFFE6CC7FRight-Click|r for Additional Options"] = true

    -- R1.27
    GRM_L["Show Border on Public, Officer, and Custom Notes"] = true

    -- R1.28
    GRM_L["Public Note:"] = true
    GRM_L["Officer Note:"] = true
    GRM_L["Public Note"] = true
    GRM_L["Officer Note"] = true
    GRM_L["Show Public and Officer Note of Left Player in the Log"] = true
    GRM_L["Hard Reset"] = true
    GRM_L["Hard reset of ALL GRM data, account-wide. Game will reload!"] = true
    GRM_L["Reject\nAll"] = true                     -- This is the same as "Reject All" it just forces the 2 words to be on 2 separate lines without me adjusting the text width
    GRM_L["{num} Applicants to the Guild have been denied"] = true
    GRM_L["Do you really want to reject all applicants?"] = true
    GRM_L["Only recommend to kick if all player linked alts exceed max time"] = true
    GRM_L["Your Guild Leader Has Set Sync Restrictions to {name} or Higher"] = true
    GRM_L["Unable to Change Rank. Guild Leader has set restriction to {name} or higher"] = true     -- Like Initiate or higher
    GRM_L["Unable to Change Rank. Guild Leader has set restriction level."] = true
    GRM_L["Unify Control Settings for all guildies with 'g#^X' commands"] = true
    GRM_L["CONTROL TAGS:"] = true
    GRM_L["Force Settings with Guild Info Tags"] = true
    GRM_L["X = index of minimum rank. Example: 0 = {name} and {num} = {name2}"] = true
    GRM_L["'g2^X' - Establish minimum sync rank restriction for player details"] = true
    GRM_L["'g3^X' - Establish minimum sync rank restriction for BAN info"] = true
    GRM_L["'g4^X' - Establish minimum sync rank restriction for Custom Note info"] = true
    GRM_L["Warning! System messages are disabled! GRM cannot function fully without them. You must re-enable them in the chat settings."] = true
    GRM_L["Database Still Loading. GRM will open automatically when finished."] = true

    -- R1.29
    GRM_L["Do you really want to invite all applicants?"] = true
    GRM_L["There are currently 0 players online to invite."] = true
    GRM_L["It appears all players are now offline."] = true
    GRM_L["Invite\nAll"] = true                             -- Just makes it 2 lines - they \n is the line break. You can remove if not necessary, or include.
    GRM_L["Include Message When Sending Invite"] = true
    GRM_L["Click here to set custom invite message. Press Enter to save before sending invite!"] = true
    GRM_L["The highlighted character is not valid for messages. Please remove."] = true
    GRM_L["Not all characters are valid. Please remove any non-text characters."] = true
    GRM_L["Kick macro created. Press \"CTRL-SHIFT-K\" to kick all of {name}'s alts"] = true
    GRM_L["Kick the Player's {num} alts too?"] = true       -- Plural
    GRM_L["Kick the Player's {num} alt too?"] = true        -- Not Plural  - "Kick the Player's 1 alt too?"
    GRM_L["Ban and Kick the Player's {num} alts too?"] = true
    GRM_L["Ban and Kick the Player's {num} alt too?"] = true

    -- R1.30
    GRM_L["Sync With {name} is Complete..."] = true
    GRM_L["Database Still Loading. Please Wait..."] = true
    GRM_L["|CFFE6CC7FLeft-Click|r and drag to move this button."] = true
    GRM_L["|CFFE6CC7FCtrl-Left-Click|r and drag to move this button anywhere."] = true
    GRM_L["MOTD:"] = true       -- Message Of The Day = M.O.T.D = MOTD - 
    GRM_L["minimap"] = true

    -- R1.31
    GRM_L["Show 'Main' Tag on both Mains and Alts in Chat"] = true

    -- R1.32
    GRM_L["Invites Currently Being Sent..."] = true
    GRM_L["GRM has moved the Guild Leader setting restriction codes to the Guild Info tab."] = true
    GRM_L["Please make room for them and re-add."] = true
    GRM_L["Your Guild Leader has pushed a reset of your data."] = true;
    GRM_L["Your Guild Leader Has Set BAN Sync Restrictions to {name} or Higher"] = true
    GRM_L["Your Guild Leader Has Set CUSTOM NOTE Sync Restrictions to {name} or Higher"] = true

    -- R1.33
    GRM_L["Invite all macro created. Press \"CTRL-SHIFT-K\" to invite all online recruits."] = true
    GRM_L["Macro will auto-remove after {num} seconds."] = true
    GRM_L["UI"] = true
    GRM_L["UI Controls"] = true
    GRM_L["UI Configuration:"] = true
    GRM_L["|CFFE6CC7FClick|r to Change Rank Restriction for Custom Note"] = true
    GRM_L["Sync restriction is unique to just {name}'s custom note"] = true
    GRM_L["Show Character Guild Reputation"] = true
    GRM_L["Show Guild Member Birthdays"] = true
    GRM_L["Set Birthday"] = true
    GRM_L["Edit Birthday"] = true
    GRM_L["Remove Date"] = true             -- Clear Birthday shorthand
    GRM_L["Birthday"] = true
    GRM_L["Only Announce Birthdays and Anniversaries if Listed as 'Main'"] = true
    GRM_L["{name} will be celebrating {num} year in the Guild!"] = true            -- {custom1} will reference the DATE. Ex: "Arkaan will be celebrating 1 year in the Guild! ( 1 May )" - SINGULAR
    GRM_L["{name} will be celebrating {num} years in the Guild!"] = true           -- Same thing but PLURAL - "years" in stead of "year"
    GRM_L["No player's currently available to sync {name}'s Guild Data..."] = true
    GRM_L["{name} has set {name2}'s Birthday: {custom1}"] = true                   -- custom note is the date like "12 Dec"
    GRM_L["{name}'s Birthday has been set: {custom1}"] = true
    GRM_L["Sync Birthdays"] = true

    -- R1.34
    GRM_L["Debugging Enabled"] = true
    GRM_L["Debugging Disabled"] = true
    GRM_L["{num} is not a valid day of the month! It must be a number between 1 and 31"] = true
    GRM_L["{num} is not a valid index of the month of the year! It must be a number between 1 and 12"] = true
    GRM_L["The day cannot be {num}. It must be a number between 1 and 31"] = true
    GRM_L["The month cannont be {num}. must be a number between 1 and 12"] = true
    GRM_L["{num} birthdays have been reset."] = true
    GRM_L["No player was found to have that birthday."] = true

    -- R1.35
    GRM_L["\"{custom1}\" setting is not valid. Value must be between 1 and 3. Defaulting to set join date to officer note with \"g5^1\"{custom2}"] = true    -- The custom1 will be something like "g5^8" or something. It's to account for typos or error warnings.
    GRM_L["Your Guild Leader Has Set Join Dates to only be added to the {name}"] = true         -- The {name} will be the "Officer note" or "Public Note" or "Custom Note"  set, based on their settings...
    GRM_L["Warning - Global Controls:"] = true
    GRM_L["Sync Restrictions Globally Changed to {name} or Higher"] = true
    GRM_L["BAN Sync Restrictions Globally Changed to {name} or Higher"] = true
    GRM_L["CUSTOM NOTE Sync Restrictions Globally Changed to {name} or Higher"] = true
    GRM_L["Join Dates Globally Changed to only be added to the {name}"] = true
    GRM_L["Unable to Modify. Global setting is set to the {name}"] = true                           -- The {name} will be the "Officer note" or "Public Note" or "Custom Note"  set, based on their settings...
    GRM_L["'g5^X' - Designate Join Date note destination. g5^1 = Officer, 2 = public, 3 = custom"] = true
    
    -- R1.37
    GRM_L["No Action Configured"] = true
    GRM_L["OLD LOG"] = true
    GRM_L["CHANGES"] = true
    GRM_L["Sync has failed to start. Please try again!"] = true
    GRM_L["Please wait {num} more seconds before manually initiating the sync process again."] = true

    -- R1.39
    GRM_L["Only Report if there are no Active Alts in the Group"] = true
    GRM_L["Level Filter Minimum:"] = true                                -- As in player level
    GRM_L["Report Milestones:"] = true
    GRM_L["Report Level Up Changes"] = true
    GRM_L["Reporting:"] = true
    GRM_L["Unable to disable level cap tracking. Please disable ALL tracking to turn off."] = true
    GRM_L["No Levels to Report to Log"] = true
    GRM_L["{name} has Surpassed their Level {num} Milestone and is Now {custom1}"] = true
    GRM_L["{name} has Reached their Level {num} Milestone"] = true
    GRM_L["{name}'s Ban has been Updated by {name2}!"] = true
    GRM_L["{name} has Updated {name2}'s BAN and also BANNED all linked alts from the guild!"] = true
    GRM_L["One moment, GRM is still being configured."] = true
    GRM_L["Press ENTER to complete"] = true
    GRM_L["Player Was Banned By: {name}"] = true
    GRM_L["|cffff0000WARNING!!!|r {num} BANNED players are currently in the guild."] = true     -- plural
    GRM_L["|cffff0000WARNING!!!|r {num} BANNED player is currently in the guild."] = true        -- Singular  -- please keep the color coding... this keeps the Warning in red
    
    -- R1.41
    GRM_L["{num} metadata profiles are being built for people previously in the guild. The data is being requested, but this may take some time."] = true                   -- PLURAL
    GRM_L["One metadata profile is being built for a player previously in the guild. The data is being requested, but this may take some time."] = true           -- SINGULAR, same line.
    GRM_L["Sync will re-trigger one time, in a moment, to collect final data on these profiles."] = true
    GRM_L["Auto-Focus the search box"] = true
    GRM_L["This will skip the first time if set to load on logon"] = true  -- Referring to the auto-focusing on the search box, this is a tooltip helper
    GRM_L["Please enter a valid level between 1 and {num}"] = true
    GRM_L["Player's Main: {name}"] = true
    GRM_L["Player's main no longer in the guild: {name}"] = true
    
    -- R1.43
    GRM_L["One moment, requesting additional details on {name} from the server. Ban List will soon update."] = true
    GRM_L["Unable to identify {name}. Ensure your spelling is accurate! Otherwise, they may have left the server."] = true
    GRM_L["(Unable to Identify)"] = true                                                                    -- As in, unable to identify on the server, they possibly server transferred off but are still on ban list
    GRM_L["|CFFE6CC7FClick|r to select player class"] = true
    GRM_L["|CFFE6CC7FClick|r to select player's realm."] = true
    GRM_L["All Connected Realms are available to choose."] = true
    GRM_L["{num} players were found to have the same name. Please manually select which connected realm the player you wish to ban is on."] = true
    GRM_L["Click or Press TAB to cycle through each step."] = true
    GRM_L["Former and Current Members"] = true
    GRM_L["No Matches Found. Add a Custom New Player or Match"] = true       -- as in, autocomplete typing matching
    
    --1.50
    GRM_L["{name}'s alt grouping has had their Birthday removed by: {name2}"] = true
    GRM_L["{name}'s Birthday has been removed by: {name2}"] = true
    GRM_L["Click to Sort"] = true
    GRM_L["No Updates"] = true
    GRM_L["Timestamp Formatting has been Globally Set to: < {name} >"] = true
    GRM_L["Your Guild Leader Has Globally Set the Timestamp Formatting to: < {name} >"] = true
    GRM_L["Unable to Modify. Global setting is set to :   {name}"] = true
    GRM_L["'g1^X' - Establish a universal timestamp format based on dropdown selection position"] = true

    -- If ppossible, try to maintain the allignment of the numbers, but only if it makes sense.
    GRM_L["{num}{custom1}: Join Dates"] = true
    GRM_L["{num}{custom1}: Promo Dates"] = true
    GRM_L["{num}{custom1}: Alts"] = true
    GRM_L["{num}{custom1}: Main Tags"] = true
    GRM_L["{num}{custom1}: Custom Notes"] = true
    GRM_L["{num}{custom1}: Birthdays"] = true
    
    -- 1.52
    GRM_L["Times in Guild: {num}"] = true
    
    -- 1.56
    -- More slash commands
    GRM_L["recruits"] = true 
    GRM_L["kick"] = true
    GRM_L["ban"] = true
    GRM_L["audit"] = true
    GRM_L["log" ] = true
    GRM_L["event"] = true
    GRM_L["events"] = true
    GRM_L["users"] = true
    GRM_L["syncusers"] = true
    GRM_L["opt"] = true
    GRM_L["option"] = true
    GRM_L["options"] = true

    GRM_L["GRM Date"] = true
    GRM_L["Note Date"] = true
    GRM_L["Status"] = true
    GRM_L["Refresh"] = true
    GRM_L["Clear Selection"] = true
    GRM_L["Fix all mismatched note dates with GRM saved date"] = true
    GRM_L["Fix selected mismatched note dates with GRM saved date"] = true
    GRM_L["Fix all mismatched GRM dates with the note date"] = true
    GRM_L["Fix selected mismatched GRM dates with the note date"] = true
    GRM_L["Import all missing join dates from the note date"] = true;
    GRM_L["Import selected missing join dates from the note date"] = true
    GRM_L["Add all missing saved dates to the {name}"] = true;
    GRM_L["Add selected missing saved dates to {name}"] = true
    GRM_L["Clear all join dates from incorrect note locations"] = true
    GRM_L["Clear selected join dates from incorrect note locations"] = true
    GRM_L["Not Found"] = true
    GRM_L["Not Set"] = true
    GRM_L["Complete"] = true
    GRM_L["Multiple"] = true
    GRM_L["Location"] = true

    -- JD tool button actions and tooltips
    GRM_L["|CFFE6CC7FShift-Click|r Second Button to Select All In-Between"] = true
    GRM_L["|CFFE6CC7FClick|r to select player"] = true
    GRM_L["|CFFE6CC7FCtrl-Click|r to open Player Window"] = true
    GRM_L["Please manually select your guild in the Community Window for this feature to work"] = true
    GRM_L["Only Show Players With Incomplete Status"] = true
    GRM_L["{num} Join Dates Need Attention"] = true             -- In other words, "155 join dates need attention" as an example
    GRM_L["Do you really want to remove the join dates from notes other than the {name}?"] = true
    GRM_L["Do you really want to fix mismatched dates using the note?"] = true
    GRM_L["Do you really want to fix note dates using the saved GRM dates?"] = true
    GRM_L["Do you really want to import all dates from the notes?"] = true
    GRM_L["Do you really want to add the missing join dates to the {name}?"] = true                     -- add the missing join dates to the default note name - like "... to the Officer Note?"
    GRM_L["Auto-adding join dates to the {name} is disabled. Do you still wish to continue?"] = true    -- Just as above
    GRM_L["There are currently {num} mismatched dates to fix"] = true
    GRM_L["There are currently no mismatched dates that need to be fixed."] = true
    GRM_L["There are currently no dates that need to be imported."] = true
    GRM_L["There are currently {num} dates that can be imported"] = true
    GRM_L["There are currently {num} dates that can be added to the default note"] = true
    GRM_L["There are currently no dates that can be added to the default note."] = true
    GRM_L["There are currently no dates that need to be removed from incorrect notes"] = true
    GRM_L["There are currently {num} players who have join dates listed in the incorrect note"] = true
    GRM_L["Warning! Your function is extremely limited without officer permissions"] = true
    GRM_L["Advanced Join Date Tool" ] = true

    -- JD tool reasons
    GRM_L["Mismatched dates"] = true
    GRM_L["Matching date found in wrong note location"] = true
    GRM_L["Date not added to note"] = true
    GRM_L["Mismatched dates, and found in wrong note location"] = true
    GRM_L["Mismatched date found in multiple locations, including correct"] = true
    GRM_L["Mismatched date found in multiple incorrect note locations"] = true
    GRM_L["Matching date found in multiple incorrect note locations"] = true
    GRM_L["Matching date found in multiple locations, including correct"] = true
    GRM_L["Date found in incorrect note, but not yet imported"] = true
    GRM_L["Date found in multiple incorrect notes, but not yet imported"] = true
    GRM_L["Date found in multiple locations, including correct, but not yet imported"] = true
    GRM_L["Date found in correct note location, but not yet imported"] = true

    -- More misc.
    GRM_L["The \"{name}\" and \"{name2}\" tags have globally been set to be added to join date note entries."] = true
    GRM_L["The \"{name}\" and \"{name2}\" tags have globally been disabled from adding to join date note entries."] = true
    GRM_L["'g5^X+' -Use the +/- sign at the end to enable the use of the tag headers"] = true
    GRM_L["Your rank has changed. Re-evaluating sync permissions."] = true
    
    -- 1.57
    GRM_L["Full Log Message:"] = true
    GRM_L["Public Notes"] = true
    GRM_L["Officer Notes"] = true
    GRM_L["Custom Notes"] = true
    GRM_L["Log Entry Tooltip"] = true
    GRM_L["1 entry has been removed from the log"] = true
    GRM_L["{num} entries have been removed from the log"] = true
    
    -- 1.58
    GRM_L["|CFFE6CC7FCtrl-Click|r to open the Old Guild Roster Window"] = true
    GRM_L["Using the Old Guild Roster Interface instead"] = true
    
    -- 1.59
    GRM_L["Adding the Join Date cannot be disabled due to the global setting"] = true
    GRM_L["Due to your current rank, you will be unable to add Join Date Timestamps"] = true
    GRM_L["Warning! Due to your rank you will be unable to add Join Date timestamps to the {name}"] = true
    GRM_L["Unable to Modify Format:  {name}"] = true
    GRM_L["Show Mouseover"] = true
    GRM_L["Unable to create GRM hotkey macro. You currently are at the cap of {num} macros."] = true
    
    -- 1.60
    GRM_L["Really remove {name} Backup Point?"] = true      -- The {name} is the guildName
    
    -- 1.63
    GRM_L["Disabled"] = true
    GRM_L["|CFFE6CC7FClick|r to sort Birthdays January to December"] = true
    GRM_L["|CFFE6CC7FClick|r to sort Birthdays December to January"] = true
    
    -- 1.64
    GRM_L["Chat Window for All GRM Messages:"] = true
    GRM_L["\"{name}\" Chat Window\nDo you wish to create it?" ] = true              -- the \n indicates a line break.
    GRM_L["GRM will automatically send messages to the \"{name}\" window if you close this one."] = true
    GRM_L["Channel Settings Are Character Specific and Will Not Be Sync'd"] = true
    
    -- 1.66
    GRM_L["Custom Join Tag:"] = true
    GRM_L["Custom Rejoin Tag:"] = true
    GRM_L["'g6^Text^^Text^^' - Custom tags for note join dates - \"g6^Joined:^^Rejoined:^^\""] = true
        -- Join Tag
    GRM_L["Custom Join Date Tag \"{name}\" cannot be set as it is {num} characters. The max is {custom1}."] = true
    GRM_L["Custom Join Tag has been changed from \"{name}\" to \"{name2}\""] = true
    GRM_L["Custom Join Tag has been set to \"{name}\""] = true
    GRM_L["Your Guild Leader has changed the Custom Join Tag from \"{name}\" to \"{name2}\""] = true
    GRM_L["Your Guild Leader has set the Custom Join Tag to \"{name}\""] = true
        -- Rejoin Tag
    GRM_L["Custom Rejoin Date Tag \"{name}\" cannot be set as it is {num} characters. The max is {custom1}."] = true
    GRM_L["Custom Rejoin Tag has been changed from \"{name}\" to \"{name2}\""] = true
    GRM_L["Custom Rejoin Tag has been set to \"{name}\""] = true
    GRM_L["Your Guild Leader has changed the Custom Rejoin Tag from \"{name}\" to \"{name2}\""] = true
    GRM_L["Your Guild Leader has set the Custom Rejoin Tag to \"{name}\""] = true
    
     -- 1.67
    -- Note, lots of plural/singular forms here for just a superior user experience, albeit a bit of extra work
    GRM_L["Kick"] = true
    GRM_L["Promote"] = true
    GRM_L["Demote"] = true
    GRM_L["Macro:"] = true
    GRM_L["Macro Size: {num}/255"] = true        -- "Macro Size: 242/255"
    GRM_L["Action"] = true
    GRM_L["Ignored Action:"] = true                 -- As in, the action being ignored, be it kick or promote or demote. 
    GRM_L["Click to Build Macro"] = true
    GRM_L["No Current Names to Add"] = true
    GRM_L["No Names to Add to the Macro"] = true
    GRM_L["Hot Key: {name}"] = true
    GRM_L["Press the Hot-key 1 time to complete all actions"] = true
    GRM_L["Press the Hot-key {num} times to complete all actions"] = true
    GRM_L["Permissions"] = true
    GRM_L["Player rank change detected, re-checking permissions and rebuilding GRM Macro Tool."] = true
    GRM_L["Click to remove selected names from the macro"] = true           -- Plural form of statement
    GRM_L["Click to remove selected name from the macro"] = true            -- Singular form of statement
    GRM_L["Click to remove selected names from Ignore List"] = true         -- Plural
    GRM_L["Click to remove selected name from Ignore List"] = true          -- Singular
    GRM_L["No names selected to remove from macro"] = true
    GRM_L["No names selected to remove from Ignore List"] = true
    GRM_L["Macro is currently empty"] = true
    GRM_L["{num} players removed from the macro"] = true                    -- plural form of the statement
    GRM_L["{num} player was removed from the macro"] = true                 -- singular form of the statement
    GRM_L["{num} players removed from the Ignored List"] = true
    GRM_L["{num} player was removed from Ignore List"] = true
    GRM_L["There are no names currently selected to be removed from the Ignore List."] = true
    GRM_L["There are no names currently selected to be removed from the macro."] = true
    GRM_L["The macro is not yet built. Please click the button to create the macro."] = true
    GRM_L["Nothing to clear"] = true
    GRM_L["There are currently no names to add"] = true
    GRM_L["There are currently no names to remove"] = true
    GRM_L["Rules"] = true
    GRM_L["Please choose a day between 1 and 99"] = true
    GRM_L["Time before recommending to kick has been set to 99 Days. For a longer time period, use the months instead."] = true
    GRM_L["Time before recommending to kick has been set to the default period of 12 Months."] = true
    GRM_L["Time before recommending to kick has been set to {num} Months."] = true
    GRM_L["Time before recommending to kick has been set to {num} Days."] = true
    GRM_L["Pressing the ESC key will also clear all lines"] = true
    GRM_L["Player's rank does not have permission to remove others from the guild"] = true
    GRM_L["Player's rank does not have permission to promote others in the guild"] = true
    GRM_L["Player's rank does not have permission to demote others in the guild"] = true
    GRM_L["Queued Actions"] = true
    GRM_L["Current Actions"] = true
    GRM_L["View Ignore List"] = true
    GRM_L["No players are currently safe from recommendations"] = true
    GRM_L["1 player is on the safe list."] = true
    GRM_L["{num} players are on the safe list."] = true
    GRM_L["1 action is being ignored."] = true
    GRM_L["{num} actions are being ignored."] = true
    GRM_L["No current actions are being ignored"] = true
    GRM_L["Actions Ignored:"] = true
    GRM_L["Total Queued:"] = true
    GRM_L["Ignored Players Safe From Action"] = true
    GRM_L["Only show players with ignored action"] = true
    GRM_L["No players on Ignore List"] = true
    GRM_L["No players to select. 1 player filtered"] = true                     -- Singular
    GRM_L["No players to select. {num} players filtered"] = true                -- Plural
    GRM_L["There are no names to select. 1 player is filtered"] = true          -- these 2 statements might seem redundant, but often the text on a button is more short hand. This gives a cleaner statement in the chat. Useful for translating in some languages that need a bit more room to be more clear.
    GRM_L["There are no names to select. {num} players are filtered"] = true
    GRM_L["Really remove selected player from the ignore list?"] = true
    GRM_L["Really remove the {num} selected players from the ignore list?"] = true
    GRM_L["Do you really wish to clear all players from the Ignore List?"] = true
    GRM_L["There are currently no players on the Ignore List"] = true
    GRM_L["Remove all players from Ignore List"] = true
    GRM_L["Ignored Players: {num}"] = true
    GRM_L["Ignore Macro Tool Filters"] = true
    GRM_L["Type \"/grm tool\" to Bring Up Macro Tool"] = true       -- Of note, the /grm tool will ALWAYS work, regardless of the language. Feel free to create your own word to coordinate for a slash command. It will match the next line
    GRM_L["Tool"] = true                                            -- /grm tool
    GRM_L["Macro Tool"] = true
    GRM_L["Macro Tool: {num}"] = true

    -- CLASSIC
    GRM_L["Social"] = true
    GRM_L["Roster"] = true
    GRM_L["|CFFE6CC7FCtrl-Click|r to open the Guild Roster Window"] = true
    GRM_L["Feature is disabled in WoW Classic"] = true
    GRM_L["Feature is disabled in TBC Classic"] = true          -- Just laying groundwork now in case Blizz ever releases it. Calendar was not added until WOTLK
    GRM_L["There is no calendar to add events to"] = true
    GRM_L["(Classic)"] = true       -- tooltip tag that shows only on the minimap mosueover version tooltip in Classic
    
    -- 1.69
    GRM_L["Importing dates must be done in a compatible format"] = true
    GRM_L["The date selection in OPTIONS shows all supported"] = true
    GRM_L["Headers, like \"Joined,\" are supported"] = true
    GRM_L["Date can only be detected if at the beginning of a note"] = true
    GRM_L["Note: Dates are only found if at the start of a note in an addon supported format. \"Joined\" headers are ok"] = true
    GRM_L["To confirm or edit the date, open the player window, right click the date, edit, and submit"] = true        --The "!!" tags are the {name}
    GRM_L["To confirm or edit the date, right click the date, edit, and submit"] = true     -- Slightly shorter explanation if already on player window
    GRM_L["The {name} tag indicates a date must be verified to sync"] = true
    
    -- 1.70
    GRM_L["GRM has errored due to a previous incompatible build with Classic that was enabled. Click YES to reload UI and fix the issue"] = true

    -- 1.71
    GRM_L["(Disabled in Classic)"] = true           -- For the Options... rather than removing them all

    -- 1.73
    GRM_L["{name} is no longer in the Guild!"] = true       -- There should really be 3 options. They got kicked, they left on their own, or if not found in the event log, they are just no longer in the guild
    GRM_L["is no longer in the Guild!"] = true              -- THIS MUST MATCH THE PREVIOUS LINE with missing name.
    GRM_L["Applying update patches... one moment."] = true
    GRM_L["Update Complete... {num} patches applied."] = true   -- Plural
    GRM_L["Update Complete... 1 patch applied."] = true         -- Singular version
    GRM_L["|CFFE6CC7FCtrl-Click|r to also REMOVE all alts from the ignore list"] = true     -- Safe/ignore filters list checkButton tooltip (bottom left mouseover window)
    GRM_L["|CFFE6CC7FCtrl-Click|r to also ADD all alts to the ignore list"] = true          -- Same
    GRM_L["Disabling will also hide the Birthday info on the roster mouseover window"] = true       -- Enable/disable birthday chekbox on UI Options and the Audit windoppw
    GRM_L["To avoid addon taint/blocking errors in Classic, the player must manually open the Guild Roster tab the first time."] = true          -- Classic only message for players explaining why window cannot open automatically.
    GRM_L["Confirm Date"] = true
    GRM_L["If the date is accurate, right click and select 'Confirm Date'"] = true
    
     -- 1.74
    GRM_L["Class Colorize Names in Guild Member Alerts"] = true
    GRM_L["All player custom notes re-enabled for sync and their checkboxes set."] = true
    
    -- 1.75
    GRM_L["!note"] = true               -- !note in English will always work. This gives you the option of creating your own key to register a public note.
    GRM_L["No officer online to set {name}'s note"] = true
    GRM_L["No officer is currently online to update your note"] = true
    GRM_L["Note updated by @{name}"] = true              -- As in "Note updated by @Arkaan"
    GRM_L["Allow Guild Members to Type \"!note\" to Set Their Own Public Note"] = true
    GRM_L["'!note' trigger has been globally enabled"] = true
    GRM_L["Enabled"] = true         -- As in, the opposite of Disabled
    GRM_L["'!note' trigger has been globally ENABLED"] = true
    GRM_L["'!note' trigger has been globally DISABLED"] = true
    GRM_L["'g7^X' - Designate '!note' use. g7^1 = Enabled, g7^2 = Disabled"] = true

    -- 1.76
    GRM_L["Same Rank"] = true                                                                   -- Macro Tool, Ignore List window - tooltip info on why no action is being done on some players who may be on it.
    GRM_L["Higher Rank"] = true                                                                 -- Macro Tool, Ignore List window - tooltip info on why no action is being done on some players who may be on it.
    GRM_L["Feature Disabled. There is no Calendar in Classic"] = true                           -- Events Tab top warning
    GRM_L["This only affects settings for your current guild: {name}"] = true                   -- Tooltip for Options > General > Sync settings to all alts in same guild
    GRM_L["GC"] = true                                                                          -- Options window, acronym for "Global Controls" and will be adjacent to all settings that have global controls
    GRM_L["*GC = Global Control - Use Guild Info to Force Setting For All"] = true              -- Top left Options window
    GRM_L["Export Global Controls"] = true                                                      -- Options > Officer Tab > Bottom left export button
    GRM_L["Global Control Values Set in Guild Info"] = true                                     -- Export GuildInfo tool tooltip
    GRM_L["Configure your settings. Click to export"] = true                                    -- Tooltip line 2- same as above
    GRM_L["Unable to add globals controls to GuildInfo. There is not enough room."] = true      -- If export of globals is not able to complete
    GRM_L["Global controls exported to the guild info note. Updating..."] = true                -- Success in exporting
    GRM_L["Your rank cannot edit the Guild Info"] = true                                              -- Mouseover tooltip helper for people without MOTD edit access
    GRM_L["All global controls are already set. You must Edit or Remove the settings manually in the guild Info."] = true;
    GRM_L["Do you really want to wipe all GRM data and settings account-wide?"] = true
    GRM_L["Are you sure your settings are configured and ready for global controls?"] = true
    GRM_L["Players the same rank or higher will not be shown"] = true
    GRM_L["Macro"] = true       -- For the slash command  /grm tool or /grm macro - same thing

    	-- 1.77
	GRM_L["Add Custom Rule"] = true         -- Kick Macro Tool - custom rule button right side
	GRM_L["Former Members"] = true          -- Export tool
	GRM_L["Data Export"] = true
	GRM_L["*Max Export is 500 Log Entries at a Time"] = true
	GRM_L["*Max Export is 500 Members at a Time"] = true
	GRM_L["*Max Export is 500 Former Members at a Time"] = true
	GRM_L["Log export follows the search and display settings"] = true
	GRM_L["*Export obeys the current log display filters"] = true
	GRM_L["Select Line Range:"] = true
	GRM_L["Select Member Range:"] = true
	GRM_L["Export Selection"] = true
	GRM_L["Export Next {num}"] = true       -- As in, "Export next 500" names or log lines
	GRM_L["Export Prev {num}"] = true       -- As in, Export Previous name
	GRM_L["Total Members: {num}"] = true
	GRM_L["Total Former Members: {num}"] = true
	GRM_L["Class"] = true                       -- As in Class Name, there is currently a "Class:" we need one with the colon
	GRM_L["Guild Rep"] = true                   -- Guild Faction reputation (abbreviated)
	GRM_L["Last Online (Days)"] = true
	GRM_L["Spreadsheet Headers"] = true
	GRM_L["Auto Include Headers"] = true        -- Auto include headers on the export frame, as in the column headers for each category on member and former mebers
	GRM_L["These will only be included if exporting from the top of the table"] = true      -- tooltip for the auto-Included export checkbutton
	GRM_L["Export"] = true
	GRM_L["This will be rounded to the nearest day"] = true
	GRM_L["Clearing Log Export. A filter setting has been changed."] = true             -- If the filter settings have been modified, the export string should be cleared and re-done
	GRM_L["No Tag"] = true                                                              -- Main Tag
	GRM_L["Delimiter:"] = true                                                          -- Delimiter selection for Export window
	GRM_L["|CFFE6CC7FClick|r to view more alt details."] = true                         -- Calendar tooltip
	GRM_L["|CFFE6CC7FRight-Click|r for additional options."] = true                     -- Also Calendar tooltip
	GRM_L["The selected delimiter will be removed from all notes on export"] = true
	GRM_L["Choose thoughtfully"] = true
	GRM_L["{name}'s note has been updated!"] = true
	GRM_L["Locked. Press ESC"] = true                                        -- Mouseover Locked text in top right.
	GRM_L["{num} guild members have outdated GRM versions"] = true                      -- Player sync with another is outdated
    GRM_L["|CFFE6CC7FClick|r to Select for Removal"] = true
    GRM_L["Feel free to recommend a delimiter you wish to use to the author"] = true
    GRM_L["Export Tool"] = true
    GRM_L["Opens the Data Export Tool"] = true
    GRM_L["Opens the Advanced Macro Tool"] = true
    GRM_L["Open any GRM window: Log, Event, Ban, etc."] = true
    
    -- 1.78
    GRM_L["Hurray!"] = true                                                              -- A short cheer! Like "Yay!" except "Hurray!"
    GRM_L["{name} has Reached the {num} Level Cap! {custom1}"] = true                  -- Arkaan has Reached the 120 Level Cap! Hurray!

    
end

-- BuildLog() - might have some extra work, conditionally based on localization as it will now have a mix of languages saved to the log, since log is not retroactively changed.
-- The options panel might need some handcrafted care for allignment.