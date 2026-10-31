namespace __FAttributePresentationConfigFunctions
{
UFUNCTION()
FText __FAttributePresentationConfig_GetDisplayName(const TDataObjectPtr<FAttributePresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FAttributePresentationConfig' DataObject!");
        }
        FAttributePresentationConfig local_72;
        return local_72.DisplayName;
    }
    return DataObject.Get().DisplayName;
}
UFUNCTION()
FText __FAttributePresentationConfig_GetDescription(const TDataObjectPtr<FAttributePresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FAttributePresentationConfig' DataObject!");
        }
        FAttributePresentationConfig local_72;
        return local_72.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
FSoftBrush __FAttributePresentationConfig_GetIcon(const TDataObjectPtr<FAttributePresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FAttributePresentationConfig' DataObject!");
        }
        FAttributePresentationConfig local_72;
        return local_72.Icon;
    }
    return DataObject.Get().Icon;
}
UFUNCTION()
FLinearColor __FAttributePresentationConfig_GetThemeColor(const TDataObjectPtr<FAttributePresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ThemeColor' from a null 'FAttributePresentationConfig' DataObject!");
        }
        FAttributePresentationConfig local_72;
        return local_72.ThemeColor;
    }
    return DataObject.Get().ThemeColor;
}
UFUNCTION()
FAttributePresentationConfig CastToFAttributePresentationConfig(const TDataObjectPtr<FAttributePresentationConfig> &inout DataObject)
{
    FAttributePresentationConfig __r;
    return __r;
}
}
