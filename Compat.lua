local IsLegion = select(4, GetBuildInfo()) >= 70000

if not IsLegion then
    local GetItemInfo = _G.GetItemInfo

    LE_ITEM_CLASS_WEAPON = 1;
    LE_ITEM_CLASS_ARMOR = 2;
    LE_ITEM_CLASS_CONTAINER = 3;
    LE_ITEM_CLASS_GEM = 8;
    LE_ITEM_CLASS_CONSUMABLE = 4;
    LE_ITEM_CLASS_GLYPH = 5;
    LE_ITEM_CLASS_TRADEGOODS = 6;
    LE_ITEM_CLASS_RECIPE = 7;
    LE_ITEM_CLASS_BATTLEPET = 11;
    LE_ITEM_CLASS_QUESTITEM = 10;
    LE_ITEM_CLASS_MISCELLANEOUS = 9;
    LE_ITEM_CLASS_ITEM_ENHANCEMENT = 100;

    REAGENTBANK_CONTAINER = -3;

    INVTYPE_HEAD = 1
    INVTYPE_NECK = 2
    INVTYPE_SHOULDER = 3
    INVTYPE_BODY = 4
    INVTYPE_CHEST = 5
    INVTYPE_WAIST = 6
    INVTYPE_LEGS = 7
    INVTYPE_FEET = 8
    INVTYPE_WRIST = 9
    INVTYPE_HAND = 10
    INVTYPE_FINGER = 11
    INVTYPE_TRINKET = 12
    INVTYPE_WEAPON = 13
    INVTYPE_SHIELD = 14
    INVTYPE_RANGEDRIGHT = 15
    INVTYPE_CLOAK = 16
    INVTYPE_2HWEAPON = 17
    INVTYPE_BAG = 18
    INVTYPE_TABARD = 19
    INVTYPE_ROBE = 20
    INVTYPE_WEAPONMAINHAND = 21
    INVTYPE_WEAPONOFFHAND = 22
    INVTYPE_HOLDABLE = 23
    INVTYPE_AMMO = 24
    INVTYPE_THROWN = 25
    INVTYPE_RANGED = 26

    NUM_LE_INVENTORY_TYPES = 26;

    LE_INVENTORY_TYPE_HEAD_TYPE = INVTYPE_HEAD
	LE_INVENTORY_TYPE_NECK_TYPE = INVTYPE_NECK
	LE_INVENTORY_TYPE_SHOULDER_TYPE = INVTYPE_SHOULDER
	LE_INVENTORY_TYPE_BODY_TYPE = INVTYPE_BODY
	LE_INVENTORY_TYPE_CHEST_TYPE = INVTYPE_CHEST
	LE_INVENTORY_TYPE_WAIST_TYPE = INVTYPE_WAIST
	LE_INVENTORY_TYPE_LEGS_TYPE = INVTYPE_LEGS
	LE_INVENTORY_TYPE_FEET_TYPE = INVTYPE_FEET
	LE_INVENTORY_TYPE_WRIST_TYPE = INVTYPE_WRIST
	LE_INVENTORY_TYPE_HAND_TYPE = INVTYPE_HAND
	LE_INVENTORY_TYPE_FINGER_TYPE = INVTYPE_FINGER
	LE_INVENTORY_TYPE_TRINKET_TYPE = INVTYPE_TRINKET
	LE_INVENTORY_TYPE_CLOAK_TYPE = INVTYPE_CLOAK
	LE_INVENTORY_TYPE_HOLDABLE_TYPE = INVTYPE_HOLDABLE

    LE_ITEM_QUALITY_POOR = 0
    LE_ITEM_QUALITY_COMMON = 1
    LE_ITEM_QUALITY_UNCOMMON = 2
    LE_ITEM_QUALITY_RARE = 3
    LE_ITEM_QUALITY_EPIC = 4
    LE_ITEM_QUALITY_LEGENDARY = 5
    LE_ITEM_QUALITY_ARTIFACT = 6

    function GetItemClassIdByName(className)
        local itemClasses = { GetAuctionItemClasses() }
        if (className == "Item Enhancement") then
            return LE_ITEM_CLASS_ITEM_ENHANCEMENT
        end

        local index={}
        for k,v in pairs(itemClasses) do
            index[v]=k
        end
        return index[className]
    end

    function GetItemSubClassIdByName(classId, subClassName)
        local subItemClasses = { GetAuctionItemSubClasses(classId) }
        local index={}
        for k,v in pairs(subItemClasses) do
            index[v]=k
        end
        return index[subClassName]
    end

    function GetItemClassInfo(classID)
        local itemClasses = { GetAuctionItemClasses() };
        if (classID == LE_ITEM_CLASS_ITEM_ENHANCEMENT) then
            return "Item Enhancement";
        end
        return itemClasses[classID - 1];
    end

    function GetItemSubClassInfo(classID, subClassID)
        local subItemClasses = { GetAuctionItemSubClasses(classID) }
        local index={}
        for k,v in pairs(subItemClasses) do
            index[v]=k
        end

        return {index[subClassID], (classID == 4 and index[subClassID] <= 4)};
    end

    function GetItemInventorySlotInfo(index)
        local name = "";
        
        if index == LE_INVENTORY_TYPE_HEAD_TYPE then
            name = "Head"
        elseif index == LE_INVENTORY_TYPE_NECK_TYPE then
            name = "Neck"
        elseif index == LE_INVENTORY_TYPE_SHOULDER_TYPE then
            name = "Shoulder"
        elseif index == LE_INVENTORY_TYPE_BODY_TYPE then
            name = "Shirt"
        elseif index == LE_INVENTORY_TYPE_CHEST_TYPE then
            name = "Chest"
        elseif index == LE_INVENTORY_TYPE_WAIST_TYPE then
            name = "Waist"
        elseif index == LE_INVENTORY_TYPE_LEGS_TYPE then
            name = "Legs"
        elseif index == LE_INVENTORY_TYPE_FEET_TYPE then
            name = "Feet"
        elseif index == LE_INVENTORY_TYPE_WRIST_TYPE then
            name = "Wrist"
        elseif index == LE_INVENTORY_TYPE_HAND_TYPE then
            name = "Hands"
        elseif index == LE_INVENTORY_TYPE_FINGER_TYPE then
            name = "Finger"
        elseif index == LE_INVENTORY_TYPE_TRINKET_TYPE then
            name = "Trinket"
        elseif index == LE_INVENTORY_TYPE_CLOAK_TYPE then
            name = "Back"
        elseif index == LE_INVENTORY_TYPE_HOLDABLE_TYPE then
            name = "Held In Off-hand"
        end

        return name;
    end

    _G.GetItemInfo = function(...)
        local data = GetItemInfo(...)
        if select("#", data) == 0 then
            return data
        end
        local classID = GetItemClassIdByName(data[6])
        table.insert(data, classID)
        local subClassID = GetItemSubClassIdByName(data[7])
        table.insert(data, subClassID)
        return data
    end

    _G.GetItemInfoInstant = function (itemID)
        local data = {GetItemInfo(itemID)}
        if not data[6] then
            print ("retry", itemID)
            data = {GetItemInfo(itemID)}
        end

        if not data[6] then
            return {}
        end

        local classId = GetItemClassIdByName(data[6])
        local subClassId = GetItemSubClassIdByName(classId, data[7])
        -- /dump GetItemInfoInstant(6948)
        return {itemID,         -- itemid
            data[6],    -- item type
            data[7],    -- item subtype
            data[9],    -- item equip location
            GetItemIcon(itemID), -- icon
            classId,    -- class id
            subClassId  -- subclass id
        }
    end

    local texture_mt = getmetatable(CreateFrame('Frame'):CreateTexture())
    texture_mt.__index.SetColorTexture = texture_mt.__index.SetTexture

    local animation_mt = getmetatable(CreateFrame('Frame'):CreateAnimationGroup("DumpGroup"):CreateAnimation("Alpha"))
    animation_mt.__index.SetFromAlpha = function(alpha) return end
    animation_mt.__index.SetToAlpha = function(alpha) return end
    
    function GetRecipeReagentItemLink()
        --GetTradeSkillReagentItemLink
    end

    C_TradeSkillUI = {
        GetRecipeNumItemsProduced = GetTradeSkillNumMade
       -- GetRecipeReagentItemLink = 
    }

    C_WowTokenPublic = {
        GetCurrentMarketPrice = function() return nil end,
        UpdateMarketPrice = function() return end
    }
end