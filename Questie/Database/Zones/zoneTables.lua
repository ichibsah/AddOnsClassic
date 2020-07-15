---@type ZoneDB
local ZoneDB = QuestieLoader:ImportModule("ZoneDB")
local _ZoneDB = ZoneDB.private


--- This table maps the areaId (used in the DB for example) to
--- the UiMapId of each zone.
--- The UiMapId identifies a map which can be displayed ingame on the worldmap.
--- Dungeons don't have a UiMapId!
--- https://wow.gamepedia.com/UiMapID/Classic
_ZoneDB.areaIdToUiMapId = {
    [0] = 947,
    [1] = 1426,
    [3] = 1418,
    [4] = 1419,
    [8] = 1435,
    [10] = 1431,
    [11] = 1437,
    [12] = 1429,
    [14] = 1411,
    [15] = 1445,
    [16] = 1447,
    [17] = 1413,
    [28] = 1422,
    [33] = 1434,
    [36] = 1416,
    [38] = 1432,
    [40] = 1436,
    [41] = 1430,
    [44] = 1433,
    [45] = 1417,
    [46] = 1428,
    [47] = 1425,
    [51] = 1427,
    [85] = 1420,
    [130] = 1421,
    [139] = 1423,
    [141] = 1438,
    [148] = 1439,
    [215] = 1412,
    [267] = 1424,
    [331] = 1440,
    [357] = 1444,
    [361] = 1448,
    [400] = 1441,
    [405] = 1443,
    [406] = 1442,
    [440] = 1446,
    [490] = 1449,
    [493] = 1450,
    [618] = 1452,
    [1377] = 1451,
    [1497] = 1458,
    [1519] = 1453,
    [1537] = 1455,
    [1637] = 1454,
    [1638] = 1456,
    [1657] = 1457,
    [2597] = 1459,
    [3277] = 1460,
    [3358] = 1461,
}

-- [areaId] = {"name", alternative areaId (a sub zone), parentId}
_ZoneDB.dungeons = {
    [209] = {"Shadowfang Keep", 236, 130},
    [491] = {"Razorfen Kraul", 1717, 17},
    [717] = {"The Stockades", nil, 1519},
    [718] = {"Wailing Caverns", nil, 17},
    [719] = {"Blackfathom Deeps", 2797, 331},
    [721] = {"Gnomeregan", 133, 1},
    [722] = {"Razorfen Downs", 1316, 17},
    [796] = {"Scarlet Monastery", nil, 85},
    [1176] = {"Zul'Farrak", 978, 440},
    [1337] = {"Uldaman", 1517, 3},
    [1477] = {"The Temple of Atal'Hakkar", 1417, 8},
    [1581] = {"The Deadmines", nil, 40},
    [1583] = {"Blackrock Spire", nil, 51},
    [1584] = {"Blackrock Depths", nil, 51},
    [2017] = {"Stratholme", 2279, 139},
    [2057] = {"Scholomance", nil, 28},
    [2100] = {"Maraudon", nil, 405},
    [2437] = {"Ragefire Chasm", nil, 1637},
    [2557] = {"Dire Maul", 2577, 357},
}

-- [areaId] = {{areaId, locationX, locationY}, ...}
_ZoneDB.dungeonLocations = {
    [209] = {{130, 45, 68.7}},
    [491] = {{17, 42.3, 89.9}},
    [717] = {{1519, 40.5, 55.9}},
    [718] = {{17, 46, 36.5}},
    [719] = {{331, 14.1, 14.4}},
    [721] = {{1, 24.4, 39.8}},
    [722] = {{17, 50.8, 92.8}},
    [796] = {{85, 83, 34}},
    [1176] = {{440, 38.7, 20.1}},
    [1337] = {{3, 44.4, 12.2}, {3, 65.2, 43.5}},
    [1417] = {{8, 69.4, 56.8}},
    [1477] = {{8, 69.4, 56.8}},
    [1581] = {{40, 42.5, 71.1}},
    [1583] = {{51, 34.8, 84.8}, {46, 29.5, 38.2}},
    [1584] = {{51, 34.8, 84.8}, {46, 29.5, 38.2}},
    [1585] = {{51, 34.8, 84.8}, {46, 29.5, 38.2}},
    [1977] = {{33, 50.6, 17.6}},
    [2017] = {{139, 30.9, 17}},
    [2057] = {{28, 69.8, 73.6}},
    [2100] = {{405, 29.5, 62.5}},
    [2159] = {{15, 52.4, 76.4}},
    [2257] = {{1519, 60.3, 12.5}, {1537, 72.8, 50.3}},
    [2437] = {{1637, 51.7, 49.8}},
    [2557] = {{357, 59.2, 45.1}},
    [2597] = {{36, 66.6, 51.3},},
    [2677] = {{51, 34.8, 84.8}, {46, 29.5, 38.2}},
    [2717] = {{51, 34.8, 84.8}, {46, 29.5, 38.2}},
    [2917] = {{1637, 40.4, 68.3}},
    [2918] = {{1519, 72.7, 54}},
    [3428] = {{1377, 29, 95}},
    [3429] = {{1377, 29, 95}},
    [3456] = {{139, 39.9, 25.8}},
    [7307] = {{51, 34.8, 84.8}, {46, 29.5, 38.2}},
}

