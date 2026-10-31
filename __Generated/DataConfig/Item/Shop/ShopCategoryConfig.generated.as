namespace __FShopCategoryConfigFunctions
{
UFUNCTION()
FSoftBrush __FShopCategoryConfig_GetDisplayIcon(const TDataObjectPtr<FShopCategoryConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FShopCategoryConfig' DataObject!");
        }
        FShopCategoryConfig local_68;
        return local_68.DisplayIcon;
    }
    return DataObject.Get().DisplayIcon;
}
UFUNCTION()
FText __FShopCategoryConfig_GetDisplayName(const TDataObjectPtr<FShopCategoryConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FShopCategoryConfig' DataObject!");
        }
        FShopCategoryConfig local_68;
        return local_68.DisplayName;
    }
    return DataObject.Get().DisplayName;
}
UFUNCTION()
int __FShopCategoryConfig_GetDisplayPriority(const TDataObjectPtr<FShopCategoryConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayPriority' from a null 'FShopCategoryConfig' DataObject!");
        }
        FShopCategoryConfig defaultValue;
        return defaultValue.DisplayPriority;
    }
    return DataObject.Get().DisplayPriority;
}
UFUNCTION()
FShopCategoryConfig CastToFShopCategoryConfig(const TDataObjectPtr<FShopCategoryConfig> &inout DataObject)
{
    FShopCategoryConfig __r;
    return __r;
}
}
