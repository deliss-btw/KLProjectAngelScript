namespace __FShopGoodsConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FServerConditionConfigBase> __FShopGoodsConfig_GetUnlockCondition(const TDataObjectPtr<FShopGoodsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCondition' from a null 'FShopGoodsConfig' DataObject!");
        }
        FShopGoodsConfig local_116;
        return local_116.GetUnlockCondition();
    }
    return GetUnlockCondition();
}
UFUNCTION()
TDataObjectPtr<FItemConfig> __FShopGoodsConfig_GetItem(const TDataObjectPtr<FShopGoodsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Item' from a null 'FShopGoodsConfig' DataObject!");
        }
        FShopGoodsConfig local_116;
        return local_116.GetItem();
    }
    return GetItem();
}
UFUNCTION()
TDataObjectPtr<FRefreshRuleConfig> __FShopGoodsConfig_GetRefreshRuleConfig(const TDataObjectPtr<FShopGoodsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RefreshRuleConfig' from a null 'FShopGoodsConfig' DataObject!");
        }
        FShopGoodsConfig local_116;
        return local_116.GetRefreshRuleConfig();
    }
    return GetRefreshRuleConfig();
}
UFUNCTION()
TDataObjectPtr<FItemConfig> __FShopGoodsConfig_GetCostItem(const TDataObjectPtr<FShopGoodsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CostItem' from a null 'FShopGoodsConfig' DataObject!");
        }
        FShopGoodsConfig local_116;
        return local_116.GetCostItem();
    }
    return GetCostItem();
}
UFUNCTION()
FShopGoodsConfig CastToFShopGoodsConfig(const TDataObjectPtr<FShopGoodsConfig> &inout DataObject)
{
    FShopGoodsConfig __r;
    return __r;
}
}
