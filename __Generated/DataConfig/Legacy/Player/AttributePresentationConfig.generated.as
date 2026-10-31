namespace __FAttributePresentationConfigFunctions
{
UFUNCTION()
FText __FAttributePresentationConfig_GetDisplayName(const TDataObjectPtr<FAttributePresentationConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FAttributePresentationConfig' DataObject!");
        }
        FAttributePresentationConfig local_72;
        return local_72.DisplayName;
    }
    return __r;
}
UFUNCTION()
FText __FAttributePresentationConfig_GetDescription(const TDataObjectPtr<FAttributePresentationConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FAttributePresentationConfig' DataObject!");
        }
        FAttributePresentationConfig local_72;
        return local_72.Description;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FAttributePresentationConfig_GetIcon(const TDataObjectPtr<FAttributePresentationConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FAttributePresentationConfig' DataObject!");
        }
        FAttributePresentationConfig local_72;
        return local_72.Icon;
    }
    return __r;
}
UFUNCTION()
FLinearColor __FAttributePresentationConfig_GetThemeColor(const TDataObjectPtr<FAttributePresentationConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ThemeColor' from a null 'FAttributePresentationConfig' DataObject!");
        }
        FAttributePresentationConfig local_72;
        return local_72.ThemeColor;
    }
    return __r;
}
UFUNCTION()
FAttributePresentationConfig CastToFAttributePresentationConfig(const TDataObjectPtr<FAttributePresentationConfig> &inout DataObject)
{
    FAttributePresentationConfig __r;
    return __r;
}
}
