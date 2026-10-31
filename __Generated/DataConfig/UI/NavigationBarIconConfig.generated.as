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
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomIconWidget' from a null 'FNavigationBarIconConfig' DataObject!");
        }
        FNavigationBarIconConfig local_88;
        return local_88.CustomIconWidget;
    }
    return __r;
}
UFUNCTION()
bool __FNavigationBarIconConfig_GetbResident(const TDataObjectPtr<FNavigationBarIconConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bResident' from a null 'FNavigationBarIconConfig' DataObject!");
        }
        FNavigationBarIconConfig local_88;
        return local_88.bResident;
    }
    return local_1;
}
UFUNCTION()
FNavigationBarIconConfig CastToFNavigationBarIconConfig(const TDataObjectPtr<FNavigationBarIconConfig> &inout DataObject)
{
    FNavigationBarIconConfig __r;
    return __r;
}
}
