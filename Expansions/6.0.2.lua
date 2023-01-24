local IsWarlords = select(4, GetBuildInfo()) >= 60000

if not IsWarlords then
    LE_ITEM_QUALITY_POOR = 0
    LE_ITEM_QUALITY_COMMON = 1
    LE_ITEM_QUALITY_UNCOMMON = 2
    LE_ITEM_QUALITY_RARE = 3
    LE_ITEM_QUALITY_EPIC = 4
    LE_ITEM_QUALITY_LEGENDARY = 5
    LE_ITEM_QUALITY_ARTIFACT = 6
    LE_ITEM_QUALITY_HEIRLOOM = 7

    LE_EXPANSION_CLASSIC                = 0
    LE_EXPANSION_BURNING_CRUSADE        = 1
    LE_EXPANSION_WRATH_OF_THE_LICH_KING = 2
    LE_EXPANSION_CATACLYSM              = 3
    LE_EXPANSION_MISTS_OF_PANDARIA      = 4
    LE_EXPANSION_WARLORDS_OF_DRAENOR    = 5
    LE_EXPANSION_LEGION                 = 6
    LE_EXPANSION_BATTLE_FOR_AZEROTH     = 7
    LE_EXPANSION_SHADOWLANDS            = 8
    LE_EXPANSION_DRAGONFLIGHT           = 9
    -- TODO set to GetBuildInfo
    LE_EXPANSION_LEVEL_CURRENT          = 4
end