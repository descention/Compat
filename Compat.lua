Compat = {
    DEBUG = false,

    -- https://stackoverflow.com/a/15278426
    TableConcat = function (t1,t2)
        for i=1,#t2 do
            t1[#t1+1] = t2[i]
        end
        return t1
    end,
    
    GetItemInfo = _G.GetItemInfo,
    QueryAuctionItems = _G.QueryAuctionItems,
    
    printd = function(...)
        if Compat.DEBUG == true then
            print(...)
        end
    end,

    OnLoad = function(self, event, addonName)
        if event == "ADDON_LOADED" and addonName == "Compat" then
            -- Our saved variables, if they exist, have been loaded at this point.
            if GetItemInfoInstantDB == nil then
                -- This is the first time this addon is loaded; set SVs to default values
                GetItemInfoInstantDB = {}
            end
        end
    end
}

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", Compat.OnLoad)
