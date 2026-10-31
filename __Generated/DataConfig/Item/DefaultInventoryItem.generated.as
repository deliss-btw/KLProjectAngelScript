namespace __FDefaultInventoryItemConfigFunctions
{
UFUNCTION()
TArray<FInventoryInitItem> __FDefaultInventoryItemConfig_GetInitItems(const TDataObjectPtr<FDefaultInventoryItemConfig> &inout DataObject)
{
    TArray<FInventoryInitItem> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitItems' from a null 'FDefaultInventoryItemConfig' DataObject!");
        }
        FDefaultInventoryItemConfig local_20;
        return local_20.InitItems;
    }
    return __r;
}
UFUNCTION()
FDefaultInventoryItemConfig CastToFDefaultInventoryItemConfig(const TDataObjectPtr<FDefaultInventoryItemConfig> &inout DataObject)
{
    FDefaultInventoryItemConfig __r;
    return __r;
}
}
