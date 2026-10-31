namespace __FShopGoodsListConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FShopCategoryConfig> __FShopGoodsListConfig_GetCategory(const TDataObjectPtr<FShopGoodsListConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Category' from a null 'FShopGoodsListConfig' DataObject!");
        }
        FShopGoodsListConfig local_44;
        return local_44.GetCategory();
    }
    return DataObject.Get().GetCategory();
}
UFUNCTION()
TArray<TDataObjectPtr<FShopGoodsConfig>> __FShopGoodsListConfig_GetGoodsList(const TDataObjectPtr<FShopGoodsListConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GoodsList' from a null 'FShopGoodsListConfig' DataObject!");
        }
        FShopGoodsListConfig local_44;
        return local_44.GetGoodsList();
    }
    return DataObject.Get().GetGoodsList();
}
UFUNCTION()
FShopGoodsListConfig CastToFShopGoodsListConfig(const TDataObjectPtr<FShopGoodsListConfig> &inout DataObject)
{
    FShopGoodsListConfig __r;
    return __r;
}
}
