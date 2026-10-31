namespace __FInventoryItemConfigFunctions
{
UFUNCTION()
int __FInventoryItemConfig_GetInventorySortPriority(const TDataObjectPtr<FInventoryItemConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InventorySortPriority' from a null 'FInventoryItemConfig' DataObject!");
        }
        FInventoryItemConfig defaultValue;
        return defaultValue.InventorySortPriority;
    }
    return DataObject.Get().InventorySortPriority;
}
UFUNCTION()
FInventoryItemConfig CastToFInventoryItemConfig(const TDataObjectPtr<FInventoryItemConfig> &inout DataObject)
{
    FInventoryItemConfig __r;
    return __r;
}
}
