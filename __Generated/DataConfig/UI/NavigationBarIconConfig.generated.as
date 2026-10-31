namespace __FNavigationBarIconConfigFunctions
{
UFUNCTION()
FPresentationDisplayRule __FNavigationBarIconConfig_GetDisplayRule(const TDataObjectPtr<FNavigationBarIconConfig> &inout DataObject)
{
    FPresentationDisplayRule __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayRule' from a null 'FNavigationBarIconConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FPresentationIcon __FNavigationBarIconConfig_GetIcon(const TDataObjectPtr<FNavigationBarIconConfig> &inout DataObject)
{
    FPresentationIcon __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FNavigationBarIconConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FNavigationBarIconConfig_GetCustomIconWidget(const TDataObjectPtr<FNavigationBarIconConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomIconWidget' from a null 'FNavigationBarIconConfig' DataObject!");
        }
        FNavigationBarIconConfig local_88;
        return local_88.CustomIconWidget;
    }
    return DataObject.Get().CustomIconWidget;
}
UFUNCTION()
bool __FNavigationBarIconConfig_GetbResident(const TDataObjectPtr<FNavigationBarIconConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bResident' from a null 'FNavigationBarIconConfig' DataObject!");
        }
        FNavigationBarIconConfig local_88;
        return local_88.bResident;
    }
    return DataObject.Get().bResident;
}
UFUNCTION()
FNavigationBarIconConfig CastToFNavigationBarIconConfig(const TDataObjectPtr<FNavigationBarIconConfig> &inout DataObject)
{
    FNavigationBarIconConfig __r;
    return __r;
}
}