-- [dungeonZone] = parentZone
_ZoneDB.dungeonParentZones = {
    [236] = 209,
    [1717] = 491,
    [2797] = 719,
    [133] = 721,
    [1316] = 722,
    [978] = 1176,
    [1517] = 1337,
    [1417] = 1477,
    [2279] = 2017,
    [2577] = 2557,
}

-- [subZone] = parentZone
_ZoneDB.subZoneToParentZone = {
    [2839] = 2597,
    [35] = 33,
    [1116] = 357,
    [702] = 141,
    [1769] = 361,
    -- starting zones
    [9] = 12,
    [132] = 1,
    [154] = 85,
    [188] = 131,
    [220] = 215,
    [363] = 14,
}

-- Different source of zoneIds
-- These are not in use anymore but are quite helpful when fixing the database
-- https://www.ownedcore.com/forums/world-of-warcraft/world-of-warcraft-emulator-servers/60411-zone-ids.html
ZoneDB.zoneIDs = {
    DUN_MOROGH = 1,
    BADLANDS = 3,
    BLASTED_LANDS = 4,
    SWAMP_OF_SORROWS = 8,
    DUSKWOOD = 10,
    WETLANDS = 11,
    ELWYNN_FOREST = 12,
    DUROTAR = 14,
    DUSTWALLOW_MARSH = 15,
    AZSHARA = 16,
    THE_BARRENS = 17,
    WESTERN_PLAGUELANDS = 28,
    STRANGLETHORN_VALE = 33,
    ALTERAC_MOUNTAINS = 36,
    LOCH_MODAN = 38,
    WESTFALL = 40,
    DEADWIND_PASS = 41,
    REDRIDGE_MOUNTAINS = 44,
    ARATHI_HIGHLANDS = 45,
    BURNING_STEPPES = 46,
    THE_HINTERLANDS = 47,
    SEARING_GORGE = 51,
    TIRISFAL_GLADES = 85,
    SILVERPINE_FOREST = 130,
    EASTERN_PLAGUELANDS = 139,
    TELDRASSIL = 141,
    DARKSHORE = 148,
    SHADOWFANG_KEEP = 209,
    MULGORE = 215,
    HILLSBRAD_FOOTHILLS = 267,
    ASHENVALE = 331,
    FERALAS = 357,
    FELWOOD = 361,
    THOUSAND_NEEDLES = 400,
    DESOLACE = 405,
    STONETALON_MOUNTAINS = 406,
    TANARIS = 440,
    UN_GORO_CRATER = 490,
    RAZORFEN_KRAUL = 491,
    MOONGLADE = 493,
    WINTERSPRING = 618,
    THE_STOCKADE = 717,
    WAILING_CAVERNS = 718,
    BLACKFATHOM_DEEPS = 719,
    GNOMEREGAN = 721,
    RAZORFEN_DOWNS = 722,
    SCARLET_MONASTERY = 796,
    ZUL_FARRAK = 1176,
    ULDAMAN = 1337,
    SILITHUS = 1377,
    THE_TEMPLE_OF_ATAL_HAKKAR = 1477,
    UNDERCITY = 1497,
    STORMWIND_CITY = 1519,
    IRONFORGE = 1537,
    THE_DEADMINES = 1581,
    LOWER_BLACKROCK_SPIRE = 1583,
    BLACKROCK_DEPTHS = 1585,
    ORGRIMMAR = 1637,
    THUNDER_BLUFF = 1638,
    DARNASSUS = 1657,
    ZUL_GURUB = 1977,
    STRATHOLME = 2017,
    SCHOLOMANCE = 2057,
    MARAUDON = 2100,
    ONYXIAS_LAIR = 2159,
    DEEPRUN_TRAM = 2257,
    RAGEFIRE_CHASM = 2437,
    DIRE_MAUL = 2557,
    ALTERAC_VALLEY = 2597,
    BLACKWING_LAIR = 2677,
    MOLTEN_CORE = 2717,
    HALL_OF_LEGENDS = 2917,
    CHAMPIONS_HALL = 2918,
    WARSONG_GULCH = 3277,
    ARATHI_BASIN = 3358,
    AHN_QIRAJ = 3428,
    RUINS_OF_AHN_QIRAJ = 3429,
    NAXXRAMAS = 3456,
    UPPER_BLACKROCK_SPIRE = 7307,
}