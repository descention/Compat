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
    end
}