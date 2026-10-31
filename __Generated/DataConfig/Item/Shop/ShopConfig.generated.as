namespace __FShopConfigFunctions
{
UFUNCTION()
FText __FShopConfig_GetDisplayName(const TDataObjectPtr<FShopConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FShopConfig' DataObject!");
        }
        FShopConfig local_100;
        return local_100.DisplayName;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FShopConfig_GetDisplayIcon(const TDataObjectPtr<FShopConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FShopConfig' DataObject!");
        }
        FShopConfig local_100;
        return local_100.DisplayIcon;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FServerConditionConfigBase> __FShopConfig_GetUnlockCondition(const TDataObjectPtr<FShopConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCondition' from a null 'FShopConfig' DataObject!");
        }
        FShopConfig local_100;
        return local_100.GetUnlockCondition();
    }
    return GetUnlockCondition();
}
UFUNCTION()
TArray<TDataObjectPtr<FItemConfig>> __FShopConfig_GetShowCostTypes(const TDataObjectPtr<FShopConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowCostTypes' from a null 'FShopConfig' DataObject!");
        }
        FShopConfig local_100;
        return local_100.GetShowCostTypes();
    }
    return GetShowCostTypes();
}
UFUNCTION()
TArray<TDataObjectPtr<FShopGoodsListConfig>> __FShopConfig_GetGoodsLists(const TDataObjectPtr<FShopConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GoodsLists' from a null 'FShopConfig' DataObject!");
        }
        FShopConfig local_100;
        return local_100.GetGoodsLists();
    }
    return GetGoodsLists();
}
UFUNCTION()
FShopConfig CastToFShopConfig(const TDataObjectPtr<FShopConfig> &inout DataObject)
{
    FShopConfig __r;
    return __r;
}
}
